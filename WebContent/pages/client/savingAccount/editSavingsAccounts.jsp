<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>

<form class="form-inline" style="font-family: '宋体'" id="savingsAccounts" method="post">
	<legend><spring:message code="client.savingaccount.editSavingApplication"/></legend>
	<fieldset>
		<table style="width: 100%;font-size: small;" >
			<tr>
				<td style="width: 14%"><label><spring:message code="fund.search.product"/><span style="font-size: 14px; color: #d9534f">*</span>:&nbsp;</label></td>
				<td style="width: 36%;padding-bottom: 10px">			
					<div class="form-group" >		
						<select id="productlist" name="productlist" class="form-control" style="width: 177px" >
	 					</select>
 					</div>
 				</td>
 				<td style="width: 14%"><label><spring:message code="lable.submitDate"/><span style="font-size: 14px; color: #d9534f">*</span>:&nbsp;</label></td>
 				<td style="width: 36%;padding-bottom: 10px">
 				 	<div class="form-group">
						<input type="text" datetype="date" name="submitDate" local-date="true" afterToday="" beforeToday="" style="width: 177px">
					</div>
 				</td>
			</tr>
			
			<tr>
				<td style="width: 14%"><label><spring:message code="lable.loan.officer"/>&nbsp;</label></td>
				<td style="width: 36%;padding-bottom: 10px">				
					<select id="fieldOfficer" class="form-control" style="width: 177px"> 
						<option selected="selected"><spring:message code="lable.please.choose"/></option>
					</select>
				</td>
				<td style="width: 14%"><label><spring:message code="lable.external"/>ID&nbsp;</label></td>
				<td style="width: 36%;padding-bottom: 10px">			
					<input type="text" class="form-control" id="externalId" name="externalId" style="width: 177px">
				</td>
			</tr>
		</table>
		<hr>		
		<label >
			<strong><spring:message code="lable.terms"/></strong>
		</label>
		<div>
			<table style="width: 100%;font-size: small;">
				<tr>
					<td style="width: 14%"><label><spring:message code="lable.currency"/></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<span id="currency" class="inp"></span>
					</td>
								
					<td style="width: 14%"><label><spring:message code="lable.decimal.places"/></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<span id="decimal" class="inp"></span>
					</td>	
				</tr>
				
				<tr>
					<td style="width: 14%"><label><spring:message code="lable.nominal.annual.interest"/><span style="font-size: 14px; color: #d9534f">*</span></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<input type="text" class="form-control inp" id="nominalAnnualInterest" name="nominalAnnualInterest" style="width: 177px">
						</div>
					</td>
								
					<td style="width: 14%"><label> 	<spring:message code="lable.interest.compounding.period"/><span style="font-size: 14px; color: #d9534f">*</span></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<select name="interestCompoundingPeriodType" id="interestCompoundingPeriodType" class="form-control" style="width: 177px"></select>
						</div>
					</td>	
				</tr>
				
				<tr>
					<td style="width: 14%"><label><spring:message code="lable.currency.in.multiples.of"/></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<input class="form-control inp" id="inMultiplesOf" name="inMultiplesOf" type="text" readonly="readonly" style="width: 177px">
					</td>
								
					<td style="width: 14%"><label><spring:message code="lable.interest.posting.period"/><span style="font-size: 14px; color: #d9534f">*</span></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<select id="interestPostingPeriodType" name="interestPostingPeriodType" class="form-control" style="width:177px">
							</select>
						</div>
					</td>	
				</tr>
				
				<tr>
					<td style="width: 14%"><label><spring:message code="lable.interest.calculated.using"/><span style="font-size: 14px; color: #d9534f">*</span></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<select name="interestCalculationType" id="interestCalculationType" class="form-control" style="width: 177px"></select>
						</div>
					</td>
								
					<td style="width: 14%"><label><spring:message code="lable.days.in.year"/><span style="font-size: 14px; color: #d9534f">*</span></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<select name="daysInYearType" id="daysInYearType" class="form-control" style="width:177px">
						</select>
					</td>	
				</tr>
				
				<tr>
					<td style="width: 14%"><label><spring:message code="lable.minimum.opening.balance"/></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<input class="form-control inp" id="minimumOpeningBalance " name="minimumOpeningBalance" type="text" style="width: 177px">
						</div>
					</td>
								
					<td style="width: 14%"><label><spring:message code="lable.Lock-in.period"/></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<div class="form-group">
							<input class="form-control inp" id="lockinPeriod" name="lockinPeriod" type="text" style="width: 177px">
							<select id="lockinPeriodType" name="lockinPeriodType" class="form-control">
							</select>
						</div>
					</td>	
				</tr>
				
				<tr>
					<td style="padding-bottom: 10px;padding-top: 10px" colspan="2">
						<input type="checkbox" id="applyWithdrawalFee" >
						<span><spring:message code="lable.apply.withdrawal.fee.for.transfers"/></span>
					</td>
				</tr>
				
				<tr>
					<td style="padding-bottom: 10px;padding-top: 10px; " colspan="2">
						<input type="checkbox" id="overdraftAllowed" >
						<span><spring:message code="lable.is.overdraft.allowed"/></span>
					</td>
					<td style="width: 14%" class="overdraftallowinp">
						<label><spring:message code="client.savingaccount.overdraftAmount"/></label>					
					</td>
					<td style="width: 36%;padding-bottom: 10px" class="overdraftallowinp">
						<input class="form-control" id="overdraftAmount" name="overdraftAmount" type="text" style="width: 177px">
					</td>
				</tr>
				
				<tr class="overdraftallowinp">
					<td style="width: 14%"><label><spring:message code="client.savingaccount.nominalAnnual"/> </label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<input class="form-control" id="nominalAnnual" name="nominalAnnual" type="text" style="width: 177px">
					</td>
								
					<td style="width: 14%"><label> 	<spring:message code="client.savingaccount.minOverdraftRequired"/></label></td>
					<td style="width: 36%;padding-bottom: 10px">
						<input class="form-control" id="minOverdraftRequired" name="minOverdraftRequired" type="text" style="width: 177px">
					</td>	
				</tr>
				
				<tr class="minimumBalance">
					<td style="padding-bottom: 10px;padding-top: 10px; " colspan="2">
						<input type="checkbox" id="enforceMB">
						<span><spring:message code="lable.enforce.minimum.balance"/></span>
					</td>
					<td style="width: 14%" >
						<label><spring:message code="lable.minimum.balance"/></label>					
					</td>
					<td style="width: 36%;padding-bottom: 10px">
						<input class="form-control" id="minimumBalance" name="minimumBalance" type="text" style="width: 177px">
					</td>
				</tr>
				
				<tr class="balanceRequiredForInterestCalculation">
					<td style="width: 14%"><label><spring:message code="client.savingaccount.balanceRequiredForInterestCalculation"/></label></td>
					<td style="width: 36%;padding-bottom: 10px" id="balanceRequiredForInterestCalculation"></td>
				</tr>
				
				<tr class="holdTax">
					<td style="padding-bottom: 10px;padding-top: 10px; " colspan="2">
						<input type="checkbox" id="holdTaxApplicable">
						<span><spring:message code="client.savingaccount.isWithholdTaxApplicable"/></span>
					</td>
					<td style="width: 14%" >
						<label><spring:message code="taxGroup"/></label>					
					</td>
					<td style="width: 36%;padding-bottom: 10px" id="taxgroup">
						
					</td>
				
				</tr>
				
				
				
				
				<tr>
					<td style="width: 14%"></td>
					<td style="width: 36%;padding-bottom: 10px"></td>
					<td style="width: 14%"></td>
					<td style="width: 36%;padding-bottom: 10px"></td>	
				</tr>
			</table>
			<hr>
			<label><h4><spring:message code="client.charges"/></h4></label>
			<select id="chargesId" class="form-control">
				<option><spring:message code="lable.please.choose"/></option>
			</select>
			<a style="cursor: pointer;" id="chargesTableButton"> <span class="glyphicon glyphicon-plus" aria-hidden="true" style="color: #4f99ed"></span></a>
				<table class="table table-hover" id="chargesTable" style="width: 100%;display: none">
					<tr>
						<th><spring:message code="client.savingaccount.name"/>&nbsp;&nbsp;&nbsp;</th>
						<th><spring:message code="client.savingaccount.type"/>&nbsp;&nbsp;&nbsp;</th>
						<th><spring:message code="client.savingaccount.amount"/>&nbsp;&nbsp;&nbsp;</th>
						<th><spring:message code="client.savingaccount.collectedOn"/>&nbsp;&nbsp;&nbsp;</th>
						<th><spring:message code="client.savingaccount.date"/></th>
						<th><spring:message code="client.savingaccount.repaymentsEvery"/></th>
						<th><spring:message code="client.savingaccount.actions"/></th>
					</tr>
				</table>
		</div>
		
