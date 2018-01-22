<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="deleteLoanCharge" name="deleteLoanCharge">
				<fieldset>
						<legend><spring:message code="deleteClient"/></legend>
			<div class="form-group">
				<spring:message code="lable.are.you.sure"/>?
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
				$.getWidget("save").click(function() {
					$.nest({
						url : '<c:url value="/fineract.do"/>',
						type : 'post',
						data : {
							'dataType' : 'DELETE',
							'mydata' : '',
							'url' : 'api.v1.loans.'+loanId+'.charges.'+chargeId
						},
						callback : 'deleteback'
					});
			});
		});
		function deleteback(param) {
			$.setReadOnly("deleteClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType=1";
			}
		}
</script>