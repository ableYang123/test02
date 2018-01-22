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
	<br><br><br>
	<div class="card" style="margin-left: 200px;margin-right: 200px;">
		<br>
		<div style="margin-top: 20px" class="class="row col-md-12 col-sm-12"">
			<span style="font-size: small;">
				<small><a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><spring:message code="view.loan.account"/></a></small>
			</span>
			<span style="font-size: small;">
				<small><input readonly="readonly" name="collateral" type="text" style="border: none;"></small>
			</span>
		</div>
		<legend></legend>
		<div class="row col-md-12 col-sm-12" style="margin-left: 0%">
			<span style="margin-left: 10px;font-size: 24px">
				<h3 style="font-size: x-large;">
					<strong><spring:message code="view.collateral"/></strong>
				</h3>
			</span>
		</div><br>
		<div style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<div style="padding: 5px;display: block;box-sizing: border-box;">
				<br><hr>
				<table class="table table-bordered ">
					<tr>
						<th><spring:message code="lable.name"/></th>
						<td><span id="name"> </span></td>
					</tr>
					<tr>
						<th><spring:message code="lable.description"/></th>
						<td><span id="description"> </span></td>
					</tr>
					<tr>
						<th><spring:message code="lable.currency"/></th>
						<td><span id="currency"> </span></td>
					</tr>
					<tr>
						<th><spring:message code="lable.value"/></th>
						<td><span id="value"> </span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
	var loanId = ${pd.loanId};
	var collateralId = ${pd.resourceId};
	function detail(){
		window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId;
	}
	$(document).ready(function(){
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.loans."+loanId+".collaterals."+collateralId
				},
			callback : "callback"
		});
	});
	function callback(param){
		$.assign({
			'collateral' : 'View Collateral('+param.type.name+')'+' / '
		});
		$('#name').append(param.type.name);
		$('#description').append(param.description);
		$('#currency').append(param.currency.name);
		$('#value').append(param.currency.displaySymbol+' '+param.value);
	}
	
	</script>
</html>
