<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>
			<form class="form-horizontal" id="approve" name="approve">
				<fieldset>
					<legend><spring:message code="lable.approve.loan.account"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="approve.on"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" datetype="date" name="approvedOnDate" local-date="true" afterToday="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.expecte.disbursement.on"/>
						</label>
						<div class="col-sm-3">
							<input class="form-control" datetype="date" name="expectedDisbursementDate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.approve.amount"/>
						</label>
						<div class="col-sm-3">
							<input class="form-control" onkeyup="copy()" size=20 name="approvedAmt" type="text" id="approvedAmt">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" name="approvedAmount" size=20 type="text" id="approvedAmount">
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
		function copy(){
			document.getElementById("approvedAmount").value=document.getElementById("approvedAmt").value;
		} 
		$(document).ready(function() {
				$.valid("approve", [ {
					"name" : "approvedOnDate",
					"notEmpty" : "不能为空"
				},
				{
					"name" : "approvedAmount",
					"notEmpty" : "不能为空"
				}]);
				
				$.datetimepicker();
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+".template?templateType=approval"
					},
					callback : "amount"
				});
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+"?associations=multiDisburseDetails"
					},
					callback : "account"
				});
				$.getWidget("save").click(function() {
					var json = {
							"approvedLoanAmount":$.value('approvedAmount'),
							"approvedOnDate":$.value('approvedOnDate'),
							"dateFormat":$('input[name="approvedOnDate"]').attr('date-format'),
							"disbursementData":[],
							"expectedDisbursementDate" : $.value('expectedDisbursementDate'),
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
							"url" : "api.v1.loans."+loanId+"?command=approve"
						},
						callback : "callback"
					});
				});
		});
		function amount(param){
			var approvalDate = $.formatDate(param.approvalDate);
			$('input[name="approvalDate"]').val(approvalDate);
			$.assign({
				'approvedAmt' : param.approvalAmount,
				'approvedAmount' : param.approvalAmount
			});
		}
		function account(param){
			var expectedDisbursementDate = $.formatDate(param.timeline.expectedDisbursementDate);
			$('input[name="expectedDisbursementDate"]').val(expectedDisbursementDate);
		}
		function callback(param) {
			$.setReadOnly("approve");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType=1";
			}
		}
</script>