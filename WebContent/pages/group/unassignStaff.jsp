<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div>
		<label><spring:message
				code="group.unassign.staff" /></label>
	</div>
	<hr style="margin-top: 5; margin-bottom: 15">
	<div class="modal-body" style="height: 150px">
		<div class="text-center" style="padding-right: 80px;margin">
			<button class="btn btn-default" data-dismiss="modal">
				<spring:message code="btn.cancle"/>
			</button>
			<button type="button" id="submite" name="submite"
				class="btn btn-primary">
				<spring:message code="btn.ok" />
			</button>
		</div>
	</div>
	<script type="text/javascript">
	$.getWidget("submite").click(function() {
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			data : {
				'dataType' : 'post',
				'mydata' : {
					"staffId" : staffId
				},
				'url' : 'api.v1.groups.' + groupId+"?command=unassignstaff"
			},
			callback : 'unassignStaffSuccess'
		});
	});
	
	function unassignStaffSuccess() {
		location.reload();
	}
	</script>
</body>
</html>