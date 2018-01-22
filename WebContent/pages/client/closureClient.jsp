<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="closeClient" name="closeClient">
				<fieldset>
					<legend><spring:message code="client.close.client"/></legend>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="client.closure.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" datetype="date" name="closeDate" local-date="true" afterToday="true">
						</div>
					</div>
					<div class="form-group">
						<label for="activationReason" class="col-sm-2 control-label"><spring:message code="client.closure.reason"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="closeReason"
								name="closeReason">
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
				$.valid("closeClient", 
						[ {"name" : "closeDate","notEmpty" : "不能为空"},
						   {"name" : "closeReason","notEmpty" : "不能为空"}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients.template?commandParam=close"
					},
					callback : "closureReason"
				});
				
				$.getWidget("save").click(function() {
					var closureReasonId = parseInt($("#closeReason").find("option:selected").attr("value"));
					var json = {
								  "dateFormat":$('input[name="closeDate"]').attr('date-format'),
								  "locale":"en",
								  "closureDate":$.value('closeDate'),
								  "closureReasonId":closureReasonId
								}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+"?command=close"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("closeClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
		
		function closureReason(param){
			$.setSelect('closeReason',param.narrations,'id','name');
		}
</script>