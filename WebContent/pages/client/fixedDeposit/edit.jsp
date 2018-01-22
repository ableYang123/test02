<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form class="form-horizontal"  id="fixedDeposit" name="fixedDeposit">
	<fieldset>
		<legend>
			<spring:message code="lable.fixed.deposit.application" />
		</legend>
	</fieldset>

	<div class="form-group">
		<label for="productlist" class="col-sm-2 control-label"><spring:message
				code="fund.search.product" /><span style="color: #d9534f;">*</span>
		</label>
		<div class="col-sm-3">
			<select class="form-control" id="productlist" name="productlist">
				<option><spring:message code="lable.please.choose" /></option>
			</select>
		</div>
		<label for="productlist" class="col-sm-2 control-label"><spring:message
				code="lable.submitDate" /><span style="color: #d9534f;">*</span> </label>
		<div class="col-sm-3">
			<input type="text" class="form-control" datetype="date"
				name="submitDate" afterToday="true">
		</div>
	</div>
	<div class="form-group">
		<label for="fieldOfficerId" class="col-sm-2 control-label"><spring:message
				code="lable.loan.officer" /> </label>
		<div class="col-sm-3">
			<select class="form-control" id="fieldOfficerId" name="fieldOfficerId">
				<option><spring:message code="lable.please.choose" /></option>
			</select>
		</div>
	</div>
	<div>
		<h4>
			<spring:message code="lable.terms" />
		</h4>
	</div>
	<div class="form-group" style="padding-left:80px">
		<div class="col-sm-2">
			<label><spring:message
					code="lable.currency" /></label>
		</div>
		<div class="col-sm-3">
			<span id="currency"></span>
		</div>
		<div class="col-sm-2">
			<label><spring:message
					code="lable.decimal.places" /></label>
		</div>
		<div class="col-sm-3">
			<span id="decimal"></span>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message
				code="lable.interest.compounding.period" /><span
			style="color: #d9534f;">*</span></label>
		<div class="col-sm-3">
			<select class="form-control" id="interestCompoundingPeriodType"
				name="interestCompoundingPeriodType">
			</select>
		</div>
		<label class="col-sm-2 control-label"><spring:message
				code="lable.interest.posting.period" /><span
			style="color: #d9534f;">*</span></label>
		<div class="col-sm-3">
			<select class="form-control" id="interestPostingPeriodType"
				name="interestPostingPeriodType">
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message
				code="lable.interest.calculated.using" /><span
			style="color: #d9534f;">*</span></label>
		<div class="col-sm-3">
			<select class="form-control" id="interestCalculationType"
				name="interestCalculationType">
			</select>
		</div>
		<label class="col-sm-2 control-label"><spring:message
				code="lable.days.in.year" /><span style="color: #d9534f;">*</span></label>
		<div class="col-sm-3">
			<select class="form-control" id="interestCalculationDaysInYearType"
				name="interestCalculationDaysInYearType">
			</select>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-2" style="padding-left:55px;">
			<label><spring:message
					code="lable.deposit.amount" /><span style="color: #d9534f;">*</span></label>
		</div>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="depositAmount" name="depositAmount">
		</div>
		<label class="col-sm-2 control-label"><spring:message
				code="lable.deposit.period" /></label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="depositPeriod">
		</div>
		<div class="col-sm-2">
			<select id="depositPeriodFrequencyId" name="depositPeriodFrequencyId" class="form-control">
				<option><spring:message code="lable.please.choose" /></option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message
				code="lable.Lock-in.period" /></label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="lockinPeriodFrequency">
		</div>
		<div class="col-sm-2">
			<select id="lockinPeriodFrequencyType" class="form-control">
				<option><spring:message code="lable.please.choose" /></option>
			</select>
		</div>
	</div>
	<div>
		<h4>
			<spring:message code="lable.setting" />
		</h4>
	</div>
	<div class="form-group" style="padding-left:40px;">
		<div  class="col-sm-2">
			<label><spring:message
					code="lable.minimum.deposit.term" /></label>
		</div>
		<div class="col-sm-3">
			<span id="minDepositTerm"></span>-<span code="" id="minDepositTermType"></span>
		</div>
		<div class="col-sm-2">
			<label><spring:message
					code="lable.and.thereafter.in.multiples.of" /></label>
		</div>
		<div class="col-sm-3">
			<span id="inMultiplesOfDepositTerm"></span>-<span code="" id="inMultiplesOfDepositTermType"></span>
		</div>
	</div>
	<div class="form-group" style="padding-left:40px;">
		<div class="col-sm-2">
			<label><spring:message
					code="lable.maximum.deposit.term" /></label>
		</div>
		<div class="col-sm-3">
			<span id="maxDepositTerm"></span>-<span code="" id="maxDepositTermType"></span>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-2 control-label">
			<label> <spring:message
					code="lable.Closure" />:</label>
		</div>
		<div class="col-sm-3" style="display: none;">
			<span id="preClosurePenalApplicable"></span>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-4">
			<label> <spring:message
					code="lable.apply.interest" /></label>
		</div>
		<div class="col-sm-3">
			<span id="preClosurePenalInterest"></span>-on<span code="" id="preClosurePenalInterestOnType"></span>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-4 control-label"><spring:message
				code="lable.trasfer.interest.to.linked.savings.account" /></label>
		<div class="col-sm-1">
			<label class="checkbox"> 
				<input id="transferInterestToSavings" type="checkbox">
			</label>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"><spring:message
				code="lable.link.savings" /></label>
		<div class="col-sm-3">
			<select id="linkAccountId" class="form-control">
				<option><spring:message code="lable.please.choose" /></option>
			</select>
		</div>
	</div>
	
	<div class="form-group" id="group" style="display: none;">
		<div class="col-sm-1" style="padding-left:100px;">
			<input id="withHoldTax" type="checkbox" checked="checked">
		</div>
		<div class="col-sm-3">
			<lable> <spring:message
				code="lable.applicable"/> </lable>
		</div>
		<div id="tax">
			<div class="col-sm-2">
				<label>
					<spring:message code="lable.tax.group"/>
				</label>
			</div>
			<div class="col-sm-2">
				<span id="taxGroup"></span>
			</div>
		</div>
	</div>
	
	<div>
		<h4>
			<spring:message code="lable.interest.rate.chart" />
		</h4>
	</div>

	<div class="form-group">
		<div style="padding-left:120px;">
			<div class="col-sm-2">
				<label >
					<spring:message code="lable.valid.form.date" />
					<span style="color: #d9534f;">*</span>
				</label>
			</div>
			<div class="col-sm-3">
				<span id="validFormDate"></span>
			</div>
			<div class="col-sm-2">
				<label>
					<spring:message code="lable.end.date" />
				</label>
			</div>
			<div class="col-sm-3">
				<span id="endDate"></span>
			</div>
		</div>
		<table id="rateTable" class="table table-bordered width100">
			<tbody>
				<tr class="graybg">
					<td>Period Type</td>
					<td>Period From / To</td>
					<td>Amount Range</td>
					<td>Interest</td>
					<td>Description</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>		
		</table>
	</div>
	<div class="form-group">
		<div class="col-sm-1 control-label">
			<label><spring:message
					code="client.charges" /></label>
		</div>
		<div class="col-sm-3">
			<select id="chargeId" class="form-control">
				<option><spring:message code="lable.please.choose" /></option>
			</select>
		</div>
		<div class="col-sm-3">
			<button type="button" class="btn btn-info">
				<spring:message code="btn.add" />
			</button>
		</div>
	</div>
	<div class="text-right" style="padding-right: 80px">
		<button type="button" id="save" name="save" class="btn btn-primary">
			<spring:message code="btn.submit" />
		</button>
	</div>