<!-- 		<button id="aaa">test</button> -->
		<div class="col-md-offset-4" >
			<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
		</div>
	</fieldset>
</form>

<script type="text/javascript">
	$(document).ready(function() {
			

		$.valid("savingsAccounts", [ {
			"name" : "productlist",
			"notEmpty" : "不能为空"
		}, {
			"name" : "submitDate",
			"notEmpty" : "不能为空"
		},{
			"name" : "nominalAnnualInterest",
			"notEmpty" : "不能为空"
		},{
			"name" : "interestCompoundingPeriodType",
			"notEmpty" : "不能为空"
		},{
			"name" : "interestPostingPeriodType",
			"notEmpty" : "不能为空"
		},{
			"name" : "interestCalculationType",
			"notEmpty" : "不能为空"
		},{
			"name" : "daysInYearType",
			"notEmpty" : "不能为空"
		},{
			"name" : "minimumOpeningBalance",
			"regexp" : "/^[0-9]*$/",
			"regexpMsg" : "只能是数字"
		},{
			"name" : "lockinPeriod",
			"regexp" : "/^[0-9]*$/",
			"regexpMsg" : "只能是数字"
		}]);
	
		
		$("#overdraftAllowed").click(function(){
			var $cr=$("#overdraftAllowed").is(':checked');
			if($cr==true){
				$(".overdraftallowinp").css("display","");
				$(".minimumBalance").css("display","none");
			}else{
				$(".overdraftallowinp").css("display","none");
				$(".minimumBalance").css("display","");
			}
		
		})
		
		
		
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.savingsaccounts/"+savingsId+"?associations=charges&staffInSelectedOfficeOnly=true&template=true"
				},
			callback :"callback"
		});
		
		
		
		$("#chargesTableButton").click(function(){
			if($.value("chargesId")!=undefined){
				var chargesId=parseInt($.value("chargesId"));
				$.nest({
					url:'<c:url value="/fineract.do"/>',
					type:"post",
					data:{
						"dataType":"GET",
						"mydate":"",
						"url":"api.v1.charges/"+chargesId+"?template=true"
						},
					callback :"tableCall"
				});
				
			}
			
			
			
			
			
		});
		
	});
	
	
	function callback(param){
		$(".inp").empty();
		
		if(param.minBalanceForInterestCalculation!=undefined){
			$(".balanceRequiredForInterestCalculation").css("display","");
			$("#balanceRequiredForInterestCalculation").append(param.minBalanceForInterestCalculation);
			
		}else{
			$(".balanceRequiredForInterestCalculation").css("display","none");
		}
		
		
		if(param.withHoldTax==true){
			$(".holdTax").css("display","");
			$("#taxgroup").append(param.taxGroup.name);
			$("#holdTaxApplicable").attr("checked","checked");
		}else{
			$(".holdTax").css("display","none");
		}
			
		
		
		
		
		
		if(param.productOptions!=undefined){
			$.setSelect("productlist",param.productOptions,'id','name');
		}
		if(param.fieldOfficerOptions!=undefined){
			$.setSelect("fieldOfficer",param.fieldOfficerOptions,'id','displayName');		
		}
				
		if(param.interestCompoundingPeriodTypeOptions!=undefined){
			$.setSelect("interestCompoundingPeriodType",param.interestCompoundingPeriodTypeOptions,'id','value');	
		}
				
		if(param.interestPostingPeriodTypeOptions!=undefined){
			$.setSelect("interestPostingPeriodType",param.interestPostingPeriodTypeOptions,'id','value');			
		}
		if(param.interestCalculationTypeOptions!=undefined){
			$.setSelect("interestCalculationType",param.interestCalculationTypeOptions,'id','value');			
		}
		if(param.interestCalculationDaysInYearTypeOptions!=undefined){
			$.setSelect("daysInYearType",param.interestCalculationDaysInYearTypeOptions,'id','value');			
		}
		if(param.lockinPeriodFrequencyTypeOptions!=undefined){
			$.setSelect("lockinPeriodType",param.lockinPeriodFrequencyTypeOptions,'id','value');			
		}
		
		
		
		if(param.savingsProductId!=undefined){
			$('#productlist option[value="' + param.savingsProductId + '"]').attr('selected', true);
		}
		if(param.fieldOfficerId!=undefined){
			$('#fieldOfficer option[value="' + param.fieldOfficerId	 + '"]').attr('selected', true);
		}
		if(param.interestCompoundingPeriodType!=undefined){
			$('#interestCompoundingPeriodType option[value="' + param.interestCompoundingPeriodType.id + '"]').attr('selected', true);
		}
		if(param.interestPostingPeriodType!=undefined){
			$('#interestPostingPeriodType option[value="' + param.interestPostingPeriodType.id + '"]').attr('selected', true);
		}
		if(param.interestCalculationType!=undefined){
			$('#interestCalculationType option[value="' + param.interestCalculationType.id + '"]').attr('selected', true);	
		}
		if(param.interestCalculationDaysInYearType!=undefined){
			$('#daysInYearType option[value="' + param.interestCalculationDaysInYearType.id + '"]').attr('selected', true);	
		}
		if(param.lockinPeriodFrequencyType!=undefined){
			$('#lockinPeriodType option[value="' + param.lockinPeriodFrequencyType.id + '"]').attr('selected', true);	
		}
		
		
		console.log(param.chargeOptions);
		
	     var chargeoptions = [];
	     $.each(param.chargeOptions,function(index,item){
	     	if(item.currency.name == param.currency.name){
	        	chargeoptions.push(item);
	        }
	    });
	     
	    console.log(chargeoptions); 
	        
		$.setSelect('chargesId',chargeoptions,'id','name');
		
		
		$.assign({
			"externalId":param.externalId,
			"nominalAnnualInterest":param.nominalAnnualInterestRate,
			"inMultiplesOf":param.currency.inMultiplesOf,
			"minimumOpeningBalance":param.minRequiredOpeningBalance,
			"lockinPeriod":param.lockinPeriodFrequency,
			"overdraftAmount":param.overdraftLimit,
			"nominalAnnual":param.nominalAnnualInterestRateOverdraft,
			"minOverdraftRequired":param.minOverdraftForInterestCalculation,
			"minimumBalance":param.minRequiredBalance
		});
		
		if(param.timeline.submittedOnDate != null && param.timeline.submittedOnDate.length > 0){
			var submitDate = $.formatDate(param.timeline.submittedOnDate);
			$('input[name="submitDate"]').val(submitDate);
		}
		
		$("#currency").append(param.currency.displayLabel);
		$("#decimal").append(param.currency.decimalPlaces);
		
		if(param.withdrawalFeeForTransfers==true){
			$("#applyWithdrawalFee").attr("checked","checked");
		}
		
		if(param.allowOverdraft==true){
			$("#overdraftAllowed").attr("checked","checked");
		}
		
		if(param.enforceMinRequiredBalance==true){
			$("#enforceMB").attr("checked","checked");
		}
		
		if(param.charges!=undefined){
		
			for(var i = 0;i<param.charges.length;i++){
				$("#chargesTable").css("display","");
				var tr="<tr>"+
						"<td>"+param.charges[i].name+"</td>"+
						"<td>"+param.charges[i].chargeCalculationType.value+"</td>"+
						"<td><input value="+param.charges[i].amount+" name='tableAmount'></td>"+
						"<td>"+param.charges[i].chargeTimeType.value+"</td>";
				if(param.charges[i].dueDate!=undefined){
					tr=tr+"<td><input datetype='date' name='tableDate' value='"+$.formatDate(param.charges[i].dueDate)+"'></td>"
				}else{
					tr=tr+"<td></td>";
				}
				tr=tr+"<td><input type='hidden' value="+param.charges[i].chargeId+" name='tableChargeId'></td><td><a style='cursor: pointer;' onclick='$(this).parent().parent().remove()'> <span class='glyphicon glyphicon-remove' aria-hidden='true' style='color: #4f99ed'></span></a></td>"+
			"</tr>";
				$("#chargesTable").append(tr);
				$.datetimepicker();
			}
		}
		
		
		
		
		
		
		
		
		
		var $sr=$("#overdraftAllowed").is(':checked');
		if($sr==true){
			$(".overdraftallowinp").css("display","");
			$(".minimumBalance").css("display","none");
		}else{
			$(".overdraftallowinp").css("display","none");
			$(".minimumBalance").css("disply","");
		}
		
		

		$.getWidget("productlist").change(function() {
			var productId=parseInt($.value("productlist"));
			if(productId!="undefined"){
				$.nest({
					url:'<c:url value="/fineract.do"/>',
					type:"post",
					data:{
						"dataType":"GET",
						"mydate":"",
						"url":"api.v1.savingsaccounts.template?clientId="+param.clientId+"&productId="+productId
						},
					callback :"callback"
				});
			}
		});
		
		
		
		$.getWidget("save").click(function() {
			var clientId=parseInt(param.clientId);
			var productId=parseInt($.value("productlist"));
			var fieldOfficerId=parseInt($.value("fieldOfficer"));
			var submittedOnDate=$.value("submitDate");
			var externalId=$.value("externalId");
			var nominalAnnualInterestRate=$.value("nominalAnnualInterest");
			var minRequiredOpeningBalance=$.value("minimumOpeningBalance");
			var lockinPeriodFrequency=$.value("lockinPeriod");
			var interestCompoundingPeriodType=parseInt($.value("interestCompoundingPeriodType"));
			var interestPostingPeriodType=parseInt($.value("interestPostingPeriodType"));
			var interestCalculationType=parseInt($.value("interestCalculationType"));
			var interestCalculationDaysInYearType=parseInt($.value("daysInYearType"));
			var lockinPeriodFrequencyType=parseInt($.value("lockinPeriodType"));
			var dateFormat=$('input[name="submitDate"]').attr('date-format');
			
			
			var charges=[];
			$("#chargesTable tr:gt(0)").each(function(){
				var tableJson={};
				if($(this).find("input[name=tableDate]").val()!=undefined){
					tableJson={
							"chargeId":$(this).find("input[name=tableChargeId]").val(),
							"amount":$(this).find("input[name=tableAmount]").val(),
							"dueDate":$(this).find("input[name=tableDate]").val()
						}
				}else{
					tableJson={
							"chargeId":$(this).find("input[name=tableChargeId]").val(),
							"amount":$(this).find("input[name=tableAmount]").val()
						}
				}
				charges.push(tableJson);
			});

			console.log(charges);
			
			
			var allowOverdraft;
			var enforceMinRequiredBalance;
			var withdrawalFeeForTransfers;
			var overdraftLimit=$.value("overdraftAmount");
			var	nominalAnnualInterestRateOverdraft=$.value("nominalAnnual");
			var	minOverdraftForInterestCalculation=$.value("minOverdraftRequired");
			var minRequiredBalance=$.value("minimumBalance");
			
			if($("#overdraftAllowed").is(':checked')==true){
				allowOverdraft=true;
			}else{
				allowOverdraft=false;
			}
			
			
			if($("#applyWithdrawalFee").is(':checked')==true){
				withdrawalFeeForTransfers=true;
			}else{
				withdrawalFeeForTransfers=false;
			}
			
			if($("#enforceMB").is(':checked')==true){
				enforceMinRequiredBalance=true;
			}else{
				enforceMinRequiredBalance=false;
			}
			
			
			var json={
					"charges":charges,
					"clientId":clientId,
					"productId":productId,
					"fieldOfficerId":fieldOfficerId,	
					"submittedOnDate":submittedOnDate,
					"externalId":externalId,
					"nominalAnnualInterestRate":nominalAnnualInterestRate,	
					"minRequiredOpeningBalance":minRequiredOpeningBalance,
					"lockinPeriodFrequency":lockinPeriodFrequency,
					"withdrawalFeeForTransfers":withdrawalFeeForTransfers,	
					"allowOverdraft":allowOverdraft,
					"overdraftLimit":overdraftLimit,
					"nominalAnnualInterestRateOverdraft":nominalAnnualInterestRateOverdraft,	
					"minOverdraftForInterestCalculation":minOverdraftForInterestCalculation,	
					"enforceMinRequiredBalance":enforceMinRequiredBalance,
					"minRequiredBalance":minRequiredBalance,
					"interestCompoundingPeriodType":interestCompoundingPeriodType,	
					"interestPostingPeriodType":interestPostingPeriodType,
					"interestCalculationType":interestCalculationType,
					"interestCalculationDaysInYearType":interestCalculationDaysInYearType,	
					"lockinPeriodFrequencyType":lockinPeriodFrequencyType,
					"locale":"en",
					"dateFormat":dateFormat,	
					"monthDayFormat":"dd MMM"
					
			};
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					"dataType" : "PUT",
					"mydata" : json,
					"url" : "api.v1.savingsaccounts." + savingsId,
					"contentType" : "application/json"
				},
				callback : "edit_success"
			});
			
			
		});
		
	}
	
	
	
	function edit_success(param){
		$.setReadOnly("savingsAccounts");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		var savingsId;
		if(param != null || param.length > 0 || typeof param != 'undefined'){
			savingsId = param.savingsId;
			window.location.href="loadPage.do?nextPage=client.savingsaccounts&savingsId="+savingsId;
		}
	}
	
	
	function tableCall(param){
		$("#chargesTable").css("display","");
		var tr="<tr>"+
					"<td>"+param.name+"</td>"+
					"<td>"+param.chargeCalculationType.value+"</td>"+
					"<td><input value="+param.amount+" name='tableAmount'></td>"+
					"<td>"+param.chargeTimeType.value+"</td>";
					if(param.chargeTimeType.id==2){
						tr=tr+"<td><input datetype='date' name='tableDate' local-date='true'></td>";
					}else{
						tr=tr+"<td></td>";
					}
					tr=tr+"<td><input type='hidden' value="+param.id+" name='tableChargeId'></td>"+
					"<td><a style='cursor: pointer;' onclick='$(this).parent().parent().remove()'> <span class='glyphicon glyphicon-remove' aria-hidden='true' style='color: #4f99ed'></span></a></td>"+
				"</tr>";
				$("#chargesTable").append(tr);		
	
				$.datetimepicker();
		
	}
	

	

</script>

