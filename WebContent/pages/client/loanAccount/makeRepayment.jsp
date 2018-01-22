<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="repayment" name=""repayment"">
				<fieldset>
					<legend><spring:message code="lable.loan.repayment"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.transaction.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" name="transactionDate">
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
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="paymentTypeId" name="paymentTypeId">
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
						<label class="col-sm-2 control-label"> <spring:message code="lable.notess"/>
						</label>
						<div class="col-sm-3">
							<textarea name="note" id="note" rows="3" cols="20"></textarea>
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
				$.valid("disburse", 
						[ {"name" : "transactionDate","notEmpty" : "不能为空"},
						   {"name" : "transactionAmount","notEmpty" : "不能为空"},
						   {"name" : "paymentTypeId","notEmpty" : "不能为空"}]);
				$.datetimepicker();
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+".transactions.template?command=repayment"
					},
					callback : "accounts"
				});
				$.getWidget("save").click(function() {
					var paymentTypeId = parseInt($.value("paymentTypeId"));
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
							"transactionAmount":$.value('transactionAmount'),
							"note" : $.value('note')
							}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+".transactions?command=repayment"
						},
						callback : "callback"
					});
				});
			});
		
		function callback(param) {
			$.setReadOnly("repayment");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		function accounts(param){
			$.setSelect('paymentTypeId',param.paymentTypeOptions,'id','name');
			var transactionDate = $.formatDate(param.date);
			$('input[name="transactionDate"]').val(transactionDate);
			$.assign({
				"transactionAmount" : param.amount
			});
		}
</script>