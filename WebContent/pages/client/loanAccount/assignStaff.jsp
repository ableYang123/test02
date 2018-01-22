<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="assignStaffClient" name="activeClient">
				<fieldset>
					<legend><spring:message code="client.assignStaff"/></legend>
					<div class="form-group">
						<label for="assignStaff" class="col-sm-2 control-label"><spring:message code="client.assignStaff"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="assignStaff"
								name="assignStaff">
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		$(document).ready(function() {
				$.valid("assignStaffClient", [ {
					"name" : "assignStaff",
					"notEmpty" : "不能为空"
				}]);
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."
								+ clientId
								+ "?staffInSelectedOfficeOnly=true&template=true"
					},
					callback : "officestaff"
				});
				$.getWidget("save").click(function() {
					var staffId = parseInt($.value("assignStaff"));
					var json = {
							  	"staffId": staffId
								}
					
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+"?command=assignStaff"
						},
						callback : "callback"
					});
				});
		});
		function officestaff(param){
			$.setSelect('assignStaff', param.staffOptions, 'id', 'displayName');
		}
		function callback(param) {
			$.setReadOnly("assignStaffClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			/* init(); */
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
</script>