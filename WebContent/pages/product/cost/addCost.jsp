<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="addCost" name="addCost" >
<div class="form-group">
			<label for="currencyCode" class="col-sm-4 control-label"><spring:message code="Charges.applies.to" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" id="chargeAppliesTo" name="chargeAppliesTo" style="width:177px;" onclick="checkSelect()">
<option  value="one">选择一个</option>
<option label="贷款" value="1"><spring:message code="deposit.loan" /></option>
<option label="储蓄与存款" value="2"><spring:message code="Savings.and.deposits" /></option>
<option label="客户端" value="3"><spring:message code="fund.result.client" /></option>
<option label="股份" value="4"><spring:message code="deposit.share" /></option>
</select>
			</div>
			</div>

<div class="form-group" id="one">
<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="name" id="name">
			</div>
		</div>
<div class="form-group">
			<label for="currencyCode" class="col-sm-4 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="currency" id="currencyCode" style="width: 275px;"></select>
			</div>
		</div>
		<div class="form-group">
			<label for="chargeTimeType" class="col-sm-4 control-label"><spring:message code="charg.Time.Type" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeTimeType" id="chargeTimeType" style="width: 275px;"></select>
			</div>
		</div>
	<div class="form-group">
			<label for="chargeCalculationType" class="col-sm-4 control-label"><spring:message code="Charge.calculation" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeCalculationType" id="chargeCalculationType" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group">
			<label for="chargePaymentMode" class="col-sm-4 control-label"><spring:message code="Charge.payment.by" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargePaymentMode" id="chargePaymentMode" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group">
			<label for="amount" class="col-sm-4 control-label"><spring:message code="deposit.label.amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="amount" id="amount">
			</div>
		</div>
<div class="form-group">
			<label for="active" class="col-sm-4 control-label"><spring:message code="deposit.active" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="active" type="checkbox"></label>
			</div>
			</div>
		
			
			<div class="form-group">
			<label for="ispenalty" class="col-sm-4 control-label"><spring:message code="Is.penalty" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="ispenalty" type="checkbox"></label>
			</div>
			</div>

<div class="form-group">
			<label for="team" class="col-sm-4 control-label"><spring:message code="deposit.label.taxGroup" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="team" id="team" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group" style="padding-top: 10px;width: 450px;text-align: right;">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button  class="btn btn-info" id="saveLoan" type="button"><spring:message code="btn.submit" /></button>
</div>
</div>
</form>
<form class="form-horizontal"  id="addCost2" name="addCost2" >
<div class="form-group" id="second">
<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="name2" id="name2">
			</div>
		</div>
<div class="form-group">
			<label for="currencyCode2" class="col-sm-4 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="currency2" id="currencyCode2" style="width: 275px;"></select>
			</div>
		</div>
		<div class="form-group">
			<label for="chargeTimeType2" class="col-sm-4 control-label"><spring:message code="charg.Time.Type" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeTimeType2" id="chargeTimeType2" style="width: 275px;"></select>
			</div>
		</div>
	<div class="form-group">
			<label for="chargeCalculationType2" class="col-sm-4 control-label"><spring:message code="Charge.calculation" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeCalculationType2" id="chargeCalculationType2" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group">
			<label for="amount2" class="col-sm-4 control-label"><spring:message code="deposit.label.amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="amount2" id="amount2">
			</div>
		</div>
<div class="form-group">
			<label for="active2" class="col-sm-4 control-label"><spring:message code="deposit.active" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="active2" type="checkbox"></label>
			</div>
			</div>
		
			
			<div class="form-group">
			<label for="ispenalty2" class="col-sm-4 control-label"><spring:message code="Is.penalty" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="ispenalty2" type="checkbox"></label>
			</div>
			</div>

