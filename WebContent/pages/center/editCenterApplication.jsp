<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<style type="text/css">
	.width14{
		width: 14%;
	}
	.width36{
		width: 36%;
	}
</style>
<form class="form-inline" id="editApplicationForm" naem="editApplicationForm" method="post">
	<fieldset>
	<legend><spring:message code="label.center.editSavingApplication"/></legend>
	<div>
		<table>
			<tr>
				<th class="width14"><spring:message code="label.center.products"/><label style="font-size: 14px; color: #d9534f">*</label></th>
				<th class="width36">
					<div class="form-group">
						<select id="productlist" name="productlist" class="form-control" style="width:170">
							<option value="?"><spring:message code="label.center.chose"/></option>
						</select>
					</div>
				</th>
				<th class="width14"><spring:message code="label.center.submit"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th class="width36">
					<div class="form-group">
						<input type="text" datetype="date" name="submitDate" id="submitDate" local-date="true" afterToday="" beforeToday="">
					</div>
				</th>	
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="width14"><spring:message code="label.center.fieldofficer"/></th>
				<th class="width36"><select id="stafflist" class="form-control" style="width:170">
						<option selected="selected"><spring:message code="label.center.chose"/></option>
				</select></th>
				<th class="width14"><spring:message code="label.center.externalId"/></th>
				<th class="width36"><input type="text" class="form-control" id="externalId" style="width:170" value=''/></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th><spring:message code="label.center.terms"/></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="width14"><spring:message code="label.center.currency"/></th>
				<th class="width36"><input class="form-control" id="currency" type="text" readonly="readonly"></th>
				<th class="width14"><spring:message code="label.center.decimalPlaces"/></th>
				<th class="width36"><input class="form-control" id="decimal" type="text" readonly="readonly"></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="width14"><spring:message code="label.center.nominalannualinterest"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th class="width36">
					<div class="form-group">
						<input type="text" name="nominalAnnualInterestRate" class="form-control" id="nominalAnnualInterestRate">
					</div>
				</th>
				<th class="width14"><spring:message code="label.center.interestcompoundingperiod"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th class="width36">
					<div class="form-group">
						<select name="interestCompoundingPeriodType" id="interestCompoundingPeriodType" class="form-control" style="margin-left: 3;">
						</select>
					</div>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="width14"><spring:message code="label.center.currencyinmultiplesof"/></th>
				<th class="width36">
					<input class="form-control" id="inMultiplesOf" type="text" readonly="readonly">
				</th>
				<th class="width14"><spring:message code="label.center.interestpostingperiod"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th class="width36">
					<div class="form-group">
						<select id="interestPostingPeriodType" name="interestPostingPeriodType" class="form-control">
						</select>
					</div>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="width14"><spring:message code="label.center.interestcalculatedusing"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th class="width36">
					<div class="form-group">
						<select name="interestCalculationType" id="interestCalculationType" class="form-control">
						</select>
					</div>
				</th>
				<th class="width14"><spring:message code="label.center.daysinyear"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th class="width36">
					<div class="form-group">
						<select name="interestCalculationDaysInYearType" id="interestCalculationDaysInYearType" class="form-control">
						</select>
					</div>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="width14"><spring:message code="label.center.minimumopeningbalance"/></th>
				<th class="width36"><input type="text" class="form-control" id="minRequiredOpeningBalance" name="minRequiredOpeningBalance" value=''/></th>
				<th class="width14"><spring:message code="label.center.lockinperiod"/></th>
				<th class="width36">
					<input id="lockinPeriodFrequency" class="form-control" type="text" value=''/>
					<select id="lockinPeriodFrequencyType" class="form-control">
						<option><spring:message code="label.center.chose"/></option>
					</select>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th colspan="2">
					<input  type="checkbox" id="withdrawalFeeForTransfers" value=''>
					<spring:message code="label.center.applywithdrawalfeefortransfers"/>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th colspan="2">
					<input  type="checkbox" id="allowOverdraft">
					<spring:message code="label.center.isOverdraftAllowed"/>
				</th>
				<th class="width14" style="display:none;">
                       <label class="control-label"><spring:message code="label.center.overdraftMaxAmount"/></label>
                 </th>
                 <th class="width36" style="display:none;">
					<input class="form-control" type="text" id="overdraftLimit" name="overdraftLimit" value=''>
				</th>     
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr style="display:none;">
                    <th class="width14">
                        <label class="control-label ng-binding"><spring:message code="label.center.overdraftNominal"/></label>
                    </th>
                    <th class="width36">
                        <input id="nominalAnnualInterestRateOverdraft" type="text" class="form-control">
                    </th>
                    <th class="width14">
                        <label class="control-label ng-binding"><spring:message code="label.center.overdraftMinCalculation"/></label>
                    </th>
                    <th class="width36">
                        <input id="minOverdraftForInterestCalculation" type="text" class="form-control" value=''>
                    </th>
            </tr>
            <tr>
				<th><br /></th>
			</tr>
			<tr>
				<th colspan="2">
					<input type="checkbox" id="enforceMinRequiredBalance">
					<spring:message code="label.center.enforceminimumbalance"/>
				</th>
				<th class="width14"><spring:message code="label.center.minimumbalance"/></th>
				<th class="width36">
					<input class="form-control" type="text" id="minRequiredBalance" name="minRequiredBalance">
				</th>
			</tr>
			<tr style="display:none;">
				<th>
					 <spring:message code='label.center.minBalanceForInterestCalculation'/>
				</th>
				<th id="minBalanceForInterestCalculation">
				</th>
			</tr>
			  <tr>
				<th><br /></th>
			</tr>
			<tr style="display:none;">
				<th colspan="2">
					<input type="checkbox" id="withHoldTax" />
					<span class="control-label">Is Withhold tax applicable </span>
				</th>
				<th class="width14"> tax group</th>
				<th class="width36" id="taxGroup"></th>
			</tr>
		</table>
		<hr>
		<label class="control-label"><spring:message code="label.center.charges"/>&nbsp;&nbsp;</label>
		<select class="form-control" id="chargeId" class="form-control">
			<option><spring:message code="label.center.chose"/></option>
		</select>
		<input class="form-control" type="button" class="btn btn-info" id="addCharge" value="+"/>
		<small style="color: #d9534f;display:none;">&nbsp;<spring:message code="label.center.selectCharge"/></small>
		<table id="charges" class="table" style="border-top: 1px solid #ddd; display: none;">
			<thead class="graybg">
				<th><spring:message code="label.center.name"/></th>
				<th><spring:message code="client.savingaccount.chargeCalculation"/></th>
				<th><spring:message code="label.center.amount"/></th>
				<th><spring:message code="client.savingaccount.chargeTimeType"/></th>
				<th><spring:message code="label.center.date"/></th>
				<th><spring:message code="label.center.repaymentEvery"/></th>
				<th><spring:message code="label.center.action"/></th>
			</thead>
			<tbody label="chargeOp">
			</tbody>
		</table>
	</div>
	<div class="text-right" style="padding-right: 80px">
		<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
	</div>
	</fieldset>
