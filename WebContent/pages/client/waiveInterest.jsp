<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="waiveInterest" name="waiveInterest">
				<fieldset>
					<legend><spring:message code="lable.waive.interest"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" datetype="date" name="transactionDate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" name="transactionAmount" type="text" id="transactionAmount">
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
				$.valid("waiveInterest", [ {
					"name" : "transactionDate",
					"notEmpty" : "不能为空"
				},
				{
					"name" : "transactionAmount",
					"notEmpty" : "不能为空"
				}]);
				
				$.datetimepicker();
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+".transactions.template?command=waiveinterest"
					},
					callback : "amount"
				});
				$.getWidget("save").click(function() {
					var json = {
							"transactionDate":$.value('transactionDate'),
							"dateFormat":$('input[name="transactionDate"]').attr('date-format'),
							"transactionAmount":$.value('transactionAmount'),
							"locale":"en",
							"note" : $.value('note')
							};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+".transactions?command=waiveinterest"
						},
						callback : "callback"
					});
				});
		});
		function amount(param){
			var transactionDate = $.formatDate(param.date);
			$('input[name="transactionDate"]').val(transactionDate);
			$.assign({
				'transactionAmount' : param.amount
			});
		}
		function callback(param) {
			$.setReadOnly("waiveInterest");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
</script>