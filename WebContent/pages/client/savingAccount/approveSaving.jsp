<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="saving" name="saving" style="font-size: small;">
				<fieldset>
					<legend><spring:message code="lable.approve.saving.account"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="approve.on"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="approvedOnDate" local-date="true" afterToday='true'>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.notess"/>&nbsp;&nbsp;
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
				$.valid("saving", [ {
					"name" : "approvedOnDate",
					"notEmpty" : "不能为空"
				}]);
				
				$.datetimepicker();
				$.getWidget("save").click(function() {
					var json = {
							"approvedOnDate":$.value('approvedOnDate'),
							"dateFormat":$('input[name="approvedOnDate"]').attr('date-format'),
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
							"url" : "api.v1.savingsaccounts."+savingsId+"?command=approve"
						},
						callback : "callback"
					});
				});
		});
		function callback(param) {
			$.setReadOnly("saving");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
</script>