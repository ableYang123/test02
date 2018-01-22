<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="adduserform" name="adduserform">
				<fieldset>
					<legend><spring:message code="label.user.createUser"/></legend>
					
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label"> 
							<spring:message code="label.user.userName"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="username"
								name="username" value='' />
						</div>
					</div>
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label"> 
							<spring:message code="label.user.firstName"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="firstname"
								name="firstname" value='' />
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label"> 
							<spring:message code="label.user.lastName"/>
						 <span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="lastname"
								name="lastname" value='' />
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">
							<spring:message code="label.user.email"/>
						 <span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="email" name="email"
								value='' />
						</div>
					</div>
					
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">
							<spring:message code="label.user.password"/>
						 <span
							style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="password" class="form-control" id="password"
								name="password" value='' />
						</div>
					</div>


					<div class="form-group">
						<label for="repeatpassword" class="col-sm-2 control-label">
							<spring:message code="label.user.repassword"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="password" class="form-control" id="repeatPassword"
								name="repeatPassword" value='' />
						</div>

					</div>
					<div class="form-group">
						<label for="office" class="col-sm-2 control-label">
							<spring:message code="label.user.office"/>
							 <span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="office" name="office" class="form-control"
								style="width: 198">
								<option value="" selected="selected">
									<spring:message code="label.user.selectOffice"/>
								</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="staff" class="col-sm-2 control-label">
							<spring:message code="label.user.staff"/>
						</label>

						<div class="col-sm-3">
							<select id="staff" name="staff" class="form-control "
								style="width: 198">
								<option selected="selected">
									<spring:message code="label.user.selectStaff"/>
								</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3 col-md-3 col-md-offset-1">
							<label class="control-label col-sm-9">
								<spring:message code="label.user.avaliableRoles"/>
							</label> 
							<select
								id="availableroles" class="form-control multiselectmin"
								name="availableroles" multiple="multiple">
							</select>

						</div>
						<div class="col-sm-5 col-md-1 padddetop25px"
							style="margin-top: 45px; margin-left: 45px;">
							<button id='addrole' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
							</button>
							<button id='delrole' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-left" style="color: #fff;"></i>
							</button>
						</div>
						<div class="col-sm-3 col-md-3 col-md-offset-1">
							<label class="control-label col-sm-9">
								<spring:message code="label.user.selectedRoles"/>
								<span style="color: #d9534f;">*</span>
							</label> 
							<select
								id="roles" class="form-control multiselectmin" name="roles"
								multiple="multiple">
							</select>

						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save" class="btn btn-primary">
								<spring:message code="btn.submit"/>
							</button>
						</div>
					</div>
				</fieldset>
			</form>
	


	<script type="text/javascript">
		var user_temp_val;
		var offi_select = $('#office');
		var role_select = $('#availableroles');
		var roles = $('#roles');
		var officeId;
		var officearr;
		var rolearr;

		$(document).ready(function() {

				$.valid("adduserform", [ {
					"name" : "username",
					"notEmpty" : ""
				}, {
					"name" : "firstname",
					"notEmpty" : ""
				}, {
					"name" : "lastname",
					"notEmpty" : ""
				}, {
					"name":"email",
					"email":"",
					"notEmpty":"",
					"regexp" : "/^[a-zA-Z0-9]+([\-\.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[\-\.])+[a-zA-Z0-9]{2,5}$/",
					"regexpMsg" : "\"Please enter your email address in the correct format\""
				}, {
					"name" : "password",
					"notEmpty" : ""
				},{
					"name" : "repeatPassword",
					"identicalTo" : "password",
					"notEmpty" : ""
				},{
					"name" : "office",
					"notEmpty" : ""
				}]);
				

				var path = 'api.v1.users.template';

				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : path
					},
					callback : "getTemplate"
				});

				$.getWidget("office").change(function() {

					/* var office_val = $(this).find('option:selected').attr('value'); */
					var office_val = $.value("office");
					officeId = parseInt(office_val);

					/* 清空id=staff的select控件 */

					//$('#staff').empty();
					
					if(!isNaN(officeId)){
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : false,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.staff?officeId="
										+ officeId
										+ "&status=all"
							},
							callback : "fillstaff"
						});
					}
				});

				/* $.getWidget('staff').change(function() {
						
				}); */

				/* 添加角色按钮 */
				$(document).on('click','#addrole',function() {
					var option_arr = $('#availableroles option:selected');
				
					/* $.setSelect('roles',option_arr,'id','name'); */
					if (option_arr != null && typeof(option_arr) != 'undefined') {
						$.each(option_arr,function(index,item) {
							var txt = $(this).text();
							var value = $(this).val();
							if (isExit(txt)) {
							} else {
								roles.append("<option value='" + value + "'>"
												+ txt + "</option>");
								$('#availableroles option[value='+ value +']').remove();
							}
						});
					}
				});

				/* 删除角色按钮 */
				$(document).on('click','#delrole',function() {
					var option_arr = $('#roles option:selected');
					
					/* console.log(option_arr); */
					if (null != option_arr && typeof(option_arr) != 'undefined') {
						$.each(option_arr,function(index) {
							var value = $(this).val();
							var txt = $(this).text();
							
							$("#roles option[value="+ value + "]").remove();
							$('#availableroles').append("<option value='" + value + "'>"
									+ txt + "</option>");
						});
					}
				});

				$.getWidget("save").click(function() {
	
					if ($.validateForm("adduserform")) {
	
						var offiId = parseInt($.value('office'));
						
						if(isNaN(offiId)){
							$.bAlert($.fn.bootstrapValidator.i18n.user.selectOffice);
							return false;
						}
						
						var username = $.trim($.value('username'));
						var firstname = $.trim($.value('firstname'));
						var lastname = $.trim($.value('lastname'));
						var email = $.trim($.value('email'));
						var password = $.trim($.value('password'));
						var repeatPassword = $.trim($.value('repeatPassword'));
						var staffId = parseInt($.value('staff'));
	
						/* 获取已选择的角色，循环遍历选择框 */
						var roles = [];
						$('#roles option').each(function() {
							roles.push(parseInt($(this).attr('value')));
						});
						
						if(roles.length <= 0){
							$.bAlert($.fn.bootstrapValidator.i18n.user.selectRole);
							return false;
						}
						
						var json = {
								"username" : username,
								"firstname" : firstname,
								"lastname" : lastname,
								"email" : email,
								"officeId" : offiId,
								"roles" : roles,
								"sendPasswordToEmail" : false,
								"passwordNeverExpires" : false
							};
							
							if(password != '' && repeatPassword != ''){
								json['password'] = password;
								json['repeatPassword'] = repeatPassword;
							}
							
							if(typeof(staffId) != 'undefined' && staffId != '' && !isNaN(staffId)){
								json['staffId'] = staffId;
							}
							
							
						$.nest({
							url : '<c:url value="/fineract.do"/>',
							data : {
								'dataType' : 'POST',
								'mydata' : json,
								'url' : 'api.v1.users',
								'contentType' : 'application/json'
							},
							callback : 'add_success'
						});
					}
				});
		});

		function getTemplate(param) {
			user_temp_val = param;

			officearr = param.allowedOffices;
			rolearr = param.availableRoles;

			$.setSelect('office', officearr, "id", "name");
			/* $.each(officearr,function(index,item){
				offi_select.append("<option officeId='"+officearr[index].id+"'>" + officearr[index].name
						+ "</option>");
			}); */

			$.setSelect('availableroles', rolearr, 'id', 'name');

			/* $.each(rolearr,function(index,item){
				role_select.append("<option roleId='"+rolearr[index].id+"'>" + rolearr[index].name
						+ "</option>");
			}); */

			
		}

		function fillstaff(param) {
			//var staff_select = $('#staff');
			$.setSelect('staff', param, 'id', 'displayName');
			/* $.each(param,function(index,item){
				staff_select.append("<option staffId='"+param[index].id+"'>" + param[index].displayName
						+ "</option>");
			}); */
		}

		function add_success(param) {

			console.log(param.resourceId);
			$.setReadOnly('adduserform');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}

		/* 添加角色时判断是否已经存在 */
		function isExit(itemValue) {
			var flag = false;
			$('#roles option').each(function() { //遍历已选择的全部option
				var txt = $(this).text(); //获取option的内容
				if (txt == itemValue) {
					flag = true;
				}
			});
			return flag;
		}
	</script>

