<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="title.manage.tax.group" /></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<table id="taxGroupTable" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' width='210' search="true"><spring:message code="lable.name" /></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var grid1;
		var taxGroupId;

		$(document).ready(function() {
				grid1 = $('#taxGroupTable').flexigrid(
								{
									title : '<spring:message code="title.list.tax.group"/>',
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
												name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnQuery,
												bclass : 'query',
												onpress : DETAIL
											} ]
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
					"url" : "api.v1.taxes.group"
				},
				callback : "callback"
			});
		}

		function ADD() {
			$.openWindow("loadPage.do?nextPage=product.taxes.group.add_taxGroup");
		}

		function EDIT() {
			taxGroupId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.taxes.group.edit_taxGroup");
		}

 		function DETAIL() {
 			taxGroupId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.taxes.group.taxGroupDetail");
		} 
		
		function callback(param) {
			grid1.addRows(param);
		}
	</script>

</body>
</html>
