<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="editStandingInstruction" name="editStandingInstruction">
				<fieldset>
					<legend><spring:message code="lable.create.standing.instruction"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.name"/>
						</label>
						<div class="col-sm-3">
							<input class="form-control" style="border: none;width: auto;" readonly="readonly" type="text" name="name" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.applicant"/>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" readonly="readonly" id=disabledInput name="disabledInput">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.type"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" readonly="readonly" id="transferType" name="transferType">
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
						</label>
						<div class="col-sm-3">
							<input readonly="readonly" class="form-control" id="fromAccountType" name="fromAccountType">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.from.account"/>
						</label>
						<div class="col-sm-3">
							<input readonly="readonly" class="form-control" id="fromAccountId" name="fromAccountId">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.destination"/>
						</label>
						<div class="col-sm-3">
							<span  id="destination" name="destination"></span>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.office"/>
						</label>
						<div class="col-sm-3">
							<input readonly="readonly" class="form-control" id="toOfficeId" name="toOfficeId">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.beneficiary"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input readonly="readonly" class="form-control" id="toClientId" name="toClientId">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.account.type"/>
						<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input readonly="readonly" class="form-control" id="toAccountType" name="toAccountType">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.to.account"/>
						</label>
						<div class="col-sm-3">
							<input readonly="readonly" class="form-control" id="toAccountId" name="toAccountId">
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
							<input type="text" datetype="date" class="form-control" id=validFrom name="validFrom" afterToday="true" beforeToday="true">
						</div>
						<label class="col-sm-2 control-label"><spring:message code="lable.to"/>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" class="form-control" id=validTill name="validTill" beforeToday="true">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><spring:message code="lable.recurrence.type"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-2">
							<select  class="form-control" style="width: auto;" id="recurrenceType" name="recurrenceType">
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
							<input type="text" datetype="date" class="form-control" id="recurrenceOnMonthDay" name="recurrenceOnMonthDay">
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
				$.valid("editStandingInstruction", 
						[ 
						   {"name" : "priority","notEmpty" : "不能为空"},
						   {"name" : "status","notEmpty" : "不能为空"},
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
						"url" : "api.v1.standinginstructions."+standingId+"?associations=template"
					},
					callback : "standing"
				});
				
				$.getWidget("save").click(function() {
					var paymentTypeId = parseInt($.value("paymentTypeId"));
					var json = {
							"amount":$.value('amount'),
							"dateFormat":$('input[name="validFrom"]').attr('date-format'),
							"instructionType":$.value('instructionType'),
							"locale":"en",
							"monthDayFormat":$('input[name="validFrom"]').attr('date-format'),
							"priority":$.value('priority'),
							"recurrenceFrequency":$.value('recurrenceFrequency'),
							"recurrenceInterval":$.value('recurrenceInterval'),
							"recurrenceOnMonthDay":$.value('recurrenceOnMonthDay'),
							"recurrenceType":$.value('recurrenceType'),
							"status":$.value('status'),
							"validFrom":$.value('validFrom'),
							"validTill" : $.value('validTill'),
							}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "PUT",
							"mydata" : json,
							"url" : "api.v1.standinginstructions."+standingId+"?command=update"
						},
						callback : "callback"
					});
				});
			});
		
		function callback(param) {
			$.setReadOnly("standingInstruction");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		function standing(param){
			$.setSelect('priority',param.priorityOptions,'id','value');	
			$('#priority option[value="' + param.priority.id + '"]').attr('selected', true);
			$.setSelect('status',param.statusOptions,'id','value');
			$('#status option[value="' + param.status.id + '"]').attr('selected', true);
			$('#destination').append('Own Account');
			$.setSelect('instructionType',param.instructionTypeOptions,'id','value');
			$('#instructionType option[value="' + param.instructionType.id + '"]').attr('selected', true);
			$.setSelect('recurrenceType',param.recurrenceTypeOptions,'id','value');
			$('#recurrenceType option[value="' + param.recurrenceType.id + '"]').attr('selected', true);
			var validFrom = $.formatDate(param.validFrom);
			$.assign({
				'name' : param.name,
				'disabledInput' : param.fromClient.displayName,
				'transferType' : param.transferType.value,
				'fromAccountType' : param.fromAccountType.value,
				'fromAccountId' : param.fromAccount.productName +'-'+param.fromAccount.accountNo,
				'toOfficeId' : param.toOffice.name,
				'toClientId' : param.toClient.displayName,
				'toAccountType' : param.toAccountType.value,
				'toAccountId' : param.toAccount.productName + '-' + param.toAccount.accountNo,
				'validFrom' : validFrom,
			});
		}
</script>