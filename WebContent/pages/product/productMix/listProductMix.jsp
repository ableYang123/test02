<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="product.mix.list" /></a></li>
				</ul>
		</div>
		<div class="div-cc" >
			
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=product.cost.addCost'/>" >
				<span id='test'></span>
			</a>
			
			<table id="ProductMixlist" style="display:none;">
				<thead>
					<tr>
					<th name='productId' style='display: none;'>id</th>
						<th name='productName' width='1400' ><spring:message code="product.name"/></th>
					</tr>
				</thead> 	
			</table>
		</div>	  
	</div>
	<script type="text/javascript">
	var grid1;
	var pId;
	var ProductName;
	$(document).ready(function() {
	grid1 = $('#ProductMixlist').flexigrid({
		title : '<spring:message code="product.mix.list" />',
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
				"url" : "api.v1.loanproducts"+"?associations=productMixes"
			},
			callback : "callback"
		}); 
	}
	function ADD(){
		
		
		$.openWindow("loadPage.do?nextPage=product.productMix.addProductMix");
	}
	
	function EDIT(){
		
		pId = grid1.colVal('productId');
		ProductName=grid1.colVal('chargeAppliesTo.value');
		$.openWindow("loadPage.do?nextPage=product.productMix.editProductMix");
	}
	function DELETE() {
		pId = grid1.colVal('productId');
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'DELETE',
				'mydata' : '',
				'url' : 'api.v1.loanproducts.' + pId+".productmix"
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