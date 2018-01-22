<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="rejectAccountForm" name="rejectAccountForm">
	<fieldset>
		<legend><spring:message code="label.center.rejectSavingAccount"/></legend>

		<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="label.center.rejectedon"/> <span
				style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
		       <input type="text" datetype="date" format="2" id="rejectedOnDate" name="rejectedOnDate" local-date="true"
		       afterToday="false" beforeToday="false" />
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
				<a id="cancel" class="btn btn-default" href="#/listCenters"><spring:message code="label.center.cancel"/></a>
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="label.center.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
    
    $.datetimepicker();
    
    $(document).ready(function(){
    	
        $.getWidget("save").click(function(){
        	var rejectedOnDate=$('input[name="rejectedOnDate"]').val();
        	var rejectedOnDate=$.formatDate(rejectedOnDate,'yyyy-MM-dd');
        	alert(rejectedOnDate);
        	var note=$('#note').text();
        	var json={
        			"rejectedOnDate":rejectedOnDate,
        			"dateFormat":"yyyy-MM-dd",
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
    				"url" : "api.v1.savingsaccounts."+savingsId+"?command=reject"
    			},
    			callback : "callback1"
    		  }); 
        });
      });
        
        function callback1(param){
        	var savingsId=param.savingsId;
        	var status1=param.changes.status.value;
        	$.setReadOnly("rejectAccountForm");
    		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
    		window.location.href="loadPage.do?nextPage=center.approveAccountDetail&savingsId="+savingsId+"status1"+status1;
        }
    
    
  
</script>