<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="background-color: f8f8f8">
	<div>
		<div class="content-container">
			<ul class="breadcrumb">
				<li class=""><spring:message code="title.charges"/></li>
			</ul> 
		</div>
		<div class="col-sm-12 col-md-12" >
			<table id="chargeslist">
				<thead>
					<tr>
						<th name='id' style='display: none;'>id</th>
						<th name="name" width='150'><spring:message code="lable.name"/></th>
						<th name="dueDate" width='150'><spring:message code="lable.dueDate"/></th>
						<th width='150' name="amount"><spring:message code="lable.amount"/></th>
						<th width='150' name="amountPaid"><spring:message code="lable.amountPaid"/></th>
						<th width='150' name="amountWaived"><spring:message code="lable.amountWaived"/></th>
						<th name="amountOutstanding" width='100'><spring:message code="lable.amountOutstanding"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div><br><br>
	<div class="form-group col-sm-12 col-md-12">
		<div class="text-right">
			<a href="javascript:void(0)" style="margin-right: 700px" onclick="back()" id="save" name="save" class="btn btn-primary" >
				<i class=""></i>
				<spring:message code="btn.back"/>
			</a>
		</div>
	</div>
	<script type="text/javascript">
		var grid1;
		var clientId = ${pd.clientId};
		$(document).ready(function() {
			nestjson = {
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId+".charges",
						"paging" : "Y"
					},
					callback : "chargelist"
			};
			grid1 = $('#chargeslist').flexigrid({
				title : '费用列表',
				nestjson : nestjson,
				buttons : [
					{
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,
						bclass : 'detail', 
						onpress: detail
					}]
			});
			init();
		});
		
		function detail(){
			chargeId = grid1.colVal('id');
			window.location.href="loadPage.do?nextPage=client.chargeDetail&chargeId="+chargeId+"&clientId="+clientId;
		}
		
		function chargelist(param) {
			for(var i=0;i<param.pageItems.length;i++){
				param.pageItems[i].dueDate = $.formatDate(param.pageItems[i].dueDate);
				if(param.pageItems[i].isPaid == false && param.pageItems[i].isWaived ==false){
					param.pageItems[i].name = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+' '+ param.pageItems[i].name;
				}else{
					param.pageItems[i].name = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 0);'></i>"+' '+ param.pageItems[i].name;
				}
			}
			grid1.addRows(param.pageItems);
			grid1.setPage(param.page, param.pages);
		}
		function back(){
			window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
		}
		function init() {
			$.nest(nestjson);
		}
	</script>
</body>
</html>
