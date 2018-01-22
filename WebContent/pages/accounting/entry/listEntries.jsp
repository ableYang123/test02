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
				<li class="active"><a href="#"><spring:message code="entry.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<div class="row" style="margin: 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table style="display:none;" id="entryList">
				<thead>
					<tr>
						<th name="id" width='200' style="display:none;">ID</th>
						<th name="createdUser" width='200'><spring:message code="entry.list.createdby"/></th>
						<th name="createdDate" width='200'><spring:message code="entry.list.createdon"/></th>
						<th name="journalEntry" width='200'><spring:message code="entry.list.journal"/></th>
						<th name="viewReport" width='200'><spring:message code="entry.list.report"/></th>
						<th name="recreatePro" width='200'><spring:message code="entry.list.recreate"/></th>
						<th name="viewEntries" width='200'><spring:message code="entry.list.viewjour"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var nestjson;
		var entryId;
		//初始化  
		$(document).ready(function() {
			var format = $.getCookie("dateFormat")+"";
			if(format==null||format=="1"){
				format='yyyy-MM-dd';
			}else if(format=="2"){
				format='yyyy/MM/dd';
			}else if(format=="3"){
				format='dd-MM-yyyy';
			}else if(format=="4"){
				format='dd/MM/yyyy';
			}
			nestjson={
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.provisioningentries?dateFormat="+format+"&locale=en", 
					"paging" : "Y"
				},
				callback : "saveaccruals"
			};
			grid1 = $('#entryList').flexigrid(
					{
						title : '<spring:message code="entry.list.title"/>',
						nestjson : nestjson,
						/*buttons :  [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress: ADD},]*/
					});
			init();
			
		});
		
		function init(){
			$.nest(nestjson);
		}
		
		function saveaccruals(param){
			for(var i in param.pageItems){//journalEntry
				
				param.pageItems[i].viewReport='<input type="button" value="<spring:message code='entry.list.view'/>" name="btn1"/>';
				if(param.pageItems[i].journalEntry){
					param.pageItems[i].journalEntry='<input type="checkbox" checked="checked" disabled="disabled"/>'
					param.pageItems[i].recreatePro='';
					param.pageItems[i].viewEntries='<input type="button" value="<spring:message code='entry.list.view'/>" name="btn3"/>';
				}else{
					param.pageItems[i].journalEntry='<input type="checkbox" disabled="disabled"/>'
					param.pageItems[i].recreatePro='<input type="button" value="<spring:message code='entry.list.recre'/>" name="btn2"/>';
					param.pageItems[i].viewEntries='';
				}
			}
			grid1.addRows(param.pageItems);
			grid1.setPage(param.page, param.pages);
		}
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=accounting.entry.addEntry");
		}
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			init();
		});
		
		$("#entryList").on("click","input[type=button]",function(){
			entryId=$(this).closest('tr').find("td")[0].innerText
			if(this.name=="btn1"){
				$.openWindow("loadPage.do?nextPage=accounting.entry.viewEntry");
			}else if(this.name=="btn2"){
				$.openWindow("loadPage.do?nextPage=accounting.entry.editEntry");
			}else{
				$.openWindow("loadPage.do?nextPage=accounting.entry.view2Entry");
			}
		});
		
	</script>
</body>
</html>