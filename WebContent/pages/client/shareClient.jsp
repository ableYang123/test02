<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form class="form-inline" style="font-family: '宋体'" id="shareAccount" method="post">
	<div>
		<table>
			<tr>
				<th class="text-right table-right"><spring:message code="fund.search.product"/><label style="font-size: 14px; color: #d9534f">*</label></th>
				<th><div class="form-group">
						<select id="productlist" name="productlist" class="form-control " style="width: 140">
							<option><spring:message code="lable.please.choose"/></option>
						</select>
					</div></th>
				<th class="text-right table-right"><spring:message code="lable.submitDate"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th>
					<div class="form-group">
						<input type="text" datetype="date" name="submitDate" local-date="true" afterToday="" beforeToday="">
					</div>
				</th>	
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="lable.external"/>ID</th>
				<th><input type="text" class="form-control" id="externalId"></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th><spring:message code="lable.terms"/></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="lable.currency"/></th>
				<th><input class="form-control" id="currency" type="text" readonly="readonly"></th>
				<th class="text-right table-right"><spring:message code="lable.decimal.places"/></th>
				<th><input class="form-control" id="decimal" type="text" readonly="readonly"></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="lable.number.shares"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th>
					<div class="form-group">
						<input type="text" name="requestedShares" class="form-control" id="requestedShares">
					</div>
				</th>
				<th class="text-right table-right"><spring:message code="lable.price"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th>
					<input id="currentMarketPrice" class="form-control" name="currentMarketPrice" type="text" readonly="readonly">
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="lable.currency.in.multiples.of"/></th>
				<th>
					<input class="form-control" id="inMultiplesOf" type="text" readonly="readonly">
				</th>
				<th class="text-right table-right"><spring:message code="lable.defaulAccount"/><span style="font-size: 14px; color: #d9534f">*</span>
					<div class="form-group">
						<select id="savingsAccountId" name="savingsAccountId" class="form-control">
						</select>
					</div>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="lable.activePeriod"/></th>
				<th>
					<div class="form-group">
						<input id="minimumActivePeriod" type="text" class="form-control">
						<select name="minimumActivePeriodFrequencyType" id="minimumActivePeriodFrequencyType" class="form-control">
						</select>
					</div>
				</th>
				<th class="text-right table-right"><spring:message code="lable.Lock-in.period"/></th>
				<th>
					<input id="lockinPeriodFrequency" type="text" class="form-control">
					<select name="lockinPeriodFrequencyType" id="lockinPeriodFrequencyType" class="form-control">
					</select>
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="lable.applicationDate"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th>
					<div class="form-group">
						<input type="text" datetype="date" name="applicationdate" local-date="true">
					</div>
				</th>
				<th>
					<input id="allowDividendCalculationForInactiveClients" type="checkbox"><spring:message code="lable.inactiveClients"/> 
				</th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th><br /></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="client.charges"/></th>
				<th>
					<select id="chargeId" class="form-control" style="width: 177">
						<option><spring:message code="lable.please.choose"/></option>
					</select>
				</th>
				<th><input class="form-control" type="button" class="btn btn-info" id="" value="+"></th>
			</tr>
		</table>
	</div>
	<div class="text-right" style="padding-right: 80px">
		<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
	</div>
</form>

	<script type="text/javascript">
	var defaultShares;
	var currentMarketPrice;
		$(document).ready(function() {
				$.valid("shareAccount", [ 
					{
						"name" : "productlist",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "date",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "requestedShares",
						"notEmpty" : "不能为空"
					},
					{
						"name" : "savingsAccountId",
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
						"url" : "api.v1.accounts.share.template?clientId="+clientId
					},
					callback : "shareAccount"
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
							"url" : "api.v1.accounts.share.template?clientId="+clientId+"&productId="+productId
						},
						callback : "accountApp"
					});
				});
				$.getWidget("save").click(function() {
					var productId = parseInt($.value("productlist"));
					var lockinPeriodFrequencyType = parseInt($.value('lockinPeriodFrequencyType'));
					var minimumActivePeriodFrequencyType = parseInt($.value('minimumActivePeriodFrequencyType'));
					var savingsAccountId = parseInt($.value('savingsAccountId'));
					var chargeId = parseInt($.value("chargeId"));
					var json = {
							  "allowDividendCalculationForInactiveClients" : $('#allowDividendCalculationForInactiveClients').is(':checked'),
							  "externalId" : $.value('externalId'),
							  "lockinPeriodFrequency" : $.value('lockinPeriodFrequency'),
							  "lockinPeriodFrequencyType" : lockinPeriodFrequencyType,
							  "minimumActivePeriod" : $.value('minimumActivePeriod'),
							  "minimumActivePeriodFrequencyType" : minimumActivePeriodFrequencyType,
							 "requestedShares" : defaultShares,
							  "productId": productId,
							  "clientId" : clientId,
							  "productId" : productId,
							  "savingsAccountId" : savingsAccountId,
							  "locale": "en",
							  "dateFormat": $('input[name="applicationdate"]').attr('date-format'),
							  "applicationDate" : $.value('applicationdate'),
							  "submittedOnDate": $.value('submitDate'),
							  "unitPrice" : currentMarketPrice
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
			$.setReadOnly("shareAccount");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		function shareAccount(param){
			$.setSelect('productlist', param.productOptions, 'id', 'name');
			$.setSelect('chargeId', param.chargeOptions, 'id', 'name');
		}
		
		function accountApp(param){
			$.setSelect('minimumActivePeriodFrequencyType',param.minimumActivePeriodFrequencyTypeOptions,'id','value');
			$.setSelect('lockinPeriodFrequencyType',param.lockinPeriodFrequencyTypeOptions,'id','value');
			$.setSelect('savingsAccountId',param.clientSavingsAccounts,'id','accountNo');
			defaultShares = param.defaultShares;
			currentMarketPrice = param.currentMarketPrice;
			$.assign({
				"currency" : param.currency.displayLabel,
				"decimal" : param.currency.decimalPlaces,
				"requestedShares" : param.defaultShares,
				"currentMarketPrice" : param.currentMarketPrice,
				"inMultiplesOf" : param.currency.inMultiplesOf
				
			});
		}
</script>