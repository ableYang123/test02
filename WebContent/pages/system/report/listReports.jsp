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
	<div class="content-container" >
		<div class="row" style="font-size: large;margin: 30px 200px;">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="report.list.report"/></a></li>
			</ul>
		</div>
		<div class="row div-cc">
			<table style="display:none;" id="reportList">
				<thead>
					<tr>
						<th name="id" width='210' style="display:none;">ID</th>
						<th name="reportName" search="true" width='210'><spring:message code="report.list.reportname"/></th>
						<th name="reportType" width='210'><spring:message code="report.list.reporttype"/></th>
						<th name="reportSubtype" width='210'><spring:message code="report.list.reportsubtype"/></th>
						<th name="reportCategory" width='210'><spring:message code="report.list.reportcategory"/></th>
						<th name="coreReport" width='210'><spring:message code="report.list.reportcore"/></th>
						<th name="useReport" width='210'><spring:message code="report.list.reportuser"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var grid1;
		var auditId;
	                                     		
		$(document).ready(function() {
			grid1 = $('#reportList').flexigrid({
				title : '<spring:message code="report.list.report"/>',
				pcpager : true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
			});
			init();
		});
		
		function init(){
			$.nest(nestjson={
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.reports"
				},
				callback : "reportList"
			});
		}
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			init();
		});
		
		function reportList(param){
			$.each(param,function(index,item){
				if($.type(item.reportSubtype) === 'undefined'){
					item.reportSubtype = '';
				}
				if($.type(item.reportCategory) === 'undefined'){
					item.reportCategory = '';
				}
			});
			grid1.addRows(param);
		}
		
		function ADD() {
			$.openWindow("loadPage.do?nextPage=system.report.addReport");
		};
		
		function EDIT() {
			auditId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=system.report.editReport");
		};
		
		function DELETE() {
			auditId = grid1.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.reports."+auditId
				},
				callback : "deleteReport"
			});
		};
		
		function deleteReport(){
			init();
		}
	</script>
</body>
</html>