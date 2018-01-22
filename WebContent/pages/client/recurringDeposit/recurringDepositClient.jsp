<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<ul class="breadcrumb">
		<li><a href=""><span id="name"></span></a></li>
	</ul>
</div>
<form name="newsavingccountform" id="newsavingccountform" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="lable.recurring.deposit.application"/></legend>
		
		<div class="form-group">
			<label for="productlist" class="col-sm-2 control-label"><spring:message code="fund.search.product" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="productlist" name="productlist" >
					<option ><spring:message code="lable.please.choose"/></option>
				</select>
			</div>
	<label for="productlist" class="col-sm-2 control-label"><spring:message code="lable.submitDate" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
			<input type="text" class="form-control"  datetype="date" name="submitDate" format="" local-date="true">			
			</div>
			</div>
		<div class="form-group">
			<label for="productlist" class="col-sm-2 control-label"><spring:message code="lable.field.officer" /></label>
		<div class="col-sm-3">
					<select id="stafflist" class="form-control">
						<option selected="selected"><spring:message code="lable.please.choose"/></option>
					</select>
				</div>		
		</div>
	<div><h4><spring:message code="lable.terms" /></h4></div>	
		<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="lable.currency" /></label>		
		<div class="col-sm-3">
		<input  id="currency" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>	
			<label class="col-sm-2 control-label"><spring:message code="lable.decimal.places" /></label>		
		<div class="col-sm-3">
		<input  id="decimal" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>		
		</div>
		<div class="form-group">
	<label  class="col-sm-2 control-label"><spring:message code="lable.interest.compounding.period" /><span style="color: #d9534f;">*</span></label>		
		<div class="col-sm-3">
		<select  class="form-control" id="interestCompoundingPeriodType" name="interestCompoundingPeriodType" >
				</select>
		</div>
		<label  class="col-sm-2 control-label"><spring:message code="lable.interest.posting.period" /><span style="color: #d9534f;">*</span></label>		
		<div class="col-sm-3">
		<select  class="form-control" id="recurringFrequencyType" name="recurringFrequencyType" >
				</select>
		</div>
		</div>	
		 <div class="form-group">
		<label  class="col-sm-2 control-label"><spring:message code="lable.interest.calculated.using" /><span style="color: #d9534f;">*</span></label>		
		<div class="col-sm-3">
		<select  class="form-control" id="interestCalculationType" name="interestCalculationType" >
				</select>
		</div>
		<label class="col-sm-2 control-label"><spring:message code="lable.days.in.year" /><span style="color: #d9534f;">*</span></label>		
		<div class="col-sm-3">
		<select  class="form-control" id="interestCalculationDaysInYearType" name="interestCalculationDaysInYearType" >
				</select>
		</div>	
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="lable.Lock-in.period" /></label>		
		<div class="col-sm-3">
		<input id="lockinPeriodFrequency" name="lockinPeriodFrequency" class="form-control" type="text">
		</div>
		<div class="col-sm-3">
		<select id="lockinPeriodFrequencyType" name="lockinPeriodFrequencyType" class="form-control">
						<option><spring:message code="lable.please.choose"/></option>
					</select>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="lable.is.mandatory.deposit" /></label>		
		<div class="col-sm-1">
				<label class="checkbox"> <input id="isMandatoryDeposit" type="checkbox"></label>
			</div>	
					<label class="col-sm-2 control-label"><spring:message code="lable.allow.withdrawals" /></label>		
			<div class="col-sm-1">
				<label class="checkbox"> <input id="allowWithdrawal" type="checkbox"></label>
			</div>
		<label class="col-sm-3 control-label"><spring:message code="lable.adjust.advance.payments.toward.future.installments" /></label>		
			<div class="col-sm-1">
				<label class="checkbox"> <input id="adjustAdvanceTowardsFuturePayments" type="checkbox"></label>
			</div>
		</div> 
		<div class="form-group">
	<label class="col-sm-2 control-label"><spring:message code="lable.Recurring.Deposit.Amount" /></label>		
		<div class="col-sm-3">
		<input type="text" class="form-control" id="mandatoryRecommendedDepositAmount" name="mandatoryRecommendedDepositAmount">
		</div>
	<label class="col-sm-2 control-label"><spring:message code="lable.deposit.period" /></label>		
		<div class="col-sm-2">
		<input type="text" class="form-control" id="depositPeriod" name="depositPeriod">
		
		</div>
		<div class="col-sm-2">
		<select id="depositPeriodFrequencyId" name="depositPeriodFrequencyId" class="form-control">
						<option><spring:message code="lable.please.choose"/></option>
					</select>
		</div>
		</div>	
		<div class="form-group">
		<label class="col-sm-4 control-label"><spring:message code="lable.group.metting" /></label>		
		<div class="col-sm-1 col-sm-offset-1">
				<label class="checkbox"> <input id="isCalendarInherited" type="checkbox"></label>
			</div>
			</div>		
		<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="lable.deposit.start.date" /></label>
		<div class="col-sm-3">
		<input type="text" class="form-control" id="expectedFirstDepositOnDate" name="expectedFirstDepositOnDate" datetype="date">
		
		</div>
