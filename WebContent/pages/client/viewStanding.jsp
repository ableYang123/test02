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
	<div style="margin-left: 200px">
		<div style="margin-top: 20px" class="row col-md-12 col-sm-12"">
			<span style="font-size: small;">
				<small><a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><spring:message code="lable.list.standing"/></a>&nbsp;/&nbsp;<spring:message code="lable.standing.instruction"/></small>
			</span>
		</div>
		<legend></legend>
		<div class="form-group">
			<h3><spring:message code="lable.view.standing"/></h3>
		</div>
		<div style="padding: 5px;display: block;box-sizing: border-box;">
			<table class="table table-bordered ">
				<tr>
					<th colspan="2"><a href="javascript:void(0)" onclick="history()" style="text-decoration: none;"><spring:message code="lable.view.transaction.history"/></a></th>
				</tr>
				<tr>
					<th><spring:message code="lable.name"/></th>
					<td><span id="name"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.applicant"/></th>
					<td><span id="applicant"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.type"/></th>
					<td><span id="transferType"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.priority"/></th>
					<td><span id="priority"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.status"/></th>
					<td><span id="status"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.from.account.type"/></th>
					<td><span id="fromAccountType"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.from.account"/></th>
					<td><span id="fromAccountId"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.destination"/></th>
					<td><span id="destination"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to.office"/></th>
					<td><span id="toOfficeId"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to.beneficiary"/></th>
					<td><span id="toClientId"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to.account.type"/></th>
					<td><span id="toAccountType"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to.account"/></th>
					<td><span id="toAccountId"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.standing.instruction.type"/></th>
					<td><span id="instructionType"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.amount"/></th>
					<td><span id="transferAmount"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.validity.from"/></th>
					<td><span id="validFrom"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.to"/></th>
					<td><span id="validTill"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.recurrence.type"/></th>
					<td><span id="recurrenceType"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.interval"/></th>
					<td><span id="recurrenceInterval"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.recurrence.frequency"/></th>
					<td><span id="recurrenceFrequency"></span></td>
				</tr>
				<tr>
					<th><spring:message code="lable.on.month.day"/></th>
					<td><span id="recurrenceOnMonthDay"></span></td>
				</tr>
			</table>
		</div>
		<div class="form-group">
			<a href="javascript:void(0)" onclick="edit()" style="margin-top: 3px;margin-left: 200px;" class="btn btn-primary btn-offset">
				<i class="glyphicon glyphicon-pencil"></i>
				<spring:message code="lable.edit"/>
			</a>
		</div>
	</div>
	<script type="text/javascript">
		var standingId = ${pd.standingId};
		$(document).ready(function() {
			$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.standinginstructions."+standingId
					},
					callback : "standing"
			});
		});
		function standing(param) {
			resourceId = param.accountDetailId;
			$('#name').append(param.name);
			$('#applicant').append(param.fromClient.displayName);
			$('#transferType').append(param.transferType.value);
			$('#priority').append(param.priority.value);
			$('#status').append(param.status.value);
			$('#fromAccountType').append(param.fromAccountType.value);
			$('#fromAccountId').append(param.fromAccount.productName+'-'+param.fromAccount.accountNo);
			$('#destination').append('Own Account');
			$('#toOfficeId').append(param.toOffice.name);
			$('#toClientId').append(param.toClient.displayName);
			$('#toAccountType').append(param.toAccountType.value);
			$('#toAccountId').append(param.toAccount.productName+'-'+param.toAccount.accountNo);
			$('#instructionType').append(param.instructionType.value);
			$('#transferAmount').append(param.amount);
			var validFrom = $.formatDate(param.validFrom);
			$('#validFrom').append(validFrom);
			var validTill = $.formatDate(param.validTill);
			$('#validTill').append(validTill);
			$('#recurrenceType').append(param.recurrenceType.value);
			$('#recurrenceInterval').append(param.recurrenceInterval);
			$('#recurrenceFrequency').append(param.recurrenceFrequency.value);
			var recurrenceOnMonthDay = $.formatDate(param.recurrenceOnMonthDay)
			$('#recurrenceOnMonthDay').append(recurrenceOnMonthDay);
		}
		function history(){
			$.openWindow("loadPage.do?nextPage=client.viewStandinghistory&standingId="+standingId);
		}
		function edit(){
			$.openWindow("loadPage.do?nextPage=client.editStandingInstruction");
		}
	</script>
</body>
</html>
