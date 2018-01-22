<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="background-color: f8f8f8">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="accrual.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<form id="listaccruals" class="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label"><spring:message code="accrual.list.till"/><span style="font-size: 14px; color: #d9534f">*</span></label>
					<div class="col-sm-3">
						<input datetype="date" name="dateTime" class="datetime" afterToday="true">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4">
						<button type='button' class="btn btn-default"><spring:message code="config.edit.cancel"/></button>
						<button type='button' id="save" class="btn btn-primary"><spring:message code="config.edit.submit"/></button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//初始化  
		$(document).ready(function() {
			$('input[name="dateTime"]').val($.formatDate(new Date()));
		});
		$.getWidget("save").click(function() {
			data = {"locale":"en",
					"dateFormat":$('input[name="dateTime"]').attr('date-format'),
					"tillDate":$('input[name="dateTime"]').val()};
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : data,
					"url" : "api.v1.runaccruals"
				},
				callback : "saveaccruals"
			});
		});
		
		function saveaccruals(){
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			$.setReadOnly('listaccruals');
		};
	</script>
</body>
</html>