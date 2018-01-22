<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>
<form class="form-horizontal"  id="editClientForm" name="editClientForm">
<fieldset>
		<legend>
			<spring:message code="lable.add.client" />
		</legend>
		
		<div class="form-group">
			<label for="officelist" class="col-sm-2 control-label"><spring:message code="lable.office" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="officelist" name="officelist" >
					<option selected="selected"><spring:message code="lable.please.choose"/></option>
				</select>
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
			<div id="Lablename">
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
			<label for="mobileNo" class="col-sm-2 control-label"><spring:message code="lable.mobleNo" /></label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="mobileNo" name="mobileNo" >
			</div>
			</div>
			<div id="div">
			<div class="form-group">
			<label for="dateofbirth" class="col-sm-2 control-label"><spring:message code="lable.dateofbirth" /> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="dateofbirth" name="dateofbirth" datetype="date" afterToday="true"/>
			</div>
			
			<label for="incorpValidityTillDate" class="col-sm-2 control-label"><spring:message code="lable.validity.date" /> </label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="incorpValidityTillDate" name="incorpValidityTillDate" datetype="date"/>
			</div>
			</div>
			</div>
			<div id="birthday">
			
			 <div class="form-group">
			<label for="birthDate" class="col-sm-2 control-label"><spring:message code="lable.birthday" /> </label>
			<div class="col-sm-3">
				<input  class="form-control" id="birthDate" name="birthDate" datetype="date" afterToday="true"/>
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
			<div class="form-group">
			<label for="externalId" class="col-sm-2 control-label"><spring:message code="lable.fullName" /></label>
			<div class="col-sm-3">
				<input type="text"  class="form-control" id="externalId" name="externalId" >
			</div>
			</div>
				<div class="form-group">
			<label for="active" class="col-sm-2 control-label"><spring:message code="lable.valid" /></label>
			
			<div class="col-sm-2">
			<label class="checkbox"> <input id="active" name="active" type="checkbox"></label>
			</div>
			<div id="activation">
			<label for="activationDate" class="col-sm-3 control-label"><spring:message code="lable.activation.date" /> <span style="color: #d9534f;">*</span></label>
				<input class="form-control" id=activationDate name="activationDate" datetype="date" afterToday="true"/>
			</div>
			</div>
			</div>
			
			
		<div class="form-group">
			<label for="submitDate" class="col-sm-2 control-label"><spring:message code="lable.submitDate" /> </label>
			<div class="col-sm-3">
				<input class="form-control" id=submitDate name="submitDate" local-date="true" datetype="date" afterToday="true"/>
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
		<button class="btn btn-info"  id="save" type="button"><spring:message code="btn.submit" /></button>
	</div>
		
</fieldset>
</form>

