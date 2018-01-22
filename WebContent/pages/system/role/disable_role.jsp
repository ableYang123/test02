<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #fff">
				<fieldset>
					<legend><spring:message code="label.role.disabledRole"/></legend>
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.ok"/></button>
						</div>
					</div>
				</fieldset>
		<script type="text/javascript">		
			var user_rolename=[];
			var new_arr=[];
			  $(document).ready(function() {
				  
				  //获取用户列表中用户被赋予权限的角色
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.users"
						},
						callback : "callback2"
					}); 
			  });
			 
			 $.getWidget("save").click(function(){	
				 if(comparerole()){
					 $.nest({ 
			    			url : "<c:url value='/fineract.do'/>",
			    			type : "post",
			    			data : {
			    				"dataType" : "POST",
			    				"mydata" : "roleid",
			    				"url" : "api.v1.roles." + roleid+"?command=disable"
			    			},
			    			callback : "editdisable_success"
			    		});	
				 }else if(!comparerole()){
					 $.bAlert('<spring:message code="error.msg.role.disabled"/>'); 
				 }
			});
		
			 function editdisable_success(param) {
		     		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		     	}
			 function callback2(param) {
				for(o in param){
					for(a in param[o].selectedRoles){
						user_rolename.push(param[o].selectedRoles[a].name);
					}
				}
				for(var i=0;i<user_rolename.length;i++){
					var items=user_rolename[i];
					if($.inArray(items,new_arr)==-1){
						new_arr.push(items);
					}
				}
				}
			 //判断角色所具有的权限是否已经赋予给用户
			  function comparerole(){
					var flag;
					 if($.inArray(role_name,new_arr)==-1){
						 flag=true; 
					 }else{
						 flag=false;
						}
					 return flag;
			 } 
			 
		</script>
</body>
</html>