<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="content-container" style="margin: 0px 200px">
			<ul class="breadcrumb">
				<li class="active"><spring:message code="group.list" /></li>
			</ul>
			<a id="ctn_button" type="button" style='display: none;'
				class="btn btn-primary btn-default"
				href='<c:url value="/loadPage.do?nextPage=group.addGroup"/>'> <span
				id='creatClient'></span>
			</a>
			<div class="div-cc" >
			<div class="row" style="margin: 5px 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.group.create"/></button>
			</div>
			<table id="centerlist">
				<thead>
					<tr>
						<th name="staffId" style="display: none;">staffId</th>
						<th name="id" style="display: none;">id</th>
						<th name="officeId" style="display: none;">officeId</th>
						<th name="name" search="true"><spring:message code="group.name" /></th>
						<th name="accountNo" search="true"><spring:message code="amount" /></th>
						<th name="externalId" search="true"><spring:message code="group.external.id" /></th>
						<th name="status.value" search="true"><spring:message code="group.status" /></th>
						<th name="officeName" search="true"><spring:message code="group.office" /></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var userId = ${userId};
		var nestjson;
		$(document)
				.ready(
						function() {
							nestjson={
									url : "<c:url value='/fineract.do'/>",
									type : "get",
									data : {
										"dataType" : "GET",
										"mydata" : "",
										"paging" : "Y",
										"url" : "api.v1.groups?paged=true"
									},
									callback : "initGroupList"
								};
							var listGroupString = $.fn.bootstrapValidator.i18n.group.listGroup;
							grid1 = $('#centerlist').flexigrid(
											{
												title : listGroupString,
												nestjson:nestjson,
												/* buttons : [
														 {
															name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
															bclass : 'add',
															onpress : ADD
														},{
															name : $.fn.bootstrapValidator.i18n.group.detail,
															bclass : 'groupLoanApplication',
															onpress : groupDetail
														} 
														], */
											});
							$.nest(nestjson);
						});
		
		
		function initGroupList(param) {
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
		//点击一下某一组，则弹出该组的详情页面
		$.getWidget("centerlist").click(function(){
			var groupId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=group.detail&groupId="+groupId,"iframe","80%","90%");
		});
		function ADD() {
			$.openWindow("loadPage.do?nextPage=group.addGroup");
		}
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			$.nest(nestjson)
		});
		
		/* function groupDetail(){
			var staffId = grid1.colVal('staffId');
			if(staffId="$nbsp")
				staffId=0;
			var groupId = grid1.colVal('id');
			var officeId = grid1.colVal('officeId');
			var officeName = grid1.colVal('officeName');
			$.openWindow("loadPage.do?nextPage=group.detail&groupId="+groupId+"&officeId="+officeId+"&staffId="+staffId+"&userId="+userId+"&officeName="+officeName,"iframe","80%","90%");
		} */

	</script>
</body>
</html>
