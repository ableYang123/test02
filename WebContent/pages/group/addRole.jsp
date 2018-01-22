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
		<label><spring:message code="group.add.role" /></label>
	</div>
	<hr style="margin-top: 5; margin-bottom: 5">
	<div class="modal-body" style="height: auto; padding-top: 0px">
		<div style="height: 50px">
			<div class="col-md-2 text-right">
				<spring:message code="group.client" />
				<span style="font-size: 14px; color: #d9534f">*</span>
			</div>
			<div class="col-md-10" style="padding-left: 0px">
				<select id="clientList" class="form-control" style="width: 200">
				</select>
			</div>
		</div>
		<div style="height: 80px">
			<div class="col-md-2 text-right">
				<spring:message code="group.role" />
				<span style="font-size: 14px; color: #d9534f">*</span>
			</div>
			<div class="col-md-10" style="padding-left: 0px">
				<select id="roleList" class="form-control" style="width: 200">
				</select>
			</div>
		</div>
		<div class="text-center" style="padding-right: 80px">
			<!-- data-dismiss="modal" -->
			<button class="btn btn-primary" id="cache" name="cache">
				<spring:message code="btn.cancle"/>
			</button>
			<button type="button" id="submite" name="submite"
				class="btn btn-primary">
				<spring:message code="btn.submit"/>
			</button>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//initClientList(clientMember);
			getGroupRole();
		});

		function getGroupRole() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"url" : "api.v1.groups." + groupId
							+ "?associations=all&template=true"
				},
				callback : "initRoleList"
			});
		}

		function initRoleList(param) { 
			$.setSelect('roleList', param.availableRoles, 'id', 'name');
			$.setSelect('clientList', param.clientMembers, 'id', 'displayName');
		}

		/* function initClientList(clientMemberList) {
			$.setSelect('clientList', clientMemberList, 'id', 'displayName');
		} */

		$("#submite").click(
				function assignRole() {
					$.nest({
						url : '<c:url value="/fineract.do"/>',
						data : {
							'dataType' : 'post',
							'mydata' : {
								clientId : parseInt($("#clientList").find(
										"option:selected").attr("value")),
								role : parseInt($("#roleList").find(
										"option:selected").attr("value"))
							},
							"url" : "api.v1.groups."+ groupId
									+ "?command=assignRole"
						},
						callback : 'assignStaffSuccess'
					});
				});
		$("#cache").click(function() {
			location.reload();
		});
		function assignStaffSuccess() {
			location.reload();
		}
	</script>
</body>
</html>