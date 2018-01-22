<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="approvedAccountForm" name="approvedAccountForm" method="post">
	<fieldset>
		<legend><spring:message code="label.center.withdrawSavingAccount"/></legend>

		<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="label.center.withdrawnon"/> <span
				style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
		       <input type="text" datetype="date" id="withdrawnOnDate" name="withdrawnOnDate" local-date="true" />
			</div>
		</div>

		<div class="form-group">
		
			<label for="repeat" class="col-sm-2 control-label"><spring:message code="label.center.note"/> </label>
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
    $(document).ready(function(){
    	$.datetimepicker();
	    $.getWidget("save").click(function(){
	    	var withdrawnOnDate=$('input[name="withdrawnOnDate"]').val();
	    	var dateFormat=$('input[name="withdrawnOnDate"]').attr('date-format');
	    	var note=$('#note').val();
	    	var json={
	    			"withdrawnOnDate":withdrawnOnDate,
	    			"dateFormat":dateFormat,
	    			"locale":"en",
	    			"note":note
	    	}
	 	   $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "post",
					"mydata" : json,
					"url" : "api.v1.savingsaccounts."+savingsId+"?command=withdrawnByApplicant"	
				},
				callback : "withdrawClientBack"
			}); 
	    });
  });
    
    function withdrawClientBack(param){
    	var savingsId=param.savingsId;
    	var status1=param.changes.status.value;
    	$.setReadOnly("approvedAccountForm");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		window.location.href="loadPage.do?nextPage=center.approveAccountDetail&savingsId="+savingsId+"status1"+status1;
    }
</script>