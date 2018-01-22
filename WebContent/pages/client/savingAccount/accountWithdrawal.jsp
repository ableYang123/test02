<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>

			<form class="form-horizontal" id="accountDeposit" name="accountDeposit" style="font-size: small;">
				<fieldset>
					<legend><spring:message code="client.savingaccount.withdrawMoneyFromSavingAccount"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label">  <spring:message code="Transaction.Date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="transactionDate" afterToday="true">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"  name="transactionAmount" >
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.payment.type"/></label>&nbsp;&nbsp;
						<div class="col-sm-3">
							<select id="paymentTypelist" class="form-control">
								<option selected="selected"><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.show.payment.details"/></label>&nbsp;&nbsp;
						<div class="col-sm-3">
							<a class="glyphicon glyphicon-plus btn btn-primary" aria-hidden="true" id="showPaymentDetails" style="background-color:#4f99ed"/>
						</div>
					</div>
								
					<div id="paymentDetails" style="display: none">
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="lable.Account"/>#</label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="accountNumber" >
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="lable.cheque"/>#</label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="checkNumber" >
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="lable.routing.code"/></label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="routingCode" >
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="lable.receipt"/>#</label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="receiptNumber" >
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="lable.bankNumber"/>#</label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="bankNumber" >
							</div>
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

			$.valid("accountDeposit", [ {
				"name" : "transactionDate",
				"notEmpty" : "不能为空"
			}],[ {
				"name" : "transactionAmount",
				"notEmpty" : "不能为空"
			}]);
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+savingsId+".transactions.template"
				},
				callback : "callback"
			});
			
			$("#showPaymentDetails").click(function(){
				$("#paymentDetails").toggle();
				$("#showPaymentDetails").attr("class")=="glyphicon glyphicon-plus btn btn-primary"?$("#showPaymentDetails").attr("class","glyphicon glyphicon-minus btn btn-primary"):$("#showPaymentDetails").attr("class","glyphicon glyphicon-plus btn btn-primary");
// 				glyphicon glyphicon-minus
			})
		});
			
		function callback(param){
			
			$.setSelect("paymentTypelist",param.paymentTypeOptions,'id','name');
			
			$.getWidget("save").click(function() {
				
				
				var json={
						"transactionDate":$.value("transactionDate"),
						"transactionAmount":$.value("transactionAmount"),
						"paymentTypeId":parseInt($.value("paymentTypelist")),
						"accountNumber":$.value("accountNumber"),
						"checkNumber":$.value("checkNumber"),
						"routingCode":$.value("routingCode"),
						"receiptNumber":$.value("receiptNumber"),
						"bankNumber":$.value("bankNumber"),
						"locale":"en",
						"dateFormat":$('input[name="transactionDate"]').attr('date-format')
						
				};

				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.savingsaccounts."+savingsId+".transactions?command=withdrawal"
					},
					callback : "withdrawal_success"
				});
			});
		}
			
		function withdrawal_success(param) {
			$.setReadOnly("accountDeposit");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
</script>