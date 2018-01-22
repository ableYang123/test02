<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
			<form class="form-horizontal" id="postInterestAsOn" name="postInterestAsOn" style="font-size: small;">
				<fieldset>
					<legend><spring:message code="client.savingaccount.postInterestAsOn"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="Transaction.Date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="transactionDate" >
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
			$.valid("postInterestAsOn", [ {
					"name" : "transactionDate",
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
		});
		function callback(param) {
			$.getWidget("save").click(function() {
				var json = {
						"transactionDate":$.value('transactionDate'),
						"dateFormat":$('input[name="transactionDate"]').attr('date-format'),
						"locale":"en",
						"isPostInterestAsOn":true
						};
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.savingsaccounts."+savingsId+".transactions?command=postInterestAsOn"
					},
					callback : "post_success"
				});
			});
			
		}
		
		
		function post_success(param){
			$.setReadOnly("postInterestAsOn");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
			
		}
</script>