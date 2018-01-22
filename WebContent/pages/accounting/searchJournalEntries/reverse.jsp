<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id=reverse name="reverse">
<fieldset>
<legend>
<spring:message code="reversal" />
</legend>
<form class="form-group">

<label><spring:message code="Comments" /></label>
<div>
<textarea rows="" cols="" id="comments"></textarea>
</div>
<div style="text-align: center; padding-top: 20px">
	<a class="btn btn-warning" href=""><spring:message code="btn.cancle"/></a>
		<button class="btn btn-info"  id="reverse" type="button"><spring:message code="reversal" /></button>
	</div>
</form>
</fieldset>
</form>
<script type="text/javascript">
$(document).ready(function(){
	 $.getWidget("reverse").click(function() {					
			date={
					"comments" : $("#comments").val(),
					"transactionId":tranId,
			}
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						'dataType' : "POST",
						'mydata' : date,
						'url' : 'api.v1.journalentries.'+tranId+"?command=reverse"
					},
					callback : "callbackadd"
					
				});
						
	  });
})
function callbackadd(){
	//transactionId = grid1.colVal('transactionId');
	window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.show";
	
}
</script>