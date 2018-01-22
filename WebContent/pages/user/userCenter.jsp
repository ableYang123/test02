<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="userCenter" name="userCenter">
			<div class="container">
				<fieldset>
					<legend><span class="glyphicon glyphicon-user"></span><spring:message code="user.infomation"/></legend>
				
					<div class="form-group" style="text-align: right;">
					<a class="btn btn-info" href="<c:url value='/loadPage.do?nextPage=system.role.rolelist'/>"><spring:message code="View.permissions"/></a>
					
					<a class="btn btn-info" id="edit"><span class="glyphicon glyphicon-cog"></span><spring:message code="lable.edit.password"/></a>
					
					</div> 
					<table class="table table-bordered table-condensed table-hover">
					<tr>
					<th><spring:message code="lable.username.id"/></th>
					<td><%=request.getSession().getValue("userId")%></td>
					</tr>
						
					<tr>
					<th><spring:message code="lable.username"/></th>
					<td id="username"></td>
					</tr>
					<tr>
					<th><spring:message code="lable.office"/></th>
					<td id="officeName"></td>
					</tr>
					<tr>
					<th><spring:message code="lable.status"/></th>
					<td>Authenticated</td>
					</tr>
					<tr>
					<th><spring:message code="language"/></th>
					<td><spring:message code="lable.language"/></td>
					</tr>
					<tr>
					<th><spring:message code="lable.email"/></th>
					<td id="email"></td>
					</tr>									
					</table>
					<table class="table table-bordered table-condensed table-hover">
					<tr>
					<th><spring:message code="label.mapping.roles"/></th>
					<th><spring:message code="report.add.description"/></th>
					</tr>
					<tr>
					<td id="name"></td>
					<td id="description"></td>
					</tr>
					</table>
	</fieldset>
</div>
					</form>
					<script type="text/javascript">
					function getUser(param){
					 $("#username")[0].innerText=param.username;
					 $("#officeName")[0].innerText=param.officeName;
					 $("#email")[0].innerText=param.email;
					 for(var i in param.selectedRoles){
						 $("#name")[0].innerText=param.selectedRoles[i].name;
						 $("#description")[0].innerText=param.selectedRoles[i].description;
						 
					 }
					}
					$(document).ready(function(){
						var id=<%=request.getSession().getValue("userId")%>;
						 $.nest({
								url : "<c:url value='/fineract.do'/>",
								type : "post",
								data : {
									"dataType" : "GET",
									"mydata" : "",
									"url" : "api.v1.users."+id
								},
								callback : "getUser"
							}); 
					})
					
			$("#edit").click(function (){
		
			$.openWindow("loadPage.do?nextPage=user.editPassword");
		})
				</script>