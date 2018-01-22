<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
<div class='div-cc'>
			<form class="form-horizontal" id="bulkLoanReassignment" name="bulkLoanReassignment" method="post">
				<fieldset>
					<legend><spring:message code="menu.admin.bulkLoanReassignment"/></legend>
					
					
					<div class="form-group">
						<label class="col-sm-3 control-label"> <spring:message code="lable.office"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="office" name=""office"" class="form-control"
								style="width: 198">
								<option value='' selected><spring:message code="label.user.selectOffice"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.bulkLoan.assignDate"/> <span
							style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <input type="text" datetype="date" name="assignmentDate"  local-date="true" afterToday="" beforeToday=" "/>  
						</div>
					</div>
					
					<div id="fromLoanOfficer" class="form-group" style="display: none;">
						<label class="col-sm-3 control-label"><spring:message code="label.bulkLoan.fromLoan"/> 
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="fromLoanOfficerId" name="fromLoanOfficerId" class="form-control"
								style="width: 198">
								<option value='' selected>
								<spring:message code="fund.search.selectOne"/>
								</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.bulkLoan.toLoan"/>  
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="toLoanOfficerId" name="toLoanOfficerId" class="form-control"
								style="width: 198">
								<option value='' selected><spring:message code="fund.search.selectOne"/></option>
							</select>
						</div>
					</div>
					
					<div class="container" style="display: none;">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<table id="clients">
									<thead>
										<tr><th><spring:message code="label.bulkLoan.client"/></th></tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<table id="groups">
									<thead>
										<tr><th><spring:message code="label.bulkLoan.group"/></th></tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-4">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
