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
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="jobs.list.title"/></a></li>
				</ul>
		</div>
		<div class="div-cc" >
		<div class="card">
    	<div class="content">
    		<div>
    		    <table class="table-condensed">
    		        <tbody><tr id="stopTr" style="display:;">
    		            <td><h3><strong><spring:message code="jobs.list.schedulerstatus"/>&nbsp;:</strong>&nbsp;<spring:message code="jobs.list.active"/></h3></td>
    		            <td></td>
    		            <td>
    		                <button id="stopBtn" class="btn-warning" ><span class="glyphicon glyphicon-remove"></span><spring:message code="jobs.list.suspend"/></button>
    		            </td>
    		        </tr>
    		        <tr id="startTr" style="display:none;">
    		            <td><h3><strong><spring:message code="jobs.list.schedulerstatus"/>&nbsp;:</strong>&nbsp;<spring:message code="jobs.list.standby"/></h3></td>
    		            <td></td>
    		            <td>
    		                <button id="startBtn"  class="btn-success" ><spring:message code="jobs.list.activate"/></button>
    		            </td>
    		        </tr>
    		    </tbody></table>
    		    <table id="runJobTable" class="table" style="display:none;">
    		        <thead><tr>
    		            <th><spring:message code="jobs.list.execution"/></th>
    		        </tr>
    		    </thead><tbody></tbody></table>
    		    <table class="table table-hover ">
    		        <thead>
    		            <tr>
    		                <th><input id="selectAll" type="checkbox"></th>
    		                <th style="display:none;">id</th>
    		                <th><spring:message code="jobs.list.name"/></th>
    		                <th><spring:message code="jobs.list.nextrun"/></th>
    		                <th><spring:message code="jobs.list.previousrun"/></th>
    		                <th><spring:message code="jobs.list.runstatus"/></th>
    		                <th><spring:message code="jobs.list.currentrunning"/></th>
    		                <th><spring:message code="jobs.list.errorlog"/></th>
    		            </tr>
    		        </thead>
    		        <tbody id="jobTableBody">
    		            
    		        </tbody>
    		    </table>
    		    <div>
    		        <button id="run" class="btn btn-primary"><span class="glyphicon glyphicon-play"></span><spring:message code="jobs.list.runselectedjobs"/></button>
    		        <button id=refush class="btn btn-primary"><span class=" glyphicon glyphicon-repeat"></span><spring:message code="jobs.list.refresh"/></button>
    		    </div>
    		</div>
    	</div>
    </div>
		</div>
	</div>

	<script type="text/javascript">
	var jobId;
	
	//初始化
	$(document).ready(function() {
		init();
	});
	
	function init(){
		//加载列表数据
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.jobs"
			},
			callback : "listJobs"
		});
		//加载状态
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.scheduler"
			},
			callback : "setActive"
		});
	};
	//加载列表数据回调
	function listJobs(param){
		$('#jobTableBody')[0].innerHTML='';
		for(var o in param){
			var str = ' <tr>'
	            +'<td><input type="checkbox"></td>'
	            +'<td style="display:none;">'+param[o].jobId+'</td>'
	            +'<td>'+param[o].displayName+'</td>'
	            +'<td>'+param[o].nextRunTime+'</td>';
	            if(param[o].lastRunHistory){
	            	str += '<td>'+param[o].lastRunHistory.jobRunStartTime+'</td>'
  		            +'<td>'+param[o].lastRunHistory.status+'</td>';
	            }else{
	            	str += '<td></td>'
					+'<td></td>';
	            }
	            str += '<td>'+param[o].currentlyRunning+'</td>'
	            +'<td></td>'
	            +'</tr>';
	            $('#jobTableBody')[0].innerHTML += str;
		}
	};
	//加载状态回调
	function setActive(param){
		if(param.active){
			$('#stopTr').css('display','');
			$('#startTr').css('display','none');
		}else{
			$('#stopTr').css('display','none');
			$('#startTr').css('display','');
		}
	}
	//刷新按钮点击事件
	$.getWidget("refush").click(function(){
		init();
		$('#selectAll').attr("checked",false);
		$('#runJobTable').css('display','none');
	});
	//全选按钮点击事件
	$.getWidget("selectAll").click(function(event){
		$('#jobTableBody input[type=checkbox]').prop("checked",this.checked);
	});
	//点击每一行的事件
	$('#jobTableBody').on('click','tr td:not(:first-child)',function(){
		jobId = this.parentNode.childNodes[1].innerText;
		$.openWindow("loadPage.do?nextPage=system.jobs.editJob");
	});
	//暂停按钮点击事件
	$.getWidget("stopBtn").click(function(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "POST",
				"mydata" : '',
				"url" : "api.v1.scheduler?command=stop"
			},
			callback : ""
		});
		init();
	})
	//"headers":{"Fineract-Platform-TenantId": "default","Authorization": "Basic bWlmb3M6cGFzc3dvcmQ="},
	//激活按钮点击事件
	$.getWidget("startBtn").click(function(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : { 
				"dataType" : "POST",
				"mydata" : '',
				"url" : "api.v1.scheduler?command=start" 
			},
		});
		init();
	})
	//运行按钮点击事件
	$.getWidget("run").click(function(){
		$('#runJobTable').css('display','');
		$('#runJobTable tbody')[0].innerHTML="";
		var tr = $('#jobTableBody tr');
		for(var o in tr){
			if(tr[o].childNodes[0].childNodes[0].checked){
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : { 
						"dataType" : "POST",
						"mydata" : "", 
						"url" : "api.v1.scheduler."+tr[o].childNodes[1].innerHTML+"?command=executeJob" 
					},
					callback : ""
				});
				$('#runJobTable tbody')[0].innerHTML+='<tr>'
		            +'<td><i class="glyphicon glyphicon-ok"></i>'+tr[o].childNodes[2].innerHTML+'</td>'
		            +'</tr>';
			};
		}
	});
	
	$('#myModal').on('hidden.bs.modal', function (event) {
		init();
	});
	</script>
</body>
</html>
