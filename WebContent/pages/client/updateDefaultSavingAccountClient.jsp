<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="updateDefaultSavingAccount" name="updateDefaultSavingAccount">
				<fieldset>
					<legend><spring:message code="lable.update.default.saving.account"/></legend>
					<div class="form-group">
						<label for="withdrawReason" class="col-sm-2 control-label"><spring:message code="lable.default.saving.account"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="savingsAccountId"
								name=""savingsAccountId"">
							</select>
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
				$.valid("updateDefaultSavingAccount", 
						[{"name" : "savingsAccountId","notEmpty" : "不能为空"}]);
				$.datetimepicker();
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId+"?template=true"
					},
					callback : "defaultSavingAccount"
				});
				
				$.getWidget("save").click(function() {
					var savingsAccountId = parseInt($.value("savingsAccountId"));
					var json = {
								"savingsAccountId" : savingsAccountId
								};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+"?command=updateSavingsAccount"
						},
						callback : "callback"
					});
				});
			});
		function callback(param) {
			$.setReadOnly("updateDefaultSavingAccount");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
		function defaultSavingAccount(param){
			$.setSelect('savingsAccountId',param.savingAccountOptions,'id','accountNo');
			$('#savingsAccountId option[value="' + param.savingsAccountId + '"]').attr('selected', true);
		}
</script>