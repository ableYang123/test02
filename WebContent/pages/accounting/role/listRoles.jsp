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
				<li class="active"><a href="#"><spring:message code="rule.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<table style="display:none;" id="rolesList">
				<thead>
					<tr>
						<th name="id" width='200' style="display:none;">ID</th>
						<th name="name" width='200'><spring:message code="rule.list.name"/></th>
						<th name="officeName" width='200'><spring:message code="rule.list.office"/></th>
						<th name="debitTag" width='200'><spring:message code="rule.list.debtags"/></th>
						<th name="debitAccount" width='200'><spring:message code="rule.list.debaccount"/></th>
						<th name="creditTag" width='200'><spring:message code="rule.list.cretags"/></th>
						<th name="creditAccount" width='200'><spring:message code="rule.list.creaccount"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var roleId;
		//初始化  
		$(document).ready(function() {
			grid1 = $('#rolesList').flexigrid(
					{
						title : '<spring:message code=" "/>会计规则',
						pcpager : true,
						buttons :  [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},]
					});
			init();
		});
		
		function init(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.accountingrules"
				},
				callback : "listRoles"
			});
		};
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			init();
		});
		
		function listRoles(param){
			for(var i in param){
				for(var o in param[i].creditTags){
					param[i].creditTag = param[i].creditTags[o].tag.name + ",";
				}
				for(var o in param[i].debitTags){
					param[i].debitTag = param[i].debitTags[o].tag.name + ",";
				}
				param[i].debitAccount = param[i].debitAccounts[0].name;
				param[i].creditAccount = param[i].creditAccounts[0].name;
			}
			grid1.addRows(param);
		};
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=accounting.role.addRole");
		};
		
		function EDIT(){
			roleId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=accounting.role.editRole");
		};
		
		function DELETE(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.accountingrules."+grid1.colVal('id')
				},
				callback : "init"
			});
		};
	</script>
</body>
</html>