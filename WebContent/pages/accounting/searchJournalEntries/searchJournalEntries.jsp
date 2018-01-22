<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id=searchJournalEntries name="searchJournalEntries">
	<div class="container">
<fieldset>
		<legend>
			<spring:message code="search.journal.entries" />
		</legend>
		<div id="div">
		<div class="form-group">
		<div class="col-sm-2">
				<select id="glAccounts" name="glAccounts" class="form-control">
				<option><spring:message code="Select.account"/></option>
				</select>
			</div>
			<div class="col-sm-2">
				<select id="officeId" name="officeId" class="form-control">
				<option><spring:message code="label.user.selectOffice"/></option>
				</select>
			</div>
			<div class="col-sm-2">
				<select id="filters" name="filters" class="form-control">
				<option>选择筛选器</option>
				<option>System Entries</option>
				<option>All</option>
				<option>Manual Entries</option>
				</select>
			</div>
			<div class="col-sm-1"><button type="button" class="btn btn-link ">
								<span class="glyphicon glyphicon-remove"></span>
							</button></div>
		</div>
		<div class="form-group">
					<label class="col-sm-2"><spring:message code="date.range" /></label>			
		</div>
		<div class="form-group">
		<div class="col-sm-2">
		<label ><spring:message code="lable.fromDate" /></label>	
				<input type="text" id="Formdate" name="Formdate" class="form-control" datetype="date" beforeToday="false">
			</div>
			<div class="col-sm-2 col-sm-offset-2">
			<label ><spring:message code="lable.fullDate" /></label>	
				<input type="text" id="Todate" name="Todate" class="form-control" datetype="date" beforeToday="false">
			</div>
		</div>
		<label class="control-label"><spring:message code="transaction" />ID</label>	
		<div class="form-group">
		<div class="col-sm-2">
		
				<input type="text" id="transactionId" name="transactionId" class="form-control">			
			</div>
			<div class="col-sm-2">
			<button type="button" class="btn btn-info" id="find">Search <span class="glyphicon glyphicon-search"></span></button>
			</div>
			</div>
			</div>
			
		</fieldset>
		</div>
		</form>
<script type="text/javascript">
function getSelect(param) {
	$.setSelect('glAccounts', param, 'id', 'name');
}
function getoffices(param) {
	$.setSelect('officeId', param, 'id', 'name');
}


$(document).ready(function(){
	
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.glaccounts"+"?disabled=false&manualEntriesAllowed=true&usage=1"
			},
			callback : "getSelect"
		}); 
	 $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.offices"
			},
			callback : "getoffices"
		}); 
	 
	 $.getWidget("find").click(function() {	
		 var officeId=parseInt($("#officeId").find("option:selected").attr("value"));
		 var glAccountId=parseInt($("#glAccounts").find("option:selected").attr("value"));
		 var fromDate = $.value('Fromdate');
		 var toDate = $.value('Todate');
		 var path = "loadPage.do?nextPage=accounting.searchJournalEntries.serach";
		 if(!isNaN(officeId)){
			 path = path + "&officeId=" + officeId;
		 }
		 if(!isNaN(glAccountId)){
			 path = path + "&glAccountId=" + glAccountId;
		 }
		 if(!$.isEmpty(fromDate)){
			 path = path + "&fromDate=" + fromDate;
		 }
		 if(!$.isEmpty(toDate)){
			 path = path + "&toDate=" + toDate; 
		 }
		 if(!$.isEmpty('${pd.savingsId}')){
			 path = path + "&savingsId=${pd.savingsId}";
		 }
		window.location.href = path + "&pageType=${pd.pageType}";
	  }) ;
	 
	 
})

</script>
