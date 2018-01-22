<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="share.product.list" /></a></li>
				</ul>
		</div>
		<div class="div-cc" >
			<div class="row" style="margin: 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="shareProductlist" style="display:none;">
				<thead>
					<tr>
					<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' search="true" width='450' ><spring:message code="lable.name" /></th>
						<th name='shortName' search="true" width='450'><spring:message code="deposit.label.shortName" /></th>
						<th name='totalShares' width='450'><spring:message code="common.shares" /></th>
					</tr>
				</thead> 	
			</table>
		</div>	  
	</div>
	<script type="text/javascript">
	var grid1;
	var productId;
	$(document).ready(function() {
	grid1 = $('#shareProductlist').flexigrid({
		title : '<spring:message code="share.product.list" />',
		pcpager : true,
		/*buttons :  [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					]*/
			});
			/* 初始化 */
			init();
			$('#myModal').on('hidden.bs.modal', function (event) {
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
				"url" : "api.v1.products.share"
			},
			callback : "callback"
		}); 
	}
	function ADD(){
				
		$.openWindow("loadPage.do?nextPage=product.shareProduct.add_shareProduct");
	}
	
	/* function EDIT(){
		
		productId = grid1.colVal('id');
		$.openWindow("loadPage.do?nextPage=product.shareProduct.edit_shareProduct");
	} */
	
	$.getWidget("shareProductlist").click(function(){
		
		if(!$.isEmpty(grid1.colVal('id')))	{
			productId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.shareProduct.edit_shareProduct");
		}
});	
	
	function callback(param) { 
		/* 填充表格数据 */
		grid1.addRows(param.pageItems);	
	}
	</script>
</body>
</html>