<div class="form-group">
			<label for="team2" class="col-sm-4 control-label"><spring:message code="deposit.label.taxGroup" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="team2" id="team2" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group" style="padding-top: 10px;width: 450px;text-align: right;">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button type="button" class="btn btn-info" id="saveSavings"><spring:message code="btn.submit" /></button>
</div>
</div>
</form>
<form class="form-horizontal"  id="addCost3" name="addCost3" >
<div class="form-group" id="third">
<div class="form-group">
			<label for="name3" class="col-sm-4 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="name3" id="name3">
			</div>
		</div>
<div class="form-group">
			<label for="currencyCode3" class="col-sm-4 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="currency3" id="currencyCode3" style="width: 275px;"></select>
			</div>
		</div>
		<div class="form-group">
			<label for="chargeTimeType3" class="col-sm-4 control-label"><spring:message code="charg.Time.Type" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeTimeType3" id="chargeTimeType3" style="width: 275px;"></select>
			</div>
		</div>
	<div class="form-group">
			<label for="chargeCalculationType3" class="col-sm-4 control-label"><spring:message code="Charge.calculation" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeCalculationType3" id="chargeCalculationType3" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group">
			<label for="amount3" class="col-sm-4 control-label"><spring:message code="deposit.label.amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="amount3" id="amount3">
			</div>
		</div>
<div class="form-group">
			<label for="active2" class="col-sm-4 control-label"><spring:message code="deposit.active" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="active3" type="checkbox"></label>
			</div>
			</div>
		
			
			<div class="form-group">
			<label for="ispenalty2" class="col-sm-4 control-label"><spring:message code="Is.penalty" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="ispenalty3" type="checkbox"></label>
			</div>
			</div>

<div class="form-group">
			<label for="charge3" class="col-sm-4 control-label"><spring:message code="Income.from.charge" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="charge3" id="charge3" style="width: 275px;"></select>
			</div>
		</div>

<div class="form-group">
			<label for="team3" class="col-sm-4 control-label"><spring:message code="deposit.label.taxGroup" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="team3" id="team3" style="width: 275px;"></select>
			</div>
		</div>

<div class="form-group" style="padding-top: 10px;width: 450px;text-align: right;">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button type="button" class="btn btn-info" id="saveClient"><spring:message code="btn.submit" /></button>
</div>
</div>
</form>
<form class="form-horizontal"  id="addCost4" name="addCost4" >
<div class="form-group" id="fourth">
<div class="form-group">
			<label for="name4" class="col-sm-4 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="name4" id="name4">
			</div>
		</div>
<div class="form-group">
			<label for="currencyCode4" class="col-sm-4 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="currency4" id="currencyCode4" style="width: 275px;"></select>
			</div>
		</div>
		<div class="form-group">
			<label for="chargeTimeType4" class="col-sm-4 control-label"><spring:message code="charg.Time.Type" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeTimeType4" id="chargeTimeType4" style="width: 275px;"></select>
			</div>
		</div>
	<div class="form-group">
			<label for="chargeCalculationType4" class="col-sm-4 control-label"><spring:message code="Charge.calculation" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="chargeCalculationType4" id="chargeCalculationType4" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group">
			<label for="amount4" class="col-sm-4 control-label"><spring:message code="deposit.label.amount" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="amount4" id="amount4">
			</div>
		</div>
<div class="form-group">
			<label for="active4" class="col-sm-4 control-label"><spring:message code="deposit.active" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="active4" type="checkbox"></label>
			</div>
			</div>

<div class="form-group">
			<label for="team4" class="col-sm-4 control-label"><spring:message code="deposit.label.taxGroup" /> </label>
			<div class="col-sm-4">
				<select  class="form-control" name="team4" id="team4" style="width: 275px;"></select>
			</div>
		</div>
