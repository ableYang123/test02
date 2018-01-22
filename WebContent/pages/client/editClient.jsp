<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form class="form-horizontal"  id="editClientForm" name="editClientForm">
<fieldset>
		<legend>
			<spring:message code="lable.edit.client" />
		</legend>
		
		<div class="form-group">
			<label for="officelist" class="col-sm-2 control-label"><spring:message code="lable.office" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="officelist" name="officelist" ></select>
			</div>
			
			<label for="stafflist" class="col-sm-2 control-label"><spring:message code="lable.staff" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="stafflist" name="stafflist">
				<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
		</div>
	<div class="form-group">
			<label for="legallist" class="col-sm-2 control-label"><spring:message code="lable.legal" /> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="legallist" name="legallist" >
				<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
			</div>
			<div id="name">
		 <div class="form-group">
			<label for="firstName" class="col-sm-2 control-label"><spring:message code="lable.firstName" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="firstName" name="firstName" >
			</div>
			</div>
			
			<div class="form-group">
			<label for="middleName" class="col-sm-2 control-label"><spring:message code="lable.middleName" /></label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="middleName"  >
			</div>
			<label for="isStaff" class="col-sm-2 control-label"><spring:message code="lable.isStaff" /></label>			
           <div class="col-sm-2">
			<label class="checkbox"> <input id="isStaff" name="isStaff" type="checkbox"></label>
			</div>
			</div>
			 <div class="form-group">
			<label for="lastName" class="col-sm-2 control-label"><spring:message code="lable.lastName" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="lastName" name="lastName" >
			</div>
			</div> 
			</div>
			<div id="full">
			<div class="form-group"  >
			<label for="fullName" class="col-sm-2 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="fullName" name="fullName" >
			</div>
			</div>
			</div>
			<div class="form-group">
			<label for="accountNo" class="col-sm-2 control-label"><spring:message code="lable.accountNo" /># </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="accountNo" name="accountNo" >
			</div>
			</div>
			<div class="form-group">
			<label for="externalId" class="col-sm-2 control-label"><spring:message code="lable.fullName" /></label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="externalId" name="externalId" >
			</div>
			</div>
			<div class="form-group">
			<label for="mobileNo" class="col-sm-2 control-label"><spring:message code="lable.mobleNo" /></label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="mobileNo" name="mobileNo" >
			</div>
			</div>
			<div id="div">
			<div class="form-group">
			<label for="dateofbirth" class="col-sm-2 control-label"><spring:message code="lable.dateofbirth" /> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="dateofbirth" name="dateofbirth" datetype="date" />
			</div>
			
			<label for="incorpValidityTillDate" class="col-sm-2 control-label"><spring:message code="lable.validity.date" /> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="incorpValidityTillDate" name="incorpValidityTillDate" datetype="date" />
			</div>
			</div>
			</div>
			<div class="form-group">
			<label for="clientTypelist" class="col-sm-2 control-label"><spring:message code="client.clientType" /> </label>
			<div class="col-sm-3">
				<select   class="form-control" id="clientTypelist" >
				<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
			
			<label for="clientClasslist" class="col-sm-2 control-label"><spring:message code="client.classic" /> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="clientClasslist" >
				<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
		</div>
			<div id="incorporation">
			<div class="form-group">
			<label for="incorpNumber" class="col-sm-2 control-label"><spring:message code="lable.incorporation.number" /> </label>
   <div class="col-sm-3">
				<input  type="text" class="form-control" name="incorpNumber" id="incorpNumber" >
				
				</div>
			<label for="mainBusinessLineId" class="col-sm-2 control-label"><spring:message code="lable.main.lusiness.line" /> </label>
   <div class="col-sm-3">
				<select  class="form-control" name="mainBusinessLineId" id="mainBusinessLineId" >
					<option><spring:message code="lable.please.choose"/></option>
				</select>
				</div>
			</div>									
	
		<div class="form-group">
		<label for="constitutionId" class="col-sm-2 control-label"><spring:message code="lable.constitution" /> </label>
			<div class="col-sm-3">
				<select id="constitutionId" name="constitutionId" class="form-control">
					<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
		</div> 
			
		<div class="form-group">
		<label for="remarks" class="col-sm-2 control-label"><spring:message code="lable.remarks" /> </label>
			<div class="col-sm-3">
				<textarea rows="" cols="" class="form-control" name="remarks" id="remarks"></textarea>
			</div>
		</div> 	
			</div>
			<div id="birthday">
			
			 <div class="form-group">
			<label for="birthDate" class="col-sm-2 control-label"><spring:message code="lable.birthday" /> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="birthDate" name="birthDate" datetype="date" />
			</div>
			
		 	<label for="sex" class="col-sm-2 control-label"><spring:message code="lable.gender" /> </label>
			<div class="col-sm-3">
				<select  class="form-control" name="sex" id="sex" >
				<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
		</div>  
		
			</div> 
		<div class="form-group">
			<label for="submitDate" class="col-sm-2 control-label"><spring:message code="lable.submitDate" /> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id=submitDate name="submitDate" datetype="date" />
			</div>
			</div>
			
			<div class="form-group" id="active" style="display: none;">
			<label for="activationDate" class="col-sm-2 control-label"><spring:message code="lable.activation.date" /> <span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<input class="form-control" id=activationDate name="activationDate" datetype="date" />
			</div>
			</div>
			<div class="form-group">
		<label for="accountId" class="col-sm-2 control-label"><spring:message code="lable.saving.account" /></label>
			<div class="col-sm-3">
				<select  class="form-control" name="accountId" id="accountId" >
				<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
			</div>
			<div style="text-align: center; padding-top: 20px">
	<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
		<button class="btn btn-info"  id="edit" type="button"><spring:message code="btn.submit" /></button>
	</div>
		
