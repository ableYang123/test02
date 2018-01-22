<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form class="form-horizontal" id="editgroupform" name="editgroupform">
		<fieldset>
			<legend>
				<spring:message code="group.edit.group" />
			</legend>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message
						code="group.name" /><span style="color: #d9534f;">*</span> </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name" name="name"
						value='' />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message
						code="group.staff" /></label>
				<div class="col-sm-3" style="width: 190">
					<select id="stafflist" name="stafflist" class="form-control" style="width: 195">
						<option value=""><spring:message code="group.select.staff"/></option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message
						code="group.external.id" /></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="externalId"
						name="externalId" value='' />
				</div>
			</div>
			<div id="activeDateDiv" class="form-group" style="display: none">
				<label class="col-sm-3 control-label"><spring:message
						code="group.activation.date" /></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" datetype="date"
						id="activeDate" name="activeDate" local-date=""
						afterToday="" beforeToday="">
				</div>
			</div>
			<div class="text-right" style="padding-right: 80px">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<spring:message code="btn.cancle"/>
				</button>
				<button type="button" id="save" name="save" class="btn btn-primary">
					<spring:message code="btn.submit"/>
				</button>
			</div>
		</fieldset>
	</form>
	<script type="text/javascript">
	var staffId;
	var format;
		$(document).ready(
				function() {		
					format = $('input[name="activeDate"]').attr('date-format');
					/* 获取对应组的信息 */
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : '',
							"url" : "api.v1.groups." + groupId
						},
						callback : "editback"
					});
					/* 获取组中办公室下属职员信息 */
					//$("#stafflist").empty();
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.clients.template?officeId="
									+ officeId
									+ "&staffInSelectedOfficeOnly=true"
						},
						callback : "officestaff"
					});

					/* 校验表单 */
					$.valid("editgroupform", [ {
						"name" : "name",
						"notEmpty" : $.fn.bootstrapValidator.i18n.group.notEmpty
					}, {
						"name" : "staffName",
						"notEmpty" : $.fn.bootstrapValidator.i18n.group.notEmpty
					} ]);

					/* 保存编辑内容 */
					$.getWidget("save").click(
							function() {
								if ($.validateForm("editgroupform")) {
									var json = {
										name : $.trim($.value("name")),
										externalId : $.trim($.value("externalId")),
										staffId :  parseInt($("#stafflist").find("option:selected").attr("value")),
										activationDate :$('input[name="activeDate"]').val(),
										dateFormat : format,
										locale : $.getLocale()
									};

									$.nest({
										url : '<c:url value="/fineract.do"/>',
										data : {
											'dataType' : 'PUT',
											'mydata' : json,
											'url' : 'api.v1.groups.' + groupId
										},
										callback : 'edit_success'
									});
								}
							});
				});

		function editback(param) {
			$.assign({
				"name" : param.name,
				"externalId" : param.externalId
			});
			var status = param.status.value;
			staffId=param.staffId;
			if (status == "Active") {
				$("#activeDateDiv").css("display", "block");
				var activeDate = $.formatDate(param.activationDate,format);
				$('input[name="activeDate"]').val(activeDate);
			}
		}
		/* 获取办公室下属职员信息后的回调函数 */
		function officestaff(param) {
			$.setSelect('stafflist', param.staffOptions, 'id', 'displayName');
			$('select[name="stafflist"]').find('option[value="'+ staffId +'"]').attr('selected',true);
		}
		/* 更新信息成功后的回调函数 */
		function edit_success() {
			location.reload();
		}
	</script>
</body>
</html>