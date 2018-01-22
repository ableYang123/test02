<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="edit_savingsProduct" name="edit_savingsProduct" >
<fieldset>
		<legend>
			<spring:message code="deposit.savings.product.edit" />
		</legend>
		<div><h3><spring:message code="deposit.label.details" /></h3></div>

	<div class="form-group">
			<label for="name" class="col-sm-2 control-label"><spring:message code="deposit.label.product.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" />
			</div>
			
			<label for="shortName" class="col-sm-2 control-label"><spring:message code="deposit.label.shortName" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="shortName" name="shortName" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="description" class="col-sm-2 control-label"><spring:message code="deposit.label.description" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<textarea class="form-control" name="description" id="description"></textarea>
			</div>
		</div>

		<div><h3><spring:message code="deposit.label.currency" /></h3></div>
		
		<div class="form-group">
			<label for="currencyCode" class="col-sm-2 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="currencyCode" name="currencyCode" class="form-control" style="width: 198">
				</select>
			</div>
			<label for="digitsAfterDecimal" class="col-sm-2 control-label"><spring:message code="deposit.label.digitsAfterDecimal" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="digitsAfterDecimal" name="digitsAfterDecimal"  />
			</div>
			
		</div>
		
		<div class="form-group">
			<label for="inMultiplesOf" class="col-sm-2 control-label"><spring:message code="label.inMultiplesOf" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="inMultiplesOf" name="inMultiplesOf" />
			</div>
		</div>
	<div><h3><spring:message code="deposit.label.terms" /></h3></div>
		
		<div class="form-group">
			<label for="nominalAnnualInterestRate" class="col-sm-2 control-label"><spring:message code="deposit.label.deposit" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="nominalAnnualInterestRate" name="nominalAnnualInterestRate" />
			</div>
		</div>
				
		<div class="form-group">
			<label for="interestCompoundingPeriodTypeOptions" class="col-sm-2 control-label"><spring:message code="deposit.label.interestCompoundingPeriodType" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="interestCompoundingPeriodTypeOptions" name="interestCompoundingPeriodTypeOptions" class="form-control" style="width: 198">
				</select>
			</div>
			<label for="interestPostingPeriodTypeOptions" class="col-sm-2 control-label"><spring:message code="label.interestPostingPeriodType" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="interestPostingPeriodTypeOptions" name="interestPostingPeriodTypeOptions" class="form-control" style="width: 198">
				</select>
			</div>
		</div>
		
		
				
		<div class="form-group">
			<label for="interestCalculationType" class="col-sm-2 control-label"><spring:message code="deposit.label.interestCalculationType" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="interestCalculationType" name="interestCalculationType" class="form-control" style="width: 198">
				</select>
			</div>
			<label for="interestCalculationDaysInYearType" class="col-sm-2 control-label"><spring:message code="deposit.label.interestCalculationDaysInYearType" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="interestCalculationDaysInYearType" name="interestCalculationDaysInYearType" class="form-control" style="width: 198">
				</select>
			</div>
		</div>

<div><h3><spring:message code="deposit.label.settings" /></h3></div>
<div class="form-group">
			<label for="minRequiredOpeningBalance" class="col-sm-2 control-label"><spring:message code="label.minDepositAmount" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minRequiredOpeningBalance" name="minRequiredOpeningBalance"  />
			</div>
			</div>
	<div class="form-group">		
			<label class="col-sm-2 control-label"><spring:message code="local.in.period" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="lockinPeriodFrequency" name="lockinPeriodFrequency"  />
			</div >
			<div  class="col-sm-2">
		<select id="lockinPeriodFrequencyType" name="lockinPeriodFrequencyType" class="form-control"></select>
			</div>
