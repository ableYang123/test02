<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="assignLoanOfficer" name="assignLoanOfficer">
				<fieldset>
					<legend><spring:message code="lable.assign.loan.officer"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="to.loan.officer"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id=toLoanOfficerId
								name="toLoanOfficerId">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="assignment.date"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="assignmentDate">
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
				$.valid("assignLoanOfficer", [ {
					"name" : "toLoanOfficerId",
					"notEmpty" : "不能为空"
				},{
					"name" : "assignmentDate",
					"notEmpty" : "不能为空"
				}]);
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+"?fields=id,loanOfficerId,loanOfficerOptions&staffInSelectedOfficeOnly=true&template=true"
					},
					callback : "officer"
				});
				$.getWidget("save").click(function() {
					var toLoanOfficerId = parseInt($.value("toLoanOfficerId"));
					var json = {
							  	"toLoanOfficerId": toLoanOfficerId,
							  	"dateFormat" : $('input[name="assignmentDate"]').attr('date-format'),
							  	"assignmentDate" : $.value('assignmentDate'),
							  	"fromLoanOfficerId" : "",
							  	"locale" : "en"
								}
					
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+"?command=assignloanofficer"
						},
						callback : "callback"
					});
				});
		});
		function officer(param){
			$.setSelect('toLoanOfficerId', param.loanOfficerOptions, 'id', 'displayName');
		}
		function callback(param) {
			$.setReadOnly("assignStaffClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			/* init(); */
			var loanId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.detail&loanId="+loanId;
			}
		}
</script>