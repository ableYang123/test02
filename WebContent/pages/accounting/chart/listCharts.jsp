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
				<li class="active"><a href="#"><spring:message code="chart.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<div class="form-group">
				<div class="pull-right" style="padding-right: 50px">
					<button type='button' id="treeBtn" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span><spring:message code="chart.list.tree"/></button>
					<button type='button' id="tableBtn" class="btn btn-primary" style="display:none;"><span class="glyphicon glyphicon-plus"></span><spring:message code="chart.list.list"/></button>
				</div>
			</div><br/><br/>
			<div id="tableCard" class="card" style="display: ;">
				<div class="content">
					<table style="display:none;" id="chartList">
						<thead>
							<tr>
								<th name="id" width='210' style="display:none;">ID</th>
								<th name="name" search="true" width='210'><spring:message code="chart.list.account"/></th>
								<th name="glCode" search="true" width='210'><spring:message code="chart.list.glcode"/></th>
								<th name="type.value" search="true" width='210'><spring:message code="chart.list.type"/></th>
								<th name="disabled" width='210'><spring:message code="chart.list.disabled"/>?</th>
								<th name="manualEntriesAllowed" width='210'><spring:message code="chart.list.allowed"/></th>
								<th name="usage.value" width='210'><spring:message code="chart.list.usedas"/></th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<div id="treeCard" class="card" style="display: none;">
				<div class="content">
					<div class="col-sm-5" id="treeCharts"></div>
					<div class="col-sm-7">
						<table class="table" id="treeTable">
							<tbody>
								<tr>
									<td width="40%">GL Code</td>
									<td></td>
								</tr>
								<tr>
									<td>Account Type</td>
									<td></td>
								</tr>
								<tr>
									<td>Account Usage</td>
									<td></td>
								</tr>
								<tr>
									<td>Manual Entries Allowed</td>
									<td></td>
								</tr>
								<tr>
									<td>Description</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var grid1;	
		var chartId;
		var treedate;
		var tree = [];
		
		//初始化  
		$(document).ready(function() {
			grid1 = $('#chartList').flexigrid(
					{
						title : '<spring:message code="chart.list.title"/>',
						pcpager : true,
						buttons :  [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDisable,bclass : 'disable', onpress: DISABLE},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnEnable,bclass : 'enable', onpress: ENABLE},]
					});
			init();
		});
		
		function init() {
			//加载列表数据
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.glaccounts"
				},
				callback : "listCharts"
			});
			
		};
		
		function listCharts(param){
			for(var i=0;i<param.length;i++){
				if(!param[i].description)
					param[i].description = "";
			}
			tree = param;
			grid1.addRows(param);
			var treedata  = $.treeData(param);
			$('#treeCharts').treeview({
				data : treedata,		//这里使用上述json格式的数据
				color: "#428bca",		//以下是相关初始化设置
				showBorder: false,
				showIcon : false,
				showCheckbox: false,
				onNodeSelected: selectNode
			});
		};
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=accounting.chart.addChart");
		}
		
		function EDIT(){
			chartId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=accounting.chart.editChart");
		}
		
		function DELETE(){
			chartId = grid1.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "DELETE",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.glaccounts."+chartId
				},
				callback : init
			});
		}
		
		function DISABLE(){
			chartId = grid1.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "PUT",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : {"disabled":true},
					"url" : "api.v1.glaccounts."+chartId
				},
				callback : init
			});
		}
		
		function ENABLE(){
			chartId = grid1.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "PUT",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : {"disabled":false},
					"url" : "api.v1.glaccounts."+chartId
				},
				callback : init
			});
		};
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			init();
		});
		
		function selectNode(event,node){
			console.info(tree);
			for(var i in tree){
				if(tree[i].id == node.id){
					$("#treeTable tr td")[1].innerHTML = tree[i].glCode;
					$("#treeTable tr td")[3].innerHTML = tree[i].type.value;
					$("#treeTable tr td")[5].innerHTML = tree[i].usage.value;
					$("#treeTable tr td")[7].innerHTML = tree[i].manualEntriesAllowed;
					$("#treeTable tr td")[9].innerHTML = tree[i].description;
				}
			}
		};
		
		$.getWidget("treeBtn").click(function() {
			toggleBtn();
		});

		$.getWidget("tableBtn").click(function() {
			toggleBtn();
		});
		
		function toggleBtn(){
			$("#tableBtn").toggle();
			$("#treeBtn").toggle();
			$("#tableCard").toggle();
			$("#treeCard").toggle();
		}
	</script>
</body>
</html>





	