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
		<div style="margin-left:200px;" class="content-container">
			<ul class="breadcrumb">
				<li class=""><spring:message code="title.client.list"/></li>
			</ul>
		</div>
		<div class="form-group" style="text-align: right; padding-right: 85px;">
 <button type="button" id="Add" class="btn btn-info" /><span class="glyphicon glyphicon-plus"></span><spring:message code="lable.add.client" /></button>
</div>
		<div class="div-cc" >
			<table id="clientlist">
				<thead>
					<tr>
						<th name='id' style='display: none;'>id</th>
						<th name="displayName" width='154'><spring:message code="lable.name"/></th>
						<th name="accountNo" width='154'><spring:message code="lable.client"/></th>
						<th name="externalId" width='154'><spring:message code="lable.external"/>ID</th>
						<th name="status.value" width='154'><spring:message code="lable.status"/></th>
						<th name="officeName" width='154'><spring:message code="lable.office"/></th>
						<th name="staffName" width='154'><spring:message code="lable.staff"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var grid1;
		var clientId;
		var isInit = false;
		var userId = ${userId};
		var groupId;
		var officeId;
		$(document).ready(function() {
				 
					url="api.v1.clients?paged=true";
				nestjson={
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : url,
							"paging" : "Y"
						},
						callback : "clientlist"
					};
			
							grid1 = $('#clientlist').flexigrid(
											{
												title : '客户列表',
												nestjson : nestjson,
												onDoubleClick : "detail",
											});
							init();
							$('#myModal').on('hidden.bs.modal',
									function(event) {
										if(isInit){
											init();
											isInit = false;
										}
									});
						});
		function init() {
			$.nest(nestjson);
		}
			$("#Add").click(function(){
				
				isInit = true;
				$.openWindow('<c:url value="/loadPage.do?nextPage=client.addClient"/>');
			})
			
		function clientlist(param) {
			$.each(param.pageItems,function(index,item){
				if(typeof item.externalId == 'undefined'){
					item.externalId = "";
				}
 				if(item.status.value == 'Active'){
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+' '+item.status.value
 				}else if(item.status.value == 'Pending'){
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: #FFA500;'></i>"+' '+item.status.value
 				}else if(item.status.value == 'Transfer in progress'){
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(255, 0, 0);'></i>"+' '+item.status.value
 				}else if(item.status.value == 'Transfer on hold'){
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(255, 0, 0);'></i>"+' '+item.status.value
 				}else{
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: #666F73;'></i>"+' '+item.status.value
 				}
			});
			grid1.addRows(param.pageItems);
			grid1.setPage(param.page, param.pages);
		}

		$('#myModal').on('hidden.bs.modal', function (event) {
			$.nest(nestjson)
		});
		
		$.getWidget("clientlist").click(function(){
			clientId = grid1.colVal('id');
			if(clientId)				
				$.openWindow("loadPage.do?nextPage=client.detail&clientId="+clientId+"&userId="+userId,"iframe","80%","90%");
		});
	</script>
</body>
</html>
