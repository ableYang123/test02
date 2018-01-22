<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>

<body style="background-color: #fff">
	<div>
		
		<div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr  class="col-xs-14">
						<td class="col-md-1"><input type="button" onclick="beforeback()" class="btn btn-primary" value="&lt;&lt;&lt;" /></td>
						<td class="col-md-5 " id="titleName"></td>
						<td class="col-md-2">
							<select id="currencyCode" name="currency" class="form-control">
								<option value="?"><spring:message code="label.cashier.selectCurrency"/></option>
							</select>
						</td>
						<%-- <td>
							<a type="button" onclick="showToTxn()" class="btn btn-primary"><spring:message code="label.cashier.showToTxn"/></a>
						</td> --%>
						<td>
							<span id="net" class="h4"></span>
						</td>
						<td>
							<button id="allocation" type="button" class="btn btn-success pull-right"><spring:message code="label.cashier.allocate"/></button>
							<button id="settle" type="button" class="btn btn-warning pull-right"><spring:message code="label.cashier.settle"/></button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="clear"></div>
			<table id="transactionslist" style="display: none;">
				<thead>
					<tr class="graybg">
						<th name='id' width="100" style='display: none;'>id</th>
						<th name='txnDate' type="date" width="166">
							<spring:message code="label.cashier.txnDate"/>
						</th>
						<th name="txnType.value" width="166" >
							<spring:message code="label.cashier.txnType"/>
						</th>
						<th name="allocateAmount" width="166" >
							
						</th>
						<th name="cashIn" width="166">
							
						</th>
						<th name="cashOut" width="166">
							
						</th>
						<th name="settleAmount" width="166">
							
						</th>
					</tr>
				</thead>
				
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var gridTransactions;
		var nestjson;
		var cashierId;
		
		$(document).ready(function() {
			//货币
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.currencies?fields=selectedCurrencyOptions"
				},
				callback : "currencylist"
			}); 
			//现金分配
			$.getWidget('allocation').click(function(){
				$.openWindow("loadPage.do?nextPage=orgnization.cashier.cashier_allocateSettle&tellerId=${pd.tellerId}&cashierId=${pd.cashierId}&pageType=allocate");
			});
			//现金结算
			$.getWidget('settle').click(function(){
				$.openWindow("loadPage.do?nextPage=orgnization.cashier.cashier_allocateSettle&tellerId=${pd.tellerId}&cashierId=${pd.cashierId}&pageType=settle");
			});
			
			$.getWidget('currencyCode').change(function(){
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.tellers.${pd.tellerId}.cashiers.${pd.cashierId}.summaryandtransactions?currencyCode=" + $.value('currencyCode')
					},
					callback : "translist"
				});
			});
		});
		
		//初始化
		function initTrans(){
			$.nest(nestjson); 
		}
		
		function currencylist(param){
			$.setSelect('currencyCode',param.selectedCurrencyOptions,'code','name');
			
			$.assign({
				"currencyCode" : param.selectedCurrencyOptions[0].code
			});
			
			nestjson = {
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.tellers.${pd.tellerId}.cashiers.${pd.cashierId}.summaryandtransactions?currencyCode=" + param.selectedCurrencyOptions[0].code
					},
					callback : "translist"
			};
			//初始化表格
			gridTransactions = $('#transactionslist').flexigrid({
				title : '<spring:message code="label.cashier.txnList"/>',
				nestjson : nestjson,
				resizable: false
			});
			
			/* 初始化 */
			initTrans();
		}
		
		function translist(param){
			//设置标题
			$('#titleName').text('<spring:message code="label.center.officeName"/>：'+ param.officeName + " | " + "<spring:message code='label.teller.tellerName'/>：" + param.tellerName + " | " + "<spring:message code='label.cashier.name'/>：" + param.cashierName);
			//设置net
			$('#net').text('<spring:message code="label.cashier.net"/>:' + param.netCash);
			//设置表格头
			$('th[name="allocateAmount"]').find('div:first').text('<spring:message code="label.cashier.allocateAmount"/>：' + param.sumCashAllocation);
			$('th[name="cashIn"]').find('div:first').text('<spring:message code="label.cashier.inwardCash"/>：' + param.sumInwardCash);
			$('th[name="cashOut"]').find('div:first').text('<spring:message code="label.cashier.outwardCash"/>：' + param.sumOutwardCash);
			$('th[name="settleAmount"]').find('div:first').text('<spring:message code="label.cashier.settleAmount"/>：' + param.sumCashSettlement);
			
			var transactionOptions = param.cashierTransactions.pageItems;
			$.each(transactionOptions,function(index,item){
				if(item.txnType.value.indexOf('Allocate') > -1){
					var json = {
							"allocateAmount" : item.txnAmount 
						};
					$.extend(true,transactionOptions[index],json);
				}else if(item.txnType.value.indexOf('Settle') > -1){
					var json = {
							"settleAmount" : item.txnAmount
					};
					$.extend(true,transactionOptions[index],json);
				} if(item.txnType.value.indexOf('Cash In') > -1){
					var json = {
							"cashIn" : item.txnAmount
					};
					$.extend(true,transactionOptions[index],json);
				} if(item.txnType.value.indexOf('Cash Out') > -1){
					var json = {
							"cashOut" : item.txnAmount
					};
					$.extend(true,transactionOptions[index],json);
				}
			});
			//添加表格数据
			gridTransactions.addRows(transactionOptions);
		}
		
		function beforeback(){
			window.location.href = "loadPage.do?nextPage=orgnization.cashier.cashierlist&tellerId=${pd.tellerId}";
		}
	</script>

</body>
</html>