</form>

	<script type="text/javascript">
		var groupId = ${pd.groupId};
		var chargeCurrencyTypeOptions = [];
		var currencyName;
		$(document).ready(function() {
				$.valid("editCenterForm", [ 
					{
						"name" : "productlist",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "date",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "nominalAnnualInterestRate",
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
						"url" : "api.v1.savingsaccounts."+'${pd.savingsId}'+"?associations=charges&staffInSelectedOfficeOnly=true&template=true"
					},
					callback : "initback"
			});
				
				/* 产品change事件 */
				$.getWidget('productlist').change(function(){
					var productId = parseInt($.value('productlist'));
					if(!isNaN(productId)){
						//获取数据
						load(groupId,productId);
						//清除表格数据并隐藏
						/* $('tbody[label="chargeOp"] tr').remove();
						$.hide('charges'); */
					}
				});
				
				/* 是否允许透支 */
				$('#allowOverdraft').click(function(e){
					var trNode_1 = $(this).closest('tr');
					var trNode_2 = trNode_1.next().next();
					var trNode_3 = trNode_2.next().next();
					if($(this).is(':checked')){
						trNode_1.find('th:eq(1)').show();
						trNode_1.find('th:eq(2)').show();
						trNode_2.show();
						trNode_3.hide();
					}else{
						trNode_1.find('th:eq(1)').hide();
						trNode_1.find('th:eq(2)').hide();
						trNode_2.hide();
						trNode_3.show();
					}
				});
				
				
				//点击添加收费按钮
				$.getWidget('addCharge').click(function(){
					$(this).next().hide();
					var chargeId = parseInt($.value('chargeId'));
					$('#chargeId').find('option:first').attr('selected',true);
					if(!isNaN(chargeId)){
						$.show('charges');
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.charges."+chargeId+"?template=true"
							},
							callback : function(param){
								var str = '<tr label="'+ param.id +'">';
								str += '<td>'+param.name+'</td>';
								str += '<td code='+param.chargeCalculationType.id+'>'+param.chargeCalculationType.value+'</td>';
								str += '<td><input name="amount" type="text" size="15" value="'+param.amount+'"/></td>';
								str += '<td code='+param.chargeTimeType.id+'>'+param.chargeTimeType.value+'</td>';
								if('Specified due date' === param.chargeTimeType.value){
									str += '<td><input type="text" datetype="date" name="specifiedDate" id="specifiedDate" local-date="" afterToday="" beforeToday="" /></td>';
								}else{
									str += '<td />';
								}
								str += '<td />';
								str += '<td><a type="button" style="cursor: pointer;"><i class="glyphicon glyphicon-remove" style="color: #4f99ed;"></i></a></td>';
								str += '</tr>';
								
								$('tbody[label="chargeOp"]').append(str);
								
								$.datetimepicker();
							}
						});
					}else{
						$(this).next().show();
					}
				});
				//删除表格数据
				$('tbody[label="chargeOp"]').on('click','a[type="button"]',function(e){
					$(this).closest('tr').remove();
					var trNode = $('tbody[label="chargeOp"]').children();
					if(trNode.length <= 0){
						$.hide('charges');
					}
				});
				
				
				$.getWidget("save").click(function() {
					if ($.validateForm("editApplicationForm")) {
					var allowOverdraft = $('#allowOverdraft').is('checked');
					var charges = [];
					$('tbody[label="chargeOp"] tr').each(function(index,item){
						var chargeJson = {};
						var chargeId = $(this).attr('label');
						var amount = parseInt($(this).find('input[name="amount"]').val());
						chargeJson['chargeId'] = chargeId;
						chargeJson['amount'] = amount;
						
						var tdVal = $(this).find('td:eq(4)').children();
						if(tdVal.length != 0){  //具有指定日期的费用
							var dueDate = $('input[name="specifiedDate"]').val();
							chargeJson['dueDate'] = dueDate;
						}
						charges.push(chargeJson);
					});
					if(chargeCurrencyTypeOptions.length > 0){
						var currencyType = chargeCurrencyTypeOptions[0].currency.name;
						if(currencyType != currencyName){
							$.bAlert('please check currency of new charges, not the same as the before');
							return false;
						}
					};
					
					var dateFormat = $('input[name="submitDate"]').attr('date-format');
					var enforceMinRequiredBalance = $('#enforceMinRequiredBalance').is(':checked');
					var groupId = ${pd.groupId};
					var interestCalculationDaysInYearType = parseInt($.value('interestCalculationDaysInYearType'));//360 365
					var interestCalculationType = parseInt($.value('interestCalculationType'));
					var interestCompoundingPeriodType = parseInt($.value('interestCompoundingPeriodType'));
					var interestPostingPeriodType = parseInt($.value('interestPostingPeriodType'));
					var locale = 'zh_CN';
					var monthDayFormat = 'dd-MMM';
					var nominalAnnualInterestRate = parseFloat($.value('nominalAnnualInterestRate'));
					var productId = parseInt($.value("productlist"));
					var submittedOnDate = $.value('submitDate');
					var withHoldTax = false;
					var withdrawalFeeForTransfers = $('#withdrawalFeeForTransfers').is('checked');
					
					var json = {
							"allowOverdraft" : allowOverdraft,
							"charges" : charges,
							"dateFormat" : dateFormat,
							"enforceMinRequiredBalance" : enforceMinRequiredBalance,
							"groupId" : groupId,
							"interestCalculationDaysInYearType" : interestCalculationDaysInYearType,
							"interestCalculationType" : interestCalculationType,
							"interestCompoundingPeriodType" : interestCompoundingPeriodType,
							"interestPostingPeriodType" : interestPostingPeriodType,
							"locale" : locale,
							"monthDayFormat" : monthDayFormat,
							"nominalAnnualInterestRate" : nominalAnnualInterestRate,
							"productId" : productId,
							"submittedOnDate" : submittedOnDate,
							"withHoldTax" : '${pd.withHoldTax}' === 'true',
							"withdrawalFeeForTransfers" : withdrawalFeeForTransfers
					};
					
					
					////////////////////////////////////////
					
					var externalId = $.value("externalId");
					if(!$.isEmpty(externalId)){
						json['externalId'] = externalId;
					}
					var fieldOfficerId = parseInt($.value('stafflist'));
					if(!$.isEmpty(fieldOfficerId) && !isNaN(fieldOfficerId)){
						json['fieldOfficerId'] = fieldOfficerId;
					}
					var minRequiredBalance = parseFloat($.value("minRequiredBalance"));
					if(!$.isEmpty(minRequiredBalance) && !isNaN(minRequiredBalance)){
						json['minRequiredBalance'] = minRequiredBalance;
					}
					var minRequiredOpeningBalance = parseFloat($.value('minRequiredOpeningBalance'));
					if(!$.isEmpty(minRequiredOpeningBalance) && !isNaN(minRequiredOpeningBalance)){
						json['minRequiredOpeningBalance'] = minRequiredOpeningBalance;
					}
					var lockinPeriodFrequency = parseInt($.value('lockinPeriodFrequency'));
					var lockinPeriodFrequencyType = parseInt($.value('lockinPeriodFrequencyType'));
					if(!$.isEmpty(lockinPeriodFrequency) && !isNaN(lockinPeriodFrequency)){
						if(isNaN(lockinPeriodFrequencyType)){
							console.log(lockinPeriodFrequencyType);
							$.bAlert('please select lockinPeriodFrequencyType');
							return false;
						}else{
							json['lockinPeriodFrequency'] = lockinPeriodFrequency;
							json['lockinPeriodFrequencyType'] = lockinPeriodFrequencyType;
						}
					}
					
					var nominalAnnualInterestRateOverdraft = parseFloat($.value('nominalAnnualInterestRateOverdraft'));
					if(!$.isEmpty(nominalAnnualInterestRateOverdraft) && !isNaN(nominalAnnualInterestRateOverdraft)){
						json['nominalAnnualInterestRateOverdraft'] = nominalAnnualInterestRateOverdraft;
					}
					var overdraftLimit = $.value('overdraftLimit');
					if(!$.isEmpty(overdraftLimit)){
						json['overdraftLimit'] = overdraftLimit;
					}
					
					var minOverdraftForInterestCalculation = $.value('minOverdraftForInterestCalculation');
					if(!$.isEmpty(minOverdraftForInterestCalculation)){
						json['minOverdraftForInterestCalculation'] = minOverdraftForInterestCalculation;
					}
					
					$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : json,
								"url" : "api.v1.savingsaccounts.${pd.savingsId}"
							},
							callback : "putback"
						});
					}
			});
		});
		
		function load(groupId,productId){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts.template?groupId="+groupId+"&productId="+productId
				},
				callback : "initback"
			});
		}
		
		function putback(param) {
			$.setReadOnly("editApplicationForm");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			//window.location.href="loadPage.do?nextPage=client.savingsaccounts&savingsId="+param.savingsId+"&pageType=center";
			//window.location.href="loadPage.do?nextPage=client.savingsaccounts&savingsId="+param.savingsId;
		}
		
 		function initback(param){
 			$('#productlist').empty();
 			currencyName = param.currency.name;
 			
 			$.setSelect('productlist', param.productOptions, 'id', 'name');
			$.setSelect('stafflist',param.fieldOfficerOptions,'id','displayName');
			//负利率
			$.setSelect('interestCompoundingPeriodType',param.interestCompoundingPeriodTypeOptions,'id','value','true');
			//利息过账期间
			$.setSelect('interestPostingPeriodType',param.interestPostingPeriodTypeOptions,'id','value','true');
			//利息计算
			$.setSelect('interestCalculationType',param.interestCalculationTypeOptions,'id','value','true');
			//天每年
			$.setSelect('interestCalculationDaysInYearType',param.interestCalculationDaysInYearTypeOptions,'id','value','true');
			//锁定期
			$.setSelect('lockinPeriodFrequencyType',param.lockinPeriodFrequencyTypeOptions,'id','value');
	        //费用
	        var chargeoptions = [];
	        $.each(param.chargeOptions,function(index,item){
	        	if(item.currency.name == currencyName){
	        		chargeoptions.push(item);
	        	}
	        });
	        $.setSelect('chargeId',chargeoptions,'id','name');
	        
	        if(typeof(param.charges) != 'undefined' && param.charges.length > 0){
	        	chargeCurrencyTypeOptions = param.charges; 
	        	var dueDate = [];
	        	$.each(param.charges,function(index,item){
	        		var str = '<tr label="'+ item.chargeId +'">';
					str += '<td>'+item.name+'</td>';
					str += '<td code='+item.chargeCalculationType.id+'>'+item.chargeCalculationType.value+'</td>';
					str += '<td><input name="amount" type="text" size="15" value="'+item.amount+'"/></td>';
					str += '<td code='+item.chargeTimeType.id+'>'+item.chargeTimeType.value+'</td>';
					if('Specified due date' === item.chargeTimeType.value){
						str += '<td><input type="text" datetype="date" name="specifiedDate" local-date="" afterToday="" beforeToday="" value="'+ $.formatDate(item.dueDate) +'"/></td>';
						dueDate[index] = $.formatDate(item.dueDate);
					}else{
						str += '<td />';
					}
					str += '<td />';
					str += '<td><a type="button" style="cursor: pointer;"><i class="glyphicon glyphicon-remove" style="color: #4f99ed;"></i></a></td>';
					str += '</tr>';
					
					$('tbody[label="chargeOp"]').append(str);
					$.datetimepicker();
					var inputNode = $('tbody[label="chargeOp"]').find('input[name="specifiedDate"]')[index];
					if(inputNode != 'undefined'){
						$(inputNode).val(dueDate[index]);
					}
	        	});
	        	$.show('charges');
	        }
			$.assign({
                "productlist" : param.savingsProductId,
                "stafflist" : param.fieldOfficerId,
                "externalId" : param.externalId,
				"currency" : param.currency.name,
				"decimal" : param.currency.decimalPlaces,
				"nominalAnnualInterestRate" : param.nominalAnnualInterestRate,
				"interestCompoundingPeriodType" : param.interestCompoundingPeriodType.id,
				"interestPostingPeriodType" : param.interestPostingPeriodType.id,
				"inMultiplesOf" : param.currency.inMultiplesOf,
				"interestCalculationType" : param.interestCalculationType.id,
				"interestCalculationDaysInYearType" : param.interestCalculationDaysInYearType.id,
				"minRequiredOpeningBalance" : param.minRequiredOpeningBalance,
				"lockinPeriodFrequency" : param.lockinPeriodFrequency,
				"minRequiredBalance" : param.minRequiredBalance,
				"nominalAnnualInterestRateOverdraft" : param.nominalAnnualInterestRateOverdraft,
				"minOverdraftForInterestCalculation" : param.minOverdraftForInterestCalculation,
				"overdraftLimit" : param.overdraftLimit
			});
			if(typeof(param.timeline.submittedOnDate) != 'undefined'){
				$.assign({
					 "submitDate" : $.formatDate(param.timeline.submittedOnDate)
				});
			}
			if(typeof(param.lockinPeriodFrequencyType) != 'undefined'){
				$.assign({
					"lockinPeriodFrequencyType" : param.lockinPeriodFrequencyType.id,
				});
			}
			
			//
			if(param.withdrawalFeeForTransfers){
	        	$('#withdrawalFeeForTransfers').attr('checked',true);
	        }
			
			 if(param.allowOverdraft){
				 $('#allowOverdraft').attr('checked',true);
		        	var trNode_1 = $('#allowOverdraft').closest('tr');
		        	var trNode_2 = trNode_1.next().next();
					var trNode_3 = trNode_2.next().next();
					trNode_1.find('th:eq(1)').show();
					trNode_1.find('th:eq(2)').show();
					trNode_2.show();
					trNode_3.hide();
		    }
			 if(param.enforceMinRequiredBalance){
				 $('#enforceMinRequiredBalance').attr('checked',true);
			 }
		} 
		
</script>