<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<legend><spring:message code="client.savingaccount.viewCharge"/>
			<div class="col-sm-12 col-md-12 text-right active" id="btngroupAct" style="display: none;">
				<a class="btn btn-primary" id="payCharge"><spring:message code="client.savingaccount.payCharge"/></a>
				<a class="btn btn-danger" id="waiveCharge"><spring:message code="client.savingaccount.waiveCharge"/></a>
				<a class="btn btn-warning" id="inactiveCharge"><spring:message code="client.savingaccount.inactiveCharge"/></a>
			</div>
			<div class="col-sm-12 col-md-12 text-right pending" id="btngroupPed" style="display: none;">
				<a class="btn btn-primary" id="editCharge"><spring:message code="btn.edit"/></a>
				<a class="btn btn-danger" id="deleteCharge"><spring:message code="btn.delete"/></a>
			</div>
			
	</legend>
	<table style="font-size:medium;">
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.name"/></th>
    		<td style="width: 60%" id="name"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.chargeType"/></th>
    		<td style="width: 60%" id="chargeType"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.currency"/></th>
    		<td style="width: 60%" id="currency"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.paymentDueAt"/></th>
    		<td style="width: 60%" id="paymentDueAt"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.paymentDueAsOf"/></th>
    		<td style="width: 60%" id="paymentDueAsOf"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.calculationType"/></th>
    		<td style="width: 60%" id="calculationType"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.due"/></th>
    		<td style="width: 60%" id="due"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.paid"/></th>
    		<td style="width: 60%" id="paid"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.waived"/></th>
    		<td style="width: 60%" id="waived"></th>
  		</tr>
  		<tr>
    		<td style="width: 20%"><spring:message code="client.savingaccount.outstanding"/></th>
    		<td style="width: 60%" id="outstanding"></th>
  		</tr>
  		
	</table>

	<script type="text/javascript">
		$(document).ready(function() {
			console.log(chargesViewId)
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url":"api.v1.savingsaccounts."+savingsId+".charges."+chargesViewId
				},
				callback : "callback"
			}); 	
		});
		function callback(param) {
			
			 if(accountStatus=="active"){
				if(param.amountOutstanding!=0){
					$("#btngroupAct").css("display","");
				}else{
					$("#btngroupAct").css("display","none");
				}
			 }else if(accountStatus=="pending"){
				 $("#btngroupPed").css("display","");
			 }	
			
			
			
			$("#name").append(param.name);
			$("#chargeType").append(param.penalty==true?"Penalty":"Fee");
			$("#currency").append(param.currency.name);
			$("#paymentDueAt").append(param.chargeTimeType.value);
			$("#paymentDueAsOf").append(param.dueDate==undefined?"":$.formatDate(param.dueDate));
			$("#calculationType").append(param.chargeCalculationType.value);
			$("#due").append(param.amount);
			$("#paid").append(param.amountPaid);
			$("#waived").append(param.amountWaived);
			$("#outstanding").append(param.amountOutstanding);
			
			$("#editCharge").click(function(){
				$.openWindow("loadPage.do?nextPage=client.accountEditCharge");				
			})
			
			$("#deleteCharge").click(function(){
				$.openWindow("loadPage.do?nextPage=client.accountDeleteCharge");				
			})
			
			$("#payCharge").click(function(){
				$.openWindow("loadPage.do?nextPage=client.accountPayCharge");				
			})
			
			$("#waiveCharge").click(function(){
				$.openWindow("loadPage.do?nextPage=client.accountWaiveCharge");				
			})
			
			$("#inactiveCharge").click(function(){
				$.openWindow("loadPage.do?nextPage=client.accountInactiveCharge");				
			})
		}
</script>