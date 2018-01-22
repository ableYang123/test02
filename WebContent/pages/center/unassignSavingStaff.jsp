<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="unassignSavingofficerForm" name="unassignSavingofficerForm">
	<fieldset>
		<legend><spring:message code="label.center.unassignSavingsOfficer"/></legend>
	
		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="label.center.unassignedon"/><span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
			     <input type="text" datetype="date" id="unassignDate" name="unassignDate"  local-date="true"/>
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
				
				//验证
				$.valid("assignSavingStaffForm", [ 
					{
						"name" : "assignDate",
						"notEmpty" : "不为空"
					  }
					]
				);
				
            	//提交表单
				$.getWidget("save").click(function() {
                  var unassignDate=$('input[name="unassignDate"]').val();
                  var unassignedDate=$.formatDate(unassignDate,'yyyy-MM-dd');
					var json={
							"unassignedDate":unassignedDate,
							"dateFormat": "yyyy-MM-dd",
							"locale":"en"
					      }
					
				 	$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.savingsaccounts."+savingsId+"?command=unassignSavingsOfficer"
						},
						callback : "callback2"
					});	
				});	
		   });	
			
			function callback2(param){
				$.setReadOnly("unassignSavingofficerForm");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
				
		</script>

