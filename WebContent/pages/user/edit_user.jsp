<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

	<form class="form-horizontal" id="edituserform" name="edituserform">
		<fieldset>
			<legend><spring:message code="label.user.editUser"/></legend>
			
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
				</label>

				<div class="col-sm-3">
					<input type="password" class="form-control" id="password"
						name="password" value='' />
				</div>
			</div>


			<div class="form-group">
				<label for="repeatpassword" class="col-sm-2 control-label">
					<spring:message code="label.user.repassword"/>
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
						<option selected="selected">
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
				<div class="col-sm-5 col-md-1"
					style="margin-top: 45px; margin-left: 45px;">
					<button id='addrole' class="btn btn-primary" type="button">
						<i class="fa fa-angle-double-right">
							<spring:message code="btn.add"/>
						</i>
					</button>
					<button id='delrole' class="btn btn-primary" type="button">
						<i class="fa fa-angle-double-left">
							<spring:message code="btn.delete"/>
						</i>
					</button>
				</div>
				<div class="col-sm-3 col-md-3 col-md-offset-1">
					<label class="control-label col-sm-9">
						<spring:message code="label.user.selectedRoles"/>
					</label> <select
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
	var staffid;
	$(document).ready(function() {
	
		
		
			$.valid("edituserform", [ {
				"name" : "username",
				"notEmpty" : "不能为空"
			}, {
				"name" : "firstname",
				"notEmpty" : "不能为空"
			}, {
				"name" : "lastname",
				"notEmpty" : "不能为空"
			}, {
				"name" : "email",
				"notEmpty" : "不能为空",
				"regexp" : "/^[a-zA-Z0-9]+([\-\.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[\-\.])+[a-zA-Z0-9]{2,5}$/",
				"regexpMsg" : "\"Please enter your email address in the correct format\""
			} ]);	
			
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.users.'+userid+'?template=true'			
				},
				callback : 'editback'
			});
			
			/* 办公室下拉框change事件 */
			$.getWidget("office").change(function() {
				var officeId = parseInt($(this).find('option:selected').attr('value'));
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
				
			/* 添加角色按钮 */
			$(document).on('click','#addrole',function() {

				var option_arr = $('#availableroles option:selected');

				/* $.setSelect('roles',option_arr,'id','name'); */
				if (option_arr != null && typeof(option_arr) != 'undefined') {
					$.each(option_arr,function(index,item) {
						var txt = $(this).text();
						var value = option_arr[index].value;
						if (isExit($('#roles option'),txt)) {
							/* alert('已经存在'); */
						} else {
							/* alert(option_arr[index].value); */
							$('#roles').append("<option value='"+value+"'>"
											+ option_arr[index].text + "</option>");
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
						/* alert(txt); */
						$("#roles option[value="+ value+ "]").remove();
						$('#availableroles').append("<option value='"+value+"'>"
								+ txt + "</option>");
					});
				}
			});
			
			/* 编辑表单进行提交 */
			$.getWidget("save").click(function() {
				if ($.validateForm("edituserform")) {	
					/* 必选项 */
					var offiId = parseInt($.value("office"));
					
					if(isNaN(offiId)){
						$.bAlert($.fn.bootstrapValidator.i18n.user.selectOffice);
						return false;
					}
					
					var username = $('#username').val();
					var firstname = $('#firstname').val();
					var lastname = $('#lastname').val();
					var email = $('#email').val();
					
					/* 可选项 */
					var password = $('#password').val();
					var repeatPassword = $('#repeatPassword').val()
					var staffId = parseInt($.value("staff"));

					/* 获取已选择的角色，循环遍历选择框 */
					var roles = [];
					$('#roles option').each(function() {
						roles.push(parseInt($(this).attr('value')));
					});
					
					if(roles.length <= 0){
						$.bAlert($.fn.bootstrapValidator.i18n.user.selectRole);
						return false;
					}
					
					/* 构造json请求参数 */
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
							'dataType' : 'PUT',
							'mydata' : json,
							'url' : 'api.v1.users.'+userid
						},
						callback : 'edit_success'
					});
				}
			});			
	});
		function fillstaff(param){
			$.setSelect('staff',param,'id','displayName');
				$.assign({
					'staff' : staffid
				});
		}
			function editback(param){
				$.assign({
					'username' : param.username,
					'firstname' : param.firstname,
					'lastname' : param.lastname,
					'email' : param.email
				});
				if(param.staff != undefined){
					staffid = param.staff.id;
				}
				$.setSelect('office',param.allowedOffices,'id','name');
				$.setSelect('availableroles',param.availableRoles,'id','name');
				$.setSelect('roles',param.selectedRoles,'id','name');
				
				$.assign({
					'office' : param.officeId
				});
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : false,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.staff?officeId="
								+ param.officeId
								+ "&status=all"
					},
					callback : "fillstaff"
				});
		}	
		function edit_success(param){
			$.setReadOnly("edituserform");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		/* 添加角色时判断是否已经存在 */
		function isExit(selectObj,itemValue) {
			var flag = false;
			selectObj.each(function() { //遍历已选择的全部option
				var txt = $(this).text(); //获取option的内容
				if (txt == itemValue) {
					flag = true;
				}
			});
			return flag;
		}
		
</script>	