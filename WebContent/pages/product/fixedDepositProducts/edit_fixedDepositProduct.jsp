<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="addFixedDPForm" name="addFixedDPForm">
	<fieldset>
		<legend>
			<spring:message code="deposit.title.fixed.edit" />
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
			<div class="col-sm-4">
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
			<label for="inMultiplesOf" class="col-sm-2 control-label"><spring:message code="deposit.label.inMultiplesOf" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="inMultiplesOf" name="inMultiplesOf" />
			</div>
		</div>



		<div><h3><spring:message code="deposit.label.terms" /></h3></div>
		
		<div class="form-group">
			<label for="depositAmount" class="col-sm-2 control-label"><spring:message code="deposit.label.depositAmount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="depositAmount" name="depositAmount" />
			</div>
		</div>
		
				
		<div class="form-group">
			<label for="minDepositAmount" class="col-sm-2 control-label"><spring:message code="deposit.label.minDepositAmount" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minDepositAmount" name="minDepositAmount"  />
			</div>
			<label for="maxDepositAmount" class="col-sm-2 control-label"><spring:message code="deposit.label.maxDepositAmount" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="maxDepositAmount" name="maxDepositAmount"  />
			</div>
		</div>
		
				
		<div class="form-group">
			<label for="interestCompoundingPeriodType" class="col-sm-2 control-label"><spring:message code="deposit.label.interestCompoundingPeriodType" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="interestCompoundingPeriodType" name="interestCompoundingPeriodType" class="form-control" style="width: 198">
				</select>
			</div>
			<label for="interestPostingPeriodType" class="col-sm-2 control-label"><spring:message code="deposit.label.interestPostingPeriodType" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="interestPostingPeriodType" name="interestPostingPeriodType" class="form-control" style="width: 198">
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
			<label for="lockinPeriodFrequency" class="col-sm-2 control-label"><spring:message code="deposit.label.lockinPeriodFrequency" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="lockinPeriodFrequency" name="lockinPeriodFrequency" />
			</div>
			<label for="lockinPeriodFrequencyType" class="col-sm-0 control-label"></label>
			<div class="col-sm-3">
				<select id="lockinPeriodFrequencyType" name="lockinPeriodFrequencyType" class="form-control" style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inMultiplesOfDepositTerm" class="col-sm-2 control-label"><spring:message code="deposit.label.inMultiplesOfDepositTerm" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="inMultiplesOfDepositTerm" name="inMultiplesOfDepositTerm" />
			</div>
			<label for="inMultiplesOfDepositTermTypeId" class="col-sm-0 control-label"></label>
			<div class="col-sm-3">
				<select id="inMultiplesOfDepositTermTypeId" name="inMultiplesOfDepositTermTypeId" class="form-control" style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="minDepositTerm" class="col-sm-2 control-label"><spring:message code="deposit.label.minDepositTerm" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="minDepositTerm" name="minDepositTerm" />
			</div>
			<label for="minDepositTermTypeId" class="col-sm-0 control-label"></label>
			<div class="col-sm-3">
				<select id="minDepositTermTypeId" name="minDepositTermTypeId" class="form-control" style="width: 198">
					
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxDepositTerm" class="col-sm-2 control-label"><spring:message code="deposit.label.maxDepositTerm" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="maxDepositTerm" name="maxDepositTerm" />
			</div>
			<label for="maxDepositTermTypeId" class="col-sm-0 control-label"></label>
			<div class="col-sm-3">
				<select id="maxDepositTermTypeId" name="maxDepositTermTypeId" class="form-control" style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="preClosurePenalApplicable" class="col-sm-2 control-label"><spring:message code="deposit.label.preClosurePenalApplicable" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="preClosurePenalApplicable" type="checkbox"></label>
			</div>
			
			<label class="col-sm-3 control-label preClosurePenalInterest"><spring:message code="deposit.label.preClosurePenalInterest" /></label>
			<div class="col-sm-2 preClosurePenalInterest">
				<input type="text" class="form-control " id="preClosurePenalInterest" name="preClosurePenalInterest" />
			</div>
			
			<label class="col-sm-1 preClosurePenalInterest"><spring:message code="deposit.label.type"/></label>
			<select id="preClosurePenalInterestOnTypeId" class="form-control col-sm-1 preClosurePenalInterest" style="width: 120">
				<option></option>
			</select>
		</div>
		
		<div class="form-group">
			<label for="withHoldTax" class="col-sm-2 control-label"><spring:message code="deposit.label.withHoldTax" /></label>
			<div class="col-sm-3">
				<label class="checkbox"> <input id="withHoldTax" type="checkbox"></label>
			</div>
			<label for="taxGroupId" class="col-sm-2 control-label taxGroup"><spring:message code="deposit.label.taxGroup"/></label>
			<div class="col-sm-3 taxGroup">
				<select id="taxGroupId" class="form-control col-sm-1" style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		
		<div><h3><spring:message code="deposit.label.interestRateChart"/></h3></div>
		
		<div class="form-group">
			<label for="fromDate" class="col-sm-2 control-label"><spring:message code="deposit.label.fromDate" />
			<span style="color: #d9534f;">*</span>
			</label>
			<div class="col-sm-3">
				<input type="text" datetype="date" name="fromDate"     beforeToday="false"/>
			</div>
			<label for="endDate" class="col-sm-2 control-label"><spring:message code="deposit.label.endDate" /></label>
			<div class="col-sm-3">
				<input type="text" datetype="date" name="endDate"     beforeToday="false"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="isPrimaryGroupingByAmount" class="col-sm-2 control-label">
			<spring:message code="deposit.label.isPrimaryGroupingByAmount" />
			<span style="color: #d9534f;" >*</span>
			</label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="isPrimaryGroupingByAmount" type="checkbox"></label>
			</div>
			<button type="button" class="btn btn-link" onclick="addChart();">
				<span class="glyphicon glyphicon-plus"></span>
				<spring:message code="taxes.add" />
			</button>	
		</div>
		
		<div class="form-group">
			<div class="col-sm-10">
				<table class="table" id="chartTable">
					<tr>
						<td><spring:message code="deposit.label.amountRange" /></td>
						<td><spring:message code="deposit.label.period" /></td>
						<td><spring:message code="deposit.label.periodType" /></td>
						<td><spring:message code="deposit.label.interest" /></td>
						<td><spring:message code="deposit.label.description" /></td>
						<td><spring:message code="deposit.label.action" /></td>
					</tr>
					<tr style="display: none">
						
						<td>
							<input name="amountRangeFrom" id="amountRangeFrom" style="width: 100"/>
							-<input name="amountRangeTo" id="amountRangeTo" style="width: 100"/>
						</td>
						<td>
							<input name="fromPeriod" id="fromPeriod" style="width: 100"/>
							-<input name="toPeriod" id="toPeriod" style="width: 100"/>
						</td>
						<td>
							<select name="periodType" id="periodType" style="width: 100"></select>
						</td>
						<td>
							<input name="annualInterestRate" id="annualInterestRate" style="width: 100"/>
						</td>
						<td>
							<input name="description" id="description" style="width: 200"/>
						</td>
						<td>
							<!-- <button type="button" class="btn btn-link " onclick="deleteTr(this)">
								Incentives
							</button> -->
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
					</tr>
				</table>
			</div>


		</div>
		
		<div><h3><spring:message code="deposit.label.charges"/></h3></div>
		
		<div class="form-group">
			
			<div class="col-sm-3">
				<select id="charges" name="charges" class="form-control" style="width: 198">
					<option></option>
				</select>
			</div>
			
			<button type="button" class="btn btn-link" onclick="addCharges();">
				<span class="glyphicon glyphicon-plus"></span>
				<spring:message code="taxes.add" />
			</button>	
		</div>
		
		<div class="form-group">
			
			<div class="col-sm-10">
			
				<table class="table" id="chargesTable">
					<tr>
						<td><spring:message code="deposit.label.name" /></td>
						<td><spring:message code="deposit.label.type" /></td>
						<td><spring:message code="deposit.label.amount" /></td>
						<td><spring:message code="deposit.label.collectedOn" /></td>
						<td><spring:message code="deposit.label.action" /></td>
					</tr>
					<tr style="display:none;">
						<td><span name="chargeName" id=""></span></td>
						<td><span name="chargeType"></span></td>
						<td><span name="chargeAmount"></span></td>
						<td><span name="chargeCollectedOn"></span></td>
						<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>


		<div><h3><spring:message code="deposit.label.accounting"/></h3></div>
		<div class="form-group">
			<label for="accountingRule" class="col-sm-1 "></label>
			<input type="radio" name="accountingRule" value="1" id="none" > 
			<label for="accountingRule" ><spring:message code="deposit.label.none"/></label>
			<input type="radio" name="accountingRule" value="2" id="cash"> 
			<label for="accountingRule" ><spring:message code="deposit.label.cash"/></label>
		</div>
		
		<!--cash部分  -->		
	<div  id="cashFrom">
		
		<div><h4><spring:message code="deposit.label.assets"/></h4></div>
		<div class="form-group">
			<label for="savingsReferenceAccountId" class="col-sm-2 "><spring:message code="deposit.label.savingsReferenceAccount" /></label>
			<div class="col-sm-3">
				<select id="savingsReferenceAccountId" name="savingsReferenceAccountId"  style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		<div><h4><spring:message code="deposit.label.liabilities"/></h4></div>
		<div class="form-group">
			<label for="savingsControlAccountId" class="col-sm-2 "><spring:message code="deposit.label.savingsControlAccount" /></label>
			<div class="col-sm-3">
				<select id="savingsControlAccountId" name="savingsControlAccountId"  style="width: 198">
					<option></option>
				</select>
			</div>
			<label for="transfersInSuspenseAccountId" class="col-sm-2 "><spring:message code="deposit.label.transfersInSuspenseAccount" /></label>
			<div class="col-sm-3">
				<select id="transfersInSuspenseAccountId" name="transfersInSuspenseAccountId" style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		<div><h4><spring:message code="deposit.label.expenses"/></h4></div>
		<div class="form-group">
			<label for="interestOnSavingsAccountId" class="col-sm-2 "><spring:message code="deposit.label.interestOnSavingsAccount" /></label>
			<div class="col-sm-3">
				<select id="interestOnSavingsAccountId" name="interestOnSavingsAccountId" style="width: 198">
					<option></option>
				</select>
			</div>
		</div>
		<div><h4><spring:message code="deposit.label.income"/></h4></div>
		<div class="form-group">
			<label for="incomeFromFeeAccountId" class="col-sm-2 "><spring:message code="deposit.label.incomeFromFeeAccount" /></label>
			<div class="col-sm-3">
				<select id="incomeFromFeeAccountId" name="incomeFromFeeAccountId" style="width: 198">
					<option></option>
				</select>
			</div>
			<label for="incomeFromPenaltyAccountId" class="col-sm-2 "><spring:message code="deposit.label.incomeFromPenaltyAccount" /></label>
			<div class="col-sm-3">
				<select id="incomeFromPenaltyAccountId" name="incomeFromPenaltyAccountId"  style="width: 198">
					<option></option>
				</select>
			</div>
				
			
		</div>
	
	<!-- advancedAccount part -->
	<div class="form-group">
		<div class="col-sm-8" ><spring:message code="deposit.label.advanced.account"/>[<a href="javaScript:void(0)" id="showAccount"><spring:message code="deposit.label.show"/></a>]</div>	
	</div>
	 <div id="advancedAccount">
		<div class="form-group">
			<label for="PaymentChannelsTable" class="col-sm-1 control-label"></label>
			<div class="col-sm-8">
				<span><spring:message code="deposit.msg.cash.paymentType"/></span>
				<table class="table" id="paymentChannelsTable">
					<tr>
						<td><spring:message code="deposit.label.paymentType" /></td>
						<td><spring:message code="deposit.label.fundSourceAccount" /></td>
						<td><spring:message code="deposit.label.action" /></td>
						<td>
							<button type="button" class="btn btn-link" onclick="addPaymentChannels();">
							<span class="glyphicon glyphicon-plus"></span>
							<spring:message code="taxes.add" />
							</button>
						</td>
					</tr>
					<tr style="display:none;">
						<td>
							<select id="paymentTypeId" name="paymentTypeId" style="width: 198">
							</select>
						</td>
						<td>
							<select id="fundSourceAccountId" name="fundSourceAccountId" style="width: 198">
							</select>
						</td>
						<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
					</tr>
				</table>
			</div>
			
		</div>
		<div class="form-group">
			<label for="MapFeesTable" class="col-sm-1 control-label"></label>
			<div class="col-sm-8">
				<span><spring:message code="deposit.msg.cash.fees"/></span>
				<table class="table" id="mapFeesTable">
					<tr>
						<td><spring:message code="deposit.label.fees" /></td>
						<td><spring:message code="deposit.label.incomeAccount" /></td>
						<td><spring:message code="deposit.label.action" /></td>
						<td>
							<button type="button" class="btn btn-link" onclick="addMapFees();">
							<span class="glyphicon glyphicon-plus"></span>
							<spring:message code="taxes.add" />
							</button>
						</td>
					</tr>
					<tr style="display:none;">
						<td>
							<select id="f_chargeId" name="f_chargeId" style="width: 198">
							</select>
						</td>
						<td>
							<select id="f_incomeAccountId" name="f_incomeAccountId" style="width: 198">
							</select>
						</td>
						<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="form-group">
			<label for="MapPenaltiesTable" class="col-sm-1 control-label"></label>
			<div class="col-sm-8">
			<span><spring:message code="deposit.msg.cash.penalty"/></span>
				<table class="table" id="mapPenaltiesTable">
					<tr>
						<td><spring:message code="deposit.label.penalty" /></td>
						<td><spring:message code="deposit.label.incomeAccount" /></td>
						<td><spring:message code="deposit.label.action" /></td>
						<td>
							<button type="button" class="btn btn-link" onclick="addMapPenalties();">
							<span class="glyphicon glyphicon-plus"></span>
							<spring:message code="taxes.add" />
							</button>
						</td>
					</tr>
					<tr style="display:none;">
						<td>
							<select id="p_chargeId" name="p_chargeId" style="width: 198">
							</select>
						</td>
						<td>
							<select id="p_incomeAccountId" name="p_incomeAccountId" style="width: 198">
							</select>
						</td>
						<td>
							<button type="button" class="btn btn-link " onclick="deleteTr(this)">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	 </div><!-- advancedAccount end -->
	</div><!-- cash结束 -->
		<div class="form-group">
			<div class="col-sm-offset-10">
				<button type='button' id="save" name="save" class="btn btn-primary">
					<spring:message code="btn.submit" />
				</button>
			</div>
		</div>
		
	</fieldset>
