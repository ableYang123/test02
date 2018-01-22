<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="add_shareProduct" name="add_shareProduct" >
<fieldset>
		<legend>
			<spring:message code="deposit.share.product.create" />
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
			<label for="totalnumberofshares" class="col-sm-2 control-label"><spring:message code="The.total.number.of.shares" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="totalnumberofshares" name="totalnumberofshares" />
			</div>
			
			<label for="totalsharestobeissued" class="col-sm-2 control-label"><spring:message code="To.issue.shares" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="totalsharestobeissued" name="totalsharestobeissued" />
			</div>
		</div>
<div class="form-group">
			<label for="nominalprice" class="col-sm-2 control-label"><spring:message code="Nominal.price" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="nominalprice" name="nominalprice" />
			</div>
			
			<label for="capitalvalue" class="col-sm-2 control-label"><spring:message code="capital.value" /></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="capitalvalue" name="capitalvalue" disabled="disabled" />
			</div>
		</div>
<div><h3><spring:message code="deposit.label.settings" /></h3></div>
<div class="form-group col-sm-12">
			<label  class="col-sm-3 control-label"><spring:message code="For.each.customer" /><span style="color: #d9534f;">*</span> </label>			
			<div class="col-sm-2">	<input type="text" class="form-control col-sm-1" id="minimumshares" name="minimumshares"></div>			
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="nominalshares" name="nominalshares"></div>					
			<div class="col-sm-2"><input  type="text" class="form-control col-sm-1" id="maximumshares" name="maximumshares"></div>
		</div>


<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="Minimum.Active.Period" /> </label>
			<div class="col-sm-3">
				<input id="minimumactiveperiod" name="minimumactiveperiod" class="form-control" >
			</div>
			<div class="col-sm-3">
				<select id="frequencyType" name="frequencyType" class="form-control" style="width: 198">
				</select>
			</div>
		</div>

<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="Lock.in.period" /></label>
			<div class="col-sm-3">
				<input id="lockinPeriodFrequency" name="lockinPeriodFrequency" class="form-control" >
			</div>
			<div class="col-sm-3">
				<select id="lockinPeriodFrequencyType" name="lockinPeriodFrequencyType" class="form-control" style="width: 198">
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="withdrawalFeeForTransfers" class="col-sm-3 control-label"><spring:message code="Allow.dividends.for.inactive.clients" /></label>
			<div class="col-sm-1">
				<label class="checkbox"> <input id="withdrawalFeeForTransfers" type="checkbox"></label>
			</div>
			</div>
<div style="padding-top: 20px;"><span style="font-size: 25px"><strong><spring:message code="market.price" /></strong></span></div>
<div>
<span><strong><spring:message code="Market.price.periods" /></strong></span>
<button type="button" class="btn btn-info"  id="addPrice"><strong><spring:message code="report.add.add" /></button>
</div>
<div style="padding-top: 20px;">
<table class="table table-bordered table-hover" id="table1" style="width:500px;">
<tr>
<th><spring:message code="lable.fromDate" /></th>
<th><spring:message code="deposit.prices" /></th>
<th><spring:message code="audit.list.action" /></th>
</tr>
<tr style="display:none;">
				<th name="beginDate"><input type="text" datetype="none" name="beginDate"  local-date="true" class="datetime"></th>
				<th name="price"><input type="text" name="price" ></th>
				<th date-worthless="true"><a class="remove"><span class="glyphicon glyphicon-remove" aria-hidden="true" id="del"></span></a></th>
			</tr>
</table>
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
<table class="table table-hover table-bordered" id="ChargeTable" style="width:700px;" >
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
							<button type="button" class="btn btn-link" onclick="deleteTr(this)" >
								<span class="glyphicon glyphicon-remove" ></span>
							</button>
						</td>
	</tr>

</table>	
</div>
<div><h3><spring:message code="deposit.label.accounting" /></h3></div>  
 <div class="form-group"   id="accountingRule">
		<label for="none"><spring:message code="deposit.label.none" /></label>
		 <input type="radio" name="Accounting" id="none" checked="checked" value="1"> 
		 <label for="money"><spring:message code="deposit.label.cash" /></label>
		<input type="radio" name="Accounting" id="money" value="2"> 
	</div> 
 <div id="div1"><h3><spring:message code="deposit.label.assets" /></h3></div> 
<div class="form-group" id="div2">
			
				
				<label class="col-sm-2 control-label"><spring:message code="For.reference" /></label>
				<div class="col-sm-3">
				<select  id="shareReferenceId" name="shareReferenceId" class="form-control" />
				<option></option>
				</select>
			</div>
			</div>
 <div id="div3"><h3><spring:message code="deposit.label.liabilities" /></h3></div> 
<div class="form-group" id="div4">
			
				
				<label class="col-sm-2 control-label"><spring:message code="For.temporary.collection.and.control" /></label>
				<div class="col-sm-3">
				<select  id="shareReferenceId2" name="shareReferenceId2" class="form-control" />
				<option></option>
				</select>
			</div>
			</div>
 <div id="div5"><h3><spring:message code="Share.Equity" /></h3></div> 
 <div class="form-group" id="div6">
			
				
				<label class="col-sm-2 control-label"><spring:message code="Share.Equity" /></label>
				<div class="col-sm-3">
				<select  id="shareReferenceId3" name="shareReferenceId3" class="form-control" />
				<option></option>
				</select>
			</div>
			</div>
<div id="div7"><h3><spring:message code="deposit.label.income" /></h3></div> 
<div class="form-group" id="div8">
			
				
				<label class="col-sm-2 control-label"><spring:message code="deposit.saving.income" /></label>
				<div class="col-sm-3">
				<select  id="shareReferenceId4" name="shareReferenceId4" class="form-control" />
				<option></option>
				</select>
			</div>
			</div>
