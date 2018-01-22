<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="Account.for.financial.activities" /></a></li>
				</ul>
		</div>
		<div class="div-cc" >
			
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=product.cost.addCost'/>" >
				<span id='test'></span>
			</a>
			
			<table id="activitiesAccount" style="display:none;">
				<thead>
					<tr>
					<th name='id' style='display: none;'>id</th>
						<th name='financialActivityData.name' width='322' ><spring:message code="Financial.activities" /></th>
						<th name='glAccountData.name' width='322'><spring:message code="title.of.account" /></th>
					</tr>
				</thead> 	
			</table>
		</div>	  
	</div>
	<script type="text/javascript">
	var grid1;
	var accountId;
	var financial;
	$(document).ready(function() {
	grid1 = $('#activitiesAccount').flexigrid({
		title : '<spring:message code="Account.for.financial.activities" />',
		pcpager : true,
		buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
	});
			/* 初始化 */
			init();
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				init();
			});
	});
	
	function init(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.financialactivityaccounts"
			},
			callback : "callback"
		}); 
	}
	function ADD(){
		
		
		$.openWindow("loadPage.do?nextPage=accounting.activitiesAccount.addActivitiesAccount");
	}
	
	function EDIT(){
		
		accountId = grid1.colVal('id');
		financial= grid1.colVal('financialActivityData.name');
		$.openWindow("loadPage.do?nextPage=accounting.activitiesAccount.editActivitiesAccount");
	}
	function DELETE() {
		accountId = grid1.colVal('id');
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'DELETE',
				'mydata' : '',
				'url' : 'api.v1.financialactivityaccounts.' + accountId
			},
			callback : 'deleteback'
		});
	}
	function callback(param) { 
		/* 填充表格数据 */
		grid1.addRows(param);	
	}
	function deleteback(param) {
		init();
	}
	
	</script>
</body>
</html>