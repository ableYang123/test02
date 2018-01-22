<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div>
			<h5 id="titlePoint"></h5>
			<table id="cashierlist" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='179' style='display: none;'>id</th>
						<th name='period' width='215' >
							<spring:message code="label.teller.period"/>
						</th>
						<th name="cashierOrStaff" width='215'>
							<spring:message code="label.teller.cashierOrStaff"/>
						</th>
						<th name="fullDayOrTime" width='215'>
							<spring:message code="label.teller.fullDayOrTime"/>
						</th>
					</tr>
				</thead>
				
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var gridCashier;
		var cashierId;
		var tellerId = '${pd.tellerId}';
		var isInit = '';
		
		$(document).ready(function() {
			gridCashier = $('#cashierlist').flexigrid({
				title : '<spring:message code="label.cashier.title"  />',
				pcpager : true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnEdit,bclass:'edit', onpress:EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnTransaction,bclass:'transaction', onpress:TRANSACTION},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAllocate,bclass:'allocate', onpress:ALLOCATE},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnSettle,bclass:'settle', onpress:SETTLE},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
			});
			
			/* 初始化 */
			initCashier();
			
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				if(isInit == 'cashier'){
					initCashier();
				}
				isInit = '';
			});
		});
		
		function initCashier(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.tellers." + tellerId + ".cashiers"
				},
				callback : "cashierlist"
			}); 
		}
		
		function ADD(){
			isInit = 'cashier';
			//window.location.href="loadPage.do?nextPage=orgnization.cashier.add_cashier&tellerId="+tellerId;
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.add_cashier&tellerId="+tellerId);
		}
		function TRANSACTION(){
			isInit = 'cashier';
			cashierId = gridCashier.colVal('id');
			window.location.href = "loadPage.do?nextPage=orgnization.cashier.cashier_transactions&tellerId="+tellerId+"&cashierId="+cashierId;
			//$.openWindow();
		}
		function ALLOCATE(){
			cashierId = gridCashier.colVal('id');
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.cashier_allocateSettle&tellerId="+tellerId+"&cashierId="+cashierId+"&pageType=allocate");
		}
		
		function SETTLE(){
			cashierId = gridCashier.colVal('id');
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.cashier_allocateSettle&tellerId="+tellerId+"&cashierId="+cashierId+"&pageType=settle");
		}
		function EDIT(){
			isInit = 'cashier';
			cashierId = gridCashier.colVal('id');
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.edit_cashier&tellerId="+tellerId+"&cashierId="+cashierId);
		}
		function DELETE(){
			var id = gridCashier.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.tellers." + tellerId + ".cashiers." + id
				},
				callback : function(param){
					$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
					initCashier();
				}
			}); 
		}
		
		/* 成功获取数据后 的回调方法*/
		function cashierlist(param) {
			//设置标题
			$('#titlePoint').text('<spring:message code="label.center.officeName"/>:' + param.officeName + ' | <spring:message code="label.cashier.name"/>:' + param.tellerName);
			var cashierOption = [];
			if(param.cashiers.length > 0){
				$.each(param.cashiers,function(index,item){
					var cashierJson = {
							"id" : item.id,
							"cashierOrStaff" : item.staffName,
					};
					if(item.isFullDay){
						cashierJson['fullDayOrTime'] = 'Yes';
					}else{
						var fullDayOrTime = item.startTime + '&nbsp;&nbsp;-&nbsp;&nbsp;' + item.endTime;
						cashierJson['fullDayOrTime'] = fullDayOrTime;
					}
					var period = '';
					if($.formatDate(item.startDate) == $.formatDate(item.endDate)){
						period = $.formatDate(item.startDate);
					}else{
						period = $.formatDate(item.startDate) + '&nbsp;&nbsp;-&nbsp;&nbsp;' + $.formatDate(item.endDate);
					}
					
					if(period.indexOf('NaN') <= -1){
						cashierJson['period'] = period;
					}
					cashierOption.push(cashierJson);
				});
			}
			gridCashier.addRows(cashierOption);
		}
		
	</script>

</body>
</html>
