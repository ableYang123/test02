<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form class="form-horizontal" id="closureGroupForm"
		name="closureGroupForm">
		<fieldset>
			<legend>
				<spring:message code="group.close.group" />
			</legend>
			<div class="form-group">
				<lable class="col-sm-3 control-lable"> <spring:message
					code="group.close.date" /> <span style="color: #d9534f;">*</span></lable>
				<input type="text" class="form-control" datetype="date"
					name="closeDate" local-date="true">
			</div>
			<div class="form-group">
				<lable class="col-sm-3 control-lable"> <spring:message
					code="group.close.reason" /> <span
					style="color: #d9534f;">*</span></lable>


				<div class="form-group">
					<select id="closurelist" name="closurelist" class="form-control"
						style="width: 195">
					</select>
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
		$(document).ready(function() {
			$.datetimepicker();
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.groups.template?command=close"
				},
				callback : "setClosureReason"
			});
		});

		$.getWidget("save").click(function() {
			if ($.validateForm("closureGroupForm")) {
				var json = {
					"dateFormat" : $('input[name="closeDate"]').attr('date-format'),
					"locale" : $.getLocale(),
					"closureDate" : $('input[name="closeDate"]').val(),
					"closureReasonId" : $("#closurelist").find("option:selected").val()
				};
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "POST",
				data : {
					"dataType" : "POST",
					"mydata" : json,
					"url" : "api.v1.groups."+groupId+"?command=close"
				},
				callback : "reload"
			});
		});
		function setClosureReason(param) {
			$.setSelect('closurelist', param.closureReasons, 'id', 'name');
		}
		function reload(){
			location.reload();
		}
	</script>
</body>
</html>