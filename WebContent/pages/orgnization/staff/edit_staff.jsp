<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

			<form class="form-horizontal" id="editstaffform" name="editstaffform" method="post">
				<fieldset>
					<legend><spring:message code="label.staff.editStaff"/></legend>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">
							<spring:message code="lable.firstName"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="firstname"
								name="firstname" value='' />
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">
							<spring:message code="lable.lastName"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="lastname"
								name="lastname" value='' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.office.officeName"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
						<select id="name" name="name" class="form-control"
								style="width: 198">
							</select>
							
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">
							<spring:message code="label.staff.isLoanOfficer"/>
						</label>

						<div class="col-sm-3">
						   	  <label class="checkbox">
						   	  	<input id="isLoanOfficer" type="checkbox">
						   	  </label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mobileNo" class="col-sm-2 control-label">
							<spring:message code="label.staff.mobileNo"/>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="mobileNo" name="mobileNo"
								value='' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.staff.isActive"/>
						</label>

						<div class="col-sm-3">
						   	  <label class="checkbox">
						   	  	<input id="isActive" type="checkbox">
						   	  </label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.staff.joiningDate"/>
						</label>

						<div class="col-sm-3">
							<input type="text" datetype="date" name="joiningDate"  local-date="" afterToday="true" beforeToday="false"/>
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
			$(document).ready(function(){
				
				
				$.valid("editstaffform",[{
					"name" : "firstname",
					"notEmpty" : ""
				},{
					"name" : "lastname",
					"notEmpty" : ""
				},{
					"name" : "name",
					"notEmpty" : ""
				},{
					"name" : "mobileNo",
					"regexp" : "/^1[3,4,5,7,8,9][0-9]{9}$/",
					"regexpMsg" : "\"Please enter your cell phone number in the correct format\""
				}]);
				
				
				
				
				/* 加载初始化 */
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.staff." + staffId + "?status=all&template=true"
					},
					callback : "editback"
				});
				
				
				/* 编辑办公室表单提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("editstaffform")) {
						
						/* 获取必选项的值 */
						var officeId = parseInt($.value("name"));
						var firstname = $.trim($.value("firstname"));
						var lastname = $.trim($.value("lastname"));
						//var join_date = $('input[name="joiningDate"]').val();
						var join_date = $.value('joiningDate');
						/* 构造json请求参数 */
						var json = {
								"officeId" : officeId,
								"firstname" : firstname,
								"lastname" : lastname,
								"joiningDate" : join_date
						};
						
						/* 可选项：设置外部ID */
						var isLoanOfficer = $('#isLoanOfficer').is(':checked');
						var mobileNo = $.value('mobileNo');
						var isActive = $('#isActive').is(':checked');
						json["isLoanOfficer"] = isLoanOfficer;
						json["mobileNo"] = mobileNo;
						json["isActive"] = isActive;
						
						/* 设置日期格式 */
						var dateFormat = $('input[name="joiningDate"]').attr('date-format');
						if(!$.isEmpty(dateFormat)){
							json["dateFormat"] = $.getDateFormat();
						}else{
							json["dateFormat"] = 'yyyy/MM/dd';
						}
						/* 设置语言 */
						json["locale"] = $.getLocale();
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : json,
								"url" : "api.v1.staff." + staffId + "?status=all"
							},
							callback : "edit_success"
						});
					}
				});
				
				
			});	
			
			function editback(param){
				/* 填充办公室下拉框 */
				$.setSelect('name',param.allowedOffices,'id','name');
				
				/* 格式化日期显示 */
				var date = $.formatDate(param.joiningDate);
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				if(param.isLoanOfficer){
					$('#isLoanOfficer').attr("checked",true);
				}
				
				if(param.isActive){
					$('#isActive').attr("checked",true);
				}
				
				$.assign({
					"name" : param.officeId,
					"firstname" : param.firstname,
					"lastname" : param.lastname,
					"mobileNo" : param.mobileNo,
					"joiningDate" : date
				});
				
			}
			
			function edit_success(param){
				$.setReadOnly("editstaffform");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
			
		</script>

	  

	

