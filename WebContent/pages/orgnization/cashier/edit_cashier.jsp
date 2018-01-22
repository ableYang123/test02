<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="editcashierform" name="editcashierform" method="post">
				<fieldset>
					<legend>编辑出纳员</legend>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"> 
							办公室
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="officeName"
								name="officeName" value='' disabled/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> 
							出纳名称
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="tellerName"
								name="tellerName" value='' disabled/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							出纳员/员工
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="staffOptions" name="staffOptions" class="form-control"
								style="width: 198" disabled>
								<option value='?' selected>--<spring:message code="label.user.selectOffice"/>--</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> 
							说明/备注
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="description"
								name="description" value='' />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="lable.startDate" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <input type="text" datetype="date" name="startDate"  local-date="" afterToday="true" beforeToday=" "/>  
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="lable.endDate" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <input type="text" datetype="date" name="endDate"  local-date="" afterToday="" beforeToday=" "/>  
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							是否全天
						</label>

						<div class="col-sm-3">
						   	  <input type="checkbox" id="fullDay"/>  
						</div>
					</div>
					<div name="fromTime" class="form-group" style="display:none;">
						<label class="col-sm-2 control-label">
							起始时间
						</label>
							<div class="col-sm-2 input-group">
								<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="addOne(this,'23')">▲</a>
								<input type="text" style="text-align: center;" id="fromTimeHour" class="form-control" value='' size="2" placeholder="HH"/>
							   	<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="removeOne(this,'23')">▼</a>
							</div>
					</div>
					<div name="fromTime" class="form-group" style="display:none;">
						<label class="col-sm-2 control-label">
							
						</label>
							<div class="col-sm-2 input-group">
							   	<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="addOne(this,'59')">▲</a>
							   	<input type="text" style="text-align: center;" id="fromTimeMin" class="form-control" value='' size="2" placeholder="mm"/>
							   	<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="removeOne(this,'59')">▼</a>
							</div>
					</div>
					
					<div name="endTime" class="form-group" style="display:none;">
						<label class="col-sm-2 control-label">
							结束时间
						</label>
						<div class="col-sm-2 input-group">
								<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="addOne(this,'23')">▲</a>
								<input type="text" style="text-align: center;" id="endTimeHour" class="form-control" value='' size="2" placeholder="HH"/>
							   	<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="removeOne(this,'23')">▼</a>
						</div>
					</div>
					<div name="endTime" class="form-group" style="display:none;">
						<label class="col-sm-2 control-label">
							
						</label>
							<div class="col-sm-2 input-group">
							   	<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="addOne(this,'59')">▲</a>
							   	<input type="text" style="text-align: center;" id="endTimeMin" class="form-control" value='' size="2" placeholder="mm"/>
							   	<a style="cursor: pointer; text-decoration: none;" class="input-group-addon" onclick="removeOne(this,'59')">▼</a>
							</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit" /></button>
						</div>
					</div>
				</fieldset>
			</form>
		<script type="text/javascript">
			$(document).ready(function(){
				$.valid("editcashierform",[
					{
						"name" : "startDate",
						"notEmpty" : ""
					},{
						"name" : "endDate",
						"notEmpty" : ""	
					}
				]);
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.tellers.${pd.tellerId}.cashiers.template"
					},
					callback : function(param){
						//填充数据
						$.assign({
							"officeName" : param.officeName,
							"tellerName" : param.tellerName
						});
						$.setSelect('staffOptions',param.staffOptions,'id','displayName');
						
						/* 加载页面初始化 */
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.tellers.${pd.tellerId}.cashiers.${pd.cashierId}"
							},
							callback : "editCashier"
						});
					}
				});
				
				
				
				$.getWidget('fullDay').click(function(){
					var flag = $(this).is(":checked");
					if(flag){
						$('div[name="fromTime"]').hide();
						$('div[name="endTime"]').hide();
					}else{
						$('div[name="fromTime"]').show();
						$('div[name="endTime"]').show();
					}
				});
				
				
				/* 表单提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("editcashierform")) {
						var request_json = {
								"dateFormat" : $.getDateFormat(),
								"description" : $.value('description'),
								"locale" : $.getLocale(),
								"startDate" : $.value('startDate'),
								"endDate" : $.value('endDate'),
								"staffId" : parseInt($.value('staffOptions')),
								"isFullDay" : $('#fullDay').is(':checked')
						};
						
						if(!$('#fullDay').is(':checked')){
							request_json['hourStartTime'] = $.value('fromTimeHour');
							request_json['minStartTime'] = $.value('fromTimeMin');
							request_json['hourEndTime'] = $.value('endTimeHour');
							request_json['minEndTime'] = $.value('endTimeMin');
						}
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : request_json,
								"url" : "api.v1.tellers.${pd.tellerId}.cashiers.${pd.cashierId}"
							},
							callback : "editSuccess"
						});
					}
				});
			});	
			
			function editCashier(param){
				//填充数据
				$.assign({
					"staffOptions" : param.staffId,
					"startDate" : $.formatDate(param.startDate),
					"endDate" : $.formatDate(param.endDate)
				});
				$("input[type='checkbox']").prop("checked", param.isFullDay);
				if(param.isFullDay){
					$('div[name="fromTime"]').hide();
					$('div[name="endTime"]').hide();
				}else{
					var timeVal1 = param.startTime.split(':');
					var timeVal2 = param.endTime.split(':');
					$('#fromTimeHour').val(timeVal1[0]);
					$('#fromTimeMin').val(timeVal1[1]);
					$('#endTimeHour').val(timeVal2[0]);
					$('#endTimeMin').val(timeVal2[1]);
					$('div[name="fromTime"]').show();
					$('div[name="endTime"]').show();
				}
				
			}
			
			
			
			function editSuccess(param){
				$.setReadOnly('editcashierform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
			
			function addOne(obj,time){
				var inputVal = parseInt($(obj).next().val());
				var timeVal = parseInt(time);
				if($.isEmpty(inputVal) || isNaN(inputVal)){
					$(obj).next().val(1);
				}else{
					if(inputVal+1 > timeVal){
						$(obj).next().val(timeVal);
					}else if(inputVal < 0){
						$(obj).next().val(0);
					}else{
						inputval = inputVal + 1;
						$(obj).next().val(inputval);
					}
				}
				
			}
			
			function removeOne(obj,time){
				var inputVal = parseInt($(obj).prev().val());
				var timeVal = parseInt(time);
				
				if($.isEmpty(inputVal) || isNaN(inputVal)){
					$(obj).prev().val(0);
				}else{
					if(inputVal-1 < 0){
						$(obj).prev().val(0);
					}else if(inputVal > timeVal){
						$(obj).prev().val(timeVal);
					}else{
						inputval = inputVal - 1;
						$(obj).prev().val(inputval);
					}
				}
			}
		</script>


	