</form>
<script type="text/javascript">
    var activeChartId;
    
	$(document).ready(
			function() {
				
				$.datetimepicker();
				
				$.valid("addFixedDPForm", 
					[ {
						"name" : "name",
						"notEmpty" : ""
					},{
						"name" : "shortName",
						"notEmpty" : "",
						"lengthMax":4
					},{
						"name" : "description",
						"notEmpty" : ""
					} ,{
						"name" : "digitsAfterDecimal",
						"notEmpty" : ""
					},{
						"name" : "inMultiplesOf",
						"notEmpty" : ""
					},{
						"name" : "depositAmount",
						"notEmpty" : ""
					},{
						"name" : "minDepositTerm",
						"notEmpty" : ""
					} ]);

				 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.fixeddepositproducts."+fixedDPId+'?template=true'
					},
					callback : "editBack"
				});
				 
				$.getWidget("save").click(
										function() {
											if ($.validateForm("addFixedDPForm")) {
												//detail
												var name = $('#name').val();
												var shortName = $('#shortName').val();
												var description = $('#description').val();
												
												//currency
												var currencyCode = $.value("currencyCode");
												var digitsAfterDecimal = $('#digitsAfterDecimal').val();
												var inMultiplesOf = $('#inMultiplesOf').val();
												
												//items
												var depositAmount = $('#depositAmount').val();
												var interestCompoundingPeriodType = $.value("interestCompoundingPeriodType");
												var interestPostingPeriodType = $.value("interestPostingPeriodType");
												var interestCalculationType = $.value("interestCalculationType");
												var interestCalculationDaysInYearType = $.value("interestCalculationDaysInYearType");
												
												//settings
												var minDepositTerm = $('#minDepositTerm').val();
												var minDepositTermTypeId = $.value("minDepositTermTypeId");
												
												//account
												var accountingRule=$('input[name="accountingRule"]:checked').val();
												
												/*基本数据*/
												var json = {
													"name" : name,
													'shortName':shortName,
													'description':description,
													'currencyCode':currencyCode,
													'digitsAfterDecimal':digitsAfterDecimal,
													'inMultiplesOf':inMultiplesOf,
													'depositAmount':depositAmount,
													'interestCompoundingPeriodType':interestCompoundingPeriodType,
													'interestPostingPeriodType':interestPostingPeriodType,
													'interestCalculationType':interestCalculationType,
													'interestCalculationDaysInYearType':interestCalculationDaysInYearType,
													'minDepositTerm':minDepositTerm,
													'minDepositTermTypeId':minDepositTermTypeId,
													'accountingRule':accountingRule,
													'locale':"zh"
												};

												/*items非必填项*/
												var minDepositAmount=$('#minDepositAmount').val();
												var maxDepositAmount=$('#maxDepositAmount').val();
												
												if(minDepositAmount!=''){
													json["minDepositAmount"] = minDepositAmount;
												}
												if(maxDepositAmount!=''){
													json["maxDepositAmount"] = maxDepositAmount;
												}
												
												
												/*settings非必填项*/
												var lockinPeriodFrequency=$('#lockinPeriodFrequency').val();
												var lockinPeriodFrequencyType = $.value("lockinPeriodFrequencyType");
												var inMultiplesOfDepositTerm=$('#inMultiplesOfDepositTerm').val();
												var inMultiplesOfDepositTermTypeId = $.value("inMultiplesOfDepositTermTypeId");
												var maxDepositTerm=$('#maxDepositTerm').val();
												var maxDepositTermTypeId = $.value("maxDepositTermTypeId");
												
												if(lockinPeriodFrequency!=''){
													
													if(typeof(lockinPeriodFrequencyType)!='undefined'){
														json["lockinPeriodFrequency"] = lockinPeriodFrequency;
														json["lockinPeriodFrequencyType"] = lockinPeriodFrequencyType;
													}
												}
												
												if(inMultiplesOfDepositTerm!=''){
													
													if(typeof(inMultiplesOfDepositTermTypeId)!='undefined'){
														json["inMultiplesOfDepositTerm"] = inMultiplesOfDepositTerm;
														json["inMultiplesOfDepositTermTypeId"] = inMultiplesOfDepositTermTypeId;
													}
												}
												
												if(maxDepositTerm!=''){
													
													if(typeof(maxDepositTermTypeId)!='undefined'){
														json["maxDepositTerm"] = maxDepositTerm;
														json["maxDepositTermTypeId"] = maxDepositTermTypeId;
													}
												}
												
												
												var preClosurePenalApplicable=$('#preClosurePenalApplicable').is(':checked');
												
												if(preClosurePenalApplicable){
													
													var preClosurePenalInterest=$('#preClosurePenalInterest').val();
													var preClosurePenalInterestOnTypeId = $.value("preClosurePenalInterestOnTypeId");
													json["preClosurePenalApplicable"] = preClosurePenalApplicable;
													json["preClosurePenalInterest"] = preClosurePenalInterest;
													json["preClosurePenalInterestOnTypeId"] = preClosurePenalInterestOnTypeId;
												}
												
												var withHoldTax=$('#withHoldTax').is(':checked');
												
												if(withHoldTax){
													
													var taxGroupId = $.value("taxGroupId");
													json["withHoldTax"] = withHoldTax;
													json["taxGroupId"] = taxGroupId;
												}
												
												
												
												//charts非必填
												var charts=[];
												
												var fromDate = $('input[name="fromDate"]').val();
												var endDate = $('input[name="endDate"]').val();
												var dateFormat = $('input[name="fromDate"]').attr('date-format');
												
												var chartsJson={
														"id":activeChartId,
														'fromDate':fromDate,
														
														'locale':'zh',
														'dateFormat':dateFormat,
												}
												if(endDate!=''){
													chartsJson['endDate'] = endDate;
												}
												var isPrimaryGroupingByAmount=$('#isPrimaryGroupingByAmount').is(':checked');
												if(isPrimaryGroupingByAmount){
													chartsJson['isPrimaryGroupingByAmount']=isPrimaryGroupingByAmount;
												}
												
												//charts非必填->表格
												var chartSlabs=[];
												
												$('#chartTable').find('tr').eq(1).nextAll().each(function() {
													var amountRangeFrom = $('input[name="amountRangeFrom"]').val();
													var amountRangeTo = $('input[name="amountRangeTo"]').val();
													var fromPeriod = $('input[name="fromPeriod"]').val();
													var toPeriod = $('input[name="toPeriod"]').val();
													
													var annualInterestRate = $('input[name="annualInterestRate"]').val();
													var description = $('input[name="description"]').val();
													
													var periodType = $(this).find('select[name="periodType"]').val();
													var incentives=[];
													
													var rowJson = {
														"amountRangeFrom" : amountRangeFrom,
														"amountRangeTo" : amountRangeTo,
														"fromPeriod":fromPeriod,
														"toPeriod":toPeriod,
														"annualInterestRate":annualInterestRate,
														"description":description,
														"periodType":periodType,
														"locale":"zh",
														"incentives":incentives,
													};
													chartSlabs.push(rowJson);
												});
												
												chartsJson['chartSlabs']=chartSlabs;
												charts.push(chartsJson);
												if(charts.length>0 && fromDate !=''){
													json['charts']=charts;
												}
												
											
												
												//charges非必填
												var chargesArr = new Array();
												
												$('#chargesTable').find('tr').eq(1).nextAll().each(function () {
													
													var chargeID=$(this).find('span[name="chargeName"]').attr('id');
													var jsonObj={
															"id":parseInt(chargeID),
													}
													chargesArr.push(jsonObj);
												});
												
												if(chargesArr.length>0){
													
													json["charges"] = chargesArr;
												}
												
												//account:cash
												if(accountingRule==2){
													var savingsReferenceAccountId = $.value("savingsReferenceAccountId");
													var savingsControlAccountId = $.value("savingsControlAccountId");
													var transfersInSuspenseAccountId= $.value("transfersInSuspenseAccountId");
													var interestOnSavingsAccountId = $.value("interestOnSavingsAccountId");
													var incomeFromFeeAccountId = $.value("incomeFromFeeAccountId");
													var incomeFromPenaltyAccountId = $.value("incomeFromPenaltyAccountId");
													
													json["savingsReferenceAccountId"] = savingsReferenceAccountId;
													json["savingsControlAccountId"] = savingsControlAccountId;
													json["transfersInSuspenseAccountId"] = transfersInSuspenseAccountId;
													json["interestOnSavingsAccountId"] = interestOnSavingsAccountId;
													json["incomeFromFeeAccountId"] = incomeFromFeeAccountId;
													json["incomeFromPenaltyAccountId"] = incomeFromPenaltyAccountId;
												
												//account:cash->advanced
												var paymentChannelToFundSourceMappings= new Array();
												var feeToIncomeAccountMappings= new Array();
												var penaltyToIncomeAccountMappings= new Array();
												
												$('#paymentChannelsTable').find('tr').eq(1).nextAll().each(function() {
													
													var paymentTypeId = parseInt($(this).find('select[name="paymentTypeId"]').val());
													var fundSourceAccountId = parseInt($(this).find('select[name="fundSourceAccountId"]').val());
													var rowJson = {
														"paymentTypeId" : paymentTypeId,
														"fundSourceAccountId" : fundSourceAccountId,
													};
													paymentChannelToFundSourceMappings.push(rowJson);
												});
												
												if(paymentChannelToFundSourceMappings.length>0){
													json['paymentChannelToFundSourceMappings']=paymentChannelToFundSourceMappings;
													
												}
												
												$('#mapFeesTable').find('tr').eq(1).nextAll().each(function() {
													
													var f_chargeId = parseInt($(this).find('select[name="f_chargeId"]').val());
													var f_incomeAccountId = parseInt($(this).find('select[name="f_incomeAccountId"]').val());
													var rowJson = {
														"chargeId" : f_chargeId,
														"incomeAccountId" : f_incomeAccountId,
													};
													feeToIncomeAccountMappings.push(rowJson);
												});
												
												if(feeToIncomeAccountMappings.length>0){
													json['feeToIncomeAccountMappings']=feeToIncomeAccountMappings;
												}
												
												$('#mapPenaltiesTable').find('tr').eq(1).nextAll().each(function() {
													
													var p_chargeId = parseInt($(this).find('select[name="p_chargeId"]').val());
													var p_incomeAccountId = parseInt($(this).find('select[name="p_incomeAccountId"]').val());
													var rowJson = {
															"chargeId" : p_chargeId,
															"incomeAccountId" : p_incomeAccountId,
														};
													penaltyToIncomeAccountMappings.push(rowJson);
												});
												
												if(penaltyToIncomeAccountMappings.length>0){
													json['penaltyToIncomeAccountMappings']=penaltyToIncomeAccountMappings;
												}
											}
										$.nest({
													url : "<c:url value='/fineract.do'/>",
													type : "post",
													async : true,
													data : {
														"dataType" : "PUT",
														"mydata" : json,
														"url" : "api.v1.fixeddepositproducts."+fixedDPId
													},
													callback : "add_success"
												}); 
											}
										});
	});

	function editBack(param) {
		
		$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');
		$.setSelect('interestCompoundingPeriodType', param.interestCompoundingPeriodTypeOptions	, 'id', 'value');
		$.setSelect('interestPostingPeriodType', param.interestPostingPeriodTypeOptions, 'id', 'value');
		$.setSelect('interestCalculationType', param.interestCalculationTypeOptions, 'id', 'value');
		$.setSelect('interestCalculationDaysInYearType', param.interestCalculationDaysInYearTypeOptions, 'id', 'value');
		$.setSelect('periodFrequencyTypeOptions', param.periodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('lockinPeriodFrequencyType', param.lockinPeriodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('inMultiplesOfDepositTermTypeId', param.periodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('minDepositTermTypeId', param.periodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('maxDepositTermTypeId', param.periodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('preClosurePenalInterestOnTypeId', param.preClosurePenalInterestOnTypeOptions, 'id', 'value');
		$.setSelect('taxGroupId', param.taxGroupOptions, 'id', 'name');
		$.setSelect('periodType', param.periodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('charges', param.chargeOptions, 'id', 'name'); 
		
		$('input:radio').eq(param.accountingRule.id-1).attr('checked', 'true');
	
			var flag = $('#cash').is(':checked');
			if (flag) {
				$('#cashFrom').show();
			} else {
				$('#cashFrom').hide();
			} 
			
		
		$.setSelect('savingsReferenceAccountId', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
		$.setSelect('savingsControlAccountId', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');
		$.setSelect('transfersInSuspenseAccountId', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');
		$.setSelect('interestOnSavingsAccountId', param.accountingMappingOptions.expenseAccountOptions, 'id', 'name');
		$.setSelect('incomeFromFeeAccountId', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
		$.setSelect('incomeFromPenaltyAccountId', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');  
		
		$.setSelect('paymentTypeId', param.paymentTypeOptions, 'id', 'name');
		$.setSelect('fundSourceAccountId', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');
		
		var feeOptions=[];
		$.each(param.penaltyOptions,function(n,obj){
			feeOptions.push(obj.chargeTimeType);
		}); 
		
	   	$.setSelect('f_chargeId', feeOptions, 'id', 'value');
		$.setSelect('f_incomeAccountId',  param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');
		$.setSelect('p_chargeId', param.penaltyOptions, 'id', 'name');
		$.setSelect('p_incomeAccountId', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name'); 
		
		
		
		$.assign({
			"name":param.name,
			"shortName":param.shortName,
			"description":param.description,
			
			"currencyCode":param.currency.code,
			"digitsAfterDecimal":param.currency.decimalPlaces,
			"inMultiplesOf":param.currency.inMultiplesOf,
			
			"depositAmount":param.depositAmount,
			"minDepositAmount":param.minDepositAmount,
			"maxDepositAmount":param.maxDepositAmount,
			"interestCompoundingPeriodType":param.interestCompoundingPeriodType.id,
			"interestPostingPeriodType":param.interestPostingPeriodType.id,
			"interestCalculationType":param.interestCalculationType.id,
			"interestCalculationDaysInYearType":param.interestCalculationDaysInYearType.id,
			
			"lockinPeriodFrequency":param.lockinPeriodFrequency,
			"inMultiplesOfDepositTerm":param.inMultiplesOfDepositTerm,
			"minDepositTerm":param.minDepositTerm,
			"minDepositTermTypeId":param.minDepositTermType.id,
			"maxDepositTerm":param.maxDepositTerm,
			
			
		});
		
		if(typeof(param.lockinPeriodFrequencyType)!='undefined'){
			$.assign({
				"lockinPeriodFrequencyType":param.lockinPeriodFrequencyType.id,
			});
		}
		if(typeof(param.inMultiplesOfDepositTermType)!='undefined'){
			$.assign({
				"inMultiplesOfDepositTermTypeId":param.inMultiplesOfDepositTermType.id, 
			});
		}
		if(typeof(param.maxDepositTermType)!='undefined'){
			$.assign({
				"maxDepositTermTypeId":param.maxDepositTermType.id, 
			});
		}
		if(param.preClosurePenalApplicable){
			$('#preClosurePenalApplicable').attr("checked",true);
			$(".preClosurePenalInterest").show();  
			$.assign({
				"preClosurePenalInterest":param.preClosurePenalInterest, 
				"preClosurePenalInterestOnTypeId":param.preClosurePenalInterestOnType.id, 
			});
		}
		if(param.withHoldTax){
			$('#withHoldTax').attr("checked",true);
			$(".taxGroup").show(); 
			$.assign({
				"taxGroupId":param.taxGroup.id, 
			});
		}
		
		if(typeof(param.activeChart)!='undefined'){
			activeChartId=param.activeChart.id;
			var dateFormat = $('input[name="fromDate"]').attr('date-format');
			var fromDate=$.formatDate(param.activeChart.fromDate,dateFormat);
			var endDate='';
			if(typeof(param.activeChart.endDate)!='undefined'){
				endDate=$.formatDate(param.activeChart.endDate,dateFormat);
			}
			$.assign({
				"fromDate":fromDate,
				"endDate":endDate,
			});
			
			if(param.activeChart.isPrimaryGroupingByAmount){
				$('#isPrimaryGroupingByAmount').attr("checked",true);
			}
			
			var chartSlabs=param.activeChart.chartSlabs;
			 if(typeof(chartSlabs)!='undefined'){
			 
					if(chartSlabs.length>0){
						for(var i=0;i<chartSlabsLength;i++){
							
							$.tableclone('chartTable');
							$('#chartTable').find('tr').eq(i+2).find('input[name="amountRangeFrom"]').val(chartSlabs[i].amountRangeFrom);
							$('#chartTable').find('tr').eq(i+2).find('input[name="amountRangeTo"]').val(chartSlabs[i].amountRangeTo);
							$('#chartTable').find('tr').eq(i+2).find('input[name="fromPeriod"]').val(chartSlabs[i].fromPeriod);
							$('#chartTable').find('tr').eq(i+2).find('input[name="toPeriod"]').val(chartSlabs[i].toPeriod);
							$('#chartTable').find('tr').eq(i+2).find('input[name="annualInterestRate"]').val(chartSlabs[i].annualInterestRate);
							$('#chartTable').find('tr').eq(i+2).find('input[name="description"]').val(chartSlabs[i].description);
							$('#chartTable').find('tr').eq(i+2).find('select[name="periodType"]').val(chartSlabs[i].periodType.id);
							
							//var incentives=[];
						}
					} 
			 }
		}
		
		if(param.charges.length>0){
			$.each(param.charges,function(n,obj){
				$.tableclone("chargesTable");
				$('#chargesTable').find('tr').last().find('span[name="chargeName"]').attr("id",obj.id);
				$('#chargesTable').find('tr').last().find('span[name="chargeName"]').text(obj.name);
				$('#chargesTable').find('tr').last().find('span[name="chargeType"]').text(obj.chargeCalculationType.value);
				$('#chargesTable').find('tr').last().find('span[name="chargeAmount"]').text(obj.amount);
				$('#chargesTable').find('tr').last().find('span[name="chargeCollectedOn"]').text(obj.chargeTimeType.value);
			});
			
		}
		if(param.accountingRule.id==2){
			
			
			$.assign({
				"savingsReferenceAccountId":param.accountingMappings.savingsReferenceAccount.id, 
				"savingsControlAccountId":param.accountingMappings.savingsControlAccount.id, 
				"transfersInSuspenseAccountId":param.accountingMappings.transfersInSuspenseAccount.id, 
				"interestOnSavingsAccountId":param.accountingMappings.interestOnSavingsAccount.id, 
				"incomeFromFeeAccountId":param.accountingMappings.incomeFromFeeAccount.id, 
				"incomeFromPenaltyAccountId":param.accountingMappings.incomeFromPenaltyAccount.id, 
			});
			
			var feeToIncomeParam=param.feeToIncomeAccountMappings;
			
			if(typeof(feeToIncomeParam)!='undefined'){
				$("#advancedAccount").show(); 
				$.each(feeToIncomeParam,function(n,obj){
					$.tableclone("mapFeesTable");
					$('#mapFeesTable').find('tr').last().find('select[name="f_chargeId"]').val(obj.charge.id);
					$('#mapFeesTable').find('tr').last().find('select[name="f_incomeAccountId"]').val(obj.incomeAccount.id);
				});
			}
			
			var penaltyToIncome=param.feeToIncomeAccountMappings;
			if(typeof(penaltyToIncome)!='undefined'){
				$("#advancedAccount").show(); 
				$.each(penaltyToIncome,function(n,obj){
					$.tableclone("mapPenaltiesTable");
					$('#mapPenaltiesTable').find('tr').last().find('select[name="p_chargeId"]').val(obj.charge.id);
					$('#mapPenaltiesTable').find('tr').last().find('select[name="p_incomeAccountId"]').val(obj.incomeAccount.id);
				});
			}
			
			var paymentChannel=param.paymentChannelToFundSourceMappings;
			if(typeof(paymentChannel)!='undefined'){
				$("#advancedAccount").show(); 
				$.each(paymentChannel,function(n,obj){
					$.tableclone("paymentChannelsTable");
					$('#paymentChannelsTable').find('tr').last().find('select[name="paymentTypeId"]').val(obj.paymentType.id);
					$('#paymentChannelsTable').find('tr').last().find('select[name="fundSourceAccountId"]').val(obj.fundSourceAccount.id);
				});
			}
			
			
	
		}
		
	}
		
	function add_success(param) {
		$.setReadOnly('addFixedDPForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
	
	//增加费用
	function addCharges(){
		var chargeID = $.value("charges");
		
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
		$('#chargesTable').find('tr').last().find('span[name="chargeType"]').text(param.name);
		$('#chargesTable').find('tr').last().find('span[name="chargeAmount"]').text(param.chargeCalculationType.value);
		$('#chargesTable').find('tr').last().find('span[name="chargeCollectedOn"]').text(param.chargeTimeType.value);
	}

	function deleteTr(obj) {
		$(obj).parent().parent().remove();
	} 
	
	function addChart(){
		$.tableclone('chartTable');
	}
	
	//$(".preClosurePenalInterest").hide();  
	//$(".taxGroup").hide(); 
	//$("#cashFrom").hide(); 
	//$("#advancedAccount").hide(); 
	
	$('#preClosurePenalApplicable').click(function(){
		$(".preClosurePenalInterest").toggle();
	});
	
	$('#withHoldTax').click(function(){
		$('.taxGroup').toggle();
	});

	
	$('input[name=accountingRule]').click(function() {
		var flag = $('#cash').is(':checked');
		if (flag) {
			$('#cashFrom').show();
		} else {
			$('#cashFrom').hide();
		}
	});
	

	$('#showAccount').click(function(){
		$('#advancedAccount').toggle();
	});
	
	function addPaymentChannels() {
		$.tableclone("paymentChannelsTable");
		
	}
	function addMapFees() {
		$.tableclone("mapFeesTable");
	}
	function addMapPenalties() {
		$.tableclone("mapPenaltiesTable");
	}
</script>




