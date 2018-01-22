<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="addEntryForm" class="form-horizontal">
	<fieldset>
		<legend><div class="form-group">
			<div class="col-sm-3">
				<label class=" control-label"><spring:message code="entry.list.createdby"/>:</span></label>
				<label class=" control-label " id="label1"></label>
			</div>
			<div class="col-sm-4">
				<label class=" control-label"><spring:message code="entry.list.createdon"/>:</span></label>
				<label class=" control-label " id="label2"></label>
			</div>
			<div class="col-sm-5">
				<label class=" control-label"><spring:message code="entry.edit.amount"/>:</span></label>
				<label class=" control-label" id="label13"></label>
			</div>
		</div></legend>
		
		<div class="form-group">
			<div class="col-sm-3">
				<select id="office" name="office" class="form-control">
					<option value=""><spring:message code="entry.edit.office"/></option>
				</select>
			</div>
			<div class="col-sm-3">
				<select id="product" name="product" class="form-control">
					<option value=""><spring:message code="entry.edit.product"/></option>
				</select>
			</div>
			<div class="col-sm-3">
				<select id="category" name="category" class="form-control">
					<option value=""><spring:message code="entry.edit.category"/></option>
				</select>
			</div>
			<div class="col-sm-3">
				<button id="searchBtn" type="button" class="btn btn-primary">
					<span class="glyphicon glyphicon-search"></span>
				</button>			
			</div>
		</div>
		<div class="form-group">
			<table class="table table-hover" id="entrytable">
				<thead>
					<tr>
						<th name="historyId" width='200' style="display:none;">ID</th>
						<th name="officeName" width='200'><spring:message code="entry.edit.offname"/></th>
						<th name="productName" width='200'><spring:message code="entry.edit.proname"/></th>
						<th name="currencyCode" width='200'><spring:message code="entry.edit.curcode"/></th>
						<th name="categoryName" width='200'><spring:message code="entry.edit.catname"/></th>
						<th name="amountreserved" width='200'><spring:message code="entry.edit.proamount"/></th>
						<th name="liabilityAccountName" width='200'><spring:message code="entry.edit.liaaccount"/>（CR）</th>
						<th name="expenseAccountName" width='200'><spring:message code="entry.edit.expaccount"/>（DR）</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>		
		<div class="form-group">
			<button id="addBtn" type="button" class="btn btn-primary center-block"><spring:message code="entry.edit.addjour"/></button>	
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	var nestjson2;
	//初始化加载数据
	$(document).ready(function() { 
		$.datetimepicker();
		$('input[name="dateTime"]').val($.formatDate(new Date()));
		nestjson2={
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.provisioningentries.entries?entryId="+entryId+"&offset=0",
				"paging" : "Y"
			},
			callback : "entries"
		}
		grid2 = $('#entrytable').flexigrid(
				{
					nestjson : nestjson,
				});
		initselect();
		viewinit();
	});
	
	function initselect(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.offices",
			},
			callback : "office"
		});
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.loanproducts",
			},
			callback : "product"
		});
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.provisioningcategory",
			},
			callback : "category"
		});
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.provisioningentries."+entryId,
			},
			callback : "viewentry"
		});
	}
	
	function viewinit(){
		$.nest(nestjson2);
	};
	
	function office(param){
		$.setSelect('office',param,'id','name');
	};
	
	function product(param){
		$.setSelect('product',param,'id','name');
	};
	
	function category(param){
		$.setSelect('category',param,'id','categoryName');
	};
	
	function viewentry(param){
		$("#label1")[0].innerHTML = param.createdUser;
		$("#label2")[0].innerHTML = param.createdDate;
		if(param.reservedAmount)
			$("#label3")[0].innerHTML = param.reservedAmount;
	};
	
	function entries(param){
		grid2.addRows(param.pageItems);
		grid2.setPage(param.page, param.pages);
	};
	
	$.getWidget("searchBtn").click(function() {
		var url = "api.v1.provisioningentries.entries?entryId="+entryId+"&offset=0";
		if($.value("office")){
			url+="&officeId="+$.value("office");
		}
		if($.value("product")){
			url+="&productId="+$.value("product");
		}
		if($.value("category")){
			url+="&categoryId="+$.value("category"); 
		}
		nestjson2.data.url = url;
		console.info(nestjson2)
		viewinit();
	});
	$.getWidget("addBtn").click(function() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "POST",
				"mydata" : "",
				"url" : "api.v1.provisioningentries."+entryId+"?command=createjournalentry",
			},
			callback : "viewinit"
		});
	});
</script>