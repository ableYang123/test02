<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//Ddiv HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
<div class='div-cc'>
			<form class="form-horizontal" id="workingdaysform" name="workingdaysform" method="post">
				<fieldset>
					<legend><spring:message code="menu.admin.workingDays"/></legend>
						<label class="control-label col-sm-3" width="20"><spring:message code="menu.admin.workingDays"/>:</label>
						
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="MO" type="checkbox"/>
							<label><spring:message code="label.work.monday"/></label>
						</div>
					
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="TU" type="checkbox"/>
							<label><spring:message code="label.work.tuesday"/></label>
						</div>
					
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="WE" type="checkbox"/>
							<label><spring:message code="label.work.wednesday"/></label>
						</div>
					
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="TU" type="checkbox"/>
							<label><spring:message code="label.work.thursday"/></label>
						</div>
					
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="FR" type="checkbox"/>
							<label><spring:message code="label.work.friday"/></label>
						</div>
					
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="SA" type="checkbox"/>
							<label><spring:message code="label.work.saturday"/></label>
						</div>
					
						<div class="form-group">
							<label class="control-label col-sm-3"></label>
							<input class="control-label" label="SU" type="checkbox"/>
							<label><spring:message code="label.work.sunday"/></label>
						</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3">
							<spring:message code="label.work.nonWorking" />
						</label>
						<div class="col-sm-4">
							<select id="repaymentReschedule" class="form-control"></select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3">
							<spring:message code="label.work.following" />
						</label>
						<div class="col-sm-3">
							<input type="checkbox" id="following"/>
						</div>
					</div>	
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary">Submit</button>
						</div>
					</div>
				</fieldset>
			</form>
</div>
		<script type="text/javascript">
			var repayType;
			$(document).ready(function(){
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				
				/* 加载页面初始化 */
				init();
				
				
				/* 提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("workingdaysform")) {
						
						var recurrence = "FREQ=WEEKLY;INTERVAL=1;BYDAY=";
						var special = [];
						$('input.control-label').each(function(){
							if($(this).is(':checked')){
								special.push($(this).attr('label'));
							}
						});
						if(special.length <= 0){
							recurrence += ',' ;
						}else{
							recurrence += special.join(',');
						}
						
						var repaymentRescheduleType;
						
						if(typeof repaymentRescheduleType == null || typeof repaymentRescheduleType == 'undefined'){
							repaymentRescheduleType = parseInt(repayType);
						}else{
							repaymentRescheduleType = parseInt($.value('repaymentReschedule'));
						}
						
						var extendTermForDailyRepayments = $('#following').is(':checked');
						
						var request_json = {
								"recurrence" : recurrence,
								"locale" : "zh_CN",
								"repaymentRescheduleType" : repaymentRescheduleType,
								"extendTermForDailyRepayments" : extendTermForDailyRepayments
						};
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : request_json,
								"url" : "api.v1.workingdays"
							},
							callback : "edit_success"
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
						"url" : "api.v1.workingdays"
					},
					callback : "callback"
				});
			}
			
			function callback(param){
				$.setSelect('repaymentReschedule',param.repaymentRescheduleOptions,'id','value');
				repayType = param.repaymentRescheduleType.id;
				$.assign({
					"repaymentReschedule" : param.repaymentRescheduleType.id
				});
				
				$('#following').attr('checked',param.extendTermForDailyRepayments);
				var equalValue = $.isContains(param.recurrence,'=');
				var codeValue = $.isContains('\u003d');
				if(equalValue ||codeValue ){
					if(equalValue){
						var arr = param.recurrence.split(';',3);
						var days = arr[2].split('=',2);
						var workingday = days[1].split(',');
						$.each(workingday,function(index,item){
							$('input[label="'+ item +'"]').attr('checked',true);
						});
					}else{
						var arr = param.recurrence.split(';',3);
						var days = arr[2].split('\u003d',2);
						var workingday = days[1].split(',');
						$.each(workingday,function(index,item){
							$('input[label="'+ item +'"]').attr('checked',true);
						});
					}
				}
				
				
				
			}
			
			function edit_success(param){
				$.setReadOnly('editcashierform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				history.go(0);
			}
		</script>
</body>
</html>

	

