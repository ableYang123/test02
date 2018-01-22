<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="editCost" name="editCost" >

<div class="form-group">
			<label for="chargeAppliesTo" class="col-sm-4 control-label"><spring:message code="Charges.applies.to" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeAppliesTo" id="chargeAppliesTo" style="width: 177px;"></select>
			</div>
		</div>
<div class="form-group" id="div1">
			<label for="name" class="col-sm-4 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="name" id="name">
			</div>
		</div>
<div class="form-group" id="div2">
			<label for="currencyCode" class="col-sm-4 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="currency" id="currencyCode" style="width: 275px;"></select>
			</div>
		</div>
		<div class="form-group" id="div3">
			<label for="chargeTimeType" class="col-sm-4 control-label"><spring:message code="charg.Time.Type" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeTimeType" id="chargeTimeType" style="width: 275px;"></select>
			</div>
		</div>
	<div class="form-group" id="div4">
			<label for="chargeCalculationType" class="col-sm-4 control-label"><spring:message code="Charge.calculation" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeCalculationType" id="chargeCalculationType" style="width: 275px;"></select>
			</div>
		</div>
		
		<div class="form-group" id="div5">
			<label for="chargePaymentMode" class="col-sm-4 control-label"><spring:message code="Charge.payment.by" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargePaymentMode" id="chargePaymentMode" style="width: 275px;"></select>
			</div>
		</div>

<div class="form-group" id="div6">
			<label for="addfeefrequency" class="col-sm-3 control-label"><spring:message code="Add.Fee.Frequency" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="addfeefrequency" type="checkbox"></label>
			</div>
			</div>
			<div class="form-group" id="div7">
			<label for="feeIntervalLoan" class="col-sm-4 control-label"><spring:message code="Charge.Frequency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="feeIntervalLoan" id="feeIntervalLoan" style="width: 275px;"></select>
			</div>
		</div>
		<div class="form-group" id="div8">
			<label for="feeFrequency" class="col-sm-4 control-label"><spring:message code="Frequency.Interval" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input  class="form-control" name="feeInterval" id="feeInterval" type="text">
			</div>
		</div>
<div class="form-group" id="div9">
			<label for="amount" class="col-sm-4 control-label"><spring:message code="deposit.label.amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="amount" id="amount">
			</div>
		</div>
<div class="form-group" id="div10">
			<label for="active" class="col-sm-4 control-label"><spring:message code="deposit.active" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="active" type="checkbox"></label>
			</div>
			</div>
<div class="form-group" id="div11">
			<label for="penalty" class="col-sm-4 control-label"><spring:message code="Is.penalty" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="penalty" type="checkbox"></label>
			</div>
			</div>

<div class="form-group" id="div12">
			<label for="incomeOrLiabilityAccountId" class="col-sm-4 control-label"><spring:message code="Income.from.charge" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" id="incomeOrLiabilityAccountId" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group" id="div13">
			<label for="team" class="col-sm-4 control-label"><spring:message code="deposit.label.taxGroup" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="team" id="team" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group" style="padding-top: 10px;width: 550px;text-align: right;" id="div14">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button  class="btn btn-info" id="edit" type="button"><spring:message code="btn.submit" /></button>
</div>
</form> 
<script type="text/javascript">
 function getSelect(param) {	
	$.setSelect('feeIntervalLoan', param.feeFrequencyOptions, 'id', 'value');				
}

