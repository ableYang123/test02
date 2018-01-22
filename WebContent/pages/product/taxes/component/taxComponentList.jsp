<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="title.manage.tax.component" /></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<div class="row" style="margin: 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="taxComponentTable" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' width='210' search="true"><spring:message code="lable.name" /></th>
						<th name='percentage' width='210'><spring:message code="lable.percentage" /></th>
						<th name='creditAccountType' width='210'><spring:message code="lable.account.type" /></th>
						<th name='creditAccount' width='210'><spring:message code="lable.account" /></th>
						<th name='startDate' width='210'><spring:message code="lable.startDate" /></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var grid1;
		var taxComponentId;

		$(document).ready(function() {
				grid1 = $('#taxComponentTable').flexigrid(
								{
									title : '<spring:message code="title.list.tax.component"/>',
									pcpager:true,
									/*buttons : [
											{
												name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
												bclass : 'add',
												onpress : ADD
											},
											{
												name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,
												bclass : 'edit',
												onpress : EDIT
											}]*/
								});

				init();

				$('#myModal').on('hidden.bs.modal',function(event) {
					init();
				});
		});
		$.getWidget("taxComponentTable").click(function(){
			EDIT();
		});
		function init() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.taxes.component"
				},
				callback : "callback"
			});
		}

		function ADD() {
			$.openWindow("loadPage.do?nextPage=product.taxes.component.add_taxComponent");
		}

		function EDIT() {
			taxComponentId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=product.taxes.component.edit_taxComponent");
		}

		
		function callback(param) {
			$.each(param,function(n,obj){
				if(typeof(obj.creditAccountType)==='undefined'){
					obj['creditAccountType']='';
				}else{
					obj.creditAccountType=obj.creditAccountType.value;
				}
				if(typeof(obj.creditAccount)==='undefined'){
					obj['creditAccount']='';
				}else{
					obj.creditAccount=obj.creditAccount.name;
				}
				var startDate=$.formatDate(obj.startDate); 
				obj.startDate=startDate;
			
			});
			grid1.addRows(param);
		}
	</script>

</body>
</html>
