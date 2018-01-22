<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id=result name="result">
<fieldset>
<legend>
<spring:message code="View.Journal.Entry" />
</legend>

<div class="form-group">
		<label class=" col-sm-2"><spring:message code="lable.office"/></label>
		<div class="col-sm-2"><label id="officeId"></label></div>
		</div>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="register.id"/></label>
		<div class="col-sm-2"><label id="id"></label></div>
		</div>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="transaction" />ID</label>
		<div class="col-sm-2"><label id="transactionId"></label></div>
		</div>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="Transaction.Date" /></label>
		<div class="col-sm-2"><label id="transactionDate"></label></div>
		</div>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="type" /></label>
		<div class="col-sm-2"><label id="type"></label></div>
		</div>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="amount" /></label>
		<div class="col-sm-2"><label id="glAccountName"></label></div>
		</div>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="borrow" /></label>
		<div class="col-sm-2"><label id="amount"></label></div>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2">Payment </label>
		</div>
			<div class="form-group">
		<label class=" col-sm-2">Details</label>
		</div>
			<div class="form-group">
		<label class=" col-sm-3">Payment type id</label>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="amount" />#</label>
		</div>
		
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="check" />#</label>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="Routing.code" /></label>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="receipt" />#</label>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="bank" />#</label>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="create.people" /></label>
		<div class="col-sm-2"><label id="createdByUserName"></label></div>
		</div>
		
			<div class="form-group">
		<label class=" col-sm-2"><spring:message code="create.on" /></label>
		<div class="col-sm-2"><label id="createdDate"></label></div>
		</div>
		<a class="btn btn-warning" href=""><spring:message code="btn.cancle"/></a>
</fieldset>
</form>
<script type="text/javascript">
$(document).ready(function(){
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.journalentries?transactionDetails=true$transactionId="+transactionId,
			},
			callback : "getdetails"
		}); 
})

function getdetails(param) {
	for(var i in param.pageItems){
		
		$("#transactionId")[0].innerText=param.pageItems[i].transactionId;
		 $("#officeId")[0].innerText=param.pageItems[i].officeName;
		 param.pageItems[i].transactionDate = $.formatDate(param.pageItems[i].transactionDate);
		 $("#transactionDate")[0].innerText=param.pageItems[i].transactionDate;
		 $("#createdByUserName")[0].innerText=param.pageItems[i].createdByUserName;
		  param.pageItems[i].createdDate = $.formatDate(param.pageItems[i].createdDate);
		 $("#createdDate")[0].innerText=param.pageItems[i].createdDate;
		 $("#id")[0].innerText=param.pageItems[i].id;
		 $("#type")[0].innerText=param.pageItems[i].glAccountType.value;
		 $("#glAccountName")[0].innerText=param.pageItems[i].glAccountName;
		 $("#amount")[0].innerText=param.pageItems[i].amount;
	 }
}
</script>