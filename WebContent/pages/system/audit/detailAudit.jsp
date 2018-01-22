<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	String path = request.getContextPath(); 
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="background-color: f8f8f8"> 
	<div class="toolbar">
		<h4><spring:message code="audit.detail.title"/></h4>
	</div>
	<hr>
	<div class="">
		<table width="100%">
			<tbody>
				<tr>
					<td width="35%">ID:</td>
					<td width="65%" id="Aid"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.status"/>:</td>
					<td id="AprocessingResult"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.user"/>:</td>
					<td id="Amaker"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.action"/>:</td>
					<td id="AactionName"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.entity"/>:</td>
					<td id="AentityName"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.resource"/>:</td>
					<td id="AresourceId"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.date"/>:</td>
					<td id="AmadeOnDate"></td>
				</tr>
				<tr>
					<td><spring:message code="audit.list.office"/>:</td>
					<td id="Aoffice"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="">
		<table width="100%">
			<thead>
				<tr>
					<th width="35%"><spring:message code="audit.list.command"/></th>
					<th width="65%"></th>
				</tr>
			</thead>
			<tbody id="table-body">
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		
		$(document).ready(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.audits."+auditId
				},
				callback : "detailAudit"
			});			
		});
		function detailAudit(param){
			$("#Aid")[0].innerText = param.id;
			$("#AprocessingResult")[0].innerText = param.processingResult;
			$("#Amaker")[0].innerText = param.maker;
			$("#AactionName")[0].innerText = param.actionName;
			$("#AentityName")[0].innerText = param.entityName;
			$("#AresourceId")[0].innerText = param.resourceId;
			$("#AmadeOnDate")[0].innerText = new Date(param.madeOnDate);
			$("#Aoffice")[0].innerText = new Date(param.office);
			var data = $.strToJson(param.commandAsJson);
			var str;
			for(var o in data){  
				var i = JSON.stringify(data[o]);
				if(i[0]=="\""){
					i = i.substr(1,i.length-2);
				}
				str = "<tr><td>"+o+":</td><td>"+i+"</td></tr>"
				$('#table-body')[0].innerHTML += str;
		    }  
			
		}
		
	</script>
</body>
</html>