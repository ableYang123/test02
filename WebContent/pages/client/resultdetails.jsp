<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="details" name="details">
	<div class="container">
	
<fieldset>
<legend>
			<spring:message code="result.details" />
		</legend>
		<div class="form-group" id="del">
		<div class="col-sm-2 col-sm-offset-9">
		<button type="button" class="btn btn-info" id="edit">编辑</button>
		<button type="button" class="btn btn-warning" >撤销</button>
</div>
		</div>
		<div>
		<label><spring:message code="transaction" />ID:</label>
		<lable id="id"></lable>
		</div>
		<div>
		<label><spring:message code="label.report.type" />:</label>
		<lable id="transactionType"></lable>
		</div>
		<div>
		<label><spring:message code="transactionDate" />:</label>
		<lable id="date"></lable>
		</div>
		<div>
		<label><spring:message code="deposit.label.currency" />:</label>
		<lable id="currency"></lable>
		</div>
		<div>
		<label><spring:message code="amount.money" />:</label>
		<lable id="amount"></lable>
		</div>
		
		
		<div id="div1">
		<label>Payment Details</label>
		</div>
		<div id="div2">
		<label>类型</label>
		<lable id="type"></lable>
		</div>
		<div id="div3">
		<label>账户#</label>
		<lable id="accountNumber"></lable>
		</div>
		<div id="div4">
		<label>支票#</label>
		<lable id="check"></lable>
		</div>
		<div id="div5">
		<label>路由代码</label>
		<lable id="code"></lable>
		</div>
		<div id="div6">
		<label>收据#</label>
		<lable id="receipt"></lable>
		</div>
		<div id="div7">
		<label>银行#</label>
		<lable id="bank"></lable>
		</div>
</fieldset>
</div>
</form>
<script type="text/javascript">
console.log(typeId)
function getDetails(param) {
	
	
	var del=param.interestedPostedAsOn==false&&(typeId==17||typeId==3);
	var edit=param.transactionType.value=='Transfer'||param.reverse==true||typeId==17||typeId==3;
	console.info(del);
	console.info(edit);
	if(del){
		$.hide("del");
	}else{
		$.show("del");
	}
	if(edit){
		$.show("edit");
	}else{
		$.hide("edit");
	}
	if(param.paymentDetailData){
		
		
		
			 
		 $("#id")[0].innerText=param.id;
			$("#transactionType")[0].innerText=param.transactionType.value;
			$("#date")[0].innerText=param.date;
			$("#currency")[0].innerText=param.currency.code;
			$("#amount")[0].innerText=param.amount;
			
			
			if(param.paymentDetailData.paymentType.name){
				$("#type")[0].innerText=param.paymentDetailData.paymentType.name;
			}else {
				$("#div2").hide();
			}
			
			if(param.paymentDetailData.paymentType.name){
				$("#check")[0].innerText=param.paymentDetailData.accountNumber;
			}else {
				$("#div3").hide();
			}
			if(param.paymentDetailData.paymentType.name){
				$("#check")[0].innerText=param.paymentDetailData.checkNumber;
			}else {
				$("#div4").hide();
			}
			
			if(param.paymentDetailData.paymentType.name){
				$("#code")[0].innerText=param.paymentDetailData.routingCode;
			}else {
				$("#div5").hide();
			}
			
			if(param.paymentDetailData.paymentType.name){
				$("#receipt")[0].innerText=param.paymentDetailData.receiptNumber;
			}else {
				$("#div6").hide();
			}
			if(param.paymentDetailData.paymentType.name){
				$("#bank")[0].innerText=param.paymentDetailData.bankNumber;
			}else {
				$("#div7").hide();
			}
	}else{
		$("#div1").hide();
		$("#div2").hide();
		$("#div3").hide();
		$("#div4").hide();
		$("#div5").hide();
		$("#div6").hide();
		$("#div7").hide();
		$("#id")[0].innerText=param.id;
		$("#transactionType")[0].innerText=param.transactionType.value;
		$("#date")[0].innerText=param.date;
		$("#currency")[0].innerText=param.currency.code;
		$("#amount")[0].innerText=param.amount;
		
	}	
	
	
	}
$(document).ready(function(){

	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.savingsaccounts."+accountId+".transactions."+trId
			},
			callback : "getDetails"
		}); 
})

</script>