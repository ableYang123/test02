<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="editProduct" name="editProduct">
<fieldset>
		<legend>
			<spring:message code="edit.loan.product" />
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
			<label for="description" class="col-sm-2 control-label"><spring:message code="deposit.label.description" /></label>
			<div class="col-sm-3">
				<textarea class="form-control" id="description" name="description" ></textarea>
			</div>
			<label for="fundId" class="col-sm-2 control-label"><spring:message code="deposit.label.fund" /></label> 
			<div class="col-sm-3"><select id="fundId" name="FundName" class="form-control"></select></div>
		</div>
		<div class="form-group">
			<label for="fromDate" class="col-sm-2 control-label"><spring:message code="label.fromDate" /></label>
			<div class="col-sm-3">
				<input type="text" datetype="date" name="startDate"  beforeToday="false" id="startDate"/>
			</div>
			<label for="endDate" class="col-sm-2 control-label"><spring:message code="label.endDate" /></label>
			<div class="col-sm-3">
				<input type="text" datetype="date" name="closeDate" beforeToday="false" id="closeDate"/>
			</div>
		</div>
	<div class="form-group">
			<label for="preClosurePenalApplicable" class="col-sm-4 control-label"><spring:message code="deposit.loan.counter" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="preClosurePenalApplicable" type="checkbox"></label>
			</div>
			</div>
	<div><h3><spring:message code="deposit.label.currency" /></h3></div>
	<div class="form-group">
			<label for="currency" class="col-sm-2 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="currency" name="currencyCode" class="form-control" style="width: 198">
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
				<input type="text" class="form-control" id="principalThresholdForLastInstallment" name="inMultiplesOf" />
			</div>
		</div>
		<div class="form-group">
			<label for="installmentAmountInMultiplesOf" class="col-sm-2 control-label"><spring:message code="Installment.in.multiples.of" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="installmentAmountInMultiplesOf" name="installmentAmountInMultiplesOf" />
			</div>
		</div>
<div><h3><spring:message code="deposit.label.terms" /></h3></div>		
				<div class="form-group">
			<label for="checkbox1" class="col-sm-3 control-label"><spring:message code="deposit.loan.cycle" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="checkbox1" type="checkbox"></label>
			</div>
	</div>
			<div class="form-group col-sm-12">
			<label  class="col-sm-2 control-label"><spring:message code="deposit.label.Principal" /><span style="color: #d9534f;">*</span> </label>			
			<div class="col-sm-2">	<input type="text" class="form-control col-sm-1" id="minPrincipal" name="min"></div>			
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="principal" name="default"></div>					
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="maxPrincipal" name="max"></div>
		</div>
			
	<div class="form-group col-sm-6" id="add">
		<span><spring:message code="deposit.label.loan.cycle" /></span>
		<button type="button" class="btn btn-info" id="addCycle"><spring:message code="btn.add" /></button>
		<table class="table table-hover table-bordered" id="table" style="width:80%px;">
<tr>
		<th></th>
		<th><spring:message code="loan.deposit" /></th>
		<th><spring:message code="table.min" /></th>
		<th><spring:message code="table.default" /></th>
		<th><spring:message code="table.max" /></th>
	</tr>
	<tr style="display:none">
	<td><select id="valueConditionType" class="form-control"></select></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	</tr>

</table>	
	</div>
	<div class="form-group col-sm-12">
			<label  class="col-sm-2 control-label"><spring:message code="deposit.label.repayments" /><span style="color: #d9534f;">*</span> </label>			
			<div class="col-sm-2">	<input type="text" class="form-control col-sm-1" id="minNumberOfRepayments" name="min">	</div>	
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="numberOfRepayments" name="default"></div>			
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="maxNumberOfRepayments" name="max"></div>
		</div>
			
	<div class="form-group">
			<label for="checkbox1" class="col-sm-4 control-label"><spring:message code="deposit.floating.rates" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="checkbox2" type="checkbox" ></label>
			</div>	
			</div>	
	<div class="form-group col-sm-6" id="add1">
		<span><spring:message code="deposit.label.loan.cycle" /></span>
		<button type="button" class="btn btn-info" id="addCycle2"><spring:message code="btn.add" /></button>
		<table class="table table-hover table-bordered" id="table2">
<tr>
<th></th>
		<th><spring:message code="loan.deposit" /></th>
		<th><spring:message code="table.min" /></th>
		<th><spring:message code="table.default" /></th>
		<th><spring:message code="table.max" /></th>
	</tr>
	<tr style="display:none">
	<td><select id="valueConditionType2" class="form-control"></select></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	</tr>

</table>	
	</div>
	

<div class="form-group" id="is1">
			<label  class="col-sm-2 control-label"><spring:message code="deposit.floating.rate" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="floatingRateOptions"  /></select>
			</div>
			<div class="col-sm-3">
				<input  type="text" class="form-control" id="differentialinterest" />
			</div>
			<label  class="col-sm-3 control-label"><spring:message code="deposit.floating.allow" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input  type="checkbox" ></label>
			</div>	
		</div>
