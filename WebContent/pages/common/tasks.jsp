<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
.dpdown{
		position: absolute;
		float: left;
		z-index: 1000;
   		min-width: 160px;
    	padding: 5px 0;
    	margin: 2px 0 0;
    	list-style: none;
    	font-size: 14px;
    	text-align: left;
    	background-color: #fff; 
    	border: 1px solid rgba(0, 0, 0, 0.15);
    	border-radius: 4px;
    	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
    	background-clip: padding-box;
    	display: none;
	}

.head-affix {
	width: 80%;
	top: 50px;
	position: static;
}


.viewchecker {
	padding-right: 60px;
	float: right;
	clear: both;
}
</style>
</head>
<body>
		<div class="container">
			<h3><strong><spring:message code="label.heading.pendingtasks"/></strong></h3>
			<ul class="nav nav-tabs" id="mytab">
				<li role="presentation" class="active"><a href="#checkerinbox"><spring:message code="label.heading.checkerinbox"/></a></li>
				<li role="presentation"><a href="#clientapproval"><spring:message code="label.heading.clientapproval"/></a></li>
				<li role="presentation"><a href="#loanapproval"><spring:message code="label.heading.loanapproval"/></a></li>
				<li role="presentation"><a href="#loandisbursal"><spring:message code="label.heading.loandisbursal"/></a></li>
				<li role="presentation"><a href="#rescheduleloan"><spring:message code="label.heading.rescheduleloan"/></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="checkerinbox">
					<div>
						<div class="head-affix">
							<table>
							<tr>
								<td>
									<input datatype="match" for="search" source="maker" id="taskssearch"  class="form-control" value='' autocomplete="off" style="width: 160px;">
								</td>
								<td>	
							        <button id="chevron-down" type="button"
							        	class="btn  btn-default">
							        	<i class="glyphicon glyphicon-chevron-down"></i>
							        </button>
								    <button id="approve" class="btn btn-success" type="button">
								    	<span class="glyphicon glyphicon-ok"></span><spring:message code="label.button.approve"/>
								    </button>
								    <button id="delete" class="btn btn-danger" type="button">
								    	<span class="glyphicon glyphicon-trash"></span> <spring:message code="label.button.delete"/>
								    </button>
								    <button id="reject" class="btn btn-warning" type="button">
								    	<span class="glyphicon glyphicon-remove"></span> <spring:message code="label.button.reject"/>
								    </button>
								</td>
							</tr>
							</table>
						</div>
					</div>
					<div id="serch-form" style="display:none;">
						<form>
						<br>
							<div class="form-group">
								<table>
									<tr>
										<td><spring:message code="label.input.fromdate"/>：</td>
										<td><input type="text" datetype="date" name="makerDateTimeFrom"  afterToday="true" class="datetime"></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="label.input.todate"/>：</td>
										<td><input type="text" datetype="date" name="makerDateTimeto"  afterToday="true" class="datetime"></td>
									</tr>
								</table>
							</div>
							<div class="form-group">
								<spring:message code="label.heading.action"/>：
								<select class="form-control" name="actionName">
								<option value=""><spring:message code="label.anchor.all"/></option>
								</select>
							</div>
							<div class="form-group">
								<spring:message code="label.heading.entity"/>：
								<select class="form-control" name="entityName">
								<option value=""><spring:message code="label.anchor.all"/></option>
								</select>
							</div>
							<div class="form-group">
								<spring:message code="label.heading.entityid"/>：
								<input name="resourceId">
							</div>
							<button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i><spring:message code="label.button.advancesearch"/></button>
						</form>
					</div>
					<table  id="taskstable">
						<thead>
							<tr>
								<th name='id' width='100'><spring:message code="label.heading.id"/></th>
								<th name='madeOnDate' type='date' width='210'><spring:message code="label.heading.madeondate"/></th>
								<th name='processingResult' width='210'><spring:message code="label.heading.status"/></th>
								<th name='maker' width='100'><spring:message code="label.heading.user"/></th>
								<th name='actionName' width='210'><spring:message code="label.heading.action"/></th>
								<th name='resourceId' width='100'><spring:message code="label.heading.entityid"/></th>
								<th name='entityName' width='210'><spring:message code="label.heading.entity"/></th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tab-pane" id="clientapproval">
					<div class="head-affix">
						<span class="form-group sercher"> <span
							class="input-append grpinputicons">
							<input id="clientapprovalsearch" type="text">
						</span>
						</span> <span class="form-group">
							<button id="approveClients" class="btn btn-success" type="button">
								<span class="glyphicon glyphicon-ok"></span> <spring:message code="label.button.approve"/>
							</button>
						</span>
					</div>
					<div id="groupclients"></div>

				</div>
				<div class="tab-pane" id="loanapproval">
					<div class="head-affix">
						<span class="form-group sercher"> <span
							class="input-append grpinputicons">
							 <input id="loanapprovalsearch" type="text">
						</span>
						</span> <span class="form-group">
							<button id="approveLoan" class="btn btn-success" type="button">
								<span class="glyphicon glyphicon-ok"></span> <spring:message code="label.button.approve"/>
							</button>
						</span>
					</div>
					<div id="grouploanapproval"></div>
				</div>
				<div class="tab-pane" id="loandisbursal">
					<div class="head-affix">
						<span class="form-group sercher"> <span
							class="input-append grpinputicons"> 
							<input id="loandisbursalsearch" type="text">	
						</span>
						</span> <span class="form-group">
							<button id="apply" class="btn btn-success" type="button">
								<span class="glyphicon glyphicon-ok"></span> <spring:message code="label.heading.disburse"/>
							</button>
						</span>
					</div>
					<table  id="loandisbursaltable">
						<thead>
							<tr>
								<th name="id" style="display: none;"><spring:message code="label.heading.id"/></th>
								<th name="clientId" style="display: none;"><spring:message code="label.heading.clientid"/></th>
								<th name="clientName"  width="210"><spring:message code="label.heading.client"/></th>
								<th name="loanProductName" width="210"><spring:message code="label.heading.loanproduct"/></th>
								<th name="accountNo" width="210"><spring:message code="label.heading.loanaccount"/></th>
								<th name="approvedPrincipal" width="210"><spring:message code="label.heading.disburse"/></th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tab-pane" id="rescheduleloan">
					<div class="head-affix">
						<span class="form-group sercher"> <span
							class="input-append grpinputicons">
							 <input id="rescheduleloansearch" type="text">
						</span>
						</span> <span class="form-group">
							<button id="approverescheduleloan" class="btn btn-success" type="button">
								<span class="glyphicon glyphicon-ok"></span> <spring:message code="label.button.approve"/>
							</button>
						</span>
					</div>
					<table  id="rescheduleloantable">
						<thead>
							<tr>
								<th name="id" style="display: none;"><spring:message code="label.heading.id"/></th>
								<th name="clientId" style="display: none;"><spring:message code="label.heading.clientid"/></th>
								<th name="clientName"  width="210"><spring:message code="label.heading.client"/></th>
								<th name="loanProductName" width="210"><spring:message code="label.heading.reschulerequest"/></th>
								<th name="accountNo" width="210"><spring:message code="label.heading.loanaccount"/></th>
								<th name="rescheduleFromDate" width="210" type='date' ><spring:message code="label.heading.reschedulefrom"/></th>
								<th name="rescheduleReasonCodeValue.name" width="210"><spring:message code="label.heading.reschedulereason"/></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	<script>
	var taskid;
	var grid1,grid2,grid3;
	var client_grid = new Array();
	var offices={};
	var searchtemplates;
	var loan_grid=new Array();
	$(document).ready(function() {
	    $('#myTab a:first').tab('show'); //初始化显示哪个tab 
	    $('#myTab a').click(function(e) {
	        e.preventDefault(); //阻止a链接的跳转行为 
	        $(this).tab('show'); //显示当前选中的链接及关联的content 
	    });
	    $('#chevron-down').click(function() {
	        var display = $('#serch-form').css('display');
	        $('#serch-form').toggle();
	    });
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "url": "api.v1.offices"
	        },
	        callback: function(param) {
	    	    $.each(param,function(index,value){
	    	    	offices[value.id]=value;
	    	    });
	        }
	    });
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "url": "api.v1.makercheckers.searchtemplate"
	        },
	        callback: function(param) {
	            searchtemplates = param;
	            var select1=$("select[name='actionName']")[0];
	            var select2=$("select[name='entityName']")[0];
	            $.each(param.actionNames,function(index,value){
	            	switch(value){
		            	case 'CREATE':
		            		value='C_!!';
		            		var option='<option value="'+value+'">CREATE</option>';
		            		$(select1).append(option);
		    			  break;
		            	case 'DELETE':
		            		value='D_!!';
		            		var option='<option value="'+value+'">DELETE</option>';
			            	$(select1).append(option);
		    			  break;
		            	case 'UPDATE':
		            		value='U_!!';
		            		var option='<option value="'+value+'">UPDATE</option>';
		            		$(select1).append(option);
		    			  break;
		            	default:
			            	var option='<option value="'+value+'">'+value+'</option>';
			            	$(select1).append(option);
	            	}
	            });
	            $.each(param.entityNames,function(index,value){
	            	var option='<option value="'+value+'">'+value+'</option>';
            		$(select2).append(option);
	            });
	        }
	    });
	    init();
	    $('#approve').click(function() {
	    	var tem=grid1.getColValues(grid1.getSelectRows(), "id");
	    	var call="";
	        $.each(tem,function(index, value) {
	        	if(index==tem.length-1){
	        		call="init"
	        	}
	            approveOne(value, call);
	        });
	    });
	    $('#delete').click(function() {
	    	var tem=grid1.getColValues(grid1.getSelectRows(), "id");
	        var call="";
	        $.each(tem,function(index, value) {
	        	if(index==tem.length-1){
	        		call="init";
	        	}
	        	deleteOne(value, call);
	        });
	    });
	    $('#reject').click(function() {
	    	var tem=grid1.getColValues(grid1.getSelectRows(), "id");
	        var call="";
	        $.each(tem,function(index, value) {
	        	if(index==tem.length-1){
	        		call="init";
	        	}
	        	rejectOne(value, call);
	        });
	    });
	    $('#approveClients').click(function() {
	        $.openWindow("loadPage.do?nextPage=client.activeClient", "", "80%", "90%");
	    });
	    $('#approveLoan').click(function() {
	    	$.openWindow("loadPage.do?nextPage=common.MSGBox&boxtype=1", "", "45%");
		});
	    $('#apply').click(function() {
	    	$.openWindow("loadPage.do?nextPage=common.MSGBox&boxtype=2", "", "45%");
		});
	   /*  $('#approverescheduleloan').click(function() {
	    	$.openWindow("loadPage.do?nextPage=common.MSGBox&boxtype=3", "", "45%");
		});
	    $('form select[name="actionName"] option:selected').input(function(){
	    	$('form select[name="entityName"] option:selected')
	    }); */
	    $('form input[name="resourceId"]').keyup(function(){
	    	var c=$(this);  
            if(/[^\d]/.test(c.val())){//替换非数字字符  
              var temp_amount=c.val().replace(/[^\d]/g,'');  
              $(this).val(temp_amount);  
            } 
	    });
	   $('form button:first').click(function(){
		   var actionName=$('form select[name="actionName"] option:selected').val();
		   var entityName=$('form select[name="entityName"] option:selected').val();
		   var makerDateTimeFrom=$('form input[name="makerDateTimeFrom"]').val();
		   var makerDateTimeto=$('form input[name="makerDateTimeto"]').val();
		   var resourceId=$('form input[name="resourceId"]').val();
		   var urlparam='';
		   var flag=false;
		   if(!$.isEmpty(actionName)){
			   urlparam+="?actionName="+actionName;
			   flag=true;
		   }
		   if(!$.isEmpty(entityName)){
			   if(!flag){
				   urlparam+="?entityName="+entityName;
			   }else{
				   urlparam+="&entityName="+entityName;
			   }
			   flag=true;
		   }
		   if(!$.isEmpty(makerDateTimeFrom)){
			   if(!flag){
				   urlparam+="?makerDateTimeFrom="+makerDateTimeFrom;
			   }else{
				   urlparam+="&makerDateTimeFrom="+makerDateTimeFrom;
			   }
			   flag=true;
		   }
		   if(!$.isEmpty(makerDateTimeto)){
			   if(!flag){
				   urlparam+="?makerDateTimeto="+makerDateTimeto;
			   }else{
				   urlparam+="&makerDateTimeto="+makerDateTimeto;
			   }
			   flag=true;
		   }
		   if(!$.isEmpty(resourceId)){
			   if(!flag){
				   urlparam+="?resourceId="+resourceId;
			   }else{
				   urlparam+="&resourceId="+resourceId;
			   }
			   flag=true;
		   }
		   /* alert(actionName+":"+entityName+":"+makerDateTimeFrom+":"+makerDateTimeto+":"+resourceId)
		   alert(urlparam); */
		   $.nest({
		        url: "<c:url value='/fineract.do'/>",
		        type: "post",
		        async: true,
		        data: {
		            "dataType": "GET",
		            "mydata": "",
		            "url": "api.v1.makercheckers"+urlparam
		        },
		        callback: "listTasks"
		    });
	   });
	});
	function actualDisbursement(json){
		var batches = new Array();
		$.each(grid2.getColValues(grid2.getSelectRows(), "id"),
		function(i, loan_id) {
			alert(loan_id);
		    var bat = {
		        "requestId": i + 1,
		        "relativeUrl": "loans/" + loan_id + "?command=disburse",
		        "method": "POST",
		        "body": JSON.stringify(json)
		    };
		    batches.push(bat);
		});
		if(batches.length==0){
	    	retrun;
	    }
	    alert(JSON.stringify(batches));
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "POST",
	            "mydata": batches,
	            "url": "api.v1.batches"
	        },
	        callback: "init"
	    });
	}
	function approveLoans(json) {
		var tem = loan_grid[0];
	    var batches = new Array();
	    $.each(loan_grid,
	    function(index, value) {
	        $.each(tem.getColValues(value.getSelectRows(), "id"),
	        function(i, loan_id) {
	        	alert(loan_id);
	            var bat = {
	                "requestId": i + 1,
	                "relativeUrl": "loans/" + loan_id + "?command=approve",
	                "method": "POST",
	                "body": JSON.stringify(json)
	            };
	            batches.push(bat);
	        });
	    });
	    if(batches.length==0){
	    	retrun;
	    }
	    alert(JSON.stringify(batches));
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "POST",
	            "mydata": batches,
	            "url": "api.v1.batches"
	        },
	        callback: "init"
	    });
	}
	function approveClients(json) {
	    var tem = client_grid[0];
	    var batches = new Array();
	    $.each(client_grid,
	    function(index, value) {
	        $.each(tem.getColValues(value.getSelectRows(), "id"),
	        function(i, client_id) {
	            var bat = {
	                "requestId": i + 1,
	                "relativeUrl": "clients/" + client_id + "?command=activate",
	                "method": "POST",
	                "body": JSON.stringify(json)
	            };
	            batches.push(bat);
	        });
	    });
	    if(batches.length==0){
	    	retrun;
	    }
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "POST",
	            "mydata": batches,
	            "url": "api.v1.batches"
	        },
	        callback: "init"
	    });
	}

	function init() {
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "mydata": "",
	            "url": "api.v1.makercheckers"
	        },
	        callback: "listTasks"
	    });
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "mydata": "",
	            "url": "api.v1.clients?limit=1000&sqlSearch=c.status_enum%3D100"
	        },
	        callback: "listClients"
	    });
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "mydata": "",
	            "url": "api.v1.loans?limit=1000&sqlSearch=l.loan_status_id%3D100"
	        },
	        callback: "listloanapproval"
	    });
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "mydata": "",
	            "url": "api.v1.loans?limit=1000&sqlSearch=l.loan_status_id%3D200"
	        },
	        callback: "listloandisbursal"
	    });
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "GET",
	            "mydata": "",
	            "url": "api.v1.rescheduleloans?command=pending"
	        },
	        callback: "listrescheduleloan"
	    });
	}
	function listloanapproval(param) {
		loan_grid=[];
	    var map = {};
	    var loans = param.pageItems;
	    for (var i = 0; i < loans.length; i++) {
	        var loan = loans[i];
	        if (!map[loan.clientOfficeId]) {
	            var officNote = new Array();
	            officNote.push(loan);
	            map[loan.clientOfficeId] = officNote;
	        } else {
	            var officNote = map[loan.clientOfficeId];
	            officNote.push(loan);
	            map[loan.clientOfficeId] = officNote;
	        }
	    }
	    $('#grouploanapproval').empty();
	    $.each(map,
	    function(key, value) {
	        //alert(key+':'+value);
	        var id = 'clientOfficeId' + key;
	        var str = '<table  id="' + id 
	        + '"><thead><tr><th name="id" style="display: none;"><spring:message code="label.heading.id"/></th>'
	        +'<th name="clientId" style="display: none;"><spring:message code="label.heading.clientid"/></th>'
	        +'<th name="clientName"  width="210"><spring:message code="label.heading.client"/></th>'
	        +'<th name="loanProductName" width="210"><spring:message code="label.heading.loanproduct"/></th>'
	        +'<th name="accountNo" width="210"><spring:message code="label.heading.loanaccount"/></th>'
	        +'<th name="approvedPrincipal" width="210"><spring:message code="label.heading.amount"/></th>'
	        +'<th name="loanPurposeName" width="210"><spring:message code="label.heading.loanpurpose"/></th></tr></thead></table><br/><br/>';
	        $('#grouploanapproval').append(str);
	        var tem = $('#clientOfficeId' + key).flexigrid({
	            title:offices[key].name,
	            pcpager: true,
	            singleSelect: false,
	            limit: 15,
	            isGroup: true,
	            onDoubleClick: "loaninfo"
	        });
	        loan_grid.push(tem);
	        tem.addRows(value);
	    });
	    $('#loanapprovalsearch').keyup(function(){
	    	var index=0;
	    	var word=$(this).val();
	    	$.each(map,
	    		    function(key, value) {
	    		var tem=new Array();
	    		for(i in value){
	    			var str=JSON.stringify(value[i].clientName);
	    			if(str.indexOf(word)>-1){
	    				tem.push(value[i]);
	    			}
	    		}
	    		loan_grid[index++].addRows(tem);
	    	});
	    });
	}
	function clientinfo(tem) {
	    //alert("clientinfo:")
	    var officedatatable = client_grid[0];
	    var id = officedatatable.getColValues($(tem), "id");
	    $.openWindow("loadPage.do?nextPage=client.detail&clientId=" + id, "iframe", "80%", "90%");
	}
	function listClients(param) {
		client_grid=[];
	    var map = {};
	    var clients = param.pageItems;
	    for (var i = 0; i < clients.length; i++) {
	        var clent = clients[i];
	        if (!map[clent.officeId]) {
	            var officNote = new Array();
	            officNote.push(clent);
	            map[clent.officeId] = officNote;
	        } else {
	            var officNote = map[clent.officeId];
	            officNote.push(clent);
	            map[clent.officeId] = officNote;
	        }
	    }
	    $.each(map,
	    function(key, value) {
	        var id = 'officeid' + key;
	        var str = '<table  id="' + id + '"><thead><tr>'
	        +'<th name="id" style="display: none;"><spring:message code="label.heading.id"/></th>'
	        +'<th name="displayName"  width="210"><spring:message code="label.heading.name"/></th>'
	        +'<th name="accountNo" width="210"><spring:message code="label.heading.accnum"/></th>'
	        +'<th name="staffName" width="210"><spring:message code="label.heading.staff"/></th></tr></thead></table>';
	        $('#groupclients').append(str);
	        var tem = $('#officeid' + key).flexigrid({
	            title: value[0].officeName,
	            pcpager: true,
	            singleSelect: false,
	            limit: 15,
	            isGroup: true,
	            onDoubleClick: "clientinfo"
	        });
	        tem.addRows(value);
	        client_grid.push(tem);
	    });
	    $('#clientapprovalsearch').keyup(function(){
	    	var index=0;
	    	var word=$(this).val();
	    	$.each(map,
	    		    function(key, value) {
	    		var tem=new Array();
	    		for(i in value){
	    			var str=JSON.stringify(value[i].displayName);
	    			if(str.indexOf(word)>-1){
	    				tem.push(value[i]);
	    			}
	    		}
	    		client_grid[index++].addRows(tem);
	    	});
	    });
	}
	function loaninfo(tem){
		var table = loan_grid[0];
	    var id = table.getColValues($(tem), "id");
	    $.openWindow("loadPage.do?nextPage=client.loanDetail&loanId=" + id, "iframe", "80%", "90%");
	}
	function listTasks(param) {
	    grid1 = $('#taskstable').flexigrid({
	        pcpager: true,
	        singleSelect: false,
	        limit: 15,
	        isGroup: true,
	        onDoubleClick: "taskInfo"
	    });
	    grid1.addRows(param);
		$.inputSearchInit(param,[],function(obj){
			var word=$(obj).text();
			if($.isEmpty(word)){
				grid1.addRows(param);
			}
			$("#taskssearch").val(word);
			$(obj).parent().hide();
			var tem=new Array();
			$.each(param,function(index,value){
				var str=JSON.stringify(value.maker);
				if(str.indexOf(word)>-1){
					tem.push(value);
				}
			});
			grid1.addRows(tem);	
		});
	} 
	function taskInfo(tem) {
	    taskid = grid1.getColValues($(tem),"id");
	    $.openWindow("loadPage.do?nextPage=common.viewcheckerinbox");
	}
	function loandisbursalinfo(){
		var id = grid2.colVal("id");
	    $.openWindow("loadPage.do?nextPage=client.loanDetail&loanId=" + id, "iframe", "80%", "90%");
	}
	function listloandisbursal(param) {
		if ($.isEmptyObject(param) || typeof(param.result) != 'undefined') return;
		var eles =param;
		if(eles.length==0)retrun;
		grid2 = $('#loandisbursaltable').flexigrid({
	        pcpager: true,
	        singleSelect: false,
	        limit: 15,
	        onDoubleClick: "loandisbursalinfo"
	    });
		$('#loandisbursalsearch').keyup(function(){
			var tem=new Array();
			for(i in eles){
				var key=$(this).val();
				var str=JSON.stringify(eles[i].clientName);
				if(str.indexOf(key)>-1){
					tem.push(eles[i]);
				}
			}
			grid2.addRows(tem);
		});
	    grid2.addRows(eles);
	}
	function rescheduleloaninfo(tem){
	    var id = grid3.getColValues($(tem),"id");
	    $.openWindow("loadPage.do?nextPage=client.loanDetail&loanId=" + id, "iframe", "80%", "90%");
	}
	function listrescheduleloan(param) {
		if ($.isEmptyObject(param) || typeof(param.result) != 'undefined') return;
		var eles =param;
		if(eles.length==0)retrun;
		grid3 = $('#rescheduleloantable').flexigrid({
	        pcpager: true,
	        singleSelect: false,
	        limit: 15,
	        isGroup:true,
	        onDoubleClick: "taskInfo"
	    });
		$('#rescheduleloansearch').keyup(function(){
			var tem=new Array();
			for(i in eles){
				var key=$(this).val();
				var str=JSON.stringify(eles[i].clientName);
				if(str.indexOf(key)>-1){
					tem.push(eles[i]);
				}
			}
			grid3.addRows(tem);
		});
	    grid3.addRows(eles);
	}
	function approveOne(id, call) {
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "POST",
	            "mydata": "",
	            "url": "api.v1.makercheckers." + id + "?command=approve"
	        },
	        callback: call
	    });
	}
	function deleteOne(id, call) {
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "DELETE",
	            "mydata": "",
	            "url": "api.v1.makercheckers." + id
	        },
	        callback: call
	    });
	}
	function rejectOne(id, call) {
	    $.nest({
	        url: "<c:url value='/fineract.do'/>",
	        type: "post",
	        async: true,
	        data: {
	            "dataType": "POST",
	            "mydata": "",
	            "url": "api.v1.makercheckers." + id + '?command=reject'
	        },
	        callback: call
	    });
	}
	</script>
</body>
</html>