</form>
	<script type="text/javascript">
		var tax;
		$('#withHoldTax').click(function(){
			var flag = $('#withHoldTax').is(':checked');
			if(flag == true){
				$.show('tax');
			}else{
				$.hide('tax');
			}
		});
		$(document).ready(function() {
				$.valid("fixedDeposit", [ 
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
						"url" : "api.v1.fixeddepositaccounts."+fixedDepositId+"?associations=charges,+linkedAccount&template=true"
					},
					callback : "depositProduct"
				});
				$.getWidget("productlist").change(function() {
					var productId = parseInt($.value("productlist"));
					$('#currency').empty();
					$('#decimal').empty();
					$('#minDepositTerm').empty();
					$('#minDepositTermType').empty();
					$('#inMultiplesOfDepositTerm').empty();
					$('#inMultiplesOfDepositTermType').empty();
					$('#maxDepositTerm').empty();
					$('#maxDepositTermType').empty();
					$('#preClosurePenalInterest').empty();
					$('#preClosurePenalInterestOnType').empty();
					$('#validFormDate').empty();
					$('#endDate').empty();
					
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.fixeddepositaccounts.template?clientId="+clientId+"&productId="+productId
						},
						callback : "productDetial"
					});
				});
				$.getWidget("save").click(function() {
					var productId = parseInt($.value("productlist"));
					var json;
					if(tax != ''){
						json = {
								  "clientId": clientId,
								  "productId": productId,
								  "dateFormat": $('input[name="submitDate"]').attr('date-format'),
								  "depositAmount" : $.value('depositAmount'),
								  "depositPeriod" : $.value('depositPeriod'),
								  "depositPeriodFrequencyId" : parseInt($.value('depositPeriodFrequencyId')),
								  "fieldOfficerId" : parseInt($.value('fieldOfficerId')),
								  "inMultiplesOfDepositTerm" : $('#inMultiplesOfDepositTerm').text(),
								  "inMultiplesOfDepositTermTypeId" : $('#inMultiplesOfDepositTermType').attr('code'),
								  "interestCalculationDaysInYearType" : $.value('interestCalculationDaysInYearType'),
								  "interestCalculationType" : parseInt($.value('interestCalculationType')),
								  "interestCompoundingPeriodType" : parseInt($.value('interestCompoundingPeriodType')),
								  "interestPostingPeriodType": parseInt($.value('interestPostingPeriodType')),
								  "linkAccountId" : parseInt($.value('linkAccountId')),
								  "lockinPeriodFrequency" : $.value('lockinPeriodFrequency'),
								  "lockinPeriodFrequencyType" : parseInt($.value('lockinPeriodFrequencyType')),
								  "maxDepositTerm" : $('#maxDepositTerm').text(),
								  "maxDepositTermTypeId" : $('#maxDepositTermType').attr('code'),
								  "minDepositTerm" : $.value('minDepositTerm'),
								  "minDepositTermTypeId" :$('#minDepositTermType').attr('code'),
								  "monthDayFormat" : "dd MM",
								  "preClosurePenalApplicable" : $('#preClosurePenalApplicable').text(),
								  "preClosurePenalInterest" : $('#preClosurePenalInterest').text(),
								  "preClosurePenalInterestOnTypeId" : $('#preClosurePenalInterestOnType').attr('code'),
								  "transferInterestToSavings" : $('#transferInterestToSavings').is(':checked'),
								  "withHoldTax" : $('#withHoldTax').is(':checked'),
								  "locale": "en",
								  "nominalAnnualInterestRate" : 1,
								  "submittedOnDate": $.value('submitDate')
							};
					}else{
						json = {
								  "clientId": clientId,
								  "productId": productId,
								  "dateFormat": $('input[name="submitDate"]').attr('date-format'),
								  "depositAmount" : $.value('depositAmount'),
								  "depositPeriod" : $.value('depositPeriod'),
								  "depositPeriodFrequencyId" : parseInt($.value('depositPeriodFrequencyId')),
								  "fieldOfficerId" : parseInt($.value('fieldOfficerId')),
								  "inMultiplesOfDepositTerm" : $('#inMultiplesOfDepositTerm').text(),
								  "inMultiplesOfDepositTermTypeId" : $('#inMultiplesOfDepositTermType').attr('code'),
								  "interestCalculationDaysInYearType" : $.value('interestCalculationDaysInYearType'),
								  "interestCalculationType" : parseInt($.value('interestCalculationType')),
								  "interestCompoundingPeriodType" : parseInt($.value('interestCompoundingPeriodType')),
								  "interestPostingPeriodType": parseInt($.value('interestPostingPeriodType')),
								  "linkAccountId" : parseInt($.value('linkAccountId')),
								  "lockinPeriodFrequency" : $.value('lockinPeriodFrequency'),
								  "lockinPeriodFrequencyType" : parseInt($.value('lockinPeriodFrequencyType')),
								  "maxDepositTerm" : $('#maxDepositTerm').text(),
								  "maxDepositTermTypeId" : $('#maxDepositTermType').attr('code'),
								  "minDepositTerm" : $.value('minDepositTerm'),
								  "minDepositTermTypeId" :$('#minDepositTermType').attr('code'),
								  "monthDayFormat" : "dd MM",
								  "preClosurePenalApplicable" : $('#preClosurePenalApplicable').text(),
								  "preClosurePenalInterest" : $('#preClosurePenalInterest').text(),
								  "preClosurePenalInterestOnTypeId" : $('#preClosurePenalInterestOnType').attr('code'),
								  "transferInterestToSavings" : $('#transferInterestToSavings').is(':checked'),
								  //"withHoldTax" : $('#withHoldTax').is(':checked'),
								  "locale": "en",
								  "nominalAnnualInterestRate" : 1,
								  "submittedOnDate": $.value('submitDate')
							};
					}
						
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.fixeddepositaccounts"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("fixedDeposit");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != ''){
				var fixedDepositId = param.resourceId;
				window.location.href="loadPage.do?nextPage=client.fixedDeposit.fixedDepositDetail&fixedDepositId="+fixedDepositId
			}
		}
		
		function depositProduct(param){
			$.setSelect('productlist', param.productOptions, 'id', 'name');
			$.setSelect('chargeId',param.chargeOptions,'id','name');
		}
		
		function productDetial(param){
			$.setSelect('fieldOfficerId',param.fieldOfficerOptions,'id','displayName');
			
			$.setSelect('interestCompoundingPeriodType',param.interestCompoundingPeriodTypeOptions,'id','value');
			$.setSelect('interestPostingPeriodType',param.interestPostingPeriodTypeOptions,'id','value');
			$.setSelect('interestCalculationType',param.interestCalculationTypeOptions,'id','value');
			$.setSelect('interestCalculationDaysInYearType',param.interestCalculationDaysInYearTypeOptions,'id','value');
			
			$.setSelect('lockinPeriodFrequencyType',param.lockinPeriodFrequencyTypeOptions,'id','value');
			$.setSelect('depositPeriodFrequencyId',param.periodFrequencyTypeOptions,'id','value');
			
			$('#interestCompoundingPeriodType option[value="' + param.interestCompoundingPeriodType.id + '"]').attr('selected', true);
			$('#interestPostingPeriodType option[value="' + param.interestPostingPeriodType.id + '"]').attr('selected', true);
			$('#interestCalculationType option[value="' + param.interestCalculationType.id + '"]').attr('selected', true);
			$('#interestCalculationDaysInYearType option[value="' + param.interestCalculationDaysInYearType.id + '"]').attr('selected', true);
			$('#currency').append(param.currency.displayLabel);
			$('#decimal').append(param.currency.decimalPlaces);
			$('#minDepositTerm').append(param.minDepositTerm);
			$('#inMultiplesOfDepositTerm').append(param.inMultiplesOfDepositTerm);
			$('#maxDepositTerm').append(param.maxDepositTerm);
			$('#minDepositTermType').append(param.minDepositTermType.value);
			$('#minDepositTermType').attr('code',param.minDepositTermType.id);
			if(typeof param.inMultiplesOfDepositTermType != 'undefined'){
				$('#inMultiplesOfDepositTermType').append(param.inMultiplesOfDepositTermType.value);
				$('#inMultiplesOfDepositTermType').attr('code',param.inMultiplesOfDepositTermType.id);
			}
			$('#maxDepositTermType').append(param.maxDepositTermType.value);
			$('#maxDepositTermType').attr('code',param.maxDepositTermType.id);
			if(typeof param.preClosurePenalInterest != 'undefined'){
				$('#preClosurePenalInterest').append(param.preClosurePenalInterest);
				$('#preClosurePenalInterestOnType').append(' '+param.preClosurePenalInterestOnType.value);
				$('#preClosurePenalInterestOnType').attr('code',param.preClosurePenalInterestOnType.id);
			}
			if(typeof param.preClosurePenalApplicable != 'undefined'){
				$('#preClosurePenalApplicable').append(param.preClosurePenalApplicable);
			}
			
			if(typeof param.taxGroup != 'undefined'){
				tax = param.taxGroup;
				$.show('group');
				$('#taxGroup').append(param.taxGroup.name);
			}else{
				tax = '';
				$.hide('group');
				$('#taxGroup').append('');
			}
			
			$('#validFormDate').append($.formatDate(param.accountChart.fromDate));
			$('#endDate').append($.formatDate(param.accountChart.endDate));
			//if(param.accountChart.fromDate != null && param.accountChart.fromDate.length > 0){
				//var validDate = $.formatDate(param.accountChart.fromDate);
			//}
			//if(param.accountChart.endDate != null && param.accountChart.endDate.length > 0){
				//var endDate = $.formatDate(param.accountChart.endDate);
			//}
			if(param.accountChart.chartSlabs != ''){
				var chartSlabs = param.chargeId.chartSlabs;
				for(var i=0;i<chartSlabs.length;i++){
					if(typeof chartSlabs[i].description == 'undefined'){
						chartSlabs[i].description = '';
					}
					var str = '<tr><td>'+chartSlabs[i].periodType.value+'</td>'
					+'<td>'+chartSlabs[i].fromPeriod+'-'+chartSlabs[i].toPeriod+'</td>'
					+'<td>-</td>'
					+'<td>'+chartSlabs[i].annualInterestRate+'</td>'
					+'<td>'+chartSlabs[i].description+'</td>'
					+'<td><a href="">Incentives</a></td>'
					+'</tr>';
					$('#rateTable').append(str);
				}
			}
		}
</script>