<label class="col-sm-2 control-label"><spring:message code="lable.deposit.frequency" /></label>
		
		<div class="col-sm-2">
	<input type="text" class="form-control" id="recurringFrequency" name="recurringFrequency" >
		
		</div>
		<div class="col-sm-2">
		<select id="recurringFrequencyType" name="recurringFrequencyType" class="form-control">
						<option><spring:message code="lable.please.choose"/></option>
					</select>
		</div>
		</div>	
		<div><h4><spring:message code="lable.setting" /></h4></div>	
			<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="lable.minimum.deposit.term" /></label>		
		<div class="col-sm-3">
		<input  id="minDepositTerm" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>	
			<label class="col-sm-2 control-label"><spring:message code="lable.and.thereafter.in.multiples.of" /></label>		
		<div class="col-sm-3">
		<input  id="inMultiplesOfDepositTerm" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>			
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="lable.maximum.deposit.term" /></label>		
		<div class="col-sm-3">
		<input  id="maxDepositTerm" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>		
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label"> <spring:message code="lable.Closure" /></label>		
		<div class="col-sm-3">
		<input  id="maxDepositTerm" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>	
		
		</div>
<div class="form-group">
		
			<lable class="col-sm-3"> <spring:message code="lable.use"/> </lable>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="" type="checkbox"></label>
			</div>
			<lable class="col-sm-2 col-sm-offset-1"> <spring:message code="deposit.label.taxGroup"/> </lable>
			<div class="col-sm-3">
			<input  id="term" type="text" style="border: none;" readonly="readonly" class="form-control">
			
			</div>
		</div> 
	<div><h4><spring:message code="lable.interest.rate.chart" /></h4></div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="lable.valid.form.date" /><span style="color: #d9534f;">*</span></label>		
		<div class="col-sm-3">
		<input  id="validFormDate" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>	
			<label class="col-sm-2 control-label"><spring:message code="lable.end.date" /></label>		
		<div class="col-sm-3">
		<input  id="endDate" type="text" style="border: none;" readonly="readonly" class="form-control">
		</div>			
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message code="client.charges" /></label>		
		<div class="col-sm-3">
		<select id="chargeId" class="form-control" >
						<option><spring:message code="lable.please.choose"/></option>
					</select>
		</div>
		<div class="col-sm-3">
				<button type="button" class="btn btn-info"><spring:message code="btn.add" /></button>				
			</div>
		</div>
	<div class="text-right" style="padding-right: 80px">
		<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
	</div>		
	
			
	</fieldset>
