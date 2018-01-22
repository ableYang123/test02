<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background: color:#fff">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="deposit.title.recurring.list"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<table id="recurDPList" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' search="true" width='500' search="true"><spring:message code="deposit.label.name"/></th>
						<th name='shortName' search="true" width='500' search="true"><spring:message code="deposit.label.shortName"/></th>
						
					</tr>
				</thead>

			</table>
		</div>

	</div>

	<script type="text/javascript">
		var grid1;
		var recurDPId;

		$(document).ready(function() {
			grid1 = $('#recurDPList').flexigrid(
									{
										title : '<spring:message code="deposit.title.recurring.list"/>',
										pcpager:true,
										buttons : [
												{
													name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
													bclass : 'add',
													onpress : ADD
												},
												{
													name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,
													bclass : 'edit',
													onpress : EDIT
												},
												/* {
													name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnQuery,
													bclass : 'query',
													onpress : DETAIL
												}, */{
													name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
													bclass : 'delete',
													onpress : DELETE
												}]
									});
			init();

			$('#myModal').on('hidden.bs.modal',function(event) {
				init();
			});
		});

		function init() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.recurringdepositproducts"+"?fields=name,shortName"
				},
				callback : "callback"
			});
		}

		function ADD() {
			$.openWindow("loadPage.do?nextPage=product.recurringDepositProducts.add_recurringDepositProduct");
		}

		function EDIT() {
			recurDPId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.recurringDepositProducts.edit_recurringDepositProduct");
		}

		/* function DETAIL(){
			recurDPId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.recurringDepositProducts.recurringDepositProductDetail");
		} */
		
		function DELETE(){
			recurDPId = grid1.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.recurringdepositproducts."+recurDPId
				},
				callback : "deleteback"
			});
		}
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			grid1.addRows(param);
		}
		
		function deleteback(param){
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
			init();
		}	
	</script>
</body>
</html>