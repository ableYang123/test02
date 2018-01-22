<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="withdrawalClient" name="withdrawalClient">
				<fieldset>
					<legend><spring:message code="lable.withdraw.money.from.saving.account"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.transaction.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" name="transactionDate" local-date="" afterToday="" beforeToday="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.transaction.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="transactionAmount" name="transactionAmount">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.payment.type"/>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="paymentTypeId" name="paymentTypeId">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.show.payment.details"/>
						</label>
						<div class="col-sm-2">
							<input type="button" class="btn btn-primary" value="+" id="showDetails" name="showDetails">
						</div>
					</div>
					<div id="account" class="form-group" style="display: none;">
						<label  class="col-sm-2 control-label"><spring:message code="lable.Account"/>#
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="accountNumber" name="accountNumber">
						</div>
					</div>
					<div id=cheque class="form-group" style="display: none;">
						<label  class="col-sm-2 control-label"><spring:message code="lable.cheque"/>#
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="checkNumber" name="checkNumber">
						</div>
					</div>
					<div id="routing" class="form-group" style="display: none;">
						<label  class="col-sm-2 control-label"><spring:message code="lable.routing.code"/>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="routingCode" name="routingCode">
						</div>
					</div>
					<div id="receipt" class="form-group" style="display: none;">
						<label  class="col-sm-2 control-label"><spring:message code="lable.receipt"/>#
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="receiptNumber" name="receiptNumber">
						</div>
					</div>
					<div id="bank" class="form-group" style="display: none;">
						<label  class="col-sm-2 control-label"><spring:message code="lable.bankNumber"/>#
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="bankNumber" name="bankNumber">
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
		var savingAccountId;
		$("#showDetails").click(function () {
			var s = $('#showDetails').attr("value");
			if(s == '-'){
					$("#account").css("display","none");
					$("#cheque").css("display","none");
					$("#routing").css("display","none");
					$("#receipt").css("display","none");
					$("#bank").css("display","none");
					$('#showDetails').prop('value','+');
			}else{
					$("#account").css("display","block");
					$("#cheque").css("display","block");
					$("#routing").css("display","block");
					$("#receipt").css("display","block");
					$("#bank").css("display","block");
					$('#showDetails').prop('value','-');
			}
		});
		$(document).ready(function() {
				$.valid("clientWith", 
						[ {"name" : "transactionDate","notEmpty" : "不能为空"},
						   {"name" : "transactionAmount","notEmpty" : "不能为空"}]);
				$.datetimepicker();
				/* $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId
					},
					callback : "savingAccount"
				}); */
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.savingsaccounts."+savingAccountId+".transactions.template"
					},
					callback : "transaction"
				});
				$.getWidget("save").click(function() {
					var paymentTypeId = parseInt($.value("paymentTypeId"));
				//	alert(dateFormat);
					var json = {
							"accountNumber":$.value('accountNumber'),
							"bankNumber":$.value('bankNumber'),
							"checkNumber":$.value('checkNumber'),
							"transactionDate":$.value('transactionDate'),
							"dateFormat":$('input[name="transactionDate"]').attr('date-format'),
							"locale":"en",
							"paymentTypeId":paymentTypeId,
							"receiptNumber":$.value('receiptNumber'),
							"routingCode":$.value('routingCode'),
							"transactionAmount":$.value('transactionAmount')
							}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.savingsaccounts."+savingAccountId+".transactions?command=withdrawal"
						},
						callback : "callback"
					});
				});
			});
		
		function callback(param) {
			$.setReadOnly("withdrawalClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			savingsId=param.savingsId
			window.location.href="<c:url value='loadPage.do?nextPage=client.savingsaccounts'/>&savingsId="+savingsId; 
		}
		/* function savingAccount(param){
			savingAccountId = param.savingsAccountId;
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+savingAccountId+".transactions.template"
				},
				callback : "transaction"
			});
		} */
		function transaction(param){
			$.setSelect('paymentTypeId',param.paymentTypeOptions,'id','name');
		}
</script>