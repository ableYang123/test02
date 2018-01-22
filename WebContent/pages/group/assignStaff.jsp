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
		<label><spring:message code="group.assign.staff" /></label>
	</div>
	<hr style="margin-top: 5; margin-bottom: 15">
	<div class="modal-body" style="height: 70px">
		<div class="col-md-2" style="text-align: right; padding-top: 3px">
			<spring:message code="group.staff" />
			<span style="font-size: 16px; color: #d9534f">*</span>
		</div>
		<div class="col-md-9">
			<select id="stafflist" class="form-control" style="width: 200">
			</select>
		</div>
	</div>

	<div class="text-center" style="padding-right: 80px">
		<button class="btn btn-default" data-dismiss="modal">
			<spring:message code="btn.cancle"/>
		</button>
		<button type="button" id="submite" name="submite" class="btn btn-primary">
			<spring:message code="btn.submit"/>
		</button>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.clients.template?officeId="
									+ officeId
									+ "&staffInSelectedOfficeOnly=true"
						},
						callback : "officestaff"
					});
				});

		function officestaff(param) {
			$.setSelect('stafflist', param.staffOptions, 'id', 'displayName');
		}

		$.getWidget("submite").click(function() {
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				data : {
					'dataType' : 'post',
					'mydata' : {
						"staffId" : parseInt($("#stafflist")
								.find("option:selected").attr(
								"value"))
					},
					'url' : 'api.v1.groups.' + groupId+"?command=assignStaff"
				},
				callback : 'assignStaffSuccess'
			});
		});
		
		function assignStaffSuccess() {
			location.reload();
		}
	</script>
</body>
</html>