<div class="form-group" id="is2">
			<label  class="col-sm-3 control-label"><spring:message code="deposit.floating.allow" /></span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minValue"  />
			</div>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="default"  />
			</div>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="maxValue" />
			</div>
	</div>	
	<div class="form-group col-sm-12">
			<label  class="col-sm-2 control-label"><spring:message code="deposit.interest.rate" /><span style="color: #d9534f;">*</span> </label>			
			<div class="col-sm-2">	<input type="text" class="form-control col-sm-1" id="minInterestRatePerPeriod" name="min">	</div>	
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="interestRatePerPeriod" name="default"></div>			
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="maxInterestRatePerPeriod" name="max"></div>
		<div class="col-sm-2"><select id="interestRateFrequencyType" class="form-control" name="interestRateFrequencyType" style="width:150px;"></select></div>
		</div>
		
<div class="form-group col-sm-6" id="add2">
		<span><strong>Principal by loan cycle </strong></span>
		<button type="button" class="btn btn-info" id="addCycle3"><spring:message code="btn.add" /></button>
		<table class="table table-hover table-bordered" id="table3" >
<tr>
		<th></th>
		<th><spring:message code="loan.deposit" /></th>
		<th><spring:message code="table.min" /></th>
		<th><spring:message code="table.default" /></th>
		<th><spring:message code="table.max" /></th>
	</tr>
	<tr style="display:none">
	<td><select id="valueConditionType3" class="form-control"></select></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	<td><input type="text" class="form-control"></td>
	</tr>

</table>	
	</div>

<div class="form-group col-sm-12">
			<label  class="col-sm-2 control-label"><spring:message code="deposit.Repaid.every" /><span style="color: #d9534f;">*</span> </label>			
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="repaymentEvery" name="repaymentEvery"></div>
		<div class="col-sm-2"><select id="every2" class="form-control" name=""></select></div>
		</div>


<div class="form-group">
			<label for="date" class="col-sm-5 control-label"><spring:message code="deposit.days" /></span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="date" name="date" />
			</div>
	</div>
<div><h3><spring:message code="deposit.label.settings" /></h3></div> 

		<div class="form-group">
			<label for="amortizationType" class="col-sm-2 control-label"><spring:message code="deposit.Amortization" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="amortizationType" name="amortizationType" /></select>
			</div>
			
			<label for="interestType" class="col-sm-3 control-label"><spring:message code="deposit.interest.method" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="interestType" name="interestType" /></select>
			</div>
		</div>
		
	
	<div class="form-group">
			<label for="interestCalculationPeriodType" class="col-sm-2 control-label"><spring:message code="deposit.period" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="interestCalculationPeriodType" name="interestCalculationPeriodType" /></select>
			</div>
			
			<label for="jisuan" class="col-sm-4 control-label"><spring:message code="deposit.interest.days.period" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input  id="jisuan"  type="checkbox" />
			</div>
		</div>
	
	<div class="form-group">
			<label for="transactionProcessingStrategyId" class="col-sm-2 control-label"><spring:message code="deposit.strategy" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="transactionProcessingStrategyId"/></select>
			</div>
			</div>

<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="deposit.moratorium" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="graceOnPrincipalPayment"/>
			</div>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="graceOnInterestPayment"/>
			</div>
			</div>
	<div class="form-group">
			<label for="graceOnInterestCharged" class="col-sm-2 control-label"><spring:message code="deposit.free.period" /> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="graceOnInterestCharged"/>
			</div>
			<label for="inArrearsTolerance" class="col-sm-2 control-label"><spring:message code="deposit.Arrears.tolerance" /> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="inArrearsTolerance"/>
			</div>
			</div>
	<div class="form-group">
			<label for="daysInYearType" class="col-sm-2 control-label"><spring:message code="deposit.day.of.year" /> <span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<select class="form-control" id="daysInYearType"/></select>
			</div>
			<label for="daysInMonthType" class="col-sm-2 control-label"><spring:message code="deposit.year.day" /> <span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<select  class="form-control" id="daysInMonthType"/></select>
			</div>
			</div>
	
	<div class="form-group">
			<label for="allow" class="col-sm-3 control-label"><spring:message code="deposit.allow.amount" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="allow" type="checkbox"></label>
			</div>
	</div>
	<div class="form-group">
			<label for="graceOnArrearsAgeing" class="col-sm-5 control-label"><spring:message code="deposit.loan.into.arrears" /> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="graceOnArrearsAgeing"/>
			</div>
			</div>
	
	<div class="form-group">
			<label for="overdueDaysForNPA" class="col-sm-5 control-label"><spring:message code="deposit.npa.loan.before" /> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="overdueDaysForNPA"/>
			</div>
			</div>

	<div class="form-group">
			<label for="allow" class="col-sm-6 control-label"><spring:message code="deposit.npa.cleared" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="allow" type="checkbox"></label>
			</div>
	</div>
	
	<div class="form-group">
			<label for="overdueDaysForNPA" class="col-sm-5 control-label"><spring:message code="deposit.principal.instalment" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="overdueDaysForNPA"/>
			</div>
			</div>
			
			<div class="form-group">
			<label for="checkbox3" class="col-sm-4 control-label"><spring:message code="deposit.allow.stages" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="checkbox3" type="checkbox"></label>
			</div>
	</div>
	
	<div class="form-group" id="instalments">
			<label  class="col-sm-3 control-label"><spring:message code="allow.stages" /> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minimumgap"/>
			</div>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="maximumgap"/>
			</div>
			</div>

