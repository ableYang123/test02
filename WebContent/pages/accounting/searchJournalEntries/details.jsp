<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="<c:url value='/js/jquery.webcam.min.js'/>"></script>
</head>
<body>
<form class="form-horizontal"  id=details name="details">
	<div class="container">
<fieldset>
<legend>
			<spring:message code="transation.number"/>
			<lable id="transaction"></lable>
		<div style="text-align: right;" id="div1"><button class="btn btn-info" type="button" id="reverse"> <span class="glyphicon glyphicon-repeat"></span><spring:message code="reversal" /></button>
		</div>
		<div style="text-align: right;" id="div2"><spring:message code="transation.reversed" /></div>
		</legend>
		
		<div class="form-group">
		<label class=" col-sm-2"><spring:message code="lable.office"/></label>
		<div class="col-sm-2"><label id="officeId"></label></div>
		<label class="col-sm-2"><spring:message code="Transaction.Date" /></label>
		<div class="col-sm-2"><label id="transactionDate"></label></div>
		</div>
			<div class="form-group">
		<label class="col-sm-2"><spring:message code="create.people" /></label>
		<div class="col-sm-2"><label id="createdByUserName"></label></div>
		<label class="col-sm-2"><spring:message code="create.on" /></label>
		<div class="col-sm-2"><label id="createdDate"></label></div>
		</div>
		<div class="form-group">
		<table id="table">
		<thead>
		<tr>
		<th name="id"><spring:message code="Entry.ID" /></th>
		<th name="glAccountType.value"><spring:message code="type" /></th>
		<th name="glAccountName"><spring:message code="amount" /></th>
		<th name="amountA"><spring:message code="borrow" /></th>
		<th name="amountB"><spring:message code="Credit.Card" /></th>
		</tr></thead>
	<tbody></tbody>
		</table>
		</div>

</fieldset>
</div>
</form>

<script type="text/javascript">
	var grid1;
	var tranId = "${pd.transactionId}";
	$(document).ready(function(){
		
			var nestjson={
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						'dataType' : "GET",
						'mydata' : "",
						'url' : "api.v1.journalentries?transactionDetails=true&transactionId="+tranId,
						"paging" : "Y"
					},
					callback : "getdetails"
					
				};
			grid1 = $('#table').flexigrid(
					{
						title : ' ',
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
	
	 function getdetails(param) {
		
	      for(var o in param.pageItems){
	    	  param.pageItems[o].transactionDate = $.formatDate(param.pageItems[o].transactionDate);
	    	  param.pageItems[o].createdDate = $.formatDate(param.pageItems[o].createdDate);
			if(param.pageItems[o].entryType.value=="CREDIT"){
				param.pageItems[o].amountB = param.pageItems[o].amount
			}else{
				param.pageItems[o].amountA =param.pageItems[o].amount
			}
		}   
	      
		for(var i in param.pageItems){
			$("#transaction")[0].innerText=param.pageItems[i].transactionId;
			 $("#officeId")[0].innerText=param.pageItems[i].officeName;
			 $("#transactionDate")[0].innerText=param.pageItems[i].transactionDate;
			 $("#createdByUserName")[0].innerText=param.pageItems[i].createdByUserName;
			 $("#createdDate")[0].innerText=param.pageItems[i].createdDate;
			 var reverse=param.pageItems[i].reversed;
				if(reverse==true){
					$("#div1").hide();
					$("#div2").show();
				}else{
					$("div1").show();
					$("#div2").hide();
				}
			
		 }
		grid1.addRows(param.pageItems);
		grid1.setPage(param.page, param.pages);
		
		
	} 
	function init1(nestjson){
		$.nest(nestjson);
	}
	function detail(){
		$.openWindow("loadPage.do?nextPage=accounting.searchJournalEntries.result");
		
	}
	$("#reverse").click(function(){
		$.openWindow("loadPage.do?nextPage=accounting.searchJournalEntries.reverse");
	})
</script>

</body>
</html>
