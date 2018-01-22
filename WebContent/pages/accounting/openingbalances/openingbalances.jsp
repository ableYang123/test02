<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id=searchJournalEntries name="searchJournalEntries">
	<div class="container">
<fieldset>
		<legend>
			<spring:message code="opening.balances.title" />
		</legend>
		
		<div class="form-group">
		<label for="officeId" class="col-sm-2 control-label"><spring:message code="lable.office" /><span style="color: #d9534f;">*</span> </label>
		<div class="col-sm-2">		
				<select id="officeId" name="officeId" class="form-control">
				</select>
			</div>
			<label for="currencyCode" class="col-sm-2 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-2">
				<select id="currencyCode" name="currencyCode" class="form-control">
				</select>
			</div>
			<button class="btn btn-info" type="button" id="search">Search Data</button>
			</div>
			<div id="div">
			<div class="form-group">
		<label  class="col-sm-2 control-label"><spring:message code="Opening.balances.contra" /></label>
		<div class="col-sm-2" >
		<span id="span1"></span>
		<span id="span2"></span>
		</div>
			</div>
		<div class="form-group">
		<label for="transactionDate" class="col-sm-2 control-label"><spring:message code="Date.of.opening.balances" /><span style="color: #d9534f;">*</span> </label>
		<div class="col-sm-2">		
		<input type="text" class="form-control" id="transactionDate">				
			</div>
			</div>
			<div class="form-group" >
			<table id="table" class="table col-sm-2 " style="margin-left: 20px;">
			<tr>
			<th><spring:message code="type"/></th>
			<th><spring:message code="gl.code"/></th>
			<th><spring:message code="amount"/></th>
			<th><spring:message code="borrow"/><span id="num"></span></th>
			<th ><spring:message code="Credit.Card"/><span id="num2"></span></th>
			</tr>
			
			<tr>
			<td ><span id="td1"></span></td>
			<td><span id="td2"></span></td>
			<td ><span id="td3"></span></td>
			<td><input type="text" class="form-control"></td>
			<td><input type="text" class="form-control"></td>
			</tr>
			<tr>
			<td ><span id="td4"></span></td>
			<td><span id="td5"></span></td>
			<td ><span id="td6"></span></td>
			<td><input type="text" class="form-control"></td>
			<td><input type="text" class="form-control"></td>
			</tr>
			<tr>
			<td ><span id="td7"></span></td>
			<td><span id="td8"></span></td>
			<td ><span id="td9"></span></td>
			<td><input type="text" class="form-control"></td>
			<td><input type="text" class="form-control"></td>
			</tr>
			<tr>
			<td ><span id="td11"></span></td>
			<td><span id="td22"></span></td>
			<td ><span id="td33"></span></td>
			<td><input type="text" class="form-control"></td>
			<td><input type="text" class="form-control"></td>
			</tr>
			</table>
			</div>
			<div style="text-align: center;">
		<button class="btn btn-info"  type="button"><spring:message code="btn.submit" /></button>
	</div>
			</div>
		</fieldset>
		</div>
		</form>
		<script type="text/javascript">
		function getSelect(param) {
			$.setSelect('currencyCode', param.selectedCurrencyOptions, 'code', 'name');
		}
		function getoffices(param) {
			$.setSelect('officeId', param, 'id', 'name');
		}
		function getbalances(param){
			 $.assign({
					"transactionDate" :$.formatDate(param.transactionDate),
				});
		
				 $("#span1")[0].innerText=param.contraAccount.name;
				 $("#span2")[0].innerText="("+param.contraAccount.glCode+")";
				 for(var i in param.assetAccountOpeningBalances){
					 $("#td1")[0].innerText=param.assetAccountOpeningBalances[i].glAccountType.value;
					 $("#td2")[0].innerText=param.assetAccountOpeningBalances[i].glAccountCode;
					 $("#td3")[0].innerText=param.assetAccountOpeningBalances[i].glAccountName;
					 
				 }
				 for(var a in param.liabityAccountOpeningBalances){
					 $("#td4")[0].innerText=param.liabityAccountOpeningBalances[a].glAccountType.value;
					 $("#td5")[0].innerText=param.liabityAccountOpeningBalances[a].glAccountCode;
					 $("#td6")[0].innerText=param.liabityAccountOpeningBalances[a].glAccountName;
					 
				 }
				 for(var n in param.incomeAccountOpeningBalances){
					 $("#td7")[0].innerText=param.incomeAccountOpeningBalances[n].glAccountType.value;
					 $("#td8")[0].innerText=param.incomeAccountOpeningBalances[n].glAccountCode;
					 $("#td9")[0].innerText=param.incomeAccountOpeningBalances[n].glAccountName;
					 
				 }
				 for(var m in param.expenseAccountOpeningBalances){
					 $("#td11")[0].innerText=param.expenseAccountOpeningBalances[m].glAccountType.value;
					 $("#td22")[0].innerText=param.expenseAccountOpeningBalances[m].glAccountCode;
					 $("#td33")[0].innerText=param.expenseAccountOpeningBalances[m].glAccountName;
					 
				 }
				
				
		} 
		$(document).ready(function(){
			 $("#div").hide();
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.currencies"+"?fields=selectedCurrencyOptions"
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
			 
			 $.getWidget("search").click(function() {	
				 $("#div").show();
					var currencyCode =$("#currencyCode").find("option:selected").attr("value");
					var officeId=parseInt($("#officeId").find("option:selected").attr("value"));
					 $.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							data : {
								'dataType' : "GET",
								'mydata' : "",
								'url' : "api.v1.journalentries.openingbalance?currencyCode="+currencyCode+"&officeId="+officeId
							},
							callback : "getbalances"
							
						});
								
			  }) ;
		});
		
		
		$("#table").on("change","input",function(){
			add();
		});
		
		function add(){
			var num = 0;
			var num2 = 0;
			var tr =$("#table tr");
			for(var i = 1 ; i < tr.length; i++){
				if(parseInt($(tr[i]).find("input")[0].value))
					num += parseInt($(tr[i]).find("input")[0].value);
				if(parseInt($(tr[i]).find("input")[1].value))
					num2 +=parseInt($(tr[i]).find("input")[1].value);
			}
			$("#num")[0].innerText=num;
			$("#num2")[0].innerText=num2;
		}
		</script>