<div class="form-group">
			<label for="full" class="col-sm-4 control-label"><spring:message code="is.allow.stages" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="full" type="checkbox"></label>
			</div>
	</div>	
	<div><h3><spring:message code="deposit.Interest.Recalculation" /></h3></div> 
	<div class="form-group">
			<label for="checkbox4" class="col-sm-3 control-label"><spring:message code="deposit.begin.interst" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="checkbox4" type="checkbox"></label>
			</div>
	</div>

<div class="form-group" id="Calculation1">
			<label for="preClosureInterestCalculationStrategy" class="col-sm-3 control-label"><spring:message code="deposit.rule.interst" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="preClosureInterestCalculationStrategy"/></select>
			</div>
			<label for="rescheduleStrategyMethod" class="col-sm-3 control-label"><spring:message code="deposit.payments.type" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="rescheduleStrategyMethod"/></select>
			</div>
			</div>
				<div class="form-group" id="Calculation7">
			<label for="interestRecalculationCompoundingMethod" class="col-sm-3 control-label"><spring:message code="interstate.recalculation .on" /> <span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<select class="form-control" id="interestRecalculationCompoundingMethod"/></select>
			</div>
			</div> 
			
			<div class="form-group" id="Calculation2">
			<label for="recalculationCompoundingFrequencyType" class="col-sm-3 control-label"><spring:message code="Frequency.for.compounding" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="recalculationCompoundingFrequencyType"/></select>
			</div>
			</div>			
	<div class="form-group" id="Calculation6">
			<label for="recalculationCompoundingFrequencyInterval" class="col-sm-3 control-label"><spring:message code="Frequency.Interval.for.compounding" /><span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="recalculationCompoundingFrequencyInterval"/>
			</div>
			</div>
					
 <div class="form-group" id="Calculation3">
			<label for="recalculationRestFrequencyType" class="col-sm-3 control-label"><spring:message code="Frequency.for.recalculate.Outstanding.Principal" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select class="form-control" id="recalculationRestFrequencyType"/></select>
			</div>
			</div> 
	
<div class="form-group" id="Calculation4">
			<label for="recalculationRestFrequencyInterval" class="col-sm-3 control-label"><spring:message code="Recalculate.the.frequency.interval" /><span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="recalculationRestFrequencyInterval"/>
			</div>
			</div>
						
			 <div class="form-group" id="Calculation5">
			<label for="isArrearsBasedOnOriginalSchedule" class="col-sm-3 control-label"><spring:message code="Is.Arrears.recognization.based.on.original.schedule" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input id="isArrearsBasedOnOriginalSchedule" type="checkbox" />
			</div>
			</div> 	
	<div><h3><spring:message code="Guarantee.Requirements" /></h3></div> 
		
		
		<div class="form-group">
			<label for="checkbox5" class="col-sm-3 control-label"><spring:message code="Place.Guarantee.Funds.On-Hold" /> </label>
			<div class="col-sm-3">
				<input id="checkbox5" type="checkbox" />
			</div>
			</div>
	<div class="form-group" id="place1">
			<label for="mandatoryGuarantee" class="col-sm-3 control-label"><spring:message code="Mandatory.Guarantee" /><span style="color: #d9534f;">* </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="mandatoryGuarantee"/>
			</div>
			</div>
			
			<div class="form-group" id="place2">
			<label  for="minimumGuaranteeFromOwnFunds" class="col-sm-3 control-label"><spring:message code="Minimum.Guarantee.from.Own.Funds" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minimumGuaranteeFromOwnFunds"/>
			</div>
						<label  for="minimumGuaranteeFromGuarantor" class="col-sm-3 control-label"><spring:message code="Minimum.Guarantee.from.Guarantor.Funds" /></label>
			
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minimumGuaranteeFromGuarantor"/>
			</div>
			</div>
