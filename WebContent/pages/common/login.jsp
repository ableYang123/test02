<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 	<head>
	    <link rel="stylesheet" href="<c:url value='/style/bootstrap.css'/>" type="text/css"></link>
	  	<link rel="stylesheet" href="<c:url value='/style/main.css'/>" type="text/css"></link>
	  	<link rel="stylesheet" href="<c:url value='/style/bootstrapValidator.css'/>" type="text/css"></link>
	  	<style type="text/css">
	  		body { 
				    background: url(<c:url value='/img/timg.jpg'/>) no-repeat #FFF;
				    background-repeat: no-repeat;
				    background-attachment: fixed;
				    background-position: center;
				    background-size: cover;
				}
	  		#hidediv{position:absolute;left:0px;top:0px;width:100%;background-color:rgba(25,25,25,0.8);filter:alpha(opacity=60);opacity=60;display:none;z-Index:1001;height: 100%}
	  	</style>
	</head>
	<body>
		<div style="position:absolute;right:10%;top:10%;z-index: 100">
				<spring:message code="title.change.language"/>：<button class="btn btn-default login-dropdown"><spring:message code="lable.language"/><span class="caret"></span></button>
				
				<ul class="login-dropdown-menu" >
					<li><a href="javascript:language('zh_CN');" >中文</a></li>
					<li><a href="javascript:language('en_US');">English</a></li>
		
		</div>
		<div class="login-alldiv">
			<div id="hidediv" > 
				<div class="spinner">
					<div class="spinner-container container1">
					    <div class="circle1"></div>
					    <div class="circle2"></div>
					    <div class="circle3"></div>
					    <div class="circle4"></div>
					</div>
					<div class="spinner-container container2">
					    <div class="circle1"></div>
					    <div class="circle2"></div>
					    <div class="circle3"></div>
					    <div class="circle4"></div>
					</div>
					<div class="spinner-container container3">
					    <div class="circle1"></div>
					    <div class="circle2"></div>
					    <div class="circle3"></div>
						<div class="circle4"></div>
					</div>
					<div style="padding-top:150px;  color:#1e90ff;font-size:x-large;font-family:'Futura';" >loading...</div> 				
				</div>
			</div>
			<div style="left: 50%"><img src="<c:url value='/img/logo3.png'/>"></img></div>
			<div class="login-div">
			
				<div class="text-center login-titleFont" ><h4><spring:message code="msg.welcome"/></h4></div>
				
				<form class="form-horizontal login-form" action="../test" id="loginForm"> 
				  <div class=" form-group-lg" >
				    <label for="username"  class="col-sm-2 control-label" style="width: 85px;color: black;"><spring:message code="lable.username"/></label>
				    <div class="col-sm-10 form-group" >
				    	<input type="text" class="form-control insideWid" name="userId" id="userId" placeholder="<spring:message code="lable.username"/>" onkeydown="if(event.keyCode==13){logOn();}">
				   		<span class="glyphicon glyphicon-user form-control-feedback" ></span>   
				    </div>
					
				  </div>
				  <div class=" form-group-lg" style="padding-top: 90px">
				    <label for="password"  class="col-sm-2 control-label"  style="width: 85px;color: black;"><spring:message code="lable.password"/></label>
				    <div class="col-sm-10 form-group">
				    	<input type="password" name="userP" id="userP" class="form-control insideWid" autocomplete="off"  placeholder="<spring:message code="lable.password"/>" onkeydown="if(event.keyCode==13){logOn();}">
				    	<span class="glyphicon glyphicon-lock form-control-feedback" ></span>
				    </div>
				  </div>
	
				  <div class="form-group" style="padding-top: 90px">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn login-btn" id="button" onclick="logOn()"><spring:message code="lable.login"/></button>
				    </div>
				  </div>
				</form>
				
				<form id="languageForm" method="post" action="<c:url value='/'/>"> 
				<input type="hidden" value="" name="locale" id="locale">
				<input type="hidden" value="" name="nextPage" id="nextPage">
				<input type="hidden" value="" name="permissions" id="permissions">
				</form>
			</div>
			
			<div class="text-center login-footer">  <spring:message code="tilte.copyright"/>  </div>  
		</div>
	
		<script type="text/javascript" src="<c:url value='/js/jquery.js'/>" ></script>
		<script type="text/javascript" src="<c:url value='/js/bootstrap.js'/>" ></script>
		<script type="text/javascript" src="<c:url value='/js/base.js'/>" ></script>
		<script type="text/javascript" src="<c:url value='/js/bootstrapValidator.js'/>" ></script>
		<script type="text/javascript" src=<c:url value='/js/jquery.corner.js'/>></script>
		<script type="text/javascript" src="<c:url value='/js/util.js'/>" ></script>
		<script type="text/javascript" src="<c:url value='/js/language/zh_CN.js'/>" ></script>
		
		<script type="text/javascript">
			function language(locale){
			$.assign({"locale":locale});
			$("#languageForm").submit();
			}
			
			function logOn(){
				if ($.validateForm("loginForm")) {
					var userId = $("#userId").val();
					var userP = $("#userP").val();
						 $.nest({
					      url : "<c:url value='/LoginController/login.do'/>",
					     data : {
					     			userId:userId,
					     			userP:userP,
					     			"contentType" : "application/json"
					 		},
					 		callback : "callback"
					   });	
				}
			}
			
		$(function(){
			$(document).ready(function(){
				$.valid('loginForm',[{"name":"userId","notEmpty":$.fn.bootstrapValidator.i18n.common.usernamenotEmpty},{"name":"userP","notEmpty":$.fn.bootstrapValidator.i18n.common.passwordnotEmpty}]);

			});
			
			$(".login-dropdown-menu").hide();
			$(".login-dropdown").click(function(){
				$(".login-dropdown-menu").toggle();
			});

			$(".login-alldiv").click(function(){
				$(".login-dropdown-menu").hide();
			});
			
			$("li a").click(function(){
				$(".login-dropdown-menu").hide();
			});
			
			
			
		})
		function callback(param){
				$("#languageForm").attr("action", "<c:url value='/loadPage.do'/>");
				$.assign({"nextPage":"common.main"});
				$.assign({"permissions":param.permissions});
				$("#locale").remove();
				$("#languageForm").submit();
		}
		
		function p_show()
		{
		   $("#hidediv").css("display","block");

		}
		function p_hide()
		{
			$("#hidediv").css("display","none");
		}
		
		</script>
	</body>
</html>