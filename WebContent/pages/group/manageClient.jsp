<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form class="form-horizontal" id="editgroupform" name="editgroupform">
		<fieldset>
			<legend>
				<spring:message code="group.add.new.client" />
			</legend>
			<div class="form-group">
				<div class="col-sm-3 col-md-3">
					<label class="col-sm-12 control-label"><spring:message
							code="group.search.client" /></label>
				</div>
				<div class="col-sm-5">
					<div class="col-sm-4 col-md-8">
						<input type="text" class="form-control" id="clientName"
							name="clientName" value='' />
					</div>
					<div class="col-sm-1 col-md-4">
						<button type="button" id="add" name="add" class="btn btn-primary">
							<spring:message code="btn.add" />
						</button>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<label class="control-label" style="font-size: 14px"><spring:message
						code="group.client.infomation" /></label>
				<hr style="margin-top: 5; margin-bottom: 5">
				<label class="control-label"
					style="font-size: 14px; width: 64; text-align: left"><spring:message
						code="group.name" /></label> <span id="name"></span>
				<hr style="margin-top: 5; margin-bottom: 5">
				<label class="control-label"
					style="font-size: 14px; width: 64; text-align: left"><spring:message
						code="group.id" /></label> <span id="id"></span>
				<hr style="margin-top: 5; margin-bottom: 5">
				<label class="control-label"
					style="font-size: 14px; width: 64; text-align: left"><spring:message
						code="group.office" /></label> <span id="office"></span>
				<hr style="margin-top: 5; margin-bottom: 5">
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-5">
				<div class="form-group" style="margin-bottom: 1">
					<label class="control-label" style="font-size: 16px"><spring:message
							code="group.client.infomation" /></label>
					<hr style="margin-top: 5; margin-bottom: 1">
				</div>
				<div id="memberList"></div>
			</div>
			<div
				style="position: absolute; left: 253px; top: 100px; z-index: 80; width: 200px; height: 150px">
				<ul class="list-group" id="clientList">
				</ul>
			</div>
		</fieldset>
	</form>
	<script type="text/javascript">
		var oldClientName;
		var clientListJson;
		var removeOrAddView;
		$(document).ready(function() {
			oldClientName = "";
			initThisWindow();
		});

		function initThisWindow() {
			/* 获取组已有成员 */
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"url" : "api.v1.groups." + groupId
							+ "?associations=clientMembers&template=true"
				},
				callback : "initClientMembers"
			});
		}

		/* 初始化组的成员列表 */
		function initClientMembers(param) {
			var clientMembersList = param.clientMembers;
			var name;
			var id;
			for (var i = 0, l = clientMembersList.length; i < l; i++) {
				name = clientMembersList[i].displayName;
				id = clientMembersList[i].id;
				addToGroup(name, id);
			}
		}

		/* 搜索框变化时执行判断 */
		$('#clientName').bind('input propertychange', function() {
			var clientName = $("input#clientName").val();
			if (clientName !== "") {
				if (clientName !== oldClientName) {
					oldClientName = clientName;
					searchClient(clientName);
				} else if (clientListJson.length > 0) {
					initClientList(clientListJson);
				}
			}
			$("ul").children("li").remove();
		});

		/* 根据关键字搜索客户端信息 */
		function searchClient(clientName) {
			$.nest({
						url : "<c:url value='/fineract.do'/>",
						data : {
							"dataType" : "GET",
							"url" : "api.v1.clients?displayName="
									+ clientName
									+ "&officeId="
									+ officeId
									+ "&orderBy=displayName&orphansOnly=true&sortOrder=ASC"
						},
						callback : "searchSuccess"
					});
		}

		/* 查询完成回调函数 */
		function searchSuccess(param) {
			if (param.totalFilteredRecords > 0) {
				clientListJson = param.pageItems;
				initClientList(clientListJson)
			}
		}

		/* 返回参数做成列表显示在搜索框下面 */
		function initClientList(list) {
			$("ul").children("li").remove();
			var div = $("#clientList");
			for (var i = 0, l = list.length; i < l; i++) {
				var clientName = list[i].displayName;
				div.append("<li id= '"
								+ i
								+ "'class='list-group-item' style='padding-left:5; padding-right:5;' onclick='setClientDetail(this);'>"
								+ clientName + "</li>");
			}
		}

		/* 设置客户端详细信息 */
		function setClientDetail(param) {
			var clientName = $(param).text();
			var index = $(param).attr("id");
			$("#name").html(clientListJson[index].displayName);
			$("#id").html(clientListJson[index].id);
			$("#office").html(clientListJson[index].officeName);
			$("input#clientName").val(clientListJson[index].displayName);
			removeAllClient();
		}

		/* 设置客户端详细信息为空 */
		function setClientDetailEmpty() {
			$("#name").html("");
			$("#id").html("");
			$("#office").html("");
			$("input#clientName").val("");
			removeAllClient();
		}

		/* 移除所有搜索框下的client名字*/
		function removeAllClient() {
			$("ul").children("li").remove();
		}

		/* 添加 按钮的点击事件*/
		$.getWidget("add").click(function() {
			var id = $("#id").html();
			var name = $("#name").html();
			changeGroupMember("associateClients", id);
			//addToGroup(name, id);
			setClientDetailEmpty();
		});

		/* 将组成员信息放到已有成员列表效果 */
		function addToGroup(name, id) {
			$("#memberList")
					.append(
							"<div class='form-group' id='"+id+"' name='memberOfTheGroup'>"
									+ "<div style='padding-top: 10;padding-bottom: 35'>"
									+ "<div class='list-group-item col-sm-8' style='padding-top: 5;padding-bottom: 5'>"
									+ name
									+ " id("
									+ id
									+ ")</div><div class='col-sm-1'></div><div class='col-sm-3'>"
									+ "<button type='button' id='add' name='add' class='btn btn-primary' onclick='removeMember("
									+ id
									+ ");'><spring:message code='btn.delete' />"
									+ "</button></div></div></div>");
		}

		/* 变更组成员信息 */
		function changeGroupMember(requestType, id) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				data : {
					"dataType" : "POST",
					"mydata" : {
						'clientMembers' : [ id ]
					},
					"url" : "api.v1.groups." + groupId + "?command="
							+ requestType
				},
				callback : "changeSuccess"
			});
		}

		/* 变更完成后的回调函数 */
		function changeSuccess(param){
			
		}
		
		/* 移除成员效果 */
		function removeMember(id) {
			//$("#" + id).remove();
			changeGroupMember("disassociateClients", id);
			setClientDetailEmpty();
		}
	</script>
</body>
</html>