</div>
		<script type="text/javascript">
		
			var loanOfficerOptions;
			var officeId;
			
			$.valid('bulkLoanReassignment',[{
				"name" : "office",
				"notEmpty" : ""
			}]);
			
			$(document).ready(function(){
				
				/*
				*  验证
				*/
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				
				/* 加载页面初始化 */
				init();
				
				/* 办公室下拉框change事件 */
				$.getWidget('office').change(function(){
					$('#fromLoanOfficerId option:not(:first)').remove();
					$('#toLoanOfficerId option:not(:first)').remove();
					var val = parseInt($(this).val());
					
					if(!$.isEmpty(val) && !isNaN(val)){
						officeId = val;
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.loans.loanreassignment.template?officeId=" + officeId
							},
							callback : "getTemplate"
						});
					}else{
						return false;
					}
				});
				
				/* from loan officer下拉框change事件 */
				$.getWidget('fromLoanOfficerId').change(function(){
					var val = parseInt($(this).val());
					
					if(!$.isEmpty(val) && !isNaN(val)){
						var fromLoanOfficerId = val;
						var option = [];
						$.each(loanOfficerOptions,function(index,item){
							if(item.id != fromLoanOfficerId){
								option.push(item);
							}
						});
						
						$.setSelect('toLoanOfficerId',option,'id','displayName');
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.loans.loanreassignment.template?fromLoanOfficerId="+ fromLoanOfficerId +"&officeId=" + officeId
							},
							callback : "getSummary"
						});
					}else{
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.loans.loanreassignment.template?officeId=" + officeId
							},
							callback : "getTemplate"
						});
					}
				});
				
				/* 创建办公室表单提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("bulkLoanReassignment")) {
						
						//var assignmentDate = $('input[name="assignmentDate"]').val();
						var dateFormat = $('input[name="assignmentDate"]').attr('date-format');
						var assignmentDate = $.value('assignmentDate');
						var fromLoanOfficerId = parseInt($.value('fromLoanOfficerId'));
						var toLoanOfficerId = parseInt($.value('toLoanOfficerId'));
						
						
						/* 判断是否选择 From loan officer */
						if(isNaN(fromLoanOfficerId)){
							$.bAlert($.fn.bootstrapValidator.i18n.loanReassign.selectFromLoanOfficer);
							return false;
						}
						
						
						/* 判断是否选择To loan officer */
						if(isNaN(toLoanOfficerId)){
							$.bAlert($.fn.bootstrapValidator.i18n.loanReassign.selectToLoanOfficer);
							return false;
						}
						
						var loans = [];
						
						$('tr[name="repeat-client"]').each(function(){
							var child_node_arr = $(this).find('input[type="checkbox"]');
							$.each(child_node_arr,function(idx,item){
								if($(item).is(':checked')){
									var code = $(item).attr('code');
									loans.push(code);
								}
							});
						});
						$('tr[name="repeat-group"]').each(function(){
							var child_node_arr = $(this).find('input[type="checkbox"]');
							$.each(child_node_arr,function(idx,item){
								if($(item).is(':checked')){
									var code = $(item).attr('code');
									loans.push(code);
								}
							});
						});
						
						if(loans.length <= 0){
							$.bAlert($.fn.bootstrapValidator.i18n.loanReassign.assignLoansForOfficer);
							return false;
						}
						var request_json = {
								"locale" : $.getLocale(),
								"dateFormat" : $.getDateFormat(),
								"assignmentDate" : assignmentDate,
								"fromLoanOfficerId" : fromLoanOfficerId,
								"toLoanOfficerId" : toLoanOfficerId,
								"loans" : loans
						};
						console.log(request_json);
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : false,
					
							data : {
								"dataType" : "POST",
								"mydata" : request_json,
								"url" : "api.v1.loans.loanreassignment",
								"contentType" : "application/json"
							},
							callback : "assign_success"
						});
						
					}
				});
			});	
			
			function init(){
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.offices"
					},
					callback : "callback"
				});
			}
			
			function callback(param){
				//将返回数据填充到办公室下拉框
				$.setSelect('office',param,'id','name');
			}
			
			function getTemplate(param){
				loanOfficerOptions = param.loanOfficerOptions;
				$('#toLoanOfficerId option:not(:first)').remove();
				$('#toLoanOfficerId option:first').attr('selected','selected');
				$.setSelect('fromLoanOfficerId',loanOfficerOptions,'id','displayName');
				$('#fromLoanOfficer').css('display','block');
			}
		
			function getSummary(param){
				var clientsOption = param.accountSummaryCollection.clients;
				var groupsOption = param.accountSummaryCollection.groups;
				var str1 = '';
				var str2 = '';
				$.each(clientsOption,function(index,item){
					str1 += '<tr name="repeat-client">';
					str1 += '<td><table><tbody>'
					str1 += '<tr code='+ item.id +'><td><label class="control-label">'+item.displayName+'</label></td></tr>';
					
					$.each(item.loans,function(idx,element){
						str1 += '<tr><td>';
						str1 += '<input type="checkbox" code="'+ element.id+'" value='+ element.productId +'/>' + element.productName+'('+ element.accountNo +')';
						str1 += '</td></tr>';
					});
					str1 += '</tbody></table></td></tr>';
				});
				$.each(groupsOption,function(index,item){
					str2 += '<tr name="repeat-group">';
					str2 += '<td><table><tbody>'
					str2 += '<tr code='+ item.id +'><td><label class="control-label">'+item.displayName+'</label></td></tr>';
					
					$.each(item.loans,function(idx,element){
						str2 += '<tr><td>';
						str2 += '<input type="checkbox" code="'+ element.id+'" value='+ element.productId +'/>' + element.productName+'('+ element.accountNo +')';
						str2 += '</td></tr>';
					});
					str2 += '</tbody></table></td></tr>';
				});
				$('#clients tbody').append(str1);
				$('#groups tbody').append(str2);
				
				$('.container').show();
			}
			
			function assign_success(param){
				$.setReadOnly('bulkLoanReassignment');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				history.go(0);
			}
		</script>
</body>
</html>

	

