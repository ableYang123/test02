<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form class="form-horizontal" id="usersettings" name="usersettings">
	<div class="container">
				<fieldset>
					<legend><span class="glyphicon glyphicon-cog"></span><spring:message code="lable.user.setting"/></legend>
				<div class="form-group">
			<label for="language" class="col-sm-3 control-label"><spring:message code="language"/><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="language" >
				<option value="zh_CN">中文</option>
				<option value="en_US">English</option>
				</select>
			</div>
			
		</div>
					
			<div class="form-group">	 	
			<label for="date" class="col-sm-3 control-label"><spring:message code="lable.format.date"/><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<select  class="form-control" id="dateFormat" >
				<option value="1">yyyy-MM-dd</option>
				<option value="2">yyyy/MM/dd</option>
				<option value="3">dd-MM-yyyy</option>
				<option value="4">dd/MM/yyyy</option>
				</select>
			</div>
			</div>
				</fieldset>
	</div>
				</form>
				<form id="languageForm" method="post" action="<c:url value='/loadPage.do'/>"> 
				<input type="hidden" value="" name="locale" id="locale">
				<input type="hidden" value="user.setting" name="nextPage" id="nextPage">
				</form>
				<script type="text/javascript" src="<c:url value='/js/language/zh_CN.js'/>" ></script>
				<script type="text/javascript">
				$.assign({"language":$.getCookie("clientLanguage")});
				$.assign({"dateFormat":$.getCookie("dateFormat")});
				$("#language").change(function(){
					language($(this).val()); 
				});
				
				$("#dateFormat").change(function(){
					$.setCookie("dateFormat",$.value("dateFormat"));
				});
				
				</script>