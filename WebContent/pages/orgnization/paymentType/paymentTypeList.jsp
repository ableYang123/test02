<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="title.list.paymentType"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<table id="paymentTypeList" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' width='210' search="true"><spring:message code="lable.name"/></th>
						<th name='description' width='210'><spring:message code="lable.description"/></th>
						<th name='isCashPayment' width='210'><spring:message code="lable.isCashPayment"/></th>
						<th name='position' width='210'><spring:message code="lable.position"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var grid1;
		var paymentTypeId;

		$(document)
				.ready(
						function() {

							grid1 = $('#paymentTypeList')
									.flexigrid(
											{
												title : '<spring:message code="title.list.paymentType"/>',
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
														{
															name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
															bclass : 'delete',
															onpress : DELETE
														} ]
											});

							/* 初始化 */
							init();

							$('#myModal').on('hidden.bs.modal',
									function(event) {
										/* 实现局部刷新 */
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
					"url" : "api.v1.paymenttypes"
				},
				callback : "callback"
			});
		}

		function ADD() {

			/* 加载创建办公室模态框 */
			$
					.openWindow("loadPage.do?nextPage=orgnization.paymentType.add_paymentType");
		}

		function EDIT() {

			paymentTypeId = grid1.colVal('id');
			/* 加载创建办公室模态框 */
			$
					.openWindow("loadPage.do?nextPage=orgnization.paymentType.edit_paymentType");
		}

		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			/* 填充表格数据 */
			grid1.addRows(param);
		}
		function DELETE() {
			var paymentTypeId = grid1.colVal('id');

			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'DELETE',
					'mydata' : '',
					"url" : "api.v1.paymenttypes." + paymentTypeId
				},
				callback : 'deleteback'
			});
		}
		function deleteback(param) {
			init();
		}
	</script>

</body>
</html>
