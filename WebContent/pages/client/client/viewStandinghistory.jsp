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
	<div style="margin-left: 200px">
		<div style="margin-top: 20px" class="row col-md-12 col-sm-12"">
			<span style="font-size: small;">
				<small><a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><span id="name"></span></a>&nbsp;/&nbsp;<spring:message code="lable.transaction.history"/></small>
			</span>
		</div>
		<legend></legend>
		<div class="form-group">
			<h3><spring:message code="lable.standing.instruction"/>-<spring:message code="lable.transaction.history"/></h3>
		</div>
		<div style="padding: 5px;display: block;box-sizing: border-box;">
			<table class="table table-bordered ">
				<tr>
					<th><spring:message code="lable.from.account"/></th>
					<td><span id="fromAccountId"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to.account"/></th>
					<td><span id="toAccountId"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to.beneficiary"/></th>
					<td><span id="toClientId"></span></td>
				</tr>
			</table>
		</div>
		<div>
			<table id="list">
				<thead>
					<tr>
						<th name='id' style='display: none;'>id</th>
						<th name="" width='154'><spring:message code="lable.transaction.date"/></th>
						<th name="" width='154'><spring:message code="lable.amount"/></th>
						<th name="" width='154'><spring:message code="lable.notes"/></th>
						<th name="" width='154'><spring:message code="lable.reversed"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var standingId = ${pd.standingId};
		var grid;
		$(document).ready(function() {
			var dateFormat = "yyyy-MM-dd";
			dateFormat = encodeURIComponent(dateFormat);
			$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.standinginstructions."+standingId+"?associations=transactions&dateFormat="+dateFormat+"&limit=14&locale=en&offset=0"
					},
					callback : "standing"
			});
			grid = $('#list').flexigrid({
			});
		});
		function standing(param) {
			$('#name').append(param.name);
			$('#fromAccountId').append(param.fromAccount.accountNo+'('+param.fromAccountType.value+')');
			$('#toClientId').append(param.toClient.displayName);
			$('#toAccountId').append(param.toAccount.accountNo+'('+param.toAccountType.value+')');
			if(param.transactions.pageItems != null || param.transactions.pageItems.length > 0){
				grid.addRows(param.transactions.pageItems);
			}
		}
		function detail(){
			$.openWindow("loadPage.do?nextPage=client.viewStanding&standingId="+standingId);
		}
	</script>
</body>
</html>
