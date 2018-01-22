<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="payCharge" name="payCharge">
				<fieldset>
					<legend><spring:message code="pay.Charge"/></legend>
					<div class="form-group">
						<label for="activationReason" class="col-sm-2 control-label"><spring:message code="client.closure.reason"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" id="amount" name="amount">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.dueDate"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" datetype="date" id=dueDate name="dueDate">
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
				$.valid("payCharge", 
						[ {"name" : "amount","notEmpty" : "不能为空"},
						   {"name" : "dueDate","notEmpty" : "不能为空"}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId+".charges."+chargeId
					},
					callback : "charge"
				});
				
				$.getWidget("save").click(function() {
					var json = {
								  "amount" : $.value('amount'),								
								  "dateFormat":$('input[name="dueDate"]').attr('date-format'),
								  "locale":"en",
								  "transactionDate" : $.value('dueDate')
								};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+".charges."+chargeId+"?command=paycharge"
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
		
		function charge(param){
			var dueDate = $.formatDate(param.dueDate);
			$('input[name="dueDate"]').val(dueDate);
			$.assign({
				'amount' : param.amount,
			});
		}
</script>