<script type="text/javascript">
var groupId='';
var officeId;
$("#active").click(function () {
	   $("#activation").toggle();
	});
	
	$("#legallist").click(function () {
		var legalFormId = parseInt($("#legallist").find("option:selected").attr("value"));
	 //   alert(legalFormId);
		if (legalFormId == 2) {
			 $.hide("Lablename","birthday");
    	    $.show("div","incorporation","full"); 
	    	
	    }
	    else{
	    	  
    	    
    	   $.hide("div","incorporation","full");
	    	$.show("Lablename");
	    }
	});
	$("#account").click(function(){
		var $open = $('#account').is(':checked');
	    if($open == true){
	    	$("#accountLabel").css("display","block");
	        $("#accountDiv").css("display", "block");
	    }else {
	    	$("#accountLabel").css("display","none");
	        $("#accountDiv").css("display", "none");
	    }
	});
	$(document).ready(
			function() {
				
				 $.hide("div","incorporation","full","activation");
				$.valid("createClient", [ {
					"name" : "officeName",
					"notEmpty" : "不能为空"
				}, {
					"name" : "firstName",
					"notEmpty" : "不能为空"
				}, {
					"name" : "lastName",
					"notEmpty" : "不能为空"
				},{
					"name" : "activationDate",
					"notEmpty" : "不能为空"
				} ]);
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				var url = "api.v1.clients.template?staffInSelectedOfficeOnly=true";
				if(groupId)
					url += "&groupId="+groupId;
				if(officeId)
					url+="&officeId="+officeId;
				$.nest({ 
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : url
					},
					callback : "clientClasslist"
				});
				
				$.getWidget("officelist").change(
						function() {
							var url = "api.v1.clients.template?staffInSelectedOfficeOnly=true";
							if($.value("officelist"))
								url += "&officeId="+$.value("officelist");
							$.nest({
								url : "<c:url value='/fineract.do'/>",
								type : "get",
								data : {
									"dataType" : "GET",
									"mydata" : "",
									"url" : url
								},
								callback : "officestaff"
							});
						});
				$.getWidget("save").click(
						function() {
							//var s = $("#active").attr("lang");
							var officeId = parseInt($.value("officelist"));
							var staffId = parseInt($.value("stafflist"));
							var clientTypeId = parseInt($.value("clientTypelist"));
							var clientClassId = parseInt($.value("clientClasslist"));
							var legalFormId = parseInt($.value("clientLegallist"));
							var genderId = parseInt($.value("sex"));
							var savingsProductId = parseInt($.value("accountId"));
							var mainBusinessLineId = parseInt($.value("mainBusinessLineId"));
							var constitutionId = parseInt($.value("constitutionId"));
							var str = {
									"incorpValidityTillDate" : $.value('incorpValidityTillDate'),
									"mainBusinessLineId" : mainBusinessLineId,
									"dateFormat" : $('input[name="incorpValidityTillDate"]').attr('date-format'),
									"locale" : "en",
									"constitutionId" : constitutionId,
									"remarks" : $.value('remarks'),
									"incorpNumber" : $.value('incorpNumber')
							};
							var data;
							if(str.length > 0){
								var dateofBirth = $.value('birthDate');
								if(dateofBirth == '' || dateofBirth == null){
									data = {
											"address" : [],
											"officeId" : officeId,
											"legalFormId" : legalFormId,
											"firstname" : $.value('firstName'),
											"middlename" : $.value('middleName'),
											"lastname" : $.value('lastName'),
											"fullname" : $.value('fullName'),
											"locale" : "en",
											"clientClassificationId" : clientClassId,
											"clientTypeId" : clientTypeId,
											"externalId" : $.value('externalId'),
											"mobileNo" : $.value('mobileNo'),
											//"isStaff" :$('#isStaff').is(':checked'),
											"active" : $('#active').is(':checked'),
											"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
											//"dateOfBirth" : $.value('birthDate'),
											"activationDate" : $.value('activationDate'),
											"submittedOnDate" : $.value('submitDate'),
											"clientNonPersonDetails" : str,
											"genderId" : genderId,
											"savingsProductId" : savingsProductId
										};
								}else{
									data = {
											"address" : [],
											"officeId" : officeId,
											"legalFormId" : legalFormId,
											"firstname" : $.value('firstName'),
											"middlename" : $.value('middleName'),
											"lastname" : $.value('lastName'),
											"fullname" : $.value('fullName'),
											"locale" : "en",
											"clientClassificationId" : clientClassId,
											"clientTypeId" : clientTypeId,
											"externalId" : $.value('externalId'),
											"mobileNo" : $.value('mobileNo'),
											//"isStaff" :$('#isStaff').is(':checked'),
											"active" : $('#active').is(':checked'),
											"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
											"dateOfBirth" : $.value('birthDate'),
											"activationDate" : $.value('activationDate'),
											"submittedOnDate" : $.value('submitDate'),
											"clientNonPersonDetails" : str,
											"genderId" : genderId,
											"savingsProductId" : savingsProductId
										};
								}
							}else{
								var dateofBirth = $.value('birthDate');
								if(dateofBirth == null || dateofBirth == ''){
									data = {
											"address" : [],
											"officeId" : officeId,
											"legalFormId" : legalFormId,
											"firstname" : $.value('firstName'),
											"middlename" : $.value('middleName'),
											"lastname" : $.value('lastName'),
											"fullname" : $.value('fullName'),
											"locale" : "en",
											"clientClassificationId" : clientClassId,
											"clientTypeId" : clientTypeId,
											"externalId" : $.value('externalId'),
											"mobileNo" : $.value('mobileNo'),
											//"isStaff" :$('#isStaff').is(':checked'),
											"active" : $('#active').is(':checked'),
											"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
											//"dateOfBirth" : $.value('birthDate'),
											"activationDate" : $.value('activationDate'),
											"submittedOnDate" : $.value('submitDate'),
											//"clientNonPersonDetails" : str,
											"genderId" : genderId,
											"savingsProductId" : savingsProductId
										};
									}else{
										data = {
												"address" : [],
												"officeId" : officeId,
												"legalFormId" : legalFormId,
												"firstname" : $.value('firstName'),
												"middlename" : $.value('middleName'),
												"lastname" : $.value('lastName'),
												"fullname" : $.value('fullName'),
												"locale" : "en",
												"clientClassificationId" : clientClassId,
												"clientTypeId" : clientTypeId,
												"externalId" : $.value('externalId'),
												"mobileNo" : $.value('mobileNo'),
												//"isStaff" :$('#isStaff').is(':checked'),
												"active" : $('#active').is(':checked'),
												"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
												//"dateOfBirth" : $.value('birthDate'),
												"activationDate" : $.value('activationDate'),
												"submittedOnDate" : $.value('submitDate'),
												//"clientNonPersonDetails" : str,
												"genderId" : genderId,
												"savingsProductId" : savingsProductId
											};
									}
								}
							if(groupId)
								data.groupId = groupId;
							$.nest({
								url : "<c:url value='/fineract.do'/>",
								type : "post",
								data : {
									'dataType' : "POST",
									'mydata' : data,
									'url' : 'api.v1.clients'
								},
								callback : "callback"
							});
						});
				});

	function officestaff(param) {
		$.setSelect('stafflist', param.staffOptions, 'id', 'displayName');
	}
	
	function clientClasslist(param){
		$.setSelect('officelist',param.officeOptions,'id','name');
		officeId = parseInt($.value('officelist'));
		if(officeId){
			$("#officelist").val(officeId);
			$("#officelist").trigger("change");
			$("#officelist").attr("disabled","disabled").css("background-color","#EEEEEE;");
			//$.hide("officelist");
			//$("#s1").append(officeName);
		}
		$.setSelect('legallist',param.clientLegalFormOptions,'id','value');
		$.setSelect('clientClasslist', param.clientClassificationOptions, 'id', 'name');
		$.setSelect('clientTypelist', param.clientTypeOptions, 'id', 'name');
		$.setSelect('constitutionId', param.clientNonPersonConstitutionOptions, 'id', 'name');
		$.setSelect('mainBusinessLineId', param.clientNonPersonMainBusinessLineOptions, 'id', 'name');
		$.setSelect('sex', param.genderOptions, 'id', 'name');
		$.setSelect('accountId', param.savingProductOptions, 'id', 'name');
	}

	function callback(param) {
		$.setReadOnly("createClient");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		/* init(); */
		var clientId;
		if(param != null || param.length > 0 || typeof param != 'undefined'){
			clientId = param.clientId;
			//window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			$.openWindow("loadPage.do?nextPage=client.detail&clientId="+clientId+"&userId="+userId,"iframe","80%","90%");
		}
	}
</script>
