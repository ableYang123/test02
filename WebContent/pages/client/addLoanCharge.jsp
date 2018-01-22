<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="loanCharge" name="loanCharge">
				<fieldset>
					<legend><spring:message code="add.loan.Charge"/></legend>
					<div class="form-group col-sm-12">
						<label for="activationReason" class="col-sm-2 control-label"><spring:message code="lable.charges"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="chargeId" name="chargeId">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="col-sm-12 form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id=amount name="amount">
						</div>
					</div>
					<div class="col-sm-12">
						<label class="col-sm-2 control-label"><spring:message code="lable.charge.calculation"/>
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly="readonly" id=info name="info">
						</div>
					</div><br><br>
					<div class="col-sm-12">
						<label class="col-sm-2 control-label"><spring:message code="charge.time"/>
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly="readonly" id="disbursement" name="disbursement">
						</div>
					</div>
					<div id="due" class="col-sm-12 form-group" style="display: none;">
						<label class="col-sm-2 control-label"><spring:message code="lable.dueDate"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="dueDate" placeholder="<spring:message code="lable.dueDate"/>">
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
		var chargeOptions = []; 
		$(document).ready(function() {
				$.datetimepicker();
				$.valid("loanCharge", 
						[ {"name" : "amount","notEmpty" : "不能为空"},
						   {"name" : "chargeId","notEmpty" : "不能为空"},
						   {"name" : "dueDate","notEmpty" : "不能为空"}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+".charges.template"
					},
					callback : "charge"
				});
				
				$.getWidget("chargeId").change(function(){
					var chargeId = $.value('chargeId');
					for(var i=0;i < chargeOptions.length;i++){
						if(chargeId == chargeOptions[i].id){
						$.assign({
							'amount' : chargeOptions[i].amount,
							'info' : chargeOptions[i].chargeCalculationType.value,
							'disbursement' : chargeOptions[i].chargeTimeType.value
						});
						if(chargeOptions[i].chargeTimeType.value == 'Specified due date'){
							$.show('due');
						}else{
							$.hide('due');
						}
						}
					}
					
				});
				
				$.getWidget("save").click(function() {
					var chargeId = parseInt($.value('chargeId'));
					var json = {
								  "amount" : $.value('amount'),								
								  "chargeId":chargeId,
								  "locale":"en",
								  "dateFormat" : $('input[name="dueDate"]').attr('date-format'),
								  "dueDate":$.value('dueDate')
								};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+".charges"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("closeClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
		
		function charge(param){
			console.info(param);
			$.setSelect('chargeId',param.chargeOptions,'id','name');
			chargeOptions = param.chargeOptions;
		}
		
</script>