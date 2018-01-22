<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="withdrawClient" name="closeClient">
				<fieldset>
					<legend><spring:message code="lable.client.withdraw"/></legend>
					
					<div class="form-group">
						<label for="withdrawDate" class="col-sm-2 control-label"><spring:message code="lable.submitDate"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" name="wiDate" format="" local-date="true" afterToday="" beforeToday="">
						</div>
					</div>
					<div class="form-group">
						<label for="withdrawReason" class="col-sm-2 control-label"><spring:message code="lable.withdraw.reason"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="withdrawReason"
								name="withdrawReason">
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
				$.valid("withdrawClient", 
						[ {"name" : "withdrawDate","notEmpty" : "不能为空"},
						   {"name" : "withdrawReason","notEmpty" : "不能为空"}]);
				$.datetimepicker();
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients.template?commandParam=withdraw"
					},
					callback : "withdrawReason"
				});
				
				$.getWidget("save").click(function() {
					var withdrawReasonId = parseInt($.value("withdrawReason"));
					var json = {
								"withdrawalDate":$.value('wiDate'),
								"withdrawalReasonId":withdrawReasonId,
								"locale":"en",
								"dateFormat":$('input[name="wiDate"]').attr('date-format')
								}
	
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+"?command=withdraw"
						},
						callback : "callback"
					});
				});
			});
		function callback(param) {
			$.setReadOnly("withdrawClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
		function withdrawReason(param){
			$.setSelect('withdrawReason',param.narrations,'id','name');
		}
</script>