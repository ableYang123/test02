<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<form class="form-horizontal ng-pristine ng-valid" name="unassignsavingsofficerform" id="unassignsavingsofficerform">

	<div id="mifos-reskin-body-view">
		<div>
			<div class="content">
				<div class="toolbar">
					<h4><spring:message code="client.savingaccount.unassignFieldOfficer"/></h4>
				</div>
				<br>
				<fieldset>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="unassignmentDate"><spring:message code="assignment.date"/><span style="font-size: 14px; color: #d9534f">*</span></label>
					<div class="col-sm-3">
						<input type="text" datetype="date" name="unassignmentDate" id="unassignmentDate" local-date="true" class="datetime" format="" afterToday="true">
					</div>
				</div>
				<div class="col-md-offset-3">
					<button id="save" type="button" class="btn btn-primary"><spring:message code="btn.submit"/></button>
				</div>
				
				</fieldset>	           
			</div>
		</div>
	</div>
</form>
<hr>
<script type="text/javascript">
	$(document).ready(function() {
	$.getWidget("save").click(function() {
		var unassignmentDate = $.value('unassignmentDate');
		var dateFormat=$('input[name="unassignmentDate"]').attr('date-format');
		
		var json={
				"unassignedDate":unassignmentDate,
				"locale":"zh_CN",
				"dateFormat":dateFormat
		};
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.savingsaccounts." + savingsId+"?command=unassignSavingsOfficer",
				"contentType" : "application/json"
			},
			callback : "edit_success"
		});
	})
	});
	
	function callback(param){
		if(param.fieldOfficerOptions!= 'undefined'){
			$.setSelect("fieldOfficer",param.fieldOfficerOptions,'id','displayName');
		}
	}
	
	function edit_success(param){
		$.setReadOnly("unassignsavingsofficerform");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		var savingsId;
		if(param != null || param.length > 0 || typeof param != 'undefined'){
			savingsId = param.savingsId;
			window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
		}
	}
	
</script>

