<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id=show name="show">
<fieldset>
<legend>
<spring:message code="success.reverse"/>
</legend>
<div class="form-group">
<label><spring:message code="record.id"/></label>
<div><lable id="transactionId"></lable></div>
</div>
<div style="text-align: center; padding-top: 20px">
	<a class="btn btn-warning" href=""><spring:message code="btn.cancle"/></a>
		<button class="btn btn-info"  id="again" type="button"><spring:message code="again.transation"/></button>
	</div>
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
	}
}
$("#again").click(function(){
	window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.details";
})
</script>