</fieldset>
</form>

<script type="text/javascript">
$("#legallist").click(function () {
	var legalFormId = parseInt($("#legallist").find("option:selected").attr("value"));
    if (legalFormId == 2) {
    	
    $.hide("name","birthday");
    $.show("div","incorporation","full");
    }
    else{
    	
    	$.hide("div","incorporation","full");
    	$.show("name","birthday");
    }
});
	var activeDate;
	var savingAccount;
	var active;
	$(document).ready(function() {
		$.valid("editClientForm", [ {
			"name" : "firstName",
			"notEmpty" : "不能为空"
		}, {
			"name" : "lastName",
			"notEmpty" : "不能为空"
		},{
			"name" : "activationDate",
			"notEmpty" : "不能为空"
		} ]);
		$.datetimepicker();
		/* 请求模态框需要的参数 */
		$('#stafflist').empty();
		$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."
								+ clientId
								+ "?staffInSelectedOfficeOnly=true&template=true"
					},
					callback : "officestaff"
				});
		/*更新客户*/
		$.getWidget("edit").click(function() {
			if ($.validateForm("editClientForm")) {
				var legalFormId = parseInt($.value("legallist"));
				var staffId = parseInt($.value('stafflist'));
				var savingsProductId = parseInt($.value("accountId"));
				var clientClassId = parseInt($.value("clientClasslist"));
				var clientTypeId = parseInt($.value("clientTypelist"));
				var genderId = parseInt($.value("sex"));
				var clientNonPersonDetails ={
						"dateFormat":$('input[name="incorpValidityTillDate"]').attr('date-format'),
						"incorpNumber":$.value('incorpNumber'),
						"incorpValidityTillDate":$.value('incorpValidityTillDate'),
						"mainBusinessLineId" : parseInt($.value('mainBusinessLineId')),
						"locale":"en",
						"remarks":$.value('remarks'),
						"constitutionId" : parseInt($.value('constitutionId'))
				};
				var json;
				var dateofBirth = $.value('birthDate');
				if(legalFormId == 2){
					if(active == true){
						if(dateofBirth == null || dateofBirth == ''){
							json = {
									"accountNo" : $.value('accountNo'),
									"activationDate" : $.value('activationDate'),
									"active" : true,
									"clientClassificationId" : clientClassId,
									"clientNonPersonDetails" : clientNonPersonDetails,
									"clientTypeId" : clientTypeId,
									"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
									//"dateOfBirth" : $.value('birthDate'),
									"externalId" : $.value('externalId'),
									"fullname" : $.value('fullName'),
									"legalFormId" : legalFormId,
									"locale" : "en",
									"mobileNo" : $.value('mobileNo'),
									"savingsProductId" : savingsProductId,
									"staffId" : staffId, 
									"submittedOnDate" : $.value('submitDate')
								};
						}else{
							json = {
									"accountNo" : $.value('accountNo'),
									"activationDate" : $.value('activationDate'),
									"active" : true,
									"clientClassificationId" : clientClassId,
									"clientNonPersonDetails" : clientNonPersonDetails,
									"clientTypeId" : clientTypeId,
									"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
									"dateOfBirth" : $.value('birthDate'),
									"externalId" : $.value('externalId'),
									"fullname" : $.value('fullName'),
									"legalFormId" : legalFormId,
									"locale" : "en",
									"mobileNo" : $.value('mobileNo'),
									"savingsProductId" : savingsProductId,
									"staffId" : staffId, 
									"submittedOnDate" : $.value('submitDate')
								};
							}
						}else{
							if(dateofBirth == null || dateofBirth == ''){
								 json = {
										"accountNo" : $.value('accountNo'),
										"active" : false,
										"clientClassificationId" : clientClassId,
										"clientNonPersonDetails" : clientNonPersonDetails,
										"clientTypeId" : clientTypeId,
										"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
										//"dateOfBirth" : $.value('birthDate'),
										"externalId" : $.value('externalId'),
										"fullname" : $.value('fullName'),
										"legalFormId" : legalFormId,
										"locale" : "en",
										"mobileNo" : $.value('mobileNo'),
										"savingsProductId" : savingsProductId,
										"staffId" : staffId, 
										"submittedOnDate" : $.value('submitDate')
									};
							}else{
								json = {
										"accountNo" : $.value('accountNo'),
										"active" : false,
										"clientClassificationId" : clientClassId,
										"clientNonPersonDetails" : clientNonPersonDetails,
										"clientTypeId" : clientTypeId,
										"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
										"dateOfBirth" : $.value('birthDate'),
										"externalId" : $.value('externalId'),
										"fullname" : $.value('fullName'),
										"legalFormId" : legalFormId,
										"locale" : "en",
										"mobileNo" : $.value('mobileNo'),
										"savingsProductId" : savingsProductId,
										"staffId" : staffId, 
										"submittedOnDate" : $.value('submitDate')
									};
							}
						}
				}else{
					if(active == true){
						if(dateofBirth == null || dateofBirth == ''){
							 json = {
									"accountNo" : $.value('accountNo'),
									"activationDate" : $.value('activationDate'),
									"active" : true,
									"clientClassificationId" : clientClassId,
									"clientNonPersonDetails" : {},
									"clientTypeId" : clientTypeId,
									"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
									"externalId" : $.value('externalId'),
									//"dateOfBirth" : $.value('birthDate'),
									"firstname" : $.value('firstName'),
									"genderId" : genderId,
									//"isStaff" : $('#isStaff').is(':checked'),
									"lastname" : $.value('lastName'),
									"legalFormId" : legalFormId,
									"locale" : "en",
									"middlename" : $.value('middleName'),
									"mobileNo" : $.value('mobileNo'),
									"savingsProductId" : savingsProductId,
									"staffId" : staffId, 
									"submittedOnDate" : $.value('submitDate')
								};
							}else{
								json = {
										"accountNo" : $.value('accountNo'),
										"activationDate" : $.value('activationDate'),
										"active" : true,
										"clientClassificationId" : clientClassId,
										"clientNonPersonDetails" : {},
										"clientTypeId" : clientTypeId,
										"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
										"externalId" : $.value('externalId'),
										"dateOfBirth" : $.value('birthDate'),
										"firstname" : $.value('firstName'),
										"genderId" : genderId,
										//"isStaff" : $('#isStaff').is(':checked'),
										"lastname" : $.value('lastName'),
										"legalFormId" : legalFormId,
										"locale" : "en",
										"middlename" : $.value('middleName'),
										"mobileNo" : $.value('mobileNo'),
										"savingsProductId" : savingsProductId,
										"staffId" : staffId, 
										"submittedOnDate" : $.value('submitDate')
									};
							}
						}else{
							if(dateofBirth == null || dateofBirth == ''){
								json = {
										"accountNo" : $.value('accountNo'),
										"active" : false,
										"clientClassificationId" : clientClassId,
										"clientNonPersonDetails" : {},
										"clientTypeId" : clientTypeId,
										"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
										"externalId" : $.value('externalId'),
										//"dateOfBirth" : $.value('birthDate'),
										"firstname" : $.value('firstName'),
										"genderId" : genderId,
										//"isStaff" : $('#isStaff').is(':checked'),
										"lastname" : $.value('lastName'),
										"legalFormId" : legalFormId,
										"locale" : "en",
										"middlename" : $.value('middleName'),
										"mobileNo" : $.value('mobileNo'),
										"savingsProductId" : savingsProductId,
										"staffId" : staffId, 
										"submittedOnDate" : $.value('submitDate')
									};
								}else{
									json = {
											"accountNo" : $.value('accountNo'),
											"active" : false,
											"clientClassificationId" : clientClassId,
											"clientNonPersonDetails" : {},
											"clientTypeId" : clientTypeId,
											"dateFormat" : $('input[name="birthDate"]').attr('date-format'),
											"externalId" : $.value('externalId'),
											"dateOfBirth" : $.value('birthDate'),
											"firstname" : $.value('firstName'),
											"genderId" : genderId,
											//"isStaff" : $('#isStaff').is(':checked'),
											"lastname" : $.value('lastName'),
											"legalFormId" : legalFormId,
											"locale" : "en",
											"middlename" : $.value('middleName'),
											"mobileNo" : $.value('mobileNo'),
											"savingsProductId" : savingsProductId,
											"staffId" : staffId, 
											"submittedOnDate" : $.value('submitDate')
										};
								}
						}
				}
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "PUT",
						"mydata" : json,
						"url" : "api.v1.clients." + clientId,
						"contentType" : "application/json"
					},
					callback : "edit_success"
				});
			}
		});
	});

	function officestaff(param) {
		active = param.active;
		$.setSelect('officelist', param.officeOptions, 'id', 'name');
		$.setSelect('stafflist', param.staffOptions, 'id', 'displayName');
		$.setSelect('legallist', param.clientLegalFormOptions, 'id', 'value');
		$.setSelect('sex', param.genderOptions, 'id', 'name');
		$.setSelect('clientTypelist', param.clientTypeOptions, 'id', 'name');
		$.setSelect('clientClasslist', param.clientClassificationOptions, 'id', 'name');
		$.setSelect('accountId', param.savingProductOptions, 'id', 'name');
		
		$('#officelist option[value="' + param.officeId + '"]').attr('selected', true);
		$('#accountId option[value="' + param.savingsProductId + '"]').attr('selected', true);
		if(typeof param.legalForm != 'undefined'){
			$('#legallist option[value="' + param.legalForm.id + '"]').attr('selected', true);
			if (param.legalForm.id == 2) {
				  $.hide("name","birthday");
				  $.show("div","incorporation","full");
				  var dateOfBirth = $.formatDate(param.dateOfBirth);
				  $.setSelect('mainBusinessLineId',param.clientNonPersonMainBusinessLineOptions,'id','name');
				  $.setSelect('constitutionId',param.clientNonPersonConstitutionOptions,'id','name');
				  $('#constitutionId option[value="' + param.clientNonPersonDetails.constitution.id + '"]').attr('selected', true);
				  var incorpValidityTillDate = $.formatDate(param.clientNonPersonDetails.incorpValidityTillDate);
				  $.assign({
					'fullName' : param.fullname,
					'dateofbirth' : dateOfBirth,
					'incorpValidityTillDate' : incorpValidityTillDate,
					'incorpNumber' : param.clientNonPersonDetails.incorpNumber,
					'remarks' : param.clientNonPersonDetails.remarks
			      });
		    }
		    else{
		    	$.hide("div","incorporation","full");
		    	$.show("name","birthday");
		    	
		    } 
		}else{
			$.hide("div","incorporation","full");
	    	$.show("name","birthday");
		}
		$('#clientTypelist option[value="' + param.clientType.id + '"]').attr('selected', true);
		$('#clientClasslist option[value="' + param.clientClassification.id + '"]').attr('selected', true);
		$('#sex option[value="' + param.gender.id + '"]').attr('selected', true);
		
		$('#editClientForm select[id="officelist"]').attr('disabled', true);
		$('#editClientForm input[id="accountNo"]').attr('disabled', true);
		$.assign({
			"firstName" : param.firstname,
			"middleName" : param.middleName,
			"lastName" : param.lastname,
			"accountNo" : param.accountNo,
			"externalId" : param.externalId,
			"mobileNo" : param.mobileNo
		});
		if(param.timeline.submittedOnDate != null && param.timeline.submittedOnDate.length > 0){
			var submitDate = $.formatDate(param.timeline.submittedOnDate);
			$('input[name="submitDate"]').val(submitDate);
		}
		if(typeof param.dateOfBirth != 'undefined'){
			var birthDate = $.formatDate(param.dateOfBirth);
			$('input[name="birthDate"]').val(birthDate);
		}
		if(typeof param.active == true){
			$.show('active');
			var activationDate = $.formatDate(param.activationDate);
			$('input[name="activationDate"]').val(activationDate);
		}else{
			$.hide('active');
		}
		activeDate = $('input[name="activationDate"]').val();
	}

	function edit_success(param) {
		$.setReadOnly("editClientForm");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		var clientId;
		if(param != null || param.length > 0 || typeof param != 'undefined'){
			clientId = param.clientId;
			window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
		}
		
	}
</script>