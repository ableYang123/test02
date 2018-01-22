<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="disburseToSaving" name="disburseToSaving">
				<fieldset>
					<legend><spring:message code="lable.disburse.loan.account"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.disburse.on"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" local-date="true" datetype="date" id="actualDisbursementDate" name="actualDisbursementDate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="transactionAmount">
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
				$.valid("disburseToSaving", [ {
					"name" : "actualDisbursementDate",
					"notEmpty" : "不能为空"
				},{"name" : "transactionAmount","notEmpty" : "不能为空"}]);
				
				$.datetimepicker();
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+".transactions.template?command=disburseToSavings"
					},
					callback : "loans"
				});
				
				$.getWidget("save").click(function() {
					var json = {
							"actualDisbursementDate":$.value('actualDisbursementDate'),
							"dateFormat":$('input[name="actualDisbursementDate"]').attr('date-format'),
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
							"url" : "api.v1.loans."+loanId+"?command=disbursetosavings"
						},
						callback : "callback"
					});
				});
		});
		function callback(param) {
			$.setReadOnly("saving");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param != ''){
				var loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
		function loans(param){
			var actualDisbursementDate = $.formatDate(param.date);
			$('#actualDisbursementDate').append(actualDisbursementDate);
			$.assign({
				'transactionAmount' : param.amount
			});
		}
</script>