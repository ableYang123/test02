<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="rejectClient" name="activeClient">
				<fieldset>
					<legend><spring:message code="lable.reject.client"/></legend>
					
					<div class="form-group">
						<label for="rejectDate" class="col-sm-2 control-label"><spring:message code="lable.reject.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input datetype="date" name="rejectDate" local-date="true" afterToday="true">
						</div>
					</div>
					<div class="form-group">
						<label for="rejectReason" class="col-sm-2 control-label"><spring:message code="lable.reject.reason"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select type="text" class="form-control" id="rejectReason"
								name="rejectReason">
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
				$.datetimepicker();
				$.valid("refuseClient", 
						[ {"name" : "rejectDate","notEmpty" : "不能为空"},
						   {"name" : "rejectReason","notEmpty" : "不能为空"}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GEt",
						"mydata" : "",
						"url" : "api.v1.clients.template?commandParam=reject"
					},
					callback : "rejectReason"
				});
						
				$.getWidget("save").click(function() {
					var rejectReasonId = parseInt($("#rejectReason").find("option:selected").attr("value"));
					var json = {
								"rejectionDate":$.value('rejectDate'),
								"rejectionReasonId":rejectReasonId,
								"locale":"en",
								"dateFormat":$('input[name="rejectDate"]').attr('date-format')
								}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+"?command=reject"
						},
						callback : "callback"
					});
				});
		});
		function callback(param) {
			$.setReadOnly("rejectClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
		function rejectReason(param){
			$.setSelect('rejectReason',param.narrations,'id','name');
		}
</script>