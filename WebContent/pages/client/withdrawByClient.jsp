<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="withdrawByClient" name=""rejectLoan"">
				<fieldset>
					<legend><spring:message code="lable.withdraw.loan.Account"/></legend>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.withdrawn.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="withdrawnOnDate" local-date="true">
						</div>
					</div>
					<div>
						<label class="col-sm-2 control-label"><spring:message code="lable.notes"/>
						</label>
						<div class="col-sm-3">
							<textarea id="note" rows="" cols="" class="form-control"></textarea>
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
				$.valid("withdrawByClient", 
						[ {"name" : "withdrawnOnDate","notEmpty" : "不能为空"}]);
				
				$.getWidget("save").click(function() {
					var json = {
								  "dateFormat":$('input[name="withdrawnOnDate"]').attr('date-format'),
								  "locale":"en",
								  "withdrawnOnDate":$.value('withdrawnOnDate'),
								  "note":$.value('note')
								}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+"?command=withdrawnByApplicant"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("withdrawByClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var loanId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
</script>