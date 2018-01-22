<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="addActivitiesAccount" name="addActivitiesAccount" >
<fieldset>
		<legend>
			<spring:message code="Financial.activities.create" />
		</legend>
		<div class="form-group">
			<label for="financialActivityId" class="col-sm-2 control-label"><spring:message code="Financial.activity" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="financialActivityId" name="financialActivityId" class="form-control" style="width: 198">
				<option><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
			</div>
				<div class="form-group">
			<label for="glAccountId" class="col-sm-2 control-label"><spring:message code="amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="glAccountId" name="glAccountId" class="form-control" style="width: 198">
			<option><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
			</div>
			<div class="form-group" >
			
<button class="btn btn-info col-sm-1 col-sm-offset-3" id="save" type="button" ><spring:message code="btn.submit" /></button>
</div>
		</fieldset>
		</form>
<script type="text/javascript">
function getSelect(param) {
	$.setSelect('financialActivityId', param.financialActivityOptions, 'id', 'name');
	
	$("#financialActivityId").change(function(){
		var glAccount=$("#financialActivityId ").val();
		if(glAccount==100){
			$.setSelect('glAccountId', param.glAccountOptions.assetAccountOptions, 'id', 'name');	
		}else if(glAccount==200){
			$.setSelect('glAccountId', param.glAccountOptions.liabilityAccountOptions, 'id', 'name');
		}else if(glAccount==300){
			$.setSelect('glAccountId', param.glAccountOptions.equityAccountOptions, 'id', 'name');
		}
	})
	
}
$(document).ready(function(){
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.financialactivityaccounts.template"
			},
			callback : "getSelect"
		}); 
	 
	 $.getWidget("save").click(function() {
			
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
					'dataType' : "POST",
					'mydata' : date,
					'url' : 'api.v1.financialactivityaccounts'
				},
				callback : "callbackadd"
				
			});
		
	 });
	
})

function callbackadd(param) {
	$.setReadOnly("addActivitiesAccount");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
		
</script>