</div>

				<div class="form-group">
			<label for="withdrawalFeeForTransfers" class="col-sm-3 control-label"><spring:message code="deposit.fee.transfers" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="withdrawalFeeForTransfers" type="checkbox"></label>
			</div>
			<label for="minBalanceForInterestCalculation" class="col-sm-3 control-label"><spring:message code="deposit.banance.interest" /></label>
			<div class="col-sm-3">
				<input id="minBalanceForInterestCalculation" type="text" class="form-control">
			</div>
	</div>
					<div class="form-group">
			<label for="withdrawalFeeForTransfers" class="col-sm-3 control-label"><spring:message code="deposit.force.min.amount" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="withdrawalFeeForTransfers" type="checkbox"></label>
			</div>
			<label for="minBalanceForInterestCalculation" class="col-sm-3 control-label"><spring:message code="deposit.min.amount" /></label>
			<div class="col-sm-3">
				<input id="minBalanceForInterestCalculation" type="text" class="form-control">
			</div>
	</div>

<div class="form-group">
			<label for="allowOverdraft" class="col-sm-3 control-label"><spring:message code="is.allow.overdraft" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="allowOverdraft" type="checkbox"></label>
			</div>
			</div>
			<div class="form-group" id="div1">
			<label for="overdraftLimit" class="col-sm-4 control-label"><spring:message code="deposit.max.amount.overdraft" /></label>
			<div class="col-sm-3">
				<input id="overdraftLimit" type="text" class="form-control">
			</div>
	</div>
	<div class="form-group" id="div2">
			<label for="nominalAnnualInterestRateOverdraft" class="col-sm-4 control-label"><spring:message code="Nominal.annual.interest.for.overdraft" /></label>
			<div class="col-sm-3">
				<input id="nominalAnnualInterestRateOverdraft" type="text" class="form-control">
			</div>
	</div>
	<div class="form-group" id="div3">
			<label for="minOverdraftForInterestCalculation" class="col-sm-4 control-label"><spring:message code="Min.Overdraft.Required.For.Interest.Calculation" /></label>
			<div class="col-sm-3">
				<input id="minOverdraftForInterestCalculation" type="text" class="form-control">
			</div>
	</div>

<div class="form-group">
			<label for="withHoldTax" class="col-sm-3 control-label"><spring:message code="deposit.is.user" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="withHoldTax" type="checkbox"></label>
			</div>
			</div>

	
	<div class="form-group" id="div4">		
			<label  class="col-sm-2 control-label"><spring:message 

code="deposit.tax.team" /></label>
			<div  class="col-sm-4">
		<select id="taxGroupId" name="taxGroupId" class="form-control" style="width:180px;"></select>
			</div>
</div>


<div class="form-group">
			<label for="isDormancyTrackingActive" class="col-sm-3 control-label"><spring:message code="Enable.Dormancy.Tracking" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="isDormancyTrackingActive" type="checkbox"></label>
			</div>
			</div>

	<div class="form-group" id="div5">
			<label for="daysToInactive" class="col-sm-4 control-label"><spring:message code="Number.of.Days.to.Inactive.sub-status" /></label>
			<div class="col-sm-3">
				<input id="daysToInactive" type="text" class="form-control">
			</div>
	</div>

	<div class="form-group" id="div6">
			<label for="daysToDormancy" class="col-sm-4 control-label"><spring:message code="Number.of.Days.to.Dormant.sub-status" /></label>
			<div class="col-sm-3">
				<input id="daysToDormancy" type="text" class="form-control">
			</div>
	</div>

	<div class="form-group" id="div7">
			<label for="daysToEscheat" class="col-sm-4 control-label"><spring:message code="Number.of.Days.to.Escheat" /></label>
			<div class="col-sm-3">
				<input id="daysToEscheat" type="text" class="form-control">
			</div>
	</div>
<div><h3><spring:message code="deposit.label.charges" /></h3></div> 
		
	<div class="form-group">
			<div class="col-sm-3">
				<select type="checkbox" id="chargeId" name="chargeId" class="form-control" >
				<option value="charge"><spring:message code="select.cost" /></option>
				</select>
			</div>
			
			<div class="col-sm-3">
				<button type="button" class="btn btn-info" onclick="addCharges();"><spring:message code="btn.add" /></button>				
			</div>
			</div>
	<table class="table table-hover table-bordered" id="chargesTable" >
