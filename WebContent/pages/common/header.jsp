<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- <%
	Cookie cookies[] = request.getCookies();
	String language = "zh_CN";
	for (int n = 0; n < cookies.length; n++) {
		if (cookies[n].getName().equals("clientLanguage")) {
			language = cookies[n].getValue();
			break;
		}
	}
	pageContext.setAttribute("language", language);	//${language }
%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="x-ua-compatible" content="IE=edge" >
<html>
<head>
<link rel="stylesheet" href="<c:url value='/style/bootstrap.css'/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value='/style/main.css'/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value='/style/bootstrapValidator.css'/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value='/style/flexigrid.css'/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value='/style/bootstrap-datetimepicker.min.css'/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value='/style/bootstrap-treeview.css'/>" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/js/jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/bootstrap.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/base.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/bootstrapValidator.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/language/zh_CN.js'/>"></script>
<script type="text/javascript" src=<c:url value='/js/select-ui.min.js'/>></script>
<script type="text/javascript" src=<c:url value='/js/jquery-form.js'/>></script>
<script type="text/javascript" src=<c:url value='/js/jquery.corner.js'/>></script>
<script type="text/javascript" src=<c:url value='/js/util.js'/>></script>
<script type="text/javascript" src=<c:url value='/js/flexigrid.js'/>></script>
<script type="text/javascript" src="<c:url value='/js/bootstrap-datetimepicker.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/bootstrap-datetimepicker.zh-CN.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/bootstrap-treeview.js'/>" ></script>

<script type="text/javascript">
	$(document).ready(function () {
		$.datetimepicker();
		$.searchBox();
	});
	function p_show()
	{
	  parent.window.p_show();

	}
	function p_hide()
	{
		parent.window.p_hide();
	}
	function p_hide()
	{
		parent.window.p_hide();
	}
	
	function getPermissions(str){
		return parent.window.getPermissions(str);
	}	
	
	function language(locale){
		return parent.window.language(locale);
	}
	
	document.onkeypress = function(e){  
	     
	if (window.event) // IE
		{
			if (e.keyCode == 13) {
				return false;
			}
		} else if (e.which) // Netscape/Firefox/Opera
			if (e.which == 13) {
				return false;
			}
	}
</script>
<body>
<div id="myModal" class="modal fade bs-example-modal-lg"  style="position: absolute;z-index: 100" tabindex="-1" role="dialog" data-backdrop="static"> 
  <div class="modal-dialog modal-lg" role="document" id="modal-dialog" name="modal-dialog">
    <div class="modal-content" style="font-size: large;">
    	<div class="modal-header" style="position: relative;">
			<button type="button" class="btn btn-default glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true" style="position: absolute;top: 0;right: 0">
			</button>
		</div>
		<div class="modal-body" id="modal-body" name="modal-body">
		</div>
    </div>
  </div>
</div>
</body>
</html>
</head>
