<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<form class="form-horizontal" id="closeSavingAccount" name="closeSavingAccount" style="font-size: small;">
	<fieldset>
		<legend> <spring:message code="client.savingaccount.closeSavingAccount"/></legend>
		<div class="form-group">
			<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.closedOn"/>
				<span style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" datetype="date" name="closedOnDate" afterToday="true">
			</div>
		</div>
							
		<div class="form-group">
			<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.withdrawBalance"/>
				<span style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
				<input type="checkbox"  name="withdrawBalance" id="withdrawBalance" >
			</div>
		</div>
							
		<div class="form-group">
			<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.interestPosting"/>
				<span style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
				<input type="checkbox"  name="postInterestValidationOnClosure" >
			</div>
		</div>
							
							
		<div id="withdrawBalanceBlock" style="display: none;">	
		
			<div class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.amount"/>
					<span style="font-size: 14px; color: #d9534f">*</span>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" readonly="readonly" id="withdrawBalan" >
				</div>
			</div>
										
			<div class="form-group">
				<label class="col-sm-2 control-label"><spring:message code="lable.payment.type"/></label>
				<div class="col-sm-3">
					<select id="paymentTypelist" class="form-control">
						<option selected="selected"><spring:message code="lable.please.choose"/></option>
					</select>
				</div>
			</div>
							
			<div class="form-group">
				<label class="col-sm-2 control-label"><spring:message code="lable.show.payment.details"/></label>
				<div class="col-sm-3">
					<a class="glyphicon glyphicon-plus btn btn-primary" aria-hidden="true" id="showPaymentDetails" style="background-color:#4f99ed"/>
				</div>
			</div>
										
			<div id="paymentDetails" style="display: none">
			
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="lable.Account"/>#</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="accountNumber" >
					</div>
				</div>
									
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="lable.cheque"/>#</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="checkNumber" >
					</div>
				</div>
										
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="lable.routing.code"/></label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="routingCode" >
					</div>
				</div>
										
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="lable.receipt"/>#</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="receiptNumber" >
					</div>
				</div>
										
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message code="lable.bankNumber"/>#</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="bankNumber" >
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"> <spring:message code="lable.notess"/>
			</label>
			<div class="col-sm-3">
				<textarea name="note" id="note" rows="3" cols="20"></textarea>
			</div>
		</div>
						
		<div class="form-group">
			<div class="text-right" style="padding-right: 80px">
				<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
		$(document).ready(function() {
			
			$("#withdrawBalance").click(function(){
				if($("#withdrawBalance").is(':checked')==true){
					$("#withdrawBalanceBlock").css("display","");
				}else{
					$("#withdrawBalanceBlock").css("display","none");
				}
			})

			$.valid("accountDeposit", [ {
				"name" : "closedOnDate",
				"notEmpty" : "不能为空"
			}],[ {
				"name" : "transactionAmount",
				"notEmpty" : "不能为空"
			}]);
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+savingsId+".transactions.template"
				},
				callback : "callback"
			});
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+savingsId+"?fields=summary"
				},
				callback : "cloCallback"
			});
			
			
			
			$("#showPaymentDetails").click(function(){
				$("#paymentDetails").toggle();
				$("#showPaymentDetails").attr("class")=="glyphicon glyphicon-plus btn btn-primary"?$("#showPaymentDetails").attr("class","glyphicon glyphicon-minus btn btn-primary"):$("#showPaymentDetails").attr("class","glyphicon glyphicon-plus btn btn-primary");
// 				glyphicon glyphicon-minus
			})
		});
			
		
		function cloCallback(param){
			$("#withdrawBalan").prop("value",param.summary.accountBalance);
		}
		
		
		
		function callback(param){
			
			$.setSelect("paymentTypelist",param.paymentTypeOptions,'id','name');
			
			$.getWidget("save").click(function() {
				var withdrawBalance;
				var postInterestValidationOnClosure;
				
				if($("#withdrawBalance").is(':checked')==true){
					withdrawBalance=true;
				}else{
					withdrawBalance=false;
				}
				
				if($("#postInterestValidationOnClosure").is(':checked')==true){
					postInterestValidationOnClosure=true;
				}else{
					postInterestValidationOnClosure=false;
				}
				
				
				
				var json={
						"closedOnDate":$.value("closedOnDate"),
						"paymentTypeId":parseInt($.value("paymentTypelist")),
						"accountNumber":$.value("accountNumber"),
						"checkNumber":$.value("checkNumber"),
						"routingCode":$.value("routingCode"),
						"receiptNumber":$.value("receiptNumber"),
						"bankNumber":$.value("bankNumber"),
						"locale":"en",
						"note":$.value("note"),
						"dateFormat":$('input[name="closedOnDate"]').attr('date-format'),
						"postInterestValidationOnClosure":postInterestValidationOnClosure,
						"withdrawBalance":withdrawBalance
				};

				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.savingsaccounts."+savingsId+"?command=close"
					},
					callback : "close_success"
				});
			});
		}
			
		function close_success(param) {
			$.setReadOnly("closeSavingAccount");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
</script>