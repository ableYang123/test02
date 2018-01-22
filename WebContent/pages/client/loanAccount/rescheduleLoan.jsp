<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<form class="form-horizontal" id="reschedule" name="reschedule">
		<fieldset>
			<legend><spring:message code="lable.reschedule.loan"/></legend>
			<div class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.reschedule.from.installment.on"/>
					<span style="font-size: 14px; color: #d9534f">*</span>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" datetype="date" name="rescheduleFromDate">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.reason.for.rescheduling"/>
					<span style="font-size: 14px; color: #d9534f">*</span>
				</label>
				<div class="col-sm-3">
					<select class="form-control" name="rescheduleReasonId" id="rescheduleReasonId">
						<option selected="selected"><spring:message code="lable.please.choose"/></option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.submitDate"/>
					<span style="font-size: 14px; color: #d9534f">*</span>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" datetype="date" name="submittedOnDate" locale-date="true">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.comments"/>
				</label>
				<div class="col-sm-3">
					<textarea name="comments" id="comments" rows="3" cols="20"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<input type="checkbox" name="changeRepaymentDate" id="changeRepaymentDate" >
				</div>
				<label class="col-sm-2 control-label"> <spring:message code="lable.change.repayment.date"/>
				</label>
			</div>
			<div id="toDate" style="display: none;" class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.installment.reschedule.to"/>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" datetype="date" name="adjustedDueDate">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<input type="checkbox" name="introduceGracePeriods" id="introduceGracePeriods" >
				</div>
				<label class="col-sm-2 control-label"> <spring:message code="lable.introdece.mid-term.grace.periods"/>
				</label>
			</div>
			<div id="gacePeriod" style="display: none;" class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.principal.grace.periods"/>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="principalgrace">
				</div>
			</div>
			<div id="interestPeriod" style="display: none;" class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.interest.grace.periods"/>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="interestgrace">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<input type="checkbox" name="extendRepaymentPeriod" id="extendRepaymentPeriod" >
				</div>
				<label class="col-sm-2 control-label"> <spring:message code="lable.extend.repayment.period"/>
				</label>
			</div>
			<div id="number" style="display: none;" class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.number.of.new.repayment"/>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="newrepayments">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<input type="checkbox" name="adjustinterestrates" id="adjustinterestrates" >
				</div>
				<label class="col-sm-2 control-label"> <spring:message code="lable.adjust.interest.rates.for.remainder.of.loan"/>
				</label>
			</div>
			<div id="rate" style="display: none;" class="form-group">
				<label class="col-sm-2 control-label"> <spring:message code="lable.new.interest.rate"/>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="newrepayments">
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
	$('#changeRepaymentDate').click(function(){
		var flag1 = $('#changeRepaymentDate').is(':checked');
		if(flag1 == true){
			$.show('toDate');
		}else{
			$.hide('toDate');
		}
	});
	$('#introduceGracePeriods').click(function(){
		var flag2 = $('#introduceGracePeriods').is(':checked');
		if(flag2 == true){
			$.show('gacePeriod');
			$.show('interestPeriod');
		}else{
			$.hide('gacePeriod');
			$.hide('interestPeriod');
		}
	});
	$('#extendRepaymentPeriod').click(function(){
		var flag3 = $('#extendRepaymentPeriod').is(':checked');
		if(flag3 == true){
			$.show('number');
		}else{
			$.hide('number');
		}
	});
	$('#adjustinterestrates').click(function(){
		var flag4 = $('#adjustinterestrates').is(':checked');
		if(flag4 == true){
			$.show('rate');
		}else{
			$.hide('rate');
		}
	});
	 $(document).ready(function() {
		$.valid("reschedule", [ {
			"name" : "rescheduleFromDate",
			"notEmpty" : "不能为空"
		},
		{
			"name" : "rescheduleReasonId",
			"notEmpty" : "不能为空"
		},
		{
			"name" : "submittedOnDate",
			"notEmpty" : "不能为空"
		}]);
		
		$.datetimepicker();
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.rescheduleloans.template"
			},
			callback : "amount"
		});
		$.getWidget("save").click(function() {
			var json = {
					"dateFormat":$('input[name="rescheduleFromDate"]').attr('date-format'),
					"locale":"en",
					"adjustedDueDate": $.value('adjustedDueDate'),
					"extraTerms":$.value('newrepayments'),
					"graceOnInterest":$.value('interestgrace'),
					"graceOnPrincipal":$.value('principalgrace'),
					"loanId":loanId,
					"newInterestRate":$.value('newinterestrate'),
					"rescheduleFromDate":$.value('rescheduleFromDate'),
					"rescheduleReasonComment":$.value('comments'),
					"rescheduleReasonId":$.value('rescheduleReasonId'),
					"submittedOnDate" :$.value('submittedOnDate')
					};
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : json,
					"url" : "api.v1.rescheduleloans?command=reschedule"
				},
				callback : "callback"
			});
		}); 
	});
	function amount(param){
		$.setSelect('rescheduleReasonId',param,'id','name');
	}
	function callback(param) {
		$.setReadOnly("approve");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		if(param != '' || param != null){
			var loanId = param.loanId;
			window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
		}
	}
</script>