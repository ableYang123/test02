<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="cost.list" /></a></li>
				</ul>
		</div>
		<div class="div-cc" >
			
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=product.cost.addCost'/>" >
				<span id='test'></span>
			</a>
			
			<table id="costlist" style="display:none;">
				<thead>
					<tr>
					<th name='id' style='display: none;'>id</th>
						<th name='name' search="true" width='322' ><spring:message code="lable.name" /></th>
						<th name='chargeAppliesTo.value' width='322'><spring:message code="Charges.applies.to" /></th>
						<th name='penalty' width='322'><spring:message code="Is.penalty" /></th>
						<th name='active' width='322'><spring:message code="client.activeClient" /></th>
					</tr>
				</thead> 	
			</table>
		</div>	  
	</div>
	<script type="text/javascript">
	var grid1;
	var productId;
	var ProductName;
	$(document).ready(function() {
	grid1 = $('#costlist').flexigrid({
		title : '<spring:message code="cost.list" />',
		pcpager : true,
		buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
	});
	init();
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */				
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
			"url" : "api.v1.charges",
		},
		callback : "costlist"
	}) 
		
	}
	function ADD(){
		
		
		$.openWindow("loadPage.do?nextPage=product.cost.addCost");
	}
	
	function EDIT(){
		
		productId = grid1.colVal('id');
		ProductName=grid1.colVal('chargeAppliesTo.value');
		$.openWindow("loadPage.do?nextPage=product.cost.editCost");
	}
	function DELETE() {
		productId = grid1.colVal('id');
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'DELETE',
				'mydata' : '',
				'url' : 'api.v1.charges.' + productId
			},
			callback : 'deleteback'
		});
	}
	function costlist(param) { 
		grid1.addRows(param);	
	}
	function deleteback(param) {
		init();
	}
	
	</script>
</body>
</html>