<tr>
		<th>Name</th>
		<th>Type</th>
		<th>Amount</th>
		<th>Collected On</th>
		<th>Date</th>
		<th>Actions</th>
	</tr>
	<tr style="display:none">
	<td><span name="chargeName" id=""></span></td>
						<td><span name="chargeType"></span></td>
						<td><span name="chargeAmount"></span></td>
						<td><span name="chargeCollectedOn"></span></td>
						<td></td>
						<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
	</tr>

</table>	
		<div><h3><spring:message code="deposit.label.accounting" /></h3></div>  
 <div class="form-group "   id="accountingRule">
		<label for="none"><spring:message code="deposit.label.none" /></label>
		 <input type="radio" name="accounting" id="none" checked="checked" value="1"> 
		 <label for="money"><spring:message code="deposit.label.cash" /></label>
		<input type="radio" name="accounting" id="money" value="2"> 
	</div> 
<div id="div01"><h3><spring:message code="deposit.label.assets" /></h3></div> 
	
<div class="form-group" id="div02">
			<label  for="loan1" class="col-sm-2 control-label"><spring:message code="deposit.reference" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="loan1" /></select>
			</div>
						<label  for="loan2" class="col-sm-2 control-label"><spring:message code="Overdraft.Portfolio" /></label>
			
			<div class="col-sm-3">
				<select class="form-control" id="loan2"/></select>
			</div>
			</div>
<div id="div03"><h3><spring:message code="deposit.label.liabilities" /></h3></div> 

	<div class="form-group" id="div04">
			<label  for="savingsControlAccountId1" class="col-sm-2 control-label"><spring:message code="Saving.control" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="savingsControlAccountId1"/></select>
			</div>
			<label  for="savingsControlAccountId2" class="col-sm-2 control-label"><spring:message code="Savings.transfers.in.suspense" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="savingsControlAccountId2"/></select>
			</div>							
			</div>
			<div class="form-group" id="div15">
			<label  for="loan3" class="col-sm-2 control-label"><spring:message code="Escheat.Liability" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="loan3" /></select>
			</div>
			</div>
<div id="div06"><h3><spring:message code="deposit.label.charges" /></h3></div>
	<div class="form-group" id="div07">
			<label  for="Expenses1" class="col-sm-2 control-label"><spring:message code="Interest.on.savings" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="Expenses1"/></select>
			</div>
						<label  for="Expenses2" class="col-sm-2 control-label"><spring:message code="deposit.Write.off" /></label>
			
			<div class="col-sm-3">
				<select  class="form-control" id="Expenses2"/></select>
			</div>
			</div>
<div id="div08"><h3><spring:message code="deposit.label.income" /></h3></div> 
	<div class="form-group" id="div09">
			<label  for="Income1" class="col-sm-2 control-label"><spring:message code="deposit.saving.income" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="Income1"/></select>
			</div>
						<label  for="Income2" class="col-sm-2 control-label"><spring:message code="Income.from.penalties" /></label>
			
			<div class="col-sm-3">
				<select  class="form-control" id="Income2"/></select>
			</div>
			</div>
			<div class="form-group" id="div10">
			<label  for="Income3" class="col-sm-2 control-label"><spring:message code="Overdraft.Interest.Income" /></label>
			<div class="col-sm-3">
				<select  class="form-control" id="Income3"/></select>
			</div>
						
			</div>
