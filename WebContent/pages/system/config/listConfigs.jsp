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
				<li class="active"><a href="#"><spring:message code="config.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<div class="card">
				<div class="content">
					<input type="text" class="form-control" id="searchText" placeholder="search" />
					<table class="table table-hover ">
						<thead>
							<tr>
								<th style="display: none;">id</th>
								<th><spring:message code="config.list.name"/></th>
								<th><spring:message code="config.list.enabled"/>?</th>
								<th></th>
								<th><spring:message code="config.list.value"/></th>
								<th></th>
							</tr>
						</thead>
						<tbody id="configTableBody">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var configId;
		var grid1 = $('#configTableBody')[0];
		var newParam=[];
		var searchParam=[];
		//初始化  
		$(document).ready(function() {
			init();
		});
		
		function init() {
			//
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "", 
					"url" : "api.v1.caches"
				},
				callback : "" 
			});
			//加载列表数据
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.configurations"
				},
				callback : "listConfigs"
			});
		};

		/*搜索框查询*/
		$("#searchText").keyup(function(){
			var searchText=$(this).val();
			if($.trim(searchText)!=''){
				var txt=searchText.toLowerCase();
				$.each(newParam[0],function(i,obj){
					var name=obj.name.toLowerCase();
					if(name.indexOf(txt)!=-1){
						searchParam.push(obj);
					}

				});
				addRows(grid1,searchParam);
				searchParam=[];
			}else{
				addRows(grid1,newParam[0]);
			}
		});

		function listConfigs(param){
			addRows(grid1,param.globalConfiguration);
			newParam.push(param.globalConfiguration);
		};

		function addRows(grid,param){
			grid1.innerHTML = "";
			$.each(param,function(index,item) {
				var str = "";
				str += "<tr><td style='display: none;'>" + item.id + "</td>"
						+ "<td>" + item.name + "</td>";
				if (!item.enabled) {
					str += "<td><i class='glyphicon glyphicon-remove' style='color:red'></i></td>"
							+ "<td><button type='button' class='btn btn-primary'>Enable</button></td>";
				} else {
					str += "<td><i class='glyphicon glyphicon-ok' style='color:green'></i></td>"
							+ "<td><button type='button' class='btn btn-danger'>Disable</button></td>";
				}
				str += "<td>" + item.value + "</td>"
						+ "<td><a><i class='glyphicon glyphicon-pencil'></i></a></td></tr>";
				grid.innerHTML += str;
			});
		}

		$('#configTableBody').on('click','button',function(){
			configId = this.parentNode.parentNode.childNodes[0].innerHTML;
			var data = {};
			if(this.className.indexOf("btn-pri") != -1){
				data.enabled = true;
			}else{
				data.enabled = false;
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : data,
					"url" : "api.v1.configurations."+configId
				},
				callback : "callbackBtn"
			}); 
		});
		
		function callbackBtn(){
			init();
		}
		
		$('#configTableBody').on('click','a',function(){
			configId = this.parentNode.parentNode.childNodes[0].innerHTML;
			$.openWindow("loadPage.do?nextPage=system.config.editConfig");
		});
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			/* 实现局部刷新 */
			init();
		});
	</script>
</body>
</html>





	