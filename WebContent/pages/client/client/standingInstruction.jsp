<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="standingInstruction" name="standingInstruction">
				<fieldset>
					<legend><spring:message code="lable.create.standing.instruction"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.name"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="name" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.applicant"/>
						</label>
						<div class="col-sm-3">
							<input type="text" readonly="readonly" class="form-control" id=disabledInput name="disabledInput">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.type"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="transferType" name="transferType">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.priority"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="priority" name="priority">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.status"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="status" name="status">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.from.account.type"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="fromAccountType" name="fromAccountType">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.from.account"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="fromAccountId" name="fromAccountId">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.destination"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="destination" name="destination">
								<option><spring:message code="lable.please.choose"/></option>
								<option><spring:message code="lable.own.account"/></option>
								<option><spring:message code="lable.with.bank"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.office"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="toOfficeId" name="toOfficeId">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.beneficiary"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="toClientId" name="toClientId">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.account.type"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="toAccountType" name="toAccountType">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.account"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="toAccountId" name="toAccountId">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.standing.instruction.type"/>
						</label>
						<div class="col-sm-3">
							<select  class="form-control" id="instructionType" name="instructionType">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.amount"/>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id=transferAmount name="transferAmount">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.validity.from"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" class="form-control" id=validFrom name="validFrom" local-date="" afterToday="" beforeToday="">
						</div>
						<label class="col-sm-2 control-label"><spring:message code="lable.to"/>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" class="form-control" id=validTill name="validTill" local-date="" afterToday="" beforeToday="">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.recurrence.type"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-2">
							<select  class="form-control" id="recurrenceType" name="recurrenceType">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.interval"/>#
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="recurrenceInterval" name="recurrenceInterval">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.recurrence.frequency"/>
						</label>
						<div class="col-sm-2">
							<select  class="form-control" id="recurrenceFrequency" name="recurrenceFrequency">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.on.month.day"/>#
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" class="form-control" id="recurrenceOnMonthDay" name="recurrenceOnMonthDay" local-date="" afterToday="" beforeToday="">
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
		var fromOfficeId;
		var productId;
		var fromAccountTypeId;
		$(document).ready(function() {
				$.valid("standingInstruction", 
						[ {"name" : "name","notEmpty" : "不能为空"},
						   {"name" : "transferType","notEmpty" : "不能为空"},
						   {"name" : "priority","notEmpty" : "不能为空"},
						   {"name" : "status","notEmpty" : "不能为空"},
						   {"name" : "fromAccountType","notEmpty" : "不能为空"},
						   {"name" : "fromAccountId","notEmpty" : "不能为空"},
						   {"name" : "destination","notEmpty" : "不能为空"},
						   {"name" : "toOfficeId","notEmpty" : "不能为空"},
						   {"name" : "toClientId","notEmpty" : "不能为空"},
						   {"name" : "toAccountType","notEmpty" : "不能为空"},
						   {"name" : "toAccountId","notEmpty" : "不能为空"},
						   {"name" : "validFrom","notEmpty" : "不能为空"},
						   {"name" : "recurrenceType","notEmpty" : "不能为空"},]);
				$.datetimepicker();
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId
					},
					callback : "officeId"
				});
				$.getWidget("transferType").change(function(){
					var transferType = parseInt($.value("transferType"));
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.standinginstructions.template?fromAccountType=2&fromClientId="+clientId+
									"&fromOfficeId="+fromOfficeId+"&transferType="+transferType
						},
						callback : "fromAccountType"
					});
				});
				$.getWidget("fromAccountType").change(function(){
					fromAccountTypeId = parseInt($.value("fromAccountType"));
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.standinginstructions.template?fromAccountType="+fromAccountTypeId+"&fromClientId="+clientId+"&fromOfficeId="+fromOfficeId
						},
						callback : "fromAccount"
					});
				});
				$.getWidget("toOfficeId").change(function(){
					var toOfficeId = parseInt($.value("toOfficeId"));
					fromAccountTypeId = parseInt($.value("fromAccountType"));
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.standinginstructions.template?fromAccountType="+fromAccountTypeId+"&fromClientId="+clientId+"&fromOfficeId="+fromOfficeId+"&toOfficeId="+toOfficeId
						},
						callback : "toClientOptions"
					});
				});
				$.getWidget("toAccountType").change(function(){
					var toAccountTypeId = parseInt($.value("toAccountType"));
					var toClientId = parseInt($.value("toClientId"));
					var toOfficeId = parseInt($.value("toOfficeId"));
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.standinginstructions.template?fromAccountType="+fromAccountTypeId+"&fromClientId="+clientId+
									"&fromOfficeId="+fromOfficeId+"&toAccountType="+toAccountTypeId+"&toClientId="+toClientId+"&toOfficeId="+toOfficeId
						},
						callback : "toAccount"
					});
				});
				$.getWidget("save").click(function() {
					var paymentTypeId = parseInt($.value("paymentTypeId"));
					var json = {
							"fromOfficeId":fromOfficeId,
							"fromClientId":clientId,
							"fromAccountType":$.value('fromAccountType'),
							"name":"$.value('name')",
							"transferType":$.value('transferType'),
							"priority":$.value('priority'),
							"status":$.value('status'),
							"fromAccountId":$.value('fromAccountId'),
							"destination" : $.value('destination'),
							"toOfficeId":$.value('toOfficeId'),
							"toClientId":$.value('toClientId'),
							"toAccountType":$.value('toAccountType'),
							"toAccountId":$.value('toAccountId'),
							"instructionType":$.value('instructionType'),
							"amount":$.value('amount'),
							"validFrom":$.value('validFrom'),
							"recurrenceType":$.value('recurrenceType'),
							"recurrenceInterval":$.value('recurrenceInterval'),
							"recurrenceFrequency":$.value('recurrenceFrequency'),
							"locale":"en",
							"dateFormat":$('input[name="validFrom"]').attr('date-format'),
							"recurrenceOnMonthDay":$.value('recurrenceOnMonthDay'),
							"monthDayFormat":$('input[name="validFrom"]').attr('date-format')
							}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.standinginstructions"
						},
						callback : "callback"
					});
				});
			});
		
		function callback(param) {
			$.setReadOnly("standingInstruction");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		function officeId(param){
			fromOfficeId = param.officeId;
			$.assign({
				"disabledInput" : param.displayName
			});
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.standinginstructions.template?fromAccountType=2&fromClientId="+clientId+"&fromOfficeId="+fromOfficeId
				},
				callback : "standingInstruction"
			});
		}
		
		function standingInstruction(param){
			$.setSelect('transferType',param.transferTypeOptions,'id','value');
			$.setSelect('priority',param.priorityOptions,'id','value');
			$.setSelect('status',param.statusOptions,'id','value');
			$.setSelect('fromAccountType',param.fromAccountTypeOptions,'id','value');
			$.setSelect('fromAccountId',param.fromAccountOptions,'id','productName');
			
	//		$.setSelect('destination',param.destinationOptions,'id','value');
			$.setSelect('toOfficeId',param.toOfficeOptions,'id','name');
			
			$.setSelect('toAccountType',param.fromAccountTypeOptions,'id','value');
			$.setSelect('instructionType',param.instructionTypeOptions,'id','value');
			
			$.setSelect('recurrenceType',param.recurrenceTypeOptions,'id','value');
			$.setSelect('recurrenceFrequency',param.recurrenceFrequencyOptions,'id','value');
			
			$('#fromAccountType option[value="'+param.fromAccountType.id+'"]').attr('selected',true);
		}
		
		function fromAccountType(param){
			$.setSelect('fromAccountType',param.fromAccountTypeOptions,'id','value');
			$.setSelect('toAccountType',param.toAccountTypeOptions,'id','value');
		}
		
		function fromAccount(param){
			$.setSelect('fromAccountId',param.fromAccountOptions,'id','productName');
		}
		
		function toClientOptions(param){
			$.setSelect('toClientId',param.toClientOptions,'id','displayName');
		}
		
		function toAccount(param){
			$.setSelect('toAccountId',param.toAccountOptions,'id','productName'+'-'+'accountNo');
		}
</script>