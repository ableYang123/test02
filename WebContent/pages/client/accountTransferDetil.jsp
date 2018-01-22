<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

	<legend>View Account Transfer Details</legend>
				
	<label><strong><spring:message code="client.savingaccount.transactionDetails"/></strong></label>				
	<table style="font-size: small;">
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.transactionAmount"/></th>
    		<td style="width: 60%" id="transactionAmount"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.transactionDate"/></th>
    		<td style="width: 60%" id="transactionDate"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.description"/></th>
    		<td style="width: 60%" id="description"></th>
  		</tr>
	</table>
					
			
	<label><strong><spring:message code="client.savingaccount.transferredFrom"/></strong></label>				
	<table style="font-size:medium;">
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.office"/></th>
    		<td style="width: 60%" id="transferredFromOffice"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.client"/></th>
    		<td style="width: 60%" id="transferredFromClient"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.accountType"/></th>
    		<td style="width: 60%" id="transferredFromAccountType"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.account"/>#</th>
    		<td style="width: 60%" id="transferredFromAccount"></th>
  		</tr>
	</table>		
	
	<label><strong><spring:message code="client.savingaccount.transferredTo"/></strong></label>				
	<table style="font-size:medium;">
   		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.office"/></th>
    		<td style="width: 60%" id="transferredToOffice"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.client"/></th>
    		<td style="width: 60%" id="transferredToClient"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.accountType"/></th>
    		<td style="width: 60%" id="transferredToAccountType"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.account"/>#</th>
    		<td style="width: 60%" id="transferredToAccount"></th>
  		</tr>
	</table>
				
					
	<script type="text/javascript">
		$(document).ready(function() {

			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.accounttransfers."+transferId
				},
				callback : "aTDCallback"
			});
			

		});
		
		
			
		function aTDCallback(param){
			$("#transactionAmount").append(param.transferAmount);
			$("#transactionDate").append($.formatDate(param.transferDate));
			$("#description").append(param.transferDescription);
			$("#transferredFromOffice").append(param.fromOffice.name);
			$("#transferredFromClient").append(param.fromClient.displayName);
			$("#transferredFromAccountType").append(param.fromAccountType.value);
			$("#transferredFromAccount").append(param.fromAccount.accountNo);
			$("#transferredToOffice").append(param.toOffice.name);
			$("#transferredToClient").append(param.toClient.displayName);
			$("#transferredToAccountType").append(param.toAccountType.value);
			$("#transferredToAccount").append(param.toAccount.accountNo);
			
		}
			
		
		
	
</script>