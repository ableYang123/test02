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
<body style="background-color: #fff">
	<div style="margin: 30px 200px;  font-size: large">
			<ul class="breadcrumb">
			<li class="active"><a href="#"><spring:message code="audit.list.title"/></a></li>
			</ul>
	</div>
	<div class="div-cc" >
		<div class="content-container" style="margin: 10px 30px">
			<div id="showDiv">
				<div class="row"> 
					<div class="form-group col-sm-10">
						 <input id="searchText" type="text" class="form-control" placeholder="<spring:message code="audit.list.search"/>">
					</div>
					<div class="form-group col-sm-1">
						<button id="downBtn" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-down"></span>
						</button>
					</div>
					<div class="form-group col-sm-1">
						<button id="searchBtn" type="button" class="btn btn-primary">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</div>
			</div>
			<div style="display:none;"  id="hideDiv">
				<form id="seerchForm">
					<div class="form-inline">
						<div class="form-group">
							<input id="searchTxt" class="form-control"  type="text" value="" placeholder="<spring:message code="audit.list.search"/>"/>
						</div>
						<div class="form-group">
							<input datetype="date" name="checkerDateTimeFrom">
						</div>
						<div class="form-group">
							<input datetype="date" name="checkerDateTimeTo">
						</div>
						<div class="form-group">
							<select id="processingResults" class="form-control">
								<option selected>--<spring:message code="audit.list.selectstatus"/>--</option>
							</select>
						</div>
						<div class="form-group" width="200px">
							<select id="actionNames" class="form-control">
								<option value='' selected><spring:message code="audit.list.all"/></option>
							</select>
						</div>
						<div class="form-group">
							<button type="reset" id="resetBtn" class="btn btn-primary control"><span><spring:message code="audit.list.reset"/></span></button>
						</div>
					</div>
					<div class="form-inline">
						<div class="form-group">
							<input id="ResoureIdTxt" class="form-control" width="155px" type="text" value="" placeholder="<spring:message code="audit.list.resource"/>"/>
						</div>
						<div class="form-group">
							<input datetype="date" name="makerDateTimeFrom">
						</div>
						<div class="form-group">
							<input datetype="date" name="makerDateTimeTo">
						</div>
						<div class="form-group">
							<select id="entityNames" class="form-control">
								<option selected><spring:message code="audit.list.all"/></option>
							</select>
						</div>
						<div class="form-group">
							<select id="appUsers" class="form-control">
								<option value='' selected><spring:message code="audit.list.all"/></option>
							</select>
						</div>
						<div class="form-group clear">
							<a id="btn" class="btn btn-primary control"><span><spring:message code="audit.list.adsearch"/></span></a>
						</div>
					</div>
				</form>
			</div>
			<div class="row" style="margin: 5px">
				<button id="csvBtn" type="button" class="btn btn-primary pull-right">
					<span class="glyphicon glyphicon-file"></span><spring:message code="audit.list.csv"/>
				</button>
			</div>
			<div class="row">
				<table style="display:none;" id="auditList">
					<thead id="auditList-thead">
						<tr>
							<th name="id" width='154'>ID</th>
							<th name="resourceId" width='154'><spring:message code="audit.list.resource"/></th>
							<th name="processingResult" width='154'><spring:message code="audit.list.status"/></th>
							<th name="maker" width='154'><spring:message code="audit.list.madeby"/></th>
							<th name="actionName" width='154'><spring:message code="audit.list.action"/></th>
							<th name="entityName" width='154'><spring:message code="audit.list.entity"/></th>
							<th name="officeName" width='154'><spring:message code="audit.list.office"/></th>
							<th name="madeOnDate" width='154' type="datetime"><spring:message code="audit.list.madedate"/></th>
							<th name="checker" width='154'><spring:message code="audit.list.checker"/></th>
							<th name="checkOnDate" width='154'><spring:message code="audit.list.checkeddate"/></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var grid1;
		var auditId;
		var url;
                                         		
		$(document).ready(function() {
			url="api.v1.audits?paged=true";
			nestjson={
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : url,
						"paging" : "Y"
					},
					callback : "auditList"
				};
			grid1 = $('#auditList').flexigrid(
					{
						title : '<spring:message code="audit.list.title"/>',
						nestjson : nestjson,
					});
			init(url);
			initSelect();
		});
		
		function init(url){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : url,
					"paging" : "Y"
				},
				callback : "auditList"
			});
		}

		function auditList(param){
			$.each(param.pageItems,function(index,item){
				if($.type(item.resourceId) === 'undefined'){
					item.resourceId = '';
				}
				if($.type(item.processingResult) === 'undefined'){
					item.processingResult = '';
				}
				if($.type(item.office) === 'undefined'){
					item.office = '';
				}
				if($.type(item.checker) === 'undefined'){
					item.checker = '';
				}
				if($.type(item.checkOnDate) === 'undefined'){
					item.checkOnDate = '';
				}
			});
			grid1.addRows(param.pageItems);
			grid1.setPage(param.page, param.pages);
		}
		
		function initSelect(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.audits.searchtemplate"
				},
				callback : "selectList"
			});
		}
		
		function selectList(param){
			$.setSelect('processingResults',param.processingResults,'id','processingResult');
			$.setSelect('appUsers',param.appUsers,'id','username');
			$.setSelectByList('entityNames',param.entityNames);
			$.setSelectByList('actionNames',param.actionNames);
		}

		$('#myModal').on('hidden.bs.modal', function (event) {
			/* 实现局部刷新 */
			init(url);
		});

		$.getWidget("auditList").click(function(){
			auditId = grid1.colVal('id');
			if(auditId)
				$.openWindow("loadPage.do?nextPage=system.audit.detailAudit");
		});
		
		$.getWidget("downBtn").click(function() {
			$("#showDiv").css('display','none');
			$("#hideDiv").css('display','');
			$.getWidget("resetBtn").click();
		});

		$.getWidget("btn").click(function() {
			var checkerDateTimeFrom = $('input[name=checkerDateTimeFrom]').val();
			var checkerDateTimeTo = $('input[name=checkerDateTimeTo]').val();
			var makerDateTimeFrom = $('input[name=makerDateTimeFrom]').val();
			var makerDateTimeTo = $('input[name=makerDateTimeTo]').val();
			var cId = $.value("searchTxt");
			var rId = $.value("ResoureIdTxt");
			var processingResults = $.value("processingResults");
			var appUsers = $.value("appUsers");
			var entityNames = $.value("entityNames");
			var actionNames = $.value("actionNames");
			url="api.v1.audits?&offset=0&paged=true";
			if(checkerDateTimeFrom!="")
				url+="&checkerDateTimeFrom="+checkerDateTimeFrom;
			if(checkerDateTimeTo!="")
				url+="&checkerDateTimeTo="+checkerDateTimeTo;
			if(makerDateTimeFrom!="")
				url+="&makerDateTimeFrom="+makerDateTimeFrom;
			if(makerDateTimeTo!="")
				url+="&makerDateTimeTo="+makerDateTimeTo;
			if(cId!="")
				url+="&makerId="+cId;
			if(rId!="")
				url+="&resourceId="+rId;
			if(actionNames!="")
				url+="&actionName="+actionNames;
			if(appUsers!="")
				url+="&checkerId="+appUsers;
			if(entityNames!="" && entityNames!=undefined)
				url+="&entityName="+entityNames;
			if(processingResults!="" && processingResults!=undefined)
				url+="&processingResult="+processingResults;
			//console.info(url);
			init(url); 
			$("#showDiv").css('display','');
			$("#hideDiv").css('display','none');
		});
		
		$.getWidget("searchBtn").click(function() {
			var cId = $.value("searchText");
			url="api.v1.audits?paged=true&makerId="+cId+"&offset=0";
			init(url);
		});
		
		$.getWidget("csvBtn").click(function() {
			$.tableToExcel('auditList');
		});
		
		
	</script>
</body>
</html>