<div style="padding-top: 20px" id="show">
<span><strong><spring:message code="deposit.label.advanced.account"/></strong><a id="showButton">[<spring:message code="deposit.label.show"/>]</a><a id="hideButton">[<spring:message code="deposit.hide"/>]</a></span>
</div>
<div style="width: 500px;text-align: right;" id="button1">
	<span><spring:message code="deposit.msg.cash.paymentType"/></span>
	<button type="button" class="btn btn-info" id="Add1">Add</button>
	<table class="table table-bordered" id="showTable1" >
	<tr>
	<th><spring:message code="deposit.label.paymentType" /></th>
						<th><spring:message code="deposit.label.fundSourceAccount" /></th>
						<th><spring:message code="deposit.label.action" /></th>
	</tr>
	<tr style="display:none">
	<td><select id="payment" class="form-control"></select></td>
	<td><select id="source" type="text" class="form-control"></select></td>
	<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
	</tr>
	</table>
	</div>
	<div style="width: 500px;text-align: right;" id="button2">
	<span><spring:message code="deposit.msg.cash.fees"/></span>
	<button type="button" class="btn btn-info" id="Add2">Add</button>
	<table class="table table-bordered" id="showTable2">
	<tr>
	<th><spring:message code="deposit.label.fees" /></th>
						<th><spring:message code="deposit.label.incomeAccount" /></th>
						<th><spring:message code="deposit.label.action" /></th>
	</tr>
	<tr style="display:none">
	<td><select id="fees" class="form-control"></select></td>
	<td><select id="income" type="text" class="form-control"></select></td>
	<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
	</tr>
	</table>
	</div>
	<div style="width: 500px;text-align: right;" id="button3">
	<span><spring:message code="deposit.msg.cash.penalty"/></span>
	<button type="button" class="btn btn-info" id="Add3">Add</button>
	<table class="table table-bordered" id="showTable3">
	<tr>
	<th><spring:message code="deposit.label.penalty" /></th>
						<th><spring:message code="deposit.label.incomeAccount" /></th>
						<th><spring:message code="deposit.label.action" /></th>
	</tr>
	<tr style="display:none">
	<td><select id="penalty" class="form-control"></select></td>
	<td><select id="Account" type="text" class="form-control"></select></td>
	<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
	</tr>
	</table>
	</div>
