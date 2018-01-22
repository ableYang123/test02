<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="editCharge" name="editCharge">
				<fieldset>
						<legend><spring:message code="edit.charge"/></legend>
	
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.amount"/><span
							style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="amount">
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
				$.valid("editCharge", [ {
					"name" : "amount",
					"notEmpty" : "不能为空"
				}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.loans."+loanId+".charges."+chargeId
					},
					callback : "charges"
				});
				
				$.getWidget("save").click(function() {
				var json = {
							  "locale": "en",
							  "dateFormat": $.getCookie('dateFormat'),
							  "amount": $.value('amount')
							}
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "PUT",
						"mydata" : json,
						"url" : "api.v1.loans."+loanId+".charges."+chargeId
					},
					callback : "callback"
				});
			});
		});
		function callback(param) {
			$.setReadOnly("editCharge");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType=1";
			}
		}
		function charges(param){
			$.assign({
				'amount' : param.amountOrPercentage
			});
		}
</script>