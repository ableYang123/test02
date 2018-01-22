<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>

		<form class="form-horizontal" id="allocationCash" name="allocationCash" method="post">
			<fieldset>
					<h4 label="allocate"><spring:message code="label.cashier.allocate"/></h4>
					<h4 label="settle"><spring:message code="label.cashier.settle"/></h4>
					
					<table class="table">
						<tbody>
							<tr>
								<td><spring:message code="label.center.officeName"/></td>
								<td id="office"></td>
								<td><spring:message code="label.teller.tellerName"/></td>
								<td id="tellerName"></td>
							</tr>
							<tr>
								<td><spring:message code="label.cashier.name"/></td>
								<td id="cashier"></td>
								<td><spring:message code="label.teller.period"/></td>
								<td id="period"></td>
							</tr>
							<tr>
								<td><spring:message code="label.cashier.txnDate"/><span style="color: #d9534f;">*</span></td>
								<td>
									<div class="col-sm-8">
										<input datetype="date" type="text" id="txnDate" name="txnDate" class="form-control" local-date="true"/>
									</div>
								</td>
								<td><spring:message code="label.cashier.currency"/><span style="color: #d9534f;">*</span></td>
								<td>
									<div class="col-sm-2">
										<select id="currency" class="form-control" style="width: 198"></select>
									</div>
								</td>
							</tr>
								<tr>
								<td><spring:message code="label.cashier.amount"/><span style="color: #d9534f;">*</span></td>
								<td>
									<div class="col-sm-8">
										<input type="text" id="txnAmount" name="txnAmount" class="form-control" style="width: 198"/>
									</div>
								</td>
								<td><spring:message code="label.cashier.note"/><span style="color: #d9534f;">*</span></td>
								<td>
									<div class="col-sm-8">
										<input id="txnNote" type="text" class="form-control" value='' style="width: 198"/>
									</div>
								</td>
							</tr>
							<tr>
								
								<td colspan="4">
									<div class="col-sm-offset-3">
										<button type='button' id="allocate" name="allocate" class="btn btn-success"><spring:message code="btn.submit" /></button>
										<button type='button' id="settle" name="settle" class="btn btn-warning"><spring:message code="btn.submit" /></button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</fieldset>
		</form>
	<script type="text/javascript">
		var gridTransactions;
		
		$(document).ready(function() {
			$.valid("allocationCash",[{
				"name" : "txnAmount",
				"notEmpty" : ""
			}]);
			if('${pd.pageType}' === 'allocate'){
				//h4标题
				$('h4[label="allocate"]').show();
				$('h4[label="settle"]').hide();
				//提交按钮
				$.show('allocate');
				$.hide('settle');
			}else{
				$('h4[label="allocate"]').hide();
				$('h4[label="settle"]').show();
				$.hide('allocate');
				$.show('settle');
			}
			//货币
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.tellers.${pd.tellerId}.cashiers.${pd.cashierId}.transactions.template"
				},
				callback : "getTemplate"
			}); 
			
			$.getWidget('allocate').click(function(){
				if($.validateForm("allocationCash")){
					baseNest('allocate');
				}
			
			});
			
			
			$.getWidget('settle').click(function(){
				if($.validateForm("allocationCash")){
					baseNest('settle');
				}
			});
			
		});
		
		function getTemplate(param){
			$('#office').text(param.officeName);
			$('#cashier').text(param.cashierName);
			$('#tellerName').text(param.tellerName);
			$('#period').text($.formatDate(param.startDate) + " - " + $.formatDate(param.endDate));
			$.setSelect('currency',param.currencyOptions,'code','name');
		}
		
		//post请求
		function baseNest(command){
			var request_json = {
					"dateFormat" : $.getDateFormat(),
					"locale" : $.getLocale(),
					"currencyCode" : $.value('currency'),
					"txnAmount" : $.value('txnAmount'),
					"txnDate" : $.value('txnDate'),
					"txnNote" : $.value('txnNote')
			};
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : request_json,
					"url" : "api.v1.tellers.${pd.tellerId}.cashiers.${pd.cashierId}.${pd.pageType}?command="+command
				},
				callback : function(param){
					$.setReadOnly('allocationCash');
					$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
					window.location.href = "loadPage.do?nextPage=orgnization.cashier.cashier_transactions&tellerId=${pd.tellerId}&cashierId=${pd.cashierId}";
				}
			});
		}
		
	</script>

</body>
</html>