<div style="text-align: center;padding-top: 20px">
<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
<button class="btn btn-info" id="save" type="button" ><spring:message code="btn.submit" /></button>
</div>
</fieldset>
</form>
<script type="text/javascript">
function getSelect(param) {	
	
	$.setSelect('shareReferenceId', param.accountingMappingOptions.assetAccountOptions, 'id', 'name');	
	$.setSelect('shareReferenceId2', param.accountingMappingOptions.liabilityAccountOptions, 'id', 'name');	
	$.setSelect('shareReferenceId3', param.accountingMappingOptions.equityAccountOptions, 'id', 'name');	
	$.setSelect('shareReferenceId4', param.accountingMappingOptions.incomeAccountOptions, 'id', 'name');	
	$.setSelect('chargeId', param.chargeOptions, 'id', 'name');
	$.setSelect('currencyCode', param.currencyOptions, 'code', 'name');	
	$.setSelect('frequencyType', param.minimumActivePeriodFrequencyTypeOptions, 'id', 'value');	
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
	$.tableclone("ChargeTable");
	$('#ChargeTable').find('tr').last().find('span[name="chargeName"]').attr("id",param.id);
	$('#ChargeTable').find('tr').last().find('span[name="chargeName"]').text(param.name);
	$('#ChargeTable').find('tr').last().find('span[name="chargeType"]').text(param.chargeCalculationType.value);
	$('#ChargeTable').find('tr').last().find('span[name="chargeAmount"]').text(param.amount);
	$('#ChargeTable').find('tr').last().find('span[name="chargeCollectedOn"]').text(param.chargeTimeType.value);
}
$(document).ready(function(){
	$("#div1").hide();
	$("#div2").hide();
	$("#div3").hide();
	$("#div4").hide();
	$("#div5").hide();
	$("#div6").hide();
	$("#div7").hide();
	$("#div8").hide();
	$("#ChargeTable").hide();
	$("#none").click(function(){
		  var    $radio = $(this).find("input[type=radio]"),
          $flag  = $radio.is(":checked");
		  $("#div1").hide();
		  $("#div2").hide();
		  $("#div3").hide();
		  $("#div4").hide();
		  $("#div5").hide();
		  $("#div6").hide();
		  $("#div7").hide();
		  $("#div8").hide();		  
          if( !$flag ){
           $radio.prop("checked",true);   
 		}		
	});
	$("#money").click(function(){
		  var    $radio = $(this).find("input[type=radio]"),
        $flag  = $radio.is(":checked");
		  $("#div1").show();
		  $("#div2").show();
		  $("#div3").show();
		  $("#div4").show();
		  $("#div5").show();
		  $("#div6").show();
		  $("#div7").show();
		  $("#div8").show();		  
        if( !$flag ){
         $radio.prop("checked",true);   
		}		
	});
	$.valid("add_shareProduct", [ {
		"name" : "name",
		"notEmpty" : "不能为空"
	}, {
		"name" : "shortName",
		"notEmpty" : "不能为空"
	}, {
		"name" : "description",
		"notEmpty" : "不能为空"
	}, {
		"name" : "inMultiplesOf",
		"notEmpty" : "不能为空"
	}, {
		"name" : "totalnumberofshares",
		"notEmpty" : "必填字段"
	}, {
		"name" : "totalsharestobeissued",
		"notEmpty" : "必填字段"
	}, {
		"name" : "nominalprice",
		"notEmpty" : "必填字段"
	}, {
		"name" : "minimumshares",
		"notEmpty" : "必填字段"
	}, {
		"name" : "nominalshares",
		"notEmpty" : "必填字段"
	}, {
		"name" : "maximumshares",
		"notEmpty" : "必填字段"
	} ]);
	
	
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.products.share.template"
			},
			callback : "getSelect"
		}); 	 
	 $.getWidget("save").click(function() {			
			var currency =$("#currencyCode").find("option:selected").attr("value");
			var FrequencyType=parseInt($("#frequencyType").find("option:selected").attr("value"));
			var lockinPeriodFrequencyType=parseInt($("#lockinPeriodFrequencyType").find("option:selected").attr("value"));			
			var date;
			date={				
					"accountingRule":1,
					"chargesSelected":[],
					"currencyCode":currency,
					"description":$.value('description'),
					"digitsAfterDecimal":$.value('digitsAfterDecimal'),
					"inMultiplesOf":$.value('inMultiplesOf'),
					"locale" : "zh_CN",
					"marketPricePeriods":[],
					"maximumShares":$.value('maximumshares'),
					"minimumShares":$.value('minimumshares'),
					"name":$.value('name'),
					"nominalShares":$.value('nominalshares'),
					"shortName":$.value('shortName'),
					"sharesIssued":$.value('totalsharestobeissued'),																							
					"totalShares":$.value('totalnumberofshares'),					
					"unitPrice":$.value('nominalprice'),					
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					'dataType' : "POST",
					'mydata' : date,
					'url' : 'api.v1.products.share'
				},
				callback : "callbackadd"				
			});
			})
});

function callbackadd(param) {
	$.setReadOnly("add_shareProduct");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
$("#addPrice").click(function() {	
	$.tableclone("table1")
})
$("#del").click(function() {  
            var link = $(this).parents("tr");  
            link.remove();  
        });  
function deleteTr(obj) {
	$(obj).parent().parent().remove();
} 
$.getWidget("chargeId").change(function() {	
	if(this.value)
		checkSelect(this.value);

});
function checkSelect(value){
	var selectedOption = document.getElementById("chargeId").value;
	if(selectedOption!="charge"){
		$("#ChargeTable").show();
	}else{
		$("#ChargeTable").hide();
	}
	}
</script>