<div><h3><spring:message code="Loan.Tranche.Details" /></h3></div> 
	
	<div class="form-group">
			<label for="checkbox6" class="col-sm-3 control-label"><spring:message code="Enable.Multiple.Disbursals" /> </label>
			<div class="col-sm-3">
				<input id="checkbox6" type="checkbox" />
			</div>
			</div>
	<div class="form-group" id="enable1">
			<label  for="maxTrancheCount" class="col-sm-3 control-label"><spring:message code="Maximum.Tranche.count" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="maxTrancheCount"/>
			</div>
			<label  for="outstandingLoanBalance" class="col-sm-3 control-label"><spring:message code="Maximum.allowed.outstanding.balance" /></label>
			
			<div class="col-sm-3">
				<input type="text" class="form-control" id="outstandingLoanBalance"/>
			</div>
			</div>
	<div><h3><spring:message code="Configurable.Terms.and.Settings" /></h3></div> 
	
		<div class="form-group">
			<label for="checkbox7" class="col-sm-5 control-label"><spring:message code="lable.allow.setting" /> </label>
			<div class="col-sm-3">
				<input id="checkbox7" type="checkbox" checked="checked" />
			</div>
			</div>
			<div class="form-group" id="set1">
			<label  class="col-sm-3 control-label"><spring:message code="deposit.Amortization" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			<label  class="col-sm-3 control-label"><spring:message code="deposit.interest.method" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			</div>
			<div class="form-group" id="set2">
			<label  class="col-sm-3 control-label"><spring:message code="deposit.strategy" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			<label  class="col-sm-3 control-label"><spring:message code="deposit.period" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			</div>
			
			<div class="form-group" id="set3">
			<label  class="col-sm-3 control-label"><spring:message code="deposit.Arrears.tolerance" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			<label  class="col-sm-3 control-label"><spring:message code="Repaid.every" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			</div>
	
		<div class="form-group" id="set4">
			<label  class="col-sm-3 control-label"><spring:message code="lable.moratorium" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			<label  class="col-sm-3 control-label"><spring:message code="deposit.loan.into.arrears" /> </label>
			<div class="col-sm-3">
				<input type="checkbox" checked="checked" />
			</div>
			</div>
		<div><h3><spring:message code="deposit.label.charges" /></h3></div> 
		
	<div class="form-group">
			<div class="col-sm-3">
				<select type="checkbox" id="chargeId" name="chargeId" class="form-control">
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
	
	<div><h3><spring:message code="deposit.Overdue.payment.cost" /></h3></div> 
	<div class="form-group">
			<div class="col-sm-3">
				<select type="checkbox" id="penalityId" name="penalityId" class="form-control">
				<option  value="Overduecharge"><spring:message code="select.cost" /></option>
				</select>
			</div>
			
			<div class="col-sm-3">
				<button type="button" class="btn btn-info" onclick="addOverdueCharges();"><spring:message code="btn.add" /></button>				
			</div>
			</div>
			<table class="table table-hover table-bordered" id="chargesTable2" >
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

 <div class="form-group"   id="accountingRule">
		<label for="none"><spring:message code="deposit.label.none" /></label> <input type="radio" name="accounting"
			id="none" checked="checked" value="1"> <label for="money"><spring:message code="deposit.label.cash" /></label>
		<input type="radio" name="accounting" id="money" value="2"> <label
			for="periodic"><spring:message code="Accrual.periodic" /></label> <input type="radio"
			name="accounting" id="periodic" value="3"> <label
			for="upfront"><spring:message code="Accrual.upfront" /></label> <input type="radio"
			name="accounting" id="upfront" value="4">
	</div> 
	</div>
	<div id="ml">
	<div><h3><spring:message code="deposit.label.assets" /></h3></div> 
	
<div class="form-group">
			<label  for="loan1" class="col-sm-2 control-label"><spring:message code="Fund.source" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="loan1"/></select>
			</div>
						<label  for="loan2" class="col-sm-2 control-label"><spring:message code="Loan.portfolio" /></label>
			
			<div class="col-sm-3">
				<select type="text" class="form-control" id="loan2"/></select>
			</div>
			</div>

<div class="form-group">
			<label  for="loan3" class="col-sm-2 control-label"><spring:message code="Interest.Receivable" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="loan3"/></select>
			</div>
						<label  for="loan4" class="col-sm-2 control-label"><spring:message code="Fees.Receivable" /></label>
			
			<div class="col-sm-3">
				<select type="text" class="form-control" id="loan4"/></select>
			</div>
			</div>


<div class="form-group" id="accounting3">
			<label  for="loan5" class="col-sm-2 control-label"><spring:message code="Penalties.Receivable" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="loan5"/></select>
			</div>					
			</div>
			