</form>



	<script type="text/javascript">
	$('#isCalendarInherited').click(function(){
		var a = $('#isCalendarInherited').is(':checked');
		if(a == true){
			$.hide('recure');
		}else{
			$.show('recure');
		}	
	});
		$(document).ready(function() {
				$.valid("savingClient", [ 
					{
						"name" : "productlist",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "date",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "interestCompoundingPeriodType",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "interestCalculationType",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "interestCalculationDaysInYearType",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "interestPostingPeriodType",
						"notEmpty" : "不能为空"
					}
				]);
				
				$.datetimepicker();
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.recurringdepositaccounts.template?clientId="+clientId
					},
					callback : "recurringProduct"
				});
				$.getWidget("productlist").change(function() {
					var productId = parseInt($.value("productlist"));
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.recurringdepositaccounts.template?clientId="+clientId+"&productId="+productId
						},
						callback : "productDetial"
					});
				});
				$.getWidget("save").click(function() {
					var productId = parseInt($.value("productlist"));
					var loanTermFrequencyType = parseInt($.value("loanTermFrequencyType"));
					var repaymentFrequencyType = parseInt($.value("repaymentFrequencyType"));
					var amortizationType = parseInt($.value("amortizationType"));
					var interestType = parseInt($.value("interestType"));
					var interestCalculationPeriodType = parseInt($.value("interestCalculationPeriodType"));
					var transactionProcessingStrategyId = parseInt($.value("transactionProcessingStrategyId"));
					var loanPurposeId = parseInt($.value("loanPurposeId"));
					var chargeId = parseInt($.value("chargeId"));
					var json = {
							  "clientId": clientId,
							  "productId": productId,
							  "locale": "en",
							  "dateFormat": $('input[name="submitDate"]').attr('date-format'),
							  "submittedOnDate": $.value('submitDate')
						};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.savingsaccounts"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("recurringDeposit");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		function recurringProduct(param){
			$.setSelect('productlist', param.productOptions, 'id', 'name');
			$.setSelect('chargeId',param.chargeOptions,'id','name');
		}
		
		function productDetial(param){
			$.setSelect('stafflist',param.fieldOfficerOptions,'id','displayName');
			
			$.setSelect('interestCompoundingPeriodType',param.interestCompoundingPeriodTypeOptions,'id','value');
			$.setSelect('recurringFrequencyType',param.interestPostingPeriodTypeOptions,'id','value');
			$.setSelect('interestCalculationType',param.interestCalculationTypeOptions,'id','value');
			$.setSelect('interestCalculationDaysInYearType',param.interestCalculationDaysInYearTypeOptions,'id','value');
			
			$.setSelect('lockinPeriodFrequencyType',param.lockinPeriodFrequencyTypeOptions,'id','value');
			$.setSelect('depositPeriodFrequencyId',param.interestPostingPeriodTypeOptions,'id','value');
			
			$('#interestCompoundingPeriodType option[value="' + param.interestCompoundingPeriodType.id + '"]').attr('selected', true);
			$('#interestPostingPeriodType option[value="' + param.interestPostingPeriodType.id + '"]').attr('selected', true);
			$('#interestCalculationType option[value="' + param.interestCalculationType.id + '"]').attr('selected', true);
			$('#interestCalculationDaysInYearType option[value="' + param.interestCalculationDaysInYearType.id + '"]').attr('selected', true);
			$.assign({
				"currency" : param.currency.name,
				"decimal" : param.currency.decimalPlaces,
				"minDepositTerm" : param.minDepositTerm,
				"minDepositTermType" : param.minDepositTermType.value,
				"inMultiplesOfDepositTerm" : param.inMultiplesOfDepositTerm,
				"inMultiplesOfDepositTermType" : param.inMultiplesOfDepositTermType.value,
				"maxDepositTerm" : param.maxDepositTerm,
				"lockinPeriodFrequency":param.lockinPeriodFrequency,
				"maxDepositTermType" : param.maxDepositTermType.value
			});
			if(param.accountChart.fromDate != null && param.accountChart.fromDate.length > 0){
				var validDate = $.formatDate(param.accountChart.fromDate,'yyyy/MM/dd');
				$('input[name="validFormDate"]').val(validDate);
			}
			if(param.accountChart.endDate != null && param.accountChart.endDate.length > 0){
				var enddate = $.formatDate(param.accountChart.endDate,'yyyy/MM/dd');
				$('input[name="endDate"]').val(enddate);
			}
		}
</script>