<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form class="form-horizontal" id="activeGroupForm"
		name="activeGroupForm">
		<fieldset>
			<legend>
				<spring:message code="group.avtive.group" />
			</legend>
			<div class="form-group">
				<lable class="col-sm-3 control-lable"> <spring:message
					code="group.activation.date" /> <span style="color: #d9534f;">*</span></lable>
				<div class="col-sm-3">
						<input type="text" class="form-control" datetype="date" name="activeDate" local-date="true">
					</div>
			</div>
			<div class="text-right" style="padding-right: 80px">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<spring:message code="btn.cancle" />
				</button>
				<button type="button" id="save" name="save" class="btn btn-primary">
					<spring:message code="btn.submit" />
				</button>
			</div>
		</fieldset>
	</form>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$.datetimepicker();
					$.getWidget("save").click(
							function() {
								var json = {
									"locale" : $.getLocale(),
									"dateFormat" : $('input[name="activeDate"]').attr('date-format'),
									"activationDate" :  $('input[name="activeDate"]').val()
								};
								$.nest({
									url : "<c:url value='/fineract.do'/>",
									data : {
										"dataType" : "POST",
										"mydata" : json,
										"url" : "api.v1.groups." + groupId
												+ "?command=activate"
									},
									callback : "activeSuccess"
								});
							});
				});
		function activeSuccess() {
			location.reload();
		}
	</script>
</body>
</html>