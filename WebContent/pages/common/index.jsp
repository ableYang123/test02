<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  		<link rel="stylesheet" href="<c:url value='/style/bootstrap.css'/>" type="text/css"></link>
	  	<link rel="stylesheet" href="<c:url value='/style/main.css'/>" type="text/css"></link>
	  	<link rel="stylesheet" href="<c:url value='/style/bootstrapValidator.css'/>" type="text/css"></link>
		<link rel="stylesheet" href="<c:url value='/style/bootstrap-datetimepicker.min.css'/>" type="text/css"></link>
		<script src="<c:url value='/js/jquery.webcam.min.js'/>"></script>
	</head>
  	
	<body>	
	<div class="card" style="padding-right: 15px; padding-left: 15px;  margin-right: auto;  margin-left: auto;margin-top: 5%;min-width:80%;width:80%;">
		<div style="padding-top: 2%">
			<legend><h3><spring:message code="index.welcome"/><%=request.getSession().getValue("username")%></h3></legend>
			<spring:message code="index.greetings"/>
			<br><br>
			<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
			<spring:message code="index.left"/>
			<span class=" glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
			<spring:message code="index.up"/>
			<span class=" glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
			<spring:message code="index.top"/>
 
			<br><br><br><br>
			
			<div class="text-center" >
				<img src="<c:url value='/img/logo7.png'/>" style="width: 80%"></img>
			</div>
		</div>
		
	</div>
		

	</body>
</html>
