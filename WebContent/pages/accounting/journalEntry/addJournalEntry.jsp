<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id=addJournalEntry name="addJournalEntry">
	<div class="container">
<fieldset>
		<legend>
			<spring:message code="Add.Journal.Entry" />
		</legend>
		
		<div class="form-group">
			<label for="officeId" class="col-sm-2 control-label"><spring:message code="lable.office" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="officeId" name="officeId" class="form-control" style="width: 198px;">
				<option><spring:message code="label.user.selectOffice"/></option>
				</select>
			</div>
			<label for="currencyCode" class="col-sm-2 control-label"><spring:message code="deposit.label.currency" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select id="currencyCode" name="currencyCode" class="form-control" style="width: 198px;">
				</select>
			</div>
			</div>
			<div id="divCode">
			<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="Affected.GLentries" /><span style="color: #d9534f;">*</span> </label>
			</div>
			<div class="form-group">
			<label  class="col-sm-2 col-sm-offset-1 control-label"><spring:message code="borrow" /> </label> 
			<div class="col-sm-4"><button type="button" class="btn btn-link" id="addtable"><span class="glyphicon glyphicon-plus"></span></button>
			
			<table id="table">
			<tr>
	<td><select id="debits" class="form-control" style="width: 180px;"></select></td>
	<td><input  type="text" class="form-control" style="width:200px;"></td>
	<td>
							<button type="button" class="btn btn-link " id="delTable">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
	</tr></table></div>
			</div>			
			<div class="form-group">
			<label  class="col-sm-2 col-sm-offset-1 control-label"><spring:message code="Credit.Card" /></label>			
			<div class="col-sm-4"><button type="button" class="btn btn-link " id="addTable"><span class="glyphicon glyphicon-plus"></span></button>		
				
			<table id="Table">
			<tr>
	<td><select id="debits2" class="form-control" style="width:180px;"></select></td>
	<td><input  type="text" class="form-control" style="width:200px;"></td>
	<td>
							<button type="button" class="btn btn-link" id="delTable2" >
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</td>
	</tr></table></div>
			</div>
			</div>
			<div class="form-group">
			<label for="referenceNumber" class="col-sm-2 control-label"><spring:message code="Reference.number" /></label>
			<div class="col-sm-3">
				<input type="text" id="referenceNumber" name="referenceNumber" class="form-control">
			</div>
			<label for="transactionDate" class="col-sm-2 control-label"><spring:message code="transactionDate" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" id="transactionDate" name="transactionDate" class="form-control" datetype="date" beforeToday="false">
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label"><spring:message code="Display.payment.details" /></label>
		   <span class="glyphicon glyphicon-plus" id="add"></span>
		   <span class="glyphicon glyphicon-minus" id="del" ></span>
			</div>
			<div id="div">
			<div class="form-group">
			<label for="paymentTypeId" class="col-sm-2 control-label"><spring:message code="payment.type" /></label>
			<div class="col-sm-3">
				<select  id="paymentTypeId" name="paymentTypeId" class="form-control" style="width: 198px;"></select>
			</div>
			<label for="accountNumber" class="col-sm-2 control-label"><spring:message code="amount" /></label>
			<div class="col-sm-3">
				<input type="text" id="accountNumber" name="accountNumber" class="form-control">
			</div>
			</div>
				<div class="form-group">
			<label for="checkNumber" class="col-sm-2 control-label"><spring:message code="check" />#</label>
			<div class="col-sm-3">
				<input type="text"  id="checkNumber" name="checkNumber" class="form-control">
			</div>
			<label for="routingCode" class="col-sm-2 control-label"><spring:message code="Routing.code" />#</label>
			<div class="col-sm-3">
				<input type="text" id="routingCode" name="routingCode" class="form-control">
			</div>
			</div>
			
					<div class="form-group">
			<label for="receiptNumber" class="col-sm-2 control-label"><spring:message code="receipt" />#</label>
			<div class="col-sm-3">
				<input type="text"  id="receiptNumber" name="receiptNumber" class="form-control">
			</div>
			<label for="bankNumber" class="col-sm-2 control-label"><spring:message code="bank" />#</label>
			<div class="col-sm-3">
				<input type="text" id="bankNumber" name="bankNumber" class="form-control">
			</div>
			</div>
			</div>
			<div class="form-group">
			<label for="comments" class="col-sm-2 control-label"><spring:message code="Comments" /></label>
			<div class="col-sm-3">
				<textarea  id="comments" name="comments" class="form-control" rows="8"></textarea>
			</div>
			</div>
			<div class="form-group ">
			<button class="btn btn-info col-sm-1 col-sm-offset-5 " id="submit" type="button"><spring:message code="btn.submit" /></button>
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
		function getRulesType(param) {
			$.setSelect('paymentTypeId', param, 'id', 'name');
		}
		function getRules(param) {
			$.setSelect('debits', param, 'id', 'name');
			$.setSelect('debits2', param, 'id', 'name');
		}
		$(document).ready(function(){
			$("#del").hide();
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
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.paymenttypes"
					},
					callback : "getRulesType"
				}); 
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.glaccounts"+"?disabled=false&manualEntriesAllowed=true&usage=1"
					},
					callback : "getRules"
				}); 
			 $.getWidget("submit").click(function() {			
					var currency =$("#currencyCode").find("option:selected").attr("value");
					var officeId=$("#officeId").find("option:selected").attr("value");
					var debits=[];
					debits.push({"glAccountId":$("#debits").find("option:selected").attr("value"),"amount":1});
					var credits=[];
					credits.push({"glAccountId":$("#debits2").find("option:selected").attr("value"),"amount":1});
					var date;
					date={
							"currencyCode":currency,
							"debits":debits,
							"credits":credits,
							"officeId":officeId,
							"dateFormat" : $('input[name="transactionDate"]').attr('date-format'),
							"transactionDate" : $('input[name="transactionDate"]').val(),
							"locale":"en",
							
					}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
							'dataType' : "POST",
							'mydata' : date,
							'url' : 'api.v1.journalentries'
						},
						callback : "callbackadd"				
					});
			 })
			 $.datetimepicker();
		});
		$("#add").click(function(){
		  $("#div").show();
			$("#del").show();
			 $("#add").hide();
		})	
			$("#del").click(function(){
		  $("#div").hide();
			$("#add").show();
			 $("#del").hide();
		})
$("#delTable").click(function() {  
            var link = $(this).parents("tr");  
            link.hide();  
        }); 
		$("#delTable2").click(function() {  
            var link = $(this).parents("tr");  
            link.hide();  
        });

$("#addTable").click(function() {	
	$.tableclone("Table")
})
$("#addtable").click(function() {	
	$.tableclone("table")
})
function callbackadd(param) {
	$.setReadOnly("addJournalEntry");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
</script>