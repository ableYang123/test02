<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="disburse" name="disburse">
				<fieldset>
					<legend><spring:message code="lable.forecloure"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.transaction.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" name="transactionDate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.principal"/>
						</label>
						<div class="col-sm-3">
							<input type="text" readonly="readonly" class="form-control" id="outstandingPrincipalPortion" name="outstandingPrincipalPortion">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.interest"/>
						</label>
						<div class="col-sm-3">
							<input type="text" readonly="readonly" class="form-control" id="outstandingInterestPortion" name="outstandingInterestPortion">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.fee.amount"/>
						</label>
						<div class="col-sm-3">
							<input type="text" readonly="readonly" class="form-control" id="outstandingFeeChargesPortion" name="outstandingFeeChargesPortion">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.penalty.amount"/>
						</label>
						<div class="col-sm-3">
							<input type="text" readonly="readonly" class="form-control" id="outstandingPenaltyChargesPortion" name="outstandingPenaltyChargesPortion">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.transaction.amount"/>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="transactionAmount" name="transactionAmount">
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
		$(document).ready(function() {
				$.valid("disburse", 
						[ {"name" : "transactionDate","notEmpty" : "不能为空"}
						   ]);
				$.datetimepicker();
				var str1 = encodeURIComponent("dateFormat=dd-MMMM-yyyy");
				var str2 = encodeURIComponent("transactionDate="+$.value('transactionDate'));
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans.38.transactions.template?command=foreclosure&"+str1+"&locale=en&"+str2
					},
					callback : "accounts"
				});
				$.getWidget("save").click(function() {
					var json = {
							"transactionDate":$.value('transactionDate'),
							"dateFormat":$('input[name="transactionDate"]').attr('date-format'),
							"locale":"en",
							"note" : $.value('note')
							}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+".transactions?command=foreclosure"
						},
						callback : "callback"
					});
				});
			});
		
		function callback(param) {
			$.setReadOnly("disburse");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param != ''){
				var loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
		function accounts(param){
			var transactionDate = $.formatDate(param.date);
			$('input[name="transactionDate"]').val(transactionDate);
			$.assign({
				"outstandingPrincipalPortion" : param.principalPortion,
				'outstandingInterestPortion' : param.interestPortion,
				'outstandingFeeChargesPortion' : param.feeChargesPortion,
				'outstandingPenaltyChargesPortion' : param.penaltyChargesPortion,
				'transactionAmount' : param.amount
			});
		}
</script>