<div class="form-group" id="accounting4">
			<label  for="loan6" class="col-sm-2 control-label"><spring:message code="Transfer.in.suspense" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="loan6"/></select>
			</div>					
			</div>
	<div><h3><spring:message code="deposit.label.income" /></h3></div> 
	<div class="form-group" id="accounting5">
			<label  for="incomeFromFeeAccountId1" class="col-sm-2 control-label"><spring:message code="Income.from.Interest" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="incomeFromFeeAccountId1"/></select>
			</div>
						<label  for="incomeFromFeeAccountId2" class="col-sm-2 control-label"><spring:message code="deposit.label.incomeFromFeeAccount" /></label>
			
			<div class="col-sm-3">
				<select type="text" class="form-control" id="incomeFromFeeAccountId2"/></select>
			</div>
			</div>
			<div class="form-group">
			<label  for="incomeFromFeeAccountId3" class="col-sm-2 control-label"><spring:message code="deposit.label.incomeFromPenaltyAccount" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="incomeFromFeeAccountId3"/></select>
			</div>
						<label  for="incomeFromFeeAccountId4" class="col-sm-2 control-label"><spring:message code="Income.from.Recovery.Repayments" /></label>
			
			<div class="col-sm-3">
				<select type="text" class="form-control" id="incomeFromFeeAccountId4"/></select>
			</div>
			</div>
	<div><h3><spring:message code="deposit.label.expense" /></h3></div> 

	<div class="form-group">
			<label  for="Expenses" class="col-sm-2 control-label"><spring:message code="Losses.written.off" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="Expenses"/></select>
			</div>
						
			</div>
		<div><h3><spring:message code="deposit.label.liabilities" /></h3></div> 

	<div class="form-group">
			<label  for="Liabilities" class="col-sm-2 control-label"><spring:message code="Over.payment.liability" /></label>
			<div class="col-sm-3">
				<select type="text" class="form-control" id="Liabilities"/></select>
			</div>
						
			</div>
			</div>
	<div style="padding-top: 20px" id="down1">
		<span><strong><spring:message code="deposit.label.advanced.account"/></strong><a id="showButton">[<spring:message code="deposit.label.show"/>]</a><a id="hideButton">[<spring:message code="deposit.hide"/>]</a></span>
	</div>
	<div id="down">
	<div style="width: 500px;text-align: right;" >
	<span><spring:message code="deposit.msg.cash.paymentType"/></span>
	<button type="button" class="btn btn-info" id="Add1">Add</button>
	<table class="table table-hover table-bordered" id="showTable1">
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
	<div style="width: 500px;text-align: right;" >
	<span><spring:message code="deposit.msg.cash.fees"/></span>
	<button type="button" class="btn btn-info" id="Add2">Add</button>
	<table class="table table-hover table-bordered" id="showTable2">
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
	<div style="width: 500px;text-align: right;">
	<span><spring:message code="deposit.msg.cash.penalty"/></span>
	<button type="button" class="btn btn-info" id="Add3">Add</button>
	<table class="table table-hover table-bordered" id="showTable3">
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
	</div>
	<div style="text-align: center; padding-top: 20px">
	<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
		<button class="btn btn-info" name="btn" id="edit" type="button"><spring:message code="btn.submit" /></button>
	</div>
	</fieldset>
</form>
<script type="text/javascript">
function getloan(param){
  if(param.startDate){
	  $.assign({
		"startDate"  :$.formatDate(param.startDate)
	  })
  }else{
	  $.assign({
			"startDate"  :""
		  })
  };
  
  if(param.startDate){
	  $.assign({
		"closeDate"  :$.formatDate(param.closeDate)
	  })
  }else{
	  $.assign({
			"closeDate"  :""
		  })
  }
	 $.assign({
			"name" : param.name,
			"shortName" : param.shortName,
			"description":param.description,
			"digitsAfterDecimal":param.currency.decimalPlaces,
			"principalThresholdForLastInstallment":param.principalThresholdForLastInstallment,
			"installmentAmountInMultiplesOf":param.installmentAmountInMultiplesOf,
		     "minPrincipal":param.minPrincipal, 
		     "principal":param.principal, 
		     "maxPrincipal":param.maxPrincipal,
		     "minNumberOfRepayments":param.minNumberOfRepayments,
		     "numberOfRepayments":param.numberOfRepayments,
		     "maxNumberOfRepayments":param.maxNumberOfRepayments,
		     "minInterestRatePerPeriod":param.minInterestRatePerPeriod,
		     "interestRatePerPeriod":param.interestRatePerPeriod,
		     "maxInterestRatePerPeriod":param.maxInterestRatePerPeriod,
		     "repaymentEvery":param.repaymentEvery,
		});

} 

