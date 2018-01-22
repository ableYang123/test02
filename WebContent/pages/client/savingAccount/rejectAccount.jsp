<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>
			<form class="form-horizontal" id="rejectAccount" name="rejectAccount" style="font-size: small;">
				<fieldset>
					<legend><spring:message code="client.savingaccount.reject"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.rejectOn"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="rejectedOnDate" >
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
				$.valid("rejectAccount", [ {
					"name" : "rejectedOnDate",
					"notEmpty" : "不能为空"
				}]);
				
				$.datetimepicker();
				$.getWidget("save").click(function() {
					var json = {
							"rejectedOnDate":$.value('rejectedOnDate'),
							"dateFormat":$('input[name="rejectedOnDate"]').attr('date-format'),
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
							"url" : "api.v1.savingsaccounts."+savingsId+"?command=reject"
						},
						callback : "callback"
					});
				});
		});
		function callback(param) {
			$.setReadOnly("rejectAccount");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
</script>