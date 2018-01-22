<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="editholidayform" name="editholidayform" method="post">
				<fieldset>
					<legend><spring:message code="label.holiday.editHoliday"/></legend>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.holidayName"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
						</div>
					</div>
				<div label="type:2" style="display:none">
						<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.fromDate" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" datetype="date" name="fromDate"  local-date="true" afterToday="false" beforeToday="true"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.toDate" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" name="toDate"  local-date="true" afterToday="false" beforeToday="true"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.repaymentType" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <select id="repaymentSchedulingRuleType" name="schedulingRule" class="form-control">
						   	  </select>
						</div>
					</div>
					<div class="form-group" id="reschedulDate">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.repaymentTo" />
							<span style="color: #d9534f;">*</span>
						</label>
						
						<div class="col-sm-3">
							<input type="text" datetype="date" name="repaymentScheduledTo"  local-date="true" afterToday="false" beforeToday="false"/>
						</div>
					</div>
				</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.description"/>
						</label>
						
						<div class="col-sm-3">
							<input id="description" name="description" type="text" value='' class="form-control"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
		<script type="text/javascript">
			var type;
			$(document).ready(function(){
			
				$.valid("editholidayform",[{
					"name" : "name",
					"notEmpty" : ""
				}]); 
				$.datetimepicker();
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.holidays." + holidayId
					},
					callback : "editback"
				});
				
				$.assign({
					"name" : holidayName
				});
				
				$.getWidget('repaymentSchedulingRuleType').change(function(){
					if($(this).val() == '1'){
						$('#reschedulDate').css('display','none');
					}else if($(this).val() == '2'){
						$('#reschedulDate').css('display','block');
					}
				});
				
				/* $('#name').val(holidayName); */
				/* 编辑办公室表单提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("editholidayform")) {
						var json = {};
						//已经激活了
						if(type == '2'){
							json =  {
									"name" : $.value('name')
							};
							if(!$.isEmpty('description')){
								json['description'] = $.value('description');
							}
							json['reschedulingType'] = 2;
							json['locale'] = 'zh_CN';
							json['dateFormat'] = $('input[name="repaymentScheduledTo"]').attr('date-format');
							json['repaymentsRescheduledTo'] = $.value('repaymentScheduledTo');
						}else{//没有激活
							var name = $.value('name');
							
							var fromDate = $.value('fromDate');
							var toDate = $.value('toDate');
							
							var repaymentSchedulingRuleType = $('#repaymentSchedulingRuleType').val();
							var repaymentScheduledTo = $.value('repaymentScheduledTo');
							var description = $.value('description');
							
							var dateFormat = $('input[name="fromDate"]').attr('date-format');
							
							/**
							*     结束日期要大于开始日期，且还款日期必须在结束日期之后或者开始日期之前的的七天内
							*/
							var flag = false;
							if(repaymentSchedulingRuleType == '2'){
								if(toDate >= fromDate){
									if(repaymentScheduledTo <= fromDate){
										var day1 = compare_time(repaymentScheduledTo,fromDate);
										if(0 <= day1 <= 7){
											flag = true;
										}else{
											flag = false;
										}
									}else if(repaymentScheduledTo >= toDate){
										var day2 = compare_time(toDate,repaymentScheduledTo);
										if(0 <= day2 <= 7){
											flag = true;
										}else{
											flag = false;
										}
									}else{
										flag = false;
									}
								}
							}else{
								if(toDate >= fromDate){
									flag = true;
								}
							}
							
							
							if(flag == false){
								$.bAlert($.fn.bootstrapValidator.i18n.holiday.dateCheck);
								return false;
							}
							
							json = {
									"name": name,
									"description": description,
									"dateFormat": $.getDateFormat(),
									"locale": $.getLocale(),
									"fromDate": fromDate,
									"toDate": toDate,
							};
							
							if(repaymentSchedulingRuleType == "2"){
								json['repaymentsRescheduledTo'] = repaymentScheduledTo;
								json['reschedulingType'] = 2;
							}else{
								json['reschedulingType'] = 1;
							}
						}
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : json,
								"url" : "api.v1.holidays." + holidayId
							},
							callback : "edit_success"
						});
					}
				});
				
				
			});	
			
			function editback(param){
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.holidays.template"
					},
					callback : "getType"
				});
				//没有指定日期
				if(param.status.value != 'Active'){
					type = "1";
					$('div[label="type:2"]').show();
					$.assign({
						'description':param.description,
						'fromDate' : $.formatDate(param.fromDate),
						'toDate' : $.formatDate(param.toDate),
						'repaymentSchedulingRuleType':1
					});
				}else{
					type = "2";
					//有指定日期
					$.assign({
						'description':param.description,
						'repaymentScheduledTo':$.formatDate(param.repaymentsRescheduledTo),
						'repaymentSchedulingRuleType':2
					});
				}
			}
			
			function getType(param){
				$.setSelect('repaymentSchedulingRuleType',param,'id','value');
			}
			function edit_success(param){
				$.setReadOnly("editholidayform");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				freshlist(officeId);
			}
			
			
			
		</script>


	