<div style="text-align: center;padding-top: 20px">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button class="btn btn-info" id="edit" type="button"><spring:message code="btn.submit" /></button>
</div>
</fieldset>
</form>
<script type="text/javascript">
function getsavings(param){
	 $.assign({
			"name" : param.name,
			"shortName" : param.shortName,
			"description":param.description,
			"inMultiplesOf":param.currency.inMultiplesOf,
			"nominalAnnualInterestRate":param.nominalAnnualInterestRate,
			"digitsAfterDecimal":param.currency.decimalPlaces,
		
		});
	 $('#active').attr('checked', param.active);
} 
function getSelect(param) {
	$.setSelect('taxGroupId', param.taxGroupOptions, 'id', 'name');
	$.setSelect('loan1', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');	
	$.setSelect('loan2', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');	
	$.setSelect('loan3', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');	
	$.setSelect('savingsControlAccountId1', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');	
	$.setSelect('savingsControlAccountId2', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');	
	$.setSelect('Expenses1', param.accountingMappingOptions.expenseAccountOptions, 'id', 'name');	
	$.setSelect('Expenses2', param.accountingMappingOptions.expenseAccountOptions, 'id', 'name');	
	$.setSelect('Income1', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');	
	$.setSelect('Income2', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');	
	$.setSelect('Income3', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');	
	$.setSelect('penalty', param.penaltyOptions, 'id', 'name');
	$.setSelect('Account', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('fees', param.chargeOptions, 'id', 'name');	
	$.setSelect('income', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('source', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('payment', param.paymentTypeOptions, 'id', 'name');	
	$.setSelect('chargeId', param.chargeOptions, 'id', 'name');		
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');	
	 $.setSelect('interestCompoundingPeriodTypeOptions', param.interestCompoundingPeriodTypeOptions, 'id', 'value');	
	$.setSelect('interestPostingPeriodTypeOptions', param.interestPostingPeriodTypeOptions, 'id', 'value');		
	$.setSelect('interestCalculationType', param.interestCalculationTypeOptions, 'id', 'value');	
	$.setSelect('interestCalculationDaysInYearType', param.interestCalculationDaysInYearTypeOptions, 'id', 'value');		
	$.setSelect('lockinPeriodFrequencyType', param.lockinPeriodFrequencyTypeOptions, 'id', 'value');	
		
}
//增加费用
function addCharges(){
	var chargeID = $.value("chargeId");
	
	if(typeof(chargeID)!='undefined'&&chargeID!=''){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : '',
				"url" : "api.v1.charges."+chargeID+"?template=true"
			},
			callback : "addChargesBack"
		});
	}
	
	
}

//费用回调，赋值
function addChargesBack(param){
	$.tableclone("chargesTable");
	$('#chargesTable').find('tr').last().find('span[name="chargeName"]').attr("id",param.id);
	$('#chargesTable').find('tr').last().find('span[name="chargeName"]').text(param.name);
	$('#chargesTable').find('tr').last().find('span[name="chargeType"]').text(param.chargeCalculationType.value);
	$('#chargesTable').find('tr').last().find('span[name="chargeAmount"]').text(param.amount);
	$('#chargesTable').find('tr').last().find('span[name="chargeCollectedOn"]').text(param.chargeTimeType.value);
}

  $(document).ready(function(){
	$("#div1").hide();
	$("#div2").hide();
	$("#div3").hide();
	$("#div4").hide();
	$("#div5").hide();
	$("#div6").hide();
	$("#div7").hide();
	$("#div01").hide();
	$("#div02").hide();
	$("#div03").hide();
	$("#div04").hide();
	$("#div05").hide();
	$("#div06").hide();
	$("#div07").hide();
	$("#div08").hide();
	$("#div09").hide();
	$("#div10").hide();
	$("#div11").hide();
	$("#div12").hide();
	$("#div13").hide();
	$("#div14").hide();
	$("#div15").hide();
    $("#show").hide();
    $("#button1").hide();
	$("#button2").hide();
	$("#button3").hide();
	$("#hideButton").hide();	
	$("#chargesTable").hide();
    $("#showButton").click(function(){
		$("#button1").show();
		$("#button2").show();
		$("#button3").show();
		$("#hideButton").show();
		$("#showButton").hide();
	});
	$("#hideButton").click(function(){
		$("#button1").hide();
		$("#button2").hide();
		$("#button3").hide();
		$("#showButton").show();
		$("#hideButton").hide();
	});
	$("#allowOverdraft").click(function(){
		$("#div1").toggle();
		$("#div2").toggle();
		$("#div3").toggle();
	});
	$("#withHoldTax").click(function(){
		$("#div4").toggle();	
	});
	$("#isDormancyTrackingActive").click(function(){
		$("#div5").toggle();
		$("#div6").toggle();
		$("#div7").toggle();
	});
	$("#none").click(function(){
			  var    $radio = $(this).find("input[type=radio]"),
	          $flag  = $radio.is(":checked");

			  $("#div01").hide();
			  $("#div02").hide();
			  $("#div03").hide();
			  $("#div04").hide();
			  $("#div05").hide();
			  $("#div06").hide();
			  $("#div07").hide();
			  $("#div08").hide();
			  $("#div09").hide();
			  $("#div10").hide();
			  $("#div11").hide();
			  $("#div12").hide();
			  $("#div13").hide();
			  $("#div14").hide();
			  $("#div15").hide();
			  $("#show").hide();
			   $("#button1").hide();
				$("#button2").hide();
				$("#button3").hide();
				$("#hideButton").hide();
				$("#showButton").hide();
	          if( !$flag ){
	           $radio.prop("checked",true);   
	 		}
	});
	$("#money").click(function(){
			  var    $radio = $(this).find("input[type=radio]"),
	          $flag  = $radio.is(":checked");

			  $("#div01").show();
			  $("#div02").show();
			  $("#div03").show();
			  $("#div04").show();
			  $("#div05").show();
			  $("#div06").show();
			  $("#div07").show();
			  $("#div08").show();
			  $("#div09").show();
			  $("#div10").show();
			  $("#div11").show();
			  $("#div12").show();
			  $("#div13").show();
			  $("#div14").show();
			  $("#show").show();
			  $("#div15").show();
	          if( !$flag ){
	           $radio.prop("checked",true);   
	 		}
	});
	$.valid("add_savingsProduct", [ {
		"name" : "name",
		"notEmpty" : "不能为空"
	}, {
		"name" : "shortName",
		"notEmpty" : "不能为空"
	},{
		"name":"description",
		"notEmpty" : "不能为空"
	},
	{
		"name":"inMultiplesOf",
		"notEmpty" : "不能为空"
	},
	{
		"name":"nominalAnnualInterestRate",
		"notEmpty" : "不能为空"
	}]);
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.savingsproducts.template"
			},
			callback : "getSelect"
		}); 
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.savingsproducts." + productId
			},
			callback : "getsavings"
		});
	
	
	 $.getWidget("edit").click(function() {
		 if ($.validateForm("edit_savingsProduct")) {	
		
		var currency =$("#currencyCode").find("option:selected").attr("value");
		var interestCompoundingPeriodType=parseInt($("#interestCompoundingPeriodTypeOptions").find("option:selected").attr("value"));
		var interestPostingPeriodType=parseInt($("#interestPostingPeriodTypeOptions").find("option:selected").attr("value"));
		var interestCalculationType=parseInt($("#interestCalculationType").find("option:selected").attr("value"));
		var interestCalculationDaysInYearType=parseInt($("#interestCalculationDaysInYearType").find("option:selected").attr("value"));

		var date;
		date={
				"accountingRule":1,
				"allowOverdraft":false,
				"charges":[],
				"currencyCode":currency,
				"description":$('#description').val(),								
				"digitsAfterDecimal":$('#digitsAfterDecimal').val(),
				"enforceMinRequiredBalance":false,
				"feeToIncomeAccountMappings":[],
				"inMultiplesOf":$.value('inMultiplesOf'),
				"interestCalculationDaysInYearType":interestCalculationDaysInYearType,
				"interestCalculationType":interestCalculationType,				
				"interestCompoundingPeriodType":interestCompoundingPeriodType,
				"interestPostingPeriodType":interestPostingPeriodType,
				"locale" : "en",
				"name":$('#name').val(),
				"isDormancyTrackingActive":false,
				"nominalAnnualInterestRate":$('#nominalAnnualInterestRate').val(),		
				"paymentChannelToFundSourceMappings":[],
				"penaltyToIncomeAccountMappings":[],
				"shortName":$('#shortName').val(),
				"withHoldTax":false,
				"withdrawalFeeForTransfers":false,
				
																				
		}
		console.log(date);
		 $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					'dataType' : "PUT",
					'mydata' : date,
					'url' : 'api.v1.savingsproducts.'+productId
				},
				callback : "callbackadd"
				
			});
					
		 }		

  }); 
  });
function callbackadd(param) {
	$.setReadOnly("edit_savingsProduct");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
$("#Add1").click(function() {	
	$.tableclone("showTable1")
})
$("#Add2").click(function() {	
	$.tableclone("showTable2")
})
$("#Add3").click(function() {	
	$.tableclone("showTable3")
})
$.getWidget("chargeId").change(function() {	
	if(this.value)
		checkSelect(this.value);

});
function checkSelect(value){
	var selectedOption = document.getElementById("chargeId").value;
	if(selectedOption!="charge"){
		$("#chargesTable").show();
	}else{
		$("#chargesTable").hide();
	}
	}
</script>