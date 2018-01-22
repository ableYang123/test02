<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="assignSavingofficerForm" name="assignSavingofficerForm">

	<fieldset>
		<legend><spring:message code="label.center.assignSavingsOfficer"/></legend>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="label.center.toSavingofficer"/><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="Savingofficer" name="Savingofficer" class="form-control"
					style="width: 198">
				  <option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="label.center.assignmentdate"/><span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
			     <input type="text" datetype="date" id="assignDate" name="assignDate"  local-date="true"/>
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
					"name" : "Savingofficer",
					"notEmpty" : "不为空"
				  },
					{
						"name" : "assignDate",
						"notEmpty" : "不为空"
					  },
					]
				);
				
			 	$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.savingsaccounts."+savingsId+"?template=true"
					},
					callback : "loadback"
				});

				//提交表单
				$.getWidget("save").click(function() {
                  var assignDate=$('input[name="assignDate"]').val();
                  var assignmentDate=$.formatDate(assignDate);
                  var toSavingsOfficerId=parseInt($("#Savingofficer").find("option:selected").attr("value"));
					var json={
							"assignmentDate":assignmentDate,
							"dateFormat": $('input[name="assignDate"]').attr('date-format'),
							"fromSavingsOfficerId": "",
							"locale":"en",
							"toSavingsOfficerId":toSavingsOfficerId
					      };
				 	$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.savingsaccounts."+savingsId+"?command=assignSavingsOfficer"
						},
						callback : "assignSuccess"
					});	
				});	
		   });	
			
			function loadback(param){
			    $.setSelect('Savingofficer', param.fieldOfficerOptions, 'id', 'displayName');
			}
			function assignSuccess(param){
				var savingsId=param.savingsId;
				$.setReadOnly("assignSavingofficerForm");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				window.location.href="loadPage.do?nextPage=center.approveAccountDetail&savingsId="+savingsId;
			}
		</script>

