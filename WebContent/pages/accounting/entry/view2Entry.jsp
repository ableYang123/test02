<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="addEntryForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="entry.view.title"/></legend>
		<div class="form-group">	
			<table class="table table-hover" id="entrytable">
				<thead>
					<tr>
						<th name="id" width='200'><spring:message code="entry.view.entry"/> ID</th>
						<th name="officeName" width='200'><spring:message code="entry.view.office"/></th>
						<th name="transactionDate" type="date" width='200'><spring:message code="entry.view.tradate"/></th>
						<th name="transactionId" width='200'><spring:message code="entry.view.transa"/>ID</th>
						<th name="glAccountType.value" width='200'><spring:message code="entry.view.type"/></th>
						<th name="createdByUserName" width='200'><spring:message code="entry.view.creby"/></th>
						<th name="glName" width='200'><spring:message code="entry.view.account"/></th>
						<th name="amount1" width='200'><spring:message code="entry.view.debit"/></th>
						<th name="amount2" width='200'><spring:message code="entry.view.credit"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>		
	</fieldset>
</form>
<script type="text/javascript">
	var nestjson2;
	//初始化加载数据
	$(document).ready(function() { 
		nestjson2={
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.journalentries.provisioning?entryId="+entryId+"&offset=0",
				"paging" : "Y"
			},
			callback : "entries"
		}
		grid2 = $('#entrytable').flexigrid(
				{
					nestjson : nestjson,
				});
		viewinit();
	});
	
	function viewinit(){
		$.nest(nestjson2);
	};
	
	function entries(param){
		for(var i in param.pageItems){
			param.pageItems[i].glName=param.pageItems[i].glAccountName+"("+ param.pageItems[i].glAccountCode+")";
			if(param.pageItems[i].entryType.value=="CREDIT"){
				param.pageItems[i].amount1 = "";
				param.pageItems[i].amount2 = param.pageItems[i].amount;
			}else{
				param.pageItems[i].amount1 = param.pageItems[i].amount;
				param.pageItems[i].amount2 = "";
			}
		}
		grid2.addRows(param.pageItems);
		grid2.setPage(param.page, param.pages);
	};
	
</script>