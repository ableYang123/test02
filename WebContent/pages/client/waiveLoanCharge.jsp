<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

			<form class="form-horizontal" id="waiveCharge" name="waiveCharge">
				<fieldset>
					<legend><spring:message code="lable.waive.loan.charge"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.select.installment"/>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="installmentNumber" name="installmentNumber"></select>
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
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.loans."+loanId+".charges."+chargeId
				},
				callback : "ment"
			});
				$.getWidget("save").click(function() {
					var json = {
							"dateFormat":$.getCookie('dateFormat'),
							"installmentNumber":$.value('installmentNumber'),
							"locale":"en"
							};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+".charges."+chargeId+"?command=waive"
						},
						callback : "callback"
					});
				});
		});
		
		function ment(param){
			$.setSelect('installmentNumber',param.installmentChargeData,'id','installmentNumber');
		}
		
		function callback(param) {
			$.setReadOnly("waiveCharge");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
</script>