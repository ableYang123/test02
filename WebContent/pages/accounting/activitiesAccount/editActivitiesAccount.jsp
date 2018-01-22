<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="editActivitiesAccount" name="editActivitiesAccount" >
<fieldset>
		<legend>
			<spring:message code="Financial.activities.edit" />
		</legend>
		<div class="form-group">
			<label for="financialActivityId" class="col-sm-2 control-label"><spring:message code="Financial.activity" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="financialActivityId" name="financialActivityId" class="form-control" style="width: 198">
				</select>
			</div>
			</div>
				<div class="form-group">
			<label for="glAccountId" class="col-sm-2 control-label"><spring:message code="amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="glAccountId" name="glAccountId" class="form-control" style="width: 198">
				</select>
			</div>
			</div>
			<div class="form-group" >
			
<button class="btn btn-info col-sm-1 col-sm-offset-3" id="edit" type="button" ><spring:message code="btn.submit" /></button>
</div>
		</fieldset>
		</form>
<script type="text/javascript">
var financial;
function getSelect(param) {

	$.setSelect('financialActivityId', param.financialActivityOptions, 'id', 'name');	 
  if(financial=='assetTransfer'){
	  $.setSelect('glAccountId', param.glAccountOptions.assetAccountOptions, 'id', 'name');
  }else if(financial=='liabilityTransfer'){
	  $.setSelect('glAccountId', param.glAccountOptions.liabilityAccountOptions, 'id', 'name');

  }else if(financial=='openingBalancesTransferContra'){
		$.setSelect('glAccountId', param.glAccountOptions.equityAccountOptions, 'id', 'name');

  }
  else if(financial=='cashAtMainVault'){
		$.setSelect('glAccountId', param.glAccountOptions.assetAccountOptions, 'id', 'name');

}
  else if(financial=='cashAtTeller'){
		$.setSelect('glAccountId', param.glAccountOptions.assetAccountOptions, 'id', 'name');

}
  else if(financial=='fundSource'){
		$.setSelect('glAccountId', param.glAccountOptions.equityAccountOptions, 'id', 'name');

}else {
	$.setSelect('glAccountId', param.glAccountOptions.equityAccountOptions, 'id', 'name');

}
	
	$('#financialActivityId option[value="' + param.financialActivityData.id + '"]').attr('selected', true);
	$('#glAccountId option[value="' + param.glAccountData.id + '"]').attr('selected', true);
}
$(document).ready(function(){
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.financialactivityaccounts."+accountId+"?template=true"
			},
			callback : "getSelect"
		}); 
	 
	 $.getWidget("edit").click(function() {
			
			var financialActivityId =$("#financialActivityId").find("option:selected").attr("value");
			var glAccountId =$("#glAccountId").find("option:selected").attr("value");
			var date;
			date={
				"financialActivityId":	financialActivityId,
				"glAccountId":glAccountId,
					
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					'dataType' : "PUT",
					'mydata' : date,
					'url' : 'api.v1.financialactivityaccounts.'+accountId
				},
				callback : "callbackadd"
				
			});
		
	 });
	
})
function callbackadd(param) {
	$.setReadOnly("editActivitiesAccount");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
		
</script>