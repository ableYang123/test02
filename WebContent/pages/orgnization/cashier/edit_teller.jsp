<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="editcashierform" name="editcashierform" method="post">
				<fieldset>
					<legend><spring:message code="label.teller.editTeller"/></legend>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"> 
							<spring:message code="label.teller.tellerName"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="tellerName"
								name="tellerName" value='' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="lable.office"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="officeId" name="officeId" class="form-control"
								style="width: 198">
								<%-- <option value='' selected>--<spring:message code="label.user.selectOffice"/>--</option> --%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.teller.description" />
						</label>

						<div class="col-sm-3">
						   	  <input id="description" name="description"  type="text" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="lable.startDate" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <input type="text" datetype="date" name="startDate"  local-date="true" afterToday="true" beforeToday=" "/>  
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
							<spring:message code="lable.status"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="usage" name="usage" class="form-control">
								<option label="Active" value="300">Active</option>
								<option label="Inactive" value="400">Inactive</option>
							</select>
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
				
				$.valid("editcashierform", [{
					"name" : "tellerName",
					"notEmpty" : ""
				}, {
					"name" : "officeId",
					"notEmpty" : ""
				}, {
					"name" : "usage",
					"notEmpty" : ""
				}]);
				
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				
				/* 加载页面初始化 */
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.tellers." + tellerId + "?template=true"
					},
					callback : "editback"
				});
				
				/* 提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("editcashierform")) {
						
						var tellerName = $.trim($.value('tellerName'));
						//var startDate = $('input[name="startDate"]').val();
						//var endDate = $('input[name="endDate"]').val();
						var startDate = $.value('startDate');
						var endDate = $.value('endDate');
						
						var dateFormat = $('input[name="startDate"]').attr('date-format');
						var officeId = parseInt($.value('officeId'));
						var description = $('#description').val();
						var status = $.value('usage');
						var add_json = {
								"name" : tellerName,
								"startDate" : startDate,
								"endDate" : endDate,
								"dateFormat" : $.getDateFormat(),
								"locale" : $.getLocale(),
								"status" : status
						};
						
						if(!isNaN(officeId)){
							add_json["officeId"] = officeId;
						}else{
							$.bAlert('Please select office');
							return false;
						}
						
						if(!$.isEmpty(description)){
							if(description.length > 100){
								$.bAlert($.fn.bootstrapValidator.i18n.teller.checkDescription);
								return false;
							}
							add_json["description"] = description;
						}
							
						if(endDate < startDate){
							$.bAlert($.fn.bootstrapValidator.i18n.teller.checkDate);
							return false;
						}
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : add_json,
								"url" : "api.v1.tellers." + tellerId
							},
							callback : "edit_success"
						});
					}
				});
			});	
			
			function editback(param){
				
				var startDate = $.formatDate(param.startDate);
				var endDate = $.formatDate(param.endDate);
				
				$.assign({
					"tellerName" : param.name,
					"description" : param.description,
					"startDate" : startDate,
					"endDate" : endDate
				});
				
				
				
				/* $('input[name="startDate"]').val(startDate);
				$('input[name="endDate"]').val(endDate); */
				$('#officeId').append('<option value="'+ param.officeId +'" >'+ param.officeName +'</option');
				$('#officeId').attr('readOnly',true);
				
				if(param.status == 'ACTIVE'){
					$.assign({
						"usage" : 300
					});
				}else if(param.status == 'INACTIVE'){
					$.assign({
						"usage" : 400
					});
				}
			}
			
			function edit_success(param){
				$.setReadOnly('editcashierform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
		</script>


	

