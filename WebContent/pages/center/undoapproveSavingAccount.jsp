<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="undoapprovedAccountForm" name="undoapprovedAccountForm" method="post">
	<fieldset>
		<legend><spring:message code="label.center.undoApprovalSavingAccount"/></legend>

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
    
    $(document).ready(function(){
    	
    $.getWidget("save").click(function(){

    	var note=$('#note').text();
    	var json={
    			"note":note
    	}
 	   $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "post",
				"mydata" : json,
				"url" : "api.v1.savingsaccounts."+savingsId+"?command=undoapproval"
			},
			callback : "callback1"
		  }); 
    });
  });
    
    function callback1(param){
    	status1=param.changes.status.value;
    	savingsId=param.savingsId
    	$.setReadOnly("undoapprovedAccountForm");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=center&savingsId="+savingsId+"&status1="+status1;
    }
</script>