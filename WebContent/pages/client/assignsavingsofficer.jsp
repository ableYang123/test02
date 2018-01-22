<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form class="form-horizontal" name="assignsavingsofficerform" id="assignsavingsofficerform" method="post" style="font-size: small;">

	<div id="mifos-reskin-body-view">
		<div class="">
			<div class="content">
				<div class="toolbar">
					<h4><spring:message code="client.savingaccount.assignFieldOfficer"/></h4>
				</div>
				<br>
				<fieldset>
				<div class="form-group">
					<label class="control-label col-sm-2 ng-binding" for="toSavingsOfficerId"><spring:message code="client.savingaccount.fieldOffice"/><span style="font-size: 14px; color: #d9534f">*</span></label>
					<div class="col-sm-3">
						<select  id="fieldOfficer" name="fieldOfficer" class="form-control" >
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="assignmentDate"><spring:message code="assignment.date"/><span style="font-size: 14px; color: #d9534f">*</span></label>
					<div class="col-sm-3">
						<input type="text" datetype="date" local-date="true" afterToday="true" name="assignmentDate" class="datetime">
					</div>
				</div>
				<div class="col-md-offset-3">
					<button id="save"  type="button" class="btn btn-primary"><spring:message code="btn.submit"/></button>
				</div>
				
<!-- 				<button id="aaa">test</button> -->
				</fieldset>	           
			</div>
		</div>
	</div>
</form>
<hr>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* 日历初始化并设置格式 */
		$.datetimepicker();
		
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.savingsaccounts/"+savingsId+"?template=true"
				},
			callback :"loadback"
		});
		
		
// 		$("#aaa").click(function(){
// 			console.log(parseInt($.value("fieldOfficer")));
// 		})
		
	$.getWidget("save").click(function() {
		var assignmentDate=$.value("assignmentDate");
		var dateFormat=$('input[name="assignmentDate"]').attr('date-format');
		
		
		var json={
				"fromSavingsOfficerId":'',
				"assignmentDate":assignmentDate,
				"locale":"zh_CN",
				"dateFormat":dateFormat,
				"toSavingsOfficerId" : parseInt($.value('fieldOfficer'))
		};
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.savingsaccounts." + savingsId+"?command=assignSavingsOfficer",
				"contentType" : "application/json"
			},
			callback : "assignSuccess"
		});
	});
		
	});
	
	function loadback(param){
		if(param.fieldOfficerOptions!=undefined){
			$.setSelect("fieldOfficer",param.fieldOfficerOptions,'id','displayName');
		}
		
	
		
	}
	
	function assignSuccess(param){
		$.setReadOnly("assignsavingsofficerform");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		var savingsId;
		if(param != null || param.length > 0 || typeof param != 'undefined'){
			savingsId = param.savingsId;
			//window.location.href="loadPage.do?nextPage=client.savingsaccounts&savingsId="+savingsId;
			window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
		}
	}
	
	
	
	


</script>