function getSelect(param) {
	$.setSelect('floatingRateOptions', param.floatingRateOptions, 'id', 'name');
	$.setSelect('penalityId', param.penaltyOptions, 'id', 'name');
	$.setSelect('recalculationCompoundingFrequencyType', param.interestRecalculationFrequencyTypeOptions, 'id', 'value');
	$.setSelect('Expenses', param.accountingMappingOptions.expenseAccountOptions, 'id', 'name');
	$.setSelect('Liabilities', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');
	$.setSelect('incomeFromFeeAccountId1', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('incomeFromFeeAccountId2', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('incomeFromFeeAccountId3', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('incomeFromFeeAccountId4', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('loan1', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('loan2', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('loan3', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('loan4', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('loan5', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('loan6', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');		
	$.setSelect('penalty', param.penaltyOptions, 'id', 'name');
	$.setSelect('Account', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('fees', param.chargeOptions, 'id', 'name');	
	$.setSelect('income', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
	$.setSelect('source', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
	$.setSelect('payment', param.paymentTypeOptions, 'id', 'name');	
	$.setSelect('chargeId', param.chargeOptions, 'id', 'name');		
	$.setSelect('valueConditionType', param.valueConditionTypeOptions, 'id', 'value');	
	$.setSelect('valueConditionType2', param.valueConditionTypeOptions, 'id', 'value');	
	$.setSelect('valueConditionType3', param.valueConditionTypeOptions, 'id', 'value');	
	$.setSelect('fundId', param.fundOptions, 'id', 'name');	
	$.setSelect('currency', param.currencyOptions, 'code', 'name');	
	 $.setSelect('interestRateFrequencyType',param.interestRateFrequencyTypeOptions,'id','value');
	 $.setSelect('every2',param.repaymentFrequencyTypeOptions,'id','value');
	 $.setSelect('amortizationType',param.amortizationTypeOptions,'id','value');
	  $.setSelect('interestType',param.interestTypeOptions,'id','value');
	  $.setSelect('interestCalculationPeriodType',param.interestCalculationPeriodTypeOptions,'id','value');
	  $.setSelect('transactionProcessingStrategyId',param.transactionProcessingStrategyOptions,'id','name');
	  $.setSelect('daysInYearType',param. daysInYearTypeOptions,'id','value');
	  $.setSelect('daysInMonthType',param. daysInMonthTypeOptions,'id','value');
	  $.setSelect('rescheduleStrategyMethod',param.rescheduleStrategyTypeOptions,'id','value');
	  $.setSelect('preClosureInterestCalculationStrategy',param.preClosureInterestCalculationStrategyOptions,'id','value');
	  $.setSelect('interestRecalculationCompoundingMethod',param.interestRecalculationCompoundingTypeOptions,'id','value');
	  $.setSelect('recalculationRestFrequencyType',param.interestRecalculationFrequencyTypeOptions,'id','value');
	
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
//增加逾期费用
function addOverdueCharges(){
	var penalityId = $.value("penalityId");
	
	if(typeof(penalityId)!='undefined'&&penalityId!=''){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : '',
				"url" : "api.v1.charges."+penalityId+"?template=true"
			},
			callback : "addOverdueChargesBack"
		});
	}
	
	
}

//逾期费用回调，赋值
function addOverdueChargesBack(param){
	$.tableclone("chargesTable2");
	$('#chargesTable2').find('tr').last().find('span[name="chargeName"]').attr("id",param.id);
	$('#chargesTable2').find('tr').last().find('span[name="chargeName"]').text(param.name);
	$('#chargesTable2').find('tr').last().find('span[name="chargeType"]').text(param.chargeCalculationType.value);
	$('#chargesTable2').find('tr').last().find('span[name="chargeAmount"]').text(param.amount);
	$('#chargesTable2').find('tr').last().find('span[name="chargeCollectedOn"]').text(param.chargeTimeType.value);
}
$("#showButton").click(function(){
	$("#hideButton").show();
	$("#showButton").hide();
	$("#down").show();
	
});
$("#hideButton").click(function(){
	$("#showButton").show();
	$("#hideButton").hide();
	$("#down").hide();
	
});
$(document).ready(function(){	
	
	$.hide("add","add1","add2","instalments","Calculation1","Calculation2","Calculation3","Calculation4","Calculation5","Calculation6","Calculation7","place1","place2","place3","enable1","enable2","is1","is2","down","down1","ml","hideButton","chargesTable","chargesTable2","addShow1","addShow2","addShow3");
	  $("#checkbox1").click(function(){
	  $("#add").toggle();
	  $("#add1").toggle();
	  $("#add2").toggle();
	  });	  
	  $("#checkbox2").click(function(){
		  $("#is1").toggle();
		  $("#is2").toggle();
		  $("#is3").toggle();
		  });	
	  $("#checkbox3").click(function(){
		  $("#instalments").toggle();
	  });
	  $("#checkbox4").click(function(){
		  $("#Calculation1").toggle();
		  $("#Calculation2").toggle();
		  $("#Calculation3").toggle();
		  $("#Calculation4").toggle();
		  $("#Calculation5").toggle();
		  $("#Calculation6").toggle();
		  $("#Calculation7").toggle();
	  });
	  $("#checkbox5").click(function(){
		  $("#place1").toggle();
		  $("#place2").toggle();
		  $("#place3").toggle();
	  });
	  $("#checkbox6").click(function(){
		  $("#enable1").toggle();
		  $("#enable2").toggle();
		  });	
	  $("#checkbox7").click(function(){
		  $("#set1").toggle();
		  $("#set2").toggle();
		  $("#set3").toggle();
		  $("#set4").toggle();
		  });
	  	  
	  $("#none").click(function(){
		  var    $radio = $(this).find("input[type=radio]"),
        $flag  = $radio.is(":checked");
		  $("#ml").hide();
		  $("#down").hide();
		  $("#down1").hide();
		  $("#hideButton").hide();
        if( !$flag ){
         $radio.prop("checked",true);   
		}
	  });
	  $("#money").click(function(){
		  var  $radio = $(this).find("input[type=radio]"),
        $flag  = $radio.is(":checked");		  
		  $("#ml").show();
		  $("#accounting3").hide();
		  $("#accounting4").hide();
		  $("#showButton").show();
			$("#hideButton").hide();
			$("#down").hide();
			$("#down1").show();
		  if( !$flag ){
			     $radio.prop("checked",true);   
			 }
	  });
	  $("#periodic").click(function(){
		  var  $radio = $(this).find("input[type=radio]"),
        $flag  = $radio.is(":checked");
		  $("#ml").show();
		  $("#accounting3").show();
			$("#accounting4").show();
			$("#showButton").show();
			$("#hideButton").hide();
			$("#down").hide();
			$("#down1").show();
		  if( !$flag ){
			     $radio.prop("checked",true);   
			 }
	  });
	  $("#upfront").click(function(){
		  var    $radio = $(this).find("input[type=radio]"),
        $flag  = $radio.is(":checked");
		  $("#ml").show();
		  $("#accounting3").show();
			$("#accounting4").show();
			$("#showButton").show();
			$("#hideButton").hide();
			$("#down").hide();
			$("#down1").show();
		  if( !$flag ){
			     $radio.prop("checked",true);   
			 }
	  });
	  $.datetimepicker();
	//不能为空
		$.valid("createProduct", [ {
			"name" : "name",
			"notEmpty" : "不能为空"
		}, {
			"name" : "shortName",
			"notEmpty" : "不能为空"
		}, {
			"name" : "digitsAfterDecimal",
			"notEmpty" : "不能为空"
		}, {
			"name" : "fenqi",
			"notEmpty" : "不能为空"
		}, {
			"name" : "repaymentEvery",
			"notEmpty" : "必填字段"
		}, {
			"name" : "min",
			"notEmpty" : "必填字段"
		}, {
			"name" : "default",
			"notEmpty" : "必填字段"
		}, {
			"name" : "max",
			"notEmpty" : "必填字段"
		}]);
	  
	  $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.loanproducts.template"
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
				"url" : "api.v1.loanproducts." + productId
			},
			callback : "getloan"
		});
	//费用回调，赋值
		function addChargesBack(param){
			$.tableclone("chargesTable");
			$('#chargesTable').find('tr').last().find('span[name="chargeName"]').attr("id",param.id);
			$('#chargesTable').find('tr').last().find('span[name="chargeName"]').text(param.name);
			$('#chargesTable').find('tr').last().find('span[name="chargeType"]').text(param.chargeCalculationType.value);
			$('#chargesTable').find('tr').last().find('span[name="chargeAmount"]').text(param.amount);
			$('#chargesTable').find('tr').last().find('span[name="chargeCollectedOn"]').text(param.chargeTimeType.value);
		}
	  $.getWidget("edit").click(function() {
		  if ($.validateForm("editProduct")) {
			
			var fundId = parseInt($("#fundId").find("option:selected").attr("value"));
			var currencyId = $("#currency").find("option:selected").attr("value");			
			var rateTypeId = parseInt($("#interestRateFrequencyType").find("option:selected").attr("value"));
			var repaymentFrequencyTypeId = parseInt($("#every2").find("option:selected").attr("value"));
			var amortizationTypeId = parseInt($("#amortizationType").find("option:selected").attr("value"));
			var interestTypeId = parseInt($("#interestType").find("option:selected").attr("value"));
			var interestCalculationPeriodTypeId = parseInt($("#interestCalculationPeriodType").find("option:selected").attr("value"));
			var transactionProcessingStrategyId = parseInt($("#transactionProcessingStrategyId").find("option:selected").attr("value"));
			var daysInYearTypeId = parseInt($("#daysInYearType").find("option:selected").attr("value"));
			var daysInMonthTypeId = parseInt($("#daysInMonthType").find("option:selected").attr("value"));			
			var preClosureInterestCalculationStrategyId = parseInt($("#preClosureInterestCalculationStrategy").find("option:selected").attr("value"));				
			var rescheduleStrategyMethodId = parseInt($("#rescheduleStrategyMethod").find("option:selected").attr("value"));
            var interestRecalculationCompoundingMethodId = parseInt($("#interestRecalculationCompoundingMethod").find("option:selected").attr("value"));								
			var recalculationRestFrequencyTypeId = parseInt($("#recalculationRestFrequencyType").find("option:selected").attr("value"));				
			var loanPortfolioAccountId = parseInt($("#loanPortfolioAccountId").find("option:selected").attr("value"));
			var receivableInterestAccountId = parseInt($("#receivableInterestAccountId").find("option:selected").attr("value"));
			var receivablePenaltyAccountId = parseInt($("#receivablePenaltyAccountId").find("option:selected").attr("value"));				
			var transfersInSuspenseAccountId = parseInt($("#transfersInSuspenseAccountId").find("option:selected").attr("value"));			
			var incomeFromFeeAccountId = parseInt($("#incomeFromFeeAccountId").find("option:selected").attr("value"));
			var incomeFromPenaltyAccountId = parseInt($("#incomeFromPenaltyAccountId").find("option:selected").attr("value"));								
			 					
			var data;				
				data = {
					"accountMovesOutOfNPAOnlyOnArrearsCompletion":false,
					"accountingRule":1,			
					"allowVariableInstallments":false,
					"amortizationType":amortizationTypeId,
					"allowPartialPeriodInterestCalcualtion":false,						
					"canDefineInstallmentAmount":false,
					"canUseForTopup":false,
					"charges":[],	
					"closeDate" : $('input[name="closeDate"]').val(),
					"currencyCode": currencyId,	
					"dateFormat" : $('input[name="closeDate"]').attr('date-format'),
					"daysInMonthType":daysInMonthTypeId,
					"daysInYearType":daysInYearTypeId,
					"description":$('#description').val(),	
					"digitsAfterDecimal":$('#digitsAfterDecimal').val(),
					"feeToIncomeAccountMappings":[],
					"holdGuaranteeFunds":false,
					"inMultiplesOf":$('#principalThresholdForLastInstallment').val(),
					"includeInBorrowerCycle":false,
					"installmentAmountInMultiplesOf":$('#installmentAmountInMultiplesOf').val(),
					"interestCalculationPeriodType":interestCalculationPeriodTypeId,
					"interestRateFrequencyType":rateTypeId,
					"interestRatePerPeriod":$('#interestRatePerPeriod').val(),
					"interestRateVariationsForBorrowerCycle":[],
					"interestType":interestTypeId,	
					"isInterestRecalculationEnabled":false,
					"isLinkedToFloatingInterestRates":false,
					"locale" : "en",
					"maxInterestRatePerPeriod":$('#maxInterestRatePerPeriod').val(),
					"maxNumberOfRepayments":$('#maxNumberOfRepayments').val(),
					"maxPrincipal":$('#maxPrincipal').val(),
					"maxTrancheCount":0,
					"minInterestRatePerPeriod":$('#minInterestRatePerPeriod').val(),
					"minNumberOfRepayments":$('#minNumberOfRepayments').val(),
					"minPrincipal":$('#minPrincipal').val(),
					"multiDisburseLoan":false,
					"name":$('#name').val(),
					"numberOfRepaymentVariationsForBorrowerCycle":[],
					"numberOfRepayments":$('#numberOfRepayments').val(),
					"paymentChannelToFundSourceMappings":[],
					"penaltyToIncomeAccountMappings":[],
					"principal":$('#principal').val(),
					"principalThresholdForLastInstallment":0,
					"principalVariationsForBorrowerCycle":[],
					"repaymentEvery":$('#repaymentEvery').val(),
					"repaymentFrequencyType":repaymentFrequencyTypeId,
					"shortName":$('#shortName').val(),
					"startDate" : $('input[name="startDate"]').val(),					
					"transactionProcessingStrategyId":transactionProcessingStrategyId,
					"useBorrowerCycle":false,																																																																																																																				
				};  
				
				 $.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
							'dataType' : "PUT",
							'mydata' : data,
							'url' : 'api.v1.loanproducts.'+productId
								
						},
						callback : "callbackadd"						
					});	
		  }
	  });
	 
});

function callbackadd(param) {
	$.setReadOnly("editProduct");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init();
}
$("#addCycle").click(function() {	
	$.tableclone("table")
})
$("#addCycle2").click(function() {	
	$.tableclone("table2")
})
$("#addCycle3").click(function() {	
	$.tableclone("table3")
})
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
$.getWidget("penalityId").change(function() {	
	if(this.value)
		checkSelect2(this.value);

});
	function deleteTr(obj) {
		$(obj).parent().parent().remove();
	} 
	function checkSelect(value){
	var selectedOption = document.getElementById("chargeId").value;
	if(selectedOption!="charge"){
		$("#chargesTable").show();
	}else{
		$("#chargesTable").hide();
	}
	}
	
	function checkSelect2(value){
		var selectedOption = document.getElementById("penalityId").value;
		if(selectedOption!="Overduecharge"){
			$("#chargesTable2").show();
		}else{
			$("#chargesTable2").hide();
		}
		}
</script>
