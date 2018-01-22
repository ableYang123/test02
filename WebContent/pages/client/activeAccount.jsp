<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

			<form class="form-horizontal" id="activeAccount" name="activeAccount" method="post">
				<fieldset>
					<legend><spring:message code="client.savingaccount.activateSavingAccount"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.activatedOn"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="activatedOnDate" afterToday='true' >
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
				$.valid("activeAccount", [ {
					"name" : "activatedOnDate",
					"notEmpty" : "不能为空"
				}]);
				
				$.datetimepicker();
				$.getWidget("save").click(function() {
					console.log($("input[name=activatedOnDate]").val());
					
					var json = {
							"activatedOnDate":$("input[name=activatedOnDate]").val(),
							"dateFormat":$('input[name="activatedOnDate"]').attr('date-format'),
							"locale":"en"
							};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.savingsaccounts."+savingsId+"?command=activate"
						},
						callback : "active_account"
					});
				});
		});
		function active_account(param) {
			$.setReadOnly("activeAccount");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
</script>