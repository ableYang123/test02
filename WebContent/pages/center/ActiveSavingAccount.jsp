<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="activeSavecountForm" name="activeSavecountForm">
				<fieldset>
						<legend><spring:message code="label.center.activateSavingAccount"/></legend>
	
					<div class="form-group">
						<label for="activationDate" class="col-sm-2 control-label"><spring:message code="label.center.activatedon"/>  <span
							style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="activeDate" local-date="true" afterToday="" beforeToday="">
						</div>
					</div>
	
			    <div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="label.report.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>

	<script type="text/javascript">
	
	    //var savingsId ="${pd.savingsId}";
	    console.log(savingsId);
		$(document).ready(function() {
			    $.datetimepicker();
				$.valid("activeSavecountForm", [ {
					"name" : "activationDate",
					"notEmpty" : "不能为空"
				}]);
				
				$.getWidget("save").click(function() {
				var json = {
							  "locale": "en",
							  "dateFormat": $('input[name="activeDate"]').attr('date-format'),
							  "activatedOnDate": $.value('activeDate')
							}
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.savingsaccounts."+savingsId+"?command=activate"
					},
					callback : "activeSuccess"
				});
			});
		});
		
		function activeSuccess(param) {
			status1=param.changes.status.value;
			$.setReadOnly("activeSaveCountForm");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=center&savingsId="+savingsId+"&status1="+status1
		}
</script>