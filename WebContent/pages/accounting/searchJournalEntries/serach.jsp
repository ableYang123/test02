<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<form class="form-horizontal"  id=search name="search" method="post">
	<div class="container">
<fieldset>
<button type="button" class="btn btn-info" id="button" ><spring:message code="parameters" /></button>
			<div >
			<table id="table">
			<thead>
			<tr>
			<th name="id"><spring:message code="Entry.ID" /></th>
			<th name="officeId"><spring:message code="lable.office" /></th>
			<th name="transactionDate"><spring:message code="Transaction.Date" /></th>
			<th name="transactionId"><spring:message code="transaction" />ID</th>
			<th name="glAccountType.value"><spring:message code="type" /></th>
			<th name="createdByUserName"><spring:message code="create.people" /></th>
			<th name="glAccountName"><spring:message code="amount" /></th>
			<th name="amountA"><spring:message code="borrow" /></th>
			<th name="amountB"><spring:message code="Credit.Card" /></th>
			</tr>
			</thead>
			<tbody></tbody>
			</table>
			</div>
</fieldset>
</div>
</form>

<script type="text/javascript">
var officeId='${pd.officeId}';
var glAccountId='${pd.glAccountId}';
var fromDate = '${pd.fromDate}';
var toDate = '${pd.toDate}';
var savingsId = '${pd.savingsId}';
var url = '';


$(document).ready(function(){
	var baseUrl = "api.v1.journalentries?dateFormat=" + $.getDateFormat() 
					+ "&locale=" + $.getLocale() 
					+ "&officeId=" + officeId
					+ "&glAccountId=" + glAccountId
					+ "&fromDate=" + fromDate
					+ "&toDate=" + toDate 
					+ "&savingsId=" + savingsId;
	console.log('${pd.officeId},${pd.glAccountId},${pd.fromDate},${pd.toDate},${pd.savingsId}');
	if($.isEmpty(officeId)){
		baseUrl = baseUrl.replace("&officeId=" + officeId,'');
	}
	if($.isEmpty(glAccountId)){
		baseUrl = baseUrl.replace("&glAccountId=" + glAccountId,'');
	}
	if($.isEmpty(fromDate)){
		baseUrl = baseUrl.replace("&fromDate=" + fromDate,'');
	}
	if($.isEmpty(toDate)){
		baseUrl = baseUrl.replace("&toDate=" + toDate,'');
	}
	
	if('${pd.pageType}' === 'center'){
		
	}else{
		baseUrl = baseUrl.replace("&savingsId=" + savingsId,'');
	}
	
	nestjson={
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		data : {
			'dataType' : "GET",
			'mydata' : "",
			'url' : baseUrl,
			"paging" : "Y"
		},
		callback : "gets"
		
	};
	grid1 = $('#table').flexigrid(
			{
				title : ' ',
				onDoubleClick : "detail",
				nestjson : nestjson,
				buttons : [
					{
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,
						bclass : 'detail', 
						onpress: detail
					}
					]
			});
	 init1(nestjson);
})

function init1(nestjson){
	$.nest(nestjson);
}
function gets(param) {	
    for(var o in param.pageItems){
    	
    	param.pageItems[o].transactionDate = $.formatDate(param.pageItems[o].transactionDate);
		if(param.pageItems[o].entryType.value=="CREDIT"){
			param.pageItems[o].amountB = param.pageItems[o].amount
		}else{
			param.pageItems[o].amountA =param.pageItems[o].amount
		}
	} 
	grid1.addRows(param.pageItems);
	grid1.setPage(param.page, param.pages);
}
var transactionId;
function detail(){
	transactionId = grid1.colVal("transactionId");
	window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.details&transactionId="+transactionId;
	
}
$("#button").click(function() {	
	window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.searchJournalEntries&pageType=${pd.pageType}&savingsId=${pd.savingsId}";
 }) ;
</script>