<div class="form-group" style="padding-top: 10px;width: 450px;text-align: right;">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button type="button" class="btn btn-info" id="saveSavings"><spring:message code="btn.submit" /></button>
</div>
</div>
</form>
<script type="text/javascript">
function getSelect(param) {	
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType', param.loanChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType', param.loanChargeCalculationTypeOptions, 'id', 'value');	
	$.setSelect('chargePaymentMode', param.chargePaymetModeOptions, 'id', 'value');	
    $.setSelect('team', param.taxGroupOptions, 'id', 'name');	
}
function getSelect2(param) {	
	$.setSelect('currencyCode2', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType2', param.savingsChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType2', param.savingsChargeCalculationTypeOptions, 'id', 'value');	
	$.setSelect('team2', param.taxGroupOptions, 'id', 'name');		
}
function getSelect3(param) {	
	$.setSelect('currencyCode3', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType3', param.clientChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType3', param.clientChargeCalculationTypeOptions, 'id', 'value');	
	$.setSelect('charge3', param.incomeOrLiabilityAccountOptions.incomeAccountOptions, 'id', 'name');	
	$.setSelect('charge3', param.incomeOrLiabilityAccountOptions.liabilityAccountOptions, 'id', 'name');	
	$.setSelect('team3', param.taxGroupOptions, 'id', 'name');		
}
function getSelect4(param) {	
	$.setSelect('currencyCode4', param.currencyOptions, 'code', 'name');			
	$.setSelect('chargeTimeType4', param.shareChargeTimeTypeOptions, 'id', 'value');	
	$.setSelect('chargeCalculationType4', param.shareChargeCalculationTypeOptions, 'id', 'value');	
	$.setSelect('team4', param.taxGroupOptions, 'id', 'name');		
}
$(document).ready(function(){
	 
	$("#one").hide();
	 $("#second").hide();
	 $("#third").hide();
	 $("#fourth").hide();
	
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
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.charges.template"
			},
			callback : "getSelect"
		}); 
	 $.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		data : {
			"dataType" : "GET",
			"mydata" : "",
			"url" : "api.v1.charges.template"
		},
		callback : "getSelect2"
	}); 
	$.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		data : {
			"dataType" : "GET",
			"mydata" : "",
			"url" : "api.v1.charges.template"
		},
		callback : "getSelect3"
	}); 
	$.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		data : {
			"dataType" : "GET",
			"mydata" : "",
			"url" : "api.v1.charges.template"
		},
		callback : "getSelect4"
	}); 
	     $.getWidget("saveLoan").click(function() {					
			var currency =$("#currencyCode").find("option:selected").attr("value");
			var chargeTimeType=parseInt($("#chargeTimeType").find("option:selected").attr("value"));
			var chargeCalculationType=parseInt($("#chargeCalculationType").find("option:selected").attr("value"));			
			var chargePaymentMode=parseInt($("#chargePaymentMode").find("option:selected").attr("value"));			
			var date;
			date={
					"locale" : "en",
					"name":$.value('name'),
					"active":$("#active").is(':checked'),
					"amount":$.value('amount'),
					"chargeAppliesTo":$.value('chargeAppliesTo'),
					"chargeCalculationType":chargeCalculationType,
					"chargePaymentMode":chargePaymentMode,
					"chargeTimeType":chargeTimeType,
					"currencyCode":currency,
					"penalty":$("#ispenalty").is(':checked'),					
					"monthDayFormat":"dd MMM",
			}
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						'dataType' : "POST",
						'mydata' : date,
						'url' : 'api.v1.charges'
					},
					callback : "callbackadd"
					
				});
						
	  }); 
	     $.getWidget("saveSavings").click(function() {					
				var currency2 =$("#currencyCode2").find("option:selected").attr("value");
				var chargeTimeType2=parseInt($("#chargeTimeType2").find("option:selected").attr("value"));
				var chargeCalculationType2=parseInt($("#chargeCalculationType2").find("option:selected").attr("value"));			
				var chargePaymentMode2=parseInt($("#chargePaymentMode2").find("option:selected").attr("value"));			
				var date;
				date={
						"locale" : "en",
						"name":$.value('name2'),
						"active":$("#active2").is(':checked'),
						"amount":$.value('amount2'),
						"chargeAppliesTo":$.value('chargeAppliesTo'),
						"chargeCalculationType":chargeCalculationType2,
						"chargePaymentMode":chargePaymentMode2,
						"chargeTimeType":chargeTimeType2,
						"currencyCode":currency2,
						"penalty":$("#ispenalty2").is(':checked'),					
				}
				 $.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
							'dataType' : "POST",
							'mydata' : date,
							'url' : 'api.v1.charges'
						},
						callback : "callbackadd"
						
					});
							
		  }); 
	     $.getWidget("saveClient").click(function() {					
				var currency3 =$("#currencyCode3").find("option:selected").attr("value");
				var chargeTimeType3=parseInt($("#chargeTimeType3").find("option:selected").attr("value"));
				var chargeCalculationType3=parseInt($("#chargeCalculationType3").find("option:selected").attr("value"));			
				var chargePaymentMode3=parseInt($("#chargePaymentMode3").find("option:selected").attr("value"));					
				var date;
				date={
						"locale" : "en",
						"name":$.value('name3'),
						"active":$("#active3").is(':checked'),
						"amount":$.value('amount3'),
						"chargeAppliesTo":$.value('chargeAppliesTo'),
						"chargeCalculationType":chargeCalculationType3,
						"chargePaymentMode":chargePaymentMode3,
						"chargeTimeType":chargeTimeType3,
						"currencyCode":currency3,
						"penalty":$("#ispenalty3").is(':checked'),					
				}
				 $.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
							'dataType' : "POST",
							'mydata' : date,
							'url' : 'api.v1.charges'
						},
						callback : "callbackadd"
						
					});
							
		  }); 
	     $.getWidget("saveShare").click(function() {					
				var currency4 =$("#currencyCode4").find("option:selected").attr("value");
				var chargeTimeType4=parseInt($("#chargeTimeType4").find("option:selected").attr("value"));
				var chargeCalculationType4=parseInt($("#chargeCalculationType4").find("option:selected").attr("value"));			
				var chargePaymentMode4=parseInt($("#chargePaymentMode4").find("option:selected").attr("value"));			
				var date;
				date={
						"locale" : "en",
						"name":$.value('name4'),
						"active":$("#active4").is(':checked'),
						"amount":$.value('amount4'),
						"chargeAppliesTo":$.value('chargeAppliesTo'),
						"chargeCalculationType":chargeCalculationType4,
						"chargePaymentMode":chargePaymentMode4,
						"chargeTimeType":chargeTimeType4,
						"currencyCode":currency4,
						"penalty":$("#ispenalty4").is(':checked'),					
				}
				 $.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
							'dataType' : "POST",
							'mydata' : date,
							'url' : 'api.v1.charges'
						},
						callback : "callbackadd"
						
					});
							
		  }); 
	
});

function callbackadd(param) {
	$.setReadOnly("addCost");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
function checkSelect(value){
	var selectedOption = document.getElementById("chargeAppliesTo").value;  
	 if(selectedOption=="one"){
		    $("#one").hide();
		    $("#second").hide();	
		    $("#third").hide();
		    $("#fourth").hide();
	 }else if(selectedOption=="1"){
		    $("#one").show();
		    $("#second").hide();
		    $("#third").hide();
		    $("#fourth").hide();
	 }else if(selectedOption=="2"){
		    $("#one").hide();
		    $("#second").show();
		    $("#third").hide();
		    $("#fourth").hide();
	 }
	 else if(selectedOption=="3"){
		    $("#one").hide();
			$("#second").hide();
			$("#third").show();
			$("#fourth").hide();
	 }
	 else if(selectedOption=="4"){
		 $("#one").hide();
		 $("#second").hide();
		 $("#third").hide();
		 $("#fourth").show();
	 }
}
</script>