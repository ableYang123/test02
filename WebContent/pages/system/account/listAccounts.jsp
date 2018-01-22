<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
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
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="account.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<div class="row" style="margin: 5px">
				<button type='button' id="addBtn" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-plus"></span><spring:message code="account.list.addpreferences"/></button>
			</div>
			<table class="table table-hover ">
				<thead>
					<tr>
						<th style="display: none;">id</th>
						<th><spring:message code="account.list.title"/></th>  <!--<spring:message code=""/>  -->
					</tr>
				</thead>
				<tbody id="accountTableBody">

				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var accountId;
		
		//初始化  
		$(document).ready(function() {
			init();
		});
		
		function init() {
			//加载列表数据
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.accountnumberformats"
				},
				callback : "listAccounts"
			});
		};
		
		function listAccounts(param){
			$('#accountTableBody')[0].innerHTML = "";
			$.each(param,function(index,item){
				var str = "";
				str += "<tr><td style='display: none;'>"+item.id+"</td>"
					+"<td>"+item.accountType.value+"</td></tr>";
				$('#accountTableBody')[0].innerHTML += str;
			})
		};
		
		$('#accountTableBody').on('click','tr',function(){
			accountId = this.childNodes[0].innerHTML;
			$.openWindow("loadPage.do?nextPage=system.account.editAccount");
		});
		
		function callbackBtn(){
			init();
		}
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			/* 实现局部刷新 */
			init();
		});
		
		$.getWidget("addBtn").click(function() {
			$.openWindow("loadPage.do?nextPage=system.account.addAccount");
		});
		
	</script>
</body>
</html>





	