<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="title.floatingRates.list" /></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<table id="floatingRatesTable" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' search="true" width='210' search="true"><spring:message code="lable.name" /></th>
						<th name='createdBy' width='210'><spring:message code="lable.create.user" /></th>
						<th name='isBaseLendingRate' width='210'><spring:message code="lable.isBaseLenging" /></th>
						<th name='isActive' width='210'><spring:message code="lable.active" /></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var grid1;
		var floatingRatesId;

		$(document).ready(function() {
				grid1 = $('#floatingRatesTable').flexigrid(
								{
									title : '<spring:message code="title.floatingRates.list"/>',
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
					"url" : "api.v1.floatingrates"
				},
				callback : "callback"
			});
		}

		function ADD() {
			$.openWindow("loadPage.do?nextPage=product.floatingRates.add_floatingRates");
		}

		function EDIT() {
			floatingRatesId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.floatingRates.edit_floatingRates");
		}

		function DETAIL() {
			floatingRatesId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.floatingRates.floatingRatesDetail");
		}
		
		function callback(param) {
			grid1.addRows(param);
		}
	</script>

</body>
</html>
