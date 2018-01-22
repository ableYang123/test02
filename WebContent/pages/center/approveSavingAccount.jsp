<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="approvedAccountForm" name="approvedAccountForm" method="post">
	<fieldset>
		<legend><spring:message code="label.center.approveSavingAccount"/></legend>

		<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="label.center.approvedon"/><span
				style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
		       <input type="text" datetype="date" id="approvedOnDate" name="approvedOnDate" local-date="true" />
			</div>
		</div>

		<div class="form-group">
		
			<label for="repeat" class="col-sm-2 control-label"><spring:message code="label.center.note"/></label>
			<div class="col-sm-3">
				<textarea id="note"></textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="label.center.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>

<script type="text/javascript">
    $.datetimepicker();
    $(document).ready(function(){
    	$.getWidget("save").click(function(){
	    	var dateFormat=$('input[name="approvedOnDate"]').attr('date-format');
	    	var approvedOnDate=$.value('approvedOnDate');
	    	var note=$('#note').val();
	    	var json={
	    			"approvedOnDate":approvedOnDate,
	    			"dateFormat":dateFormat,
	    			"locale":"zh_CN",
	    			"note":note
	    	}
	 	   $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "post",
					"mydata" : json,
					"url" : "api.v1.savingsaccounts."+savingsId+"?command=approve",
					"contentType" : "application/json"
				},
				callback : "approveSuccess"
			  }); 
    	});
  });
    
    function approveSuccess(param){
    	status1=param.changes.status.value;
    	$.setReadOnly("approvedAccountForm");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		window.location.href="<c:url value='loadPage.do?nextPage=client.savingsaccounts'/>&pageType=center&savingsId="+savingsId+"&status1="+status1; 
      } 
</script>