function getcharges(param){
	
	$.setSelect('chargeAppliesTo', param.chargeAppliesToOptions, 'id', 'value');	      
	$('#chargeAppliesTo option[value="' + param.chargeAppliesTo.id + '"]').attr('selected', true);		
	$('#editCost select[id="chargeAppliesTo"]').attr('disabled', true);
	
} 
function getcharges1(param){
	if(param.active){
		$('#active').attr("checked",true);
	}
	if(param.penalty){
		$('#penalty').attr("checked",true);
	}
	if(param.feeInterval){
		$("#div7").show();
		$("#div8").show();
	}else{
		$("#div7").hide();
		$("#div8").hide();
	}
	$.assign({
		"name" : param.name,
		"amount" : param.amount,
		"feeInterval":param.feeInterval,
		
	});	 
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType', param.loanChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType', param.loanChargeCalculationTypeOptions, 'id', 'value');	
	$.setSelect('chargePaymentMode', param.chargePaymetModeOptions, 'id', 'value');	
    $.setSelect('team', param.taxGroupOptions, 'id', 'name');	
    
    $('#currencyCode option[value="' + param.currencyCode + '"]').attr('selected', true);
	$('#chargeTimeType option[value="' + param.chargeTimeType.id + '"]').attr('selected', true);
	$('#chargeCalculationType option[value="' + param.chargeCalculationType.id + '"]').attr('selected', true);
	$('#chargePaymentMode option[value="' + param.chargePaymentMode.id + '"]').attr('selected', true);
	$('#team option[value="' + param.team + '"]').attr('selected', true);
	
}
function getcharges2(param){
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType', param.savingsChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType', param.savingsChargeCalculationTypeOptions, 'id', 'value');
	$.setSelect('team', param.taxGroupOptions, 'id', 'name');
		 
    $('#currencyCode option[value="' + param.currencyCode + '"]').attr('selected', true);
	$('#chargeTimeType option[value="' + param.chargeTimeType.id + '"]').attr('selected', true);
	$('#chargeCalculationType option[value="' + param.chargeCalculationType.id + '"]').attr('selected', true);
	$('#team option[value="' + param.team + '"]').attr('selected', true);
	if(param.active){
		$('#active').attr("checked",true);
	}
	if(param.penalty){
		$('#penalty').attr("checked",true);
	}
	$.assign({
		"name" : param.name,
		"amount" : param.amount,
		
	});
	
}
function getcharges3(param){
	if(param.active){
		$('#active').attr("checked",true);
	}
	if(param.penalty){
		$('#penalty').attr("checked",true);
	}
	$.assign({
		"name" : param.name,
		"amount" : param.amount,
		
	});
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType', param.clientChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType', param.clientChargeCalculationTypeOptions, 'id', 'value');
	$.setSelect('incomeOrLiabilityAccountId', param.incomeOrLiabilityAccountOptions.incomeAccountOptions, 'id', 'name');	
	$.setSelect('incomeOrLiabilityAccountId', param.incomeOrLiabilityAccountOptions.liabilityAccountOptions, 'id', 'name');
	$.setSelect('team', param.taxGroupOptions, 'id', 'name');
	
	 
    $('#currencyCode option[value="' + param.currencyCode + '"]').attr('selected', true);
	$('#chargeTimeType option[value="' + param.chargeTimeType.id + '"]').attr('selected', true);
	$('#chargeCalculationType option[value="' + param.chargeCalculationType.id + '"]').attr('selected', true);
	$('#team option[value="' + param.team + '"]').attr('selected', true);
}
function getcharges4(param){
	if(param.active){
		$('#active').attr("checked",true);
	}
	if(param.penalty){
		$('#penalty').attr("checked",true);
	}
	$.assign({
		"name" : param.name,
		"amount" : param.amount,
		
	});
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType', param.shareChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType', param.shareChargeCalculationTypeOptions, 'id', 'value');
	$.setSelect('chargePaymentMode', param.chargePaymetModeOptions, 'id', 'value');	
	$.setSelect('team', param.taxGroupOptions, 'id', 'name');
	
	 
    $('#currencyCode option[value="' + param.currencyCode + '"]').attr('selected', true);
	$('#chargeTimeType option[value="' + param.chargeTimeType.id + '"]').attr('selected', true);
	$('#chargeCalculationType option[value="' + param.chargeCalculationType.id + '"]').attr('selected', true);
	$('#chargePaymentMode option[value="' + param.chargePaymentMode.id + '"]').attr('selected', true);
	$('#team option[value="' + param.team + '"]').attr('selected', true);
}
$(document).ready(function(){
	
	$("#div7").hide();
	$("#div8").hide();
	$("#div12").hide();
	$("#addfeefrequency").click(function(){
		$("#div7").toggle();
		$("#div8").toggle();
	})
	
	$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges." + productId+"?template=true"
			},
			callback : "getSelect"
		});
	if("Loan"==ProductName){	
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges." + productId+"?template=true"
			},
			callback : "getcharges1"
		});
	}else if("Savings"==ProductName){

		$("#div5").hide();
		$("#div6").hide();
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges." + productId+"?template=true"
			},
			callback : "getcharges2"
		});
		
	}else if("Client"==ProductName){
		$("#div12").show();
		$("#div5").hide();
		$("#div6").hide();
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges." + productId+"?template=true"
			},
			callback : "getcharges3"
		});
		
	}else if("Shares"==ProductName){
		$("#div6").hide();
		$("#div11").hide();
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges." + productId+"?template=true"
			},
			callback : "getcharges4"
		});
	}
			
	 $.getWidget("edit").click(function() {
		 if ($.validateForm("editCost")) {	
			 var currency =$("#currencyCode").find("option:selected").attr("value");
			 var chargeAppliesTo=parseInt($("#chargeAppliesTo").find("option:selected").attr("value"));
			 var chargeCalculationType=parseInt($("#chargeCalculationType").find("option:selected").attr("value"));
			 var chargePaymentMode=parseInt($("#chargePaymentMode").find("option:selected").attr("value"));			
			 var chargeTimeType=parseInt($("#chargeTimeType").find("option:selected").attr("value"));
			 var taxGroupId=parseInt($("#team").find("option:selected").attr("value"));
			if("Loan"==ProductName){
				var  date={
				 		
						 "name":$('#name').val(),
						 "penalty":$("#penalty").is(':checked'),	
						 "chargeAppliesTo":chargeAppliesTo,
						 "chargeTimeType":chargeTimeType,
						 "locale":"en",	
						 "chargeCalculationType":chargeCalculationType,
						 "chargePaymentMode":chargePaymentMode,
						 "amount":$('#amount').val(),
						 "active":$("#active").is(':checked'),	
						 "currencyCode":currency,	
					 }			
				
			}else if("Savings"==ProductName) {
				var  date={
				 		
						 "name":$('#name').val(),
						 "penalty":$("#penalty").is(':checked'),	
						 "chargeAppliesTo":chargeAppliesTo,
						 "chargeTimeType":chargeTimeType,
						 "locale":"en",	
						 "chargePaymentMode":1,
						 "chargeCalculationType":chargeCalculationType,
						 "amount":$('#amount').val(),
						 "active":$("#active").is(':checked'),	
						 "currencyCode":currency,	
						
					 }			
				
			}else if("Client"==ProductName) {
				var  date={
				 		
						 "name":$('#name').val(),
						 "penalty":$("#penalty").is(':checked'),	
						 "chargeAppliesTo":chargeAppliesTo,
						 "chargeTimeType":chargeTimeType,
						 "locale":"en",	
						 "chargePaymentMode":1,
						 "chargeCalculationType":chargeCalculationType,
						 "amount":$('#amount').val(),
						 "active":$("#active").is(':checked'),	
						 "currencyCode":currency,	
						
					 }	
			}else if("Shares"==ProductName) {
					var  date={
					 		
							 "name":$('#name').val(),
							 "penalty":$("#penalty").is(':checked'),	
							 "chargeAppliesTo":chargeAppliesTo,
							 "chargeTimeType":chargeTimeType,
							 "locale":"en",	
							 "chargePaymentMode":1,
							 "chargeCalculationType":chargeCalculationType,
							 "amount":$('#amount').val(),
							 "active":$("#active").is(':checked'),	
							 "currencyCode":currency,	
							
						 }	
			}
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						'dataType' : "PUT",
						'mydata' : date,
						'url' : 'api.v1.charges.'+productId
					},
					callback : "callbackadd"
					
				});
		 }
		 })
	 $.valid("addCost", [ {
			"name" : "name",
			"notEmpty" : "不能为空"
		},{
			"name" : "currency",
			"notEmpty" : "不能为空"
		},{
			"name" : "chargeTimeType",
			"notEmpty" : "不能为空"
		},{
			"name" : "chargeCalculationType",
			"notEmpty" : "不能为空"
		},{
			"name" : "chargePaymentMode",
			"notEmpty" : "不能为空"
		},{
			"name" : "amount",
			"notEmpty" : "不能为空"
		}])
			
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges." + productId+"?template=true"
			},
			callback : "getcharges"
		});
	 
})
function callbackadd(param) {
	$.setReadOnly("editCost");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}

</script>