<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">
		tbody td{
			font-size:12px;
		}
		
		.circle {
			width: 15px;
			height: 15px;
			border-radius: 9px;
		}
		
		.pad {
			padding: 0px
		}
		
		.marg {
			margin: 0px
		}.dark {
			background: #666F73;
		}
		
		.orange {
			background: #FFA500;
		}

		.read {
			background: #FF0000;
		}
		.green {
			background: #00CE00;
		}
	</style>
</head>
<body>
		<div>
			<h5 id="titlePoint">
					<%-- Head Info --%>
			</h5>
			<legend></legend>
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#generalList"><spring:message code="lable.center.general"/></a></li>
				<li><a href="#notes"><spring:message code="lable.center.notes"/></a></li>
			</ul>
			<legend></legend>
			<div class="tab-content" id="myTabContent">
				<div id="generalList" class="tab-pane active">
					<div style="height: 25px; margin-top: 10px; margin-bottom: 25px;">
			       		<div class="btn-group pull-right">
			       			<span id="active">
				       		 <a href="javascript:void(0)" onclick="active()" style="margin-top: 3px" id="edit" name="edit"
								class="btn btn-primary btn-offset"> 
								<i class="glyphicon glyphicon-edit"></i> <spring:message code="label.center.active"/>
							</a>
						</span> 
						<span id="edit1"> 
							<a href="javascript:void(0)" onclick="edit()" style="margin-top: 3px" id="edit" name="edit"
								class="btn btn-primary btn-offset"> 
								<i class="glyphicon glyphicon-edit"></i> <spring:message code="label.center.edit"/>
							</a>
						</span> 
						<span id="addgroup1"> 
							<a href="javascript:void(0)" onclick="addGroup()" style="margin-top: 3px" id="addgroup"
								name="addgroup" class="btn btn-primary btn-offset"> 
								<i class="glyphicon glyphicon-plus"></i> <spring:message code="label.center.addgroup"/>
							</a>
						</span>
						 <span id="managegroup">
						 	 <a href="javascript:void(0)" onclick="manageGroup()" style="margin-top: 3px" id="newSaving"
								name="manageGroup" newSaving="" class="btn btn-primary btn-offset"> 
								<i class="glyphicon glyphicon-plus"></i> <spring:message code="label.center.managegroup"/>
							</a>
						</span> 
						<span id="centerSave"> 
							<a href="javascript:void(0)" onclick="centerSave()" style="margin-top: 3px" id="newSaving"
								name="centerSave" newSaving="" class="btn btn-primary btn-offset"><spring:message code="label.center.centersave"/> </a>
						</span>
						<span class="dropdown">
							<button style="margin-top: 3px" class="btn btn-primary dropdown-toggle" type="button"
								id="more" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
								<spring:message code="label.center.more"/> </a> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu  dropdown-menu-right" aria-labelledby="dropdownMenu1">
								<li id="attd"><a href="javascript:void(0)" onclick="attendence()"><spring:message code="label.center.attendance"/></a></li>
								<li id="asi"><a href="javascript:void(0)" onclick="assignStaff()"><spring:message code="label.center.assignStaff"/></a></li>
								<li id="unasi"><a href="javascript:void(0)" onclick="unassignStaff()"><spring:message code="label.center.unassignStaff"/></a></li>
								<li id="del"><a href="javascript:void(0)" onclick="delete1()"><spring:message code="label.center.delete"/></a></li>
								<li id="clo"><a href="javascript:void(0)" onclick="close1()"><spring:message code="label.center.close"/></a></li>
								<li id="attr"><a href="javascript:void(0)" onclick="attachMeeting()"><spring:message code="label.center.attachmeeting"/></a></li>
								<li id="lishi"><a href="javascript:void(0)" onclick="workHistory()"><spring:message code="label.center.staffassignmenthistory"/></a></li>
							</ul>
						</span> 
			       		</div>
					</div>
					
					<div class="row">
						<div class="col-sm-9 col-md-9">
						<p  id="centerclose" style="display:none;margin-left:10px;font-size:30px;"><spring:message code="label.center.centerClose"/></p>
							<div id="detail_center" class="row">
								<!-- 组面板 -->
								<div id="s1" class="col-sm-6 col-md-6">
									<div class="list-group">
										<a href="#" class="list-group-item disabled" id="groups"><spring:message code="label.center.group"/></a>		
									</div>
								</div>
								<!-- 会议面板 -->
								<div id="s2" class="col-sm-6 col-md-6">
									<div class="panel panel-default" style="background-color: #FCF8E3">
										<div class="panel-body">
										 	<p><spring:message code="label.center.nextmeeting"/>:<span id="p1"></span></p>
										 	<p id="p3" style="display:none;"><spring:message code="label.center.meetingfrequency"/>:<span id="p2"></span></p>
											<p id="closeDate" style="display:none;"><spring:message code="label.center.closeDate"/></p>
										</div>
									</div>
								</div>
							</div>
							<div>
								<!-- 存储账户 -->
								<div id="s3" style="display: none;">
									<div class="text-left">
										<label><spring:message code="label.center.savingsaccountoverview"/></label>
									</div>
									
									<div>
										<table id="savingList" class="table table-condensed">
											<thead>
												<tr>
													<th name='id' style='display: none;'>id</th>
													<th name="accountNo" width="170"><spring:message code="label.center.accountNo"/>#</th>
													<th name="productName" width="170"><spring:message code="label.center.products"/></th>
													<th name="accountBalance" width="150"><spring:message code="label.center.balance"/></th>
													<%-- <th name="status.value" width="200"><spring:message code="label.center.action"/></th>
													 --%>
													<th width="200" name="status.value" search="true" type="action" button="true" 
													actionjs="
													var color = $('<i></i>');
													color.addClass('glyphicon glyphicon-stop');
													if(row.status.value=='Submitted and pending approval')
													{	
														color.css({'font-size':'20px','color':'rgb(255, 106, 64)'});
														button.addClass('btn btn-primary btn-offset');
													 	button.attr('value','<spring:message code='label.center.approve'/>').css('width','85px');
													 	button.attr('onClick','ApproveSavingAccount('+row.id+')');
													 }else if(row.status.value=='Active'){
													 	color.css({'font-size':'20px','color':'rgb(64, 255, 106)'});
													  	button.addClass('btn btn-primary btn-offset');
													 	button.attr('value','<spring:message code='label.center.deposit'/>').css('width','85px');;
													 	button.attr('onClick','Deposit('+row.id+')');
														var lBtn=$(td).append('<input  id='+'btttnnn'+' type='+'button'+' />').children()[1];
													 	$($(lBtn).addClass('btn btn-primary btn-offset')).val('<spring:message code='label.center.withdraw'/>').css('width','85px').attr('onClick','Withdraw('+row.id+')');
													 }else{
													 	if(row.status.value=='Approved'){
													 		color.css({'font-size':'20px','color':'rgb(0, 0, 255)'});
													 	}else{
													 		color.css({'font-size':'20px','color':'rgb(0, 0, 0)'});
													 	}
														button.addClass('btn btn-primary btn-offset');
													 	button.attr('value','<spring:message code='label.center.undoapprove'/>').css('width','85px');;
													 	button.attr('onClick','UndoApproveSavingAccount('+row.id+')');
													 	var lBtn=$(td).append('<input  id='+'btttnnn'+' type='+'button'+' />').children()[1];
														$($(lBtn).addClass('btn btn-primary btn-offset')).val('<spring:message code='label.center.activeSavingAccount'/>').css('width','85px').attr('onClick','ActiveSavingAccount('+row.id+')');				
													 }
													 	color.prependTo($(tr).find('td:eq(1)'));" >
													<spring:message code="label.center.action"/></th>
												</tr>
											</thead>
										</table>
									</div>
					 			</div>
							</div>
						</div>
						<div class="col-sm-3 col-md-3">
							<div id="right" class="thumbnail">
								<div class="">
									 <h4><p><span id="ss"></span>&nbsp;&nbsp;<spring:message code="label.center.details"/><p></h4>
									 <%-- <p  id="l1" style="display:none;"><spring:message code="label.center.externalId"/>:&nbsp;&nbsp;<span id="p4"></span></p>
									 <p id="l2" style="display:none;"><spring:message code="label.center.activationdate"/> :&nbsp;&nbsp;<span id="p5"></span></p>
									 <p id="l3" style="display:none;"><spring:message code="label.center.staff"/> :&nbsp;&nbsp;<span id="p6"></span></p> --%>
									 <table class="table-minified">
										<tbody>
											<tr id="l1" style="display:none;">
												<th><spring:message code="label.center.externalId"/>:&nbsp;&nbsp;</th>
												<td><span id="p4"></span></td>
											</tr>
											<tr id="l2" style="display:none;">
												<th><spring:message code="label.center.activationdate"/>:&nbsp;&nbsp;</th>
												<td><span id="p5"></span></td>
											</tr>
											<tr id="l3" style="display:none;">
												<th><spring:message code="label.center.staff"/>:&nbsp;&nbsp;</th>
												<td><span id="p6"></span></td>
											</tr>
										</tbody>
									</table>
									 
									 <h4><p><spring:message code="label.center.summary"/><p></h4>
									 <%-- <p ><spring:message code="label.center.activeclients"/>：&nbsp;&nbsp;<span id="p7"></span></p>
									 <p ><spring:message code="label.center.activeGroupLoans"/>：&nbsp;&nbsp;<span id="p8"></span></p>
									 <p ><spring:message code="label.center.activeClientLoans"/>：&nbsp;&nbsp;<span id="p9"></span></p>
									 <p ><spring:message code="label.center.activeGroupBorrowers"/>：&nbsp;&nbsp;<span id="p10"></span></p>
								     <p ><spring:message code="label.center.activeClientBorrowers"/>：&nbsp;&nbsp;<span id="p11"></span></p>
								     <p ><spring:message code="label.center.activeOverdueGroupLoans"/>：&nbsp;&nbsp;<span id="p12"></span></p>
								     <p ><spring:message code="label.center.activeOverdueClientLoans"/>：&nbsp;&nbsp;<span id="p13"></span></p> --%>
									 <table class="table-minified">
										<tbody>
											<tr>
												<th><spring:message code="label.center.activeclients"/>:&nbsp;&nbsp;</th>
												<td><span id="p7"></span></td>
											</tr>
											<tr>
												<th><spring:message code="label.center.activeGroupLoans"/>:&nbsp;&nbsp;</th>
												<td><span id="p8"></span></td>
											</tr>
											<tr>
												<th><spring:message code="label.center.activeClientLoans"/>:&nbsp;&nbsp;</th>
												<td><span id="p9"></span></td>
											</tr>
											<tr>
												<th><spring:message code="label.center.activeGroupBorrowers"/>:&nbsp;&nbsp;</th>
												<td><span id="p10"></span></td>
											</tr>
											<tr>
												<th><spring:message code="label.center.activeClientBorrowers"/>:&nbsp;&nbsp;</th>
												<td><span id="p11"></span></td>
											</tr>
											<tr>
												<th><spring:message code="label.center.activeOverdueGroupLoans"/>:&nbsp;&nbsp;</th>
												<td><span id="p12"></span></td>
											</tr>
											<tr>
												<th><spring:message code="label.center.activeOverdueClientLoans"/>:&nbsp;&nbsp;</th>
												<td><span id="p13"></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div id="notes" class="tab-pane text-right" style="padding-right: 80px">
					<table id="noteList">
						<thead>
							<tr>
								<th name='id' width='100'>ID</th>
								<th name="note" width='300'><spring:message code="label.center.content"/></th>
								<th name="createdByUsername" width='200'><spring:message code="label.center.createdby"/></th>
								<th name="createdOn" width='200' type="date"><spring:message code="label.center.createdon"/></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript">
    var flag;
    var grid1;
    var grid2;
    var staffId;
    var calendarId;  
    var groupId = '${pd.centerId}';
    var clientId = false;
    var centerId="${pd.centerId}";
    var isInit = '';
	var savingsId;
	var savingAccountId;
	var officeId;
	var userId = <%=request.getSession().getValue("userId") %>
	var groupLength;
	var t;
	$(document).ready(function(){
	  
	  //储蓄账户表
		grid1 = $('#savingList').flexigrid({
			height : 'auto',
			width : '700',
			pcpager: true,
			resizable: false,
			buttons : [
	/* 		{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnApprove,bclass: 'approveSavingAccount', onpress:ApproveSavingAccount},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnUnApprove,bclass: 'unapproveSaving', onpress:UndoApproveSavingAccount},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnActive,bclass: 'active', onpress:ActiveSavingAccount},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDeposit,bclass: 'deposit', onpress:Deposit},
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnWithdraw,bclass: 'withdrawSavingAccount', onpress:Withdraw}, 
			{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,bclass: 'detail', onpress:SavingAccountDetail}  */
			]
		});
		
	  //笔记表
		grid2 = $('#noteList').flexigrid({
			usepager: false,
			showToggleBtn: false,
			buttons : [{
							name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
							bclass : 'add',
							onpress : noteAdd
					}]
		});
	  
		//加载初始化（状态判断，数据加载、按钮隐藏等）
		init();
		
		//组点击事件
		$('#s1').on('click','a:not(":first")',function(){
			//跳组页面
			window.location.href = "loadPage.do?nextPage=group.detail&userId="+userId+"&staffId="+staffId+"&officeId="+officeId+"&groupId="+$(this).attr('code');
			//$.openWindow("loadPage.do?nextPage=group.detail&userId="+userId+"&staffId="+staffId+"&officeId="+officeId+"&groupId="+$(this).attr('code'),"iframe","100%","100%");

		});
		
		//模态框关闭事件
		$('#myModal').on('hidden.bs.modal',function(event) {
					 if(isInit=="note"){
						init_note();
					}else if(isInit=='account'){
						init_savingAccount();
					}else if(isInit=='main'){
						init_main();	
					}else if(isInit=='sum'){
						init_btn();
						init_main();
					}
					isInit="";
				});
	   });
	
	//数据表操作
	function dataTable(param){
		
		var liNode = $('#myTab').find('li');
		if(liNode.length > 2){
			for(var j = 2; j < liNode.length ; j++){
				var aName = $(liNode[j]).children('a:eq(0)').attr('href').replace('#','');
				$("#myTabContent").find('div[id="'+aName+'"]').remove();
				$(liNode).remove();
			}
		}
		
	    
		if(param.length>0){
			for(var i=0;i<param.length;i++){
				var btnjson = param[i];
				var name = $.replaceTemplate(btnjson.registeredTableName," ","");
				var tableHeader = btnjson.columnHeaderData;
				var url = "loadPage.do?nextPage=system.datatable.app_datatable_add";
				if(tableHeader != undefined && tableHeader[0] != undefined && tableHeader[0].columnName=="id"){
					url = "loadPage.do?nextPage=system.datatable.app_datatable_list";
				}
				url += "&datatablename="+btnjson.registeredTableName+"&notesid="+centerId;
				$("#myTab").append("<li><a href='#"+name+"'>"+btnjson.registeredTableName+"</a></li> ");
				if(flag != "Closed"){
					$("#myTabContent").append("<div class='tab-pane' id='"+name+"' action='"+url+"'><div class='iframe-div'><iframe id='"+name+"Frm' class='iframe-style' src=''></iframe></div></div> ");
			    }else{
			    	$("#myTabContent").append("<div class='tab-pane' id='"+name+"' action='"+url+"'></div> ");
			    }
		}
		
        $('#myTab a:first').tab('show');//初始化显示哪个tab 
        $($('#myTab a:first').attr("href")+"Frm").attr("src",$($('#myTab a:first').attr("href")).attr("action"));
        $('#myTab a').click(function (e) { 
          e.preventDefault();//阻止a链接的跳转行为 
          $(this).tab('show');//显示当前选中的链接及关联的content 
          $($(this).attr("href")+"Frm").attr("src",$($(this).attr("href")).attr("action"));
        }) 			
		}
	}
	
	function init(){
		//获取中心数据
		init_btn();
		//数据表
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.datatables?apptable=m_center"		
			},
			callback : "dataTable"
		}); 
		//初始化主体页面（组和会议）
		init_main();
		
		//中心细节
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'GET',
				'mydata' : '',
				'url' : 'api.v1.runreports.GroupSummaryCounts?R_groupId='+centerId+'&genericResultSet=false'
			},
			callback : 'detailback'
		});
		
		//获取存储账户
		init_savingAccount();
		//获取笔记
		init_note();
		
	}
	
	function init_btn(){
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'GET',
				'mydata' : '',
				'url' : 'api.v1.centers.'+centerId
			 },
			callback : 'btnback'
		});
	}
	
	//按钮组设置
	function btnback(param){
		 //按钮的显示
		
		 flag=param.status.value;
		
		 if (flag.toString() == "Pending") {
			  $.hide('centerSave');
			  $.hide('attd');
			  $.hide('attr');
		   }else if(flag.toString() == "Active"){
			  $.show('centerSave');
			  $.hide('del');
			  $.hide('active');
		  }else{
			  $.hide('centerSave');
			  $.hide('active');
			  $.hide('edit1');
			  $.hide('addgroup1');
			  $.hide('managegroup');
			  $.hide('more');
			  $("#centerclose").css("display","block");
		  }
		//判断分配员工
		
	    if(typeof(param.staffId)!="undefined"){
	    	$.hide('asi');
	    	$.show('unasi');
	    }else{
	    	$.hide('unasi');
	    	$.show('asi');
	    } 		  
	}
	
	//获取组和会议数据
	function init_main(){
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'GET',
				'mydata' : '',
				'url' : 'api.v1.centers.'+centerId+'?associations=groupMembers,collectionMeetingCalendar'
			},
			callback : 'mainback'
		});
	}
	

	//组和会议的数据回调方法
	function mainback(param) {
		staffId = param.staffId;
		officeId = param.officeId;
		flag = param.status.value;
		if (flag != "Pending") {
			if (typeof (param.collectionMeetingCalendar) == "undefined") {
				$.hide('attd');
				$.show('attr');
			} else {
				calendarId = param.collectionMeetingCalendar.id;
				$.hide('attr');
				$.show('attd');
			}
		} else {
			$.hide('attd');
			$.hide('attr');
		}
		//最上部分
		/* $.assign({
			"name" : param.name,
			"account" : param.accountNo,
			"office":param.officeName
		}); */

		//设置标题
		var center_name = '<span class="glyphicon glyphicon-map-marker">'
				+ param.name + '</span>';
		var center_no = '&nbsp;&nbsp;<span class="glyphicon glyphicon-barcode"> <spring:message code="label.center.accountNo"/>#:'
				+ param.accountNo + '</span>';
		var center_office = '&nbsp;&nbsp;|&nbsp;&nbsp;'
				+ '<span class="glyphicon glyphicon-list"> <spring:message code="label.center.officeName"/>：'
				+ param.officeName + '</span>';

		var center_sum = center_name + center_no + center_office;
		var center_color = '<span class="' + centerColor(param.status.value)
				+ ' circle marg">&nbsp;&nbsp;&nbsp;&nbsp;</span>';
		$('#titlePoint').empty();
		$('#titlePoint').append(center_color + center_sum);

		//组
		var groupMembers = param.groupMembers;
		groupLength = groupMembers.length;
		for (var i = 0; i < groupLength; i++) {
			$("#groups").after(
					"<a id=li"+i+" code="+groupMembers[i].id+">"
							+ groupMembers[i].name + "</li>" + "</br>"); //在a标签后动态添加a标签  
			$("#li" + i).attr("class", 'list-group-item'); //为a标签添加class属性  
		}
		if (groupLength == 0) {
			$("#groups").after("<a id=li"+i+">" + "</li>" + "</br>");
			$("#li" + i).attr("class", 'list-group-item');
		}
		//除了第一个a标签，都删除
		var divNode = $("#groups").closest('div');
		var aNode = divNode.find('a');
		for (var j = groupLength + 1; j < aNode.length; j++) {
			$(aNode[j]).remove();
		}
		//会议

		if (param.status.value == "Closed") {
			$("#p1").text("<spring:message code='label.center.meetingSatus'/>");
			$('#closeDate').append(
					':' + $.formatDate(param.timeline.closedOnDate));
			$.show('closeDate');
		} else {
			if (typeof (param.collectionMeetingCalendar) != "undefined") {
				$("#p1")
						.text(
								$
										.formatDate(param.collectionMeetingCalendar.nextTenRecurringDates[0]));
				if (param.collectionMeetingCalendar.entityType.value
						.indexOf('CENTERS') > -1) {
					$("#p1")
							.append(
									'&nbsp;<a href="javascript:void(0)" onclick="editMeeting('
											+ calendarId
											+ ')"><i class="glyphicon glyphicon-edit" style="color:blue;" ></i></a>');
				}
				$("#p2").text(param.collectionMeetingCalendar.humanReadable);
				$.show('p3');
			} else {
				$("#p1").text(
						"<spring:message code='label.center.meetingSatus'/>");
			}
		}

		//细节  
		$('#ss').text(param.name);

		if (typeof (param.externalId) != "undefined") {
			$("#p4").text(param.externalId);
			$.show('l1');
		}

		if (param.status.value == "Active") {
			$("#p5").text($.formatDate(param.activationDate));
			$.show('l2');
		}

		if (typeof (param.staffName) != "undefined") {
			$("#p6").text(param.staffName);
			$.show('l3');
		}

	}
	//中心详情
	function detailback(param) {

		//概要部分
		if ("undefined" === typeof (param[0].activeClients)) {
			param.activeClients = 0;
		}
		if ("undefined" === typeof (param[0].activeGroupLoans)) {
			param.activeGroupLoans = 0;
		}
		if ("undefined" == typeof (param[0].activeClientLoans)) {
			param.activeClientLoans = 0;
		}
		if ("undefined" == typeof (param[0].activeGroupBorrowers)) {
			param.activeGroupBorrowers = 0;
		}
		if ("undefined" == typeof (param[0].activeClientBorrowers)) {
			param.activeClientBorrowers = 0;
		}
		if ("undefined" == typeof (param[0].overdueGroupLoans)) {
			param.overdueGroupLoans = 0;
		}
		if ("undefined" == typeof (param[0].overdueClientLoans)) {
			param.overdueClientLoans = 0;
		}

		$("#p7").text(param[0].activeClients);
		$("#p8").text(param[0].activeGroupLoans);
		$("#p9").text(param[0].activeClientLoans);
		$("#p10").text(param[0].activeGroupBorrowers);
		$("#p11").text(param[0].activeClientBorrowers);
		$("#p12").text(param[0].overdueGroupLoans);
		$("#p13").text(param[0].overdueClientLoans);
	}

	//获取存储账户
	function init_savingAccount() {
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'GET',
				'mydata' : '',
				'url' : 'api.v1.centers.' + centerId + '.accounts'
			},
			callback : 'savingsback'
		});
	}

	//获取储蓄账户回调方法
	function savingsback(param) {
		var savingAccount1 = param.savingsAccounts;
		if (typeof (savingAccount1) != "undefined") {
			var savinglength = param.savingsAccounts.length;
			grid1.addRows(param.savingsAccounts);
			t = 0;
			for (var i = 0; i < savinglength; i++) {
				if (savingAccount1[i].status.value == "Closed") {
					t += 0;
				} else {
					t += 1;
				}
			}
			$.show('s3');
		} else {
			$.hide('s3');
		}
	}

	function init_note() {
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'GET',
				'mydata' : '',
				'url' : 'api.v1.groups.' + centerId + '.notes'
			},
			callback : 'noteback'
		});
	}

	//填充笔记表格
	function noteback(param) {
		grid2.addRows(param);

		$('#noteList tbody tr').each(function() {
			var td_node = $(this).children('td:eq(3)');
			var div_node = td_node.children('div:first');
			if ($.trim(div_node.text()).indexOf('NaN') > -1) {
				div_node.text('');
			}
		});
	}
	//添加笔记
	function noteAdd() {
		isInit = "note";
		$
				.openWindow('loadPage.do?nextPage=client.noteClient&pageType=center&centerId='
						+ centerId);
	}
	//功能

	/*action 1：批准
			2：取消批准  激活
			3： 存款和取款
	 */
	function ApproveSavingAccount(id) {
		//先获取状态判断是否可以进行批准操作
		isInit = 'account';
		savingsId = id;
		$.openWindow("loadPage.do?nextPage=center.approveSavingAccount");
	}

	//取消批准
	function UndoApproveSavingAccount(id) {
		isInit = 'account';
		savingsId = id;
		$.openWindow("loadPage.do?nextPage=center.undoapproveSavingAccount");
	}

	//激活
	function ActiveSavingAccount(id) {
		isInit = 'account';
		savingsId = id;
		$.openWindow("loadPage.do?nextPage=center.ActiveSavingAccount");
	}
	//储蓄账户详情（跳客户储蓄详情页面，注意关掉转移基金按钮）
	$
			.getWidget("savingList")
			.click(
					function() {
						isInit = 'account';
						if (!$.isEmpty(grid1.colVal('id'))) {
							savingsId = grid1.colVal('id');
							window.location.href = '<c:url value="loadPage.do?nextPage=client.savingsaccounts"/>&pageType=center&centerId=${pd.centerId}&officeId='
									+ officeId + '&savingsId=' + savingsId;
						}
					});

	/* function SavingAccountDetail(){
	isInit = 'account';
	savingsId = grid1.colVal('id');
	window.location.href='<c:url value="loadPage.do?nextPage=client.savingsaccounts"/>&pageType=center&centerId=${pd.centerId}&officeId='+officeId+'&savingsId='+savingsId;
	//$.openWindow("loadPage.do?nextPage=client.savingsaccounts");
	}  */
	//中心激活
	function active() {
		isInit = 'sum';
		$.openWindow("loadPage.do?nextPage=center.enable-active");
	}
	//修改中心
	function edit() {
		isInit = 'main';
		$.openWindow("loadPage.do?nextPage=center.editCenters");
	}
	//添加组
	function addGroup() {
		isInit = 'main';
		$.openWindow("loadPage.do?nextPage=center.addGroups");
	}
	//管理组
	function manageGroup() {
		isInit = 'main';
		$.openWindow("loadPage.do?nextPage=center.manageGroup");
	}
	//添加中心储蓄账户
	function centerSave() {
		isInit = 'account';
		$.openWindow("loadPage.do?nextPage=center.saveCenter&centerId="
				+ centerId);
		//$.openWindow("loadPage.do?nextPage=client.savingClient&pageType=center");
		//window.location.href = "loadPage.do?nextPage=center.saveCenter&centerId=" + centerId;
	}
	//取消分配员工
	function unassignStaff() {
		isInit = 'sum';
		$.openWindow("loadPage.do?nextPage=center.unAssignStaff");
	}
	//分配员工
	function assignStaff() {
		isInit = 'sum';
		$.openWindow("loadPage.do?nextPage=center.assignStaff");
	}
	//删除中心
	function delete1() {
		$.openWindow("loadPage.do?nextPage=center.deleteCenter");
	}
	//关闭中心
	function close1() {
		$.openWindow("loadPage.do?nextPage=center.closeCenter");
	}
	//出席
	function attendence() {
		$.openWindow("loadPage.do?nextPage=center.attendence");
	}
	//附加会议
	function attachMeeting() {
		isInit = 'sum';
		$
				.openWindow("loadPage.do?nextPage=group.attachMeeting&pageType=center");
	}
	//查看员工分配历史
	function workHistory() {
		$.openWindow("loadPage.do?nextPage=center.staffAssignHistory&centerId="
				+ centerId, 'iframe', '90%', '90%');
	}

	//存款
	function Deposit(id) {
		isInit = 'account';
		savingsId = id;
		$
				.openWindow("loadPage.do?nextPage=client.accountDeposit&pageType=center");
	}
	//取款
	function Withdraw(id) {
		isInit = 'account';
		savingsId = id;
		$
				.openWindow("loadPage.do?nextPage=client.accountWithdrawal&pageType=center");
	}

	//修改会议	
	function editMeeting(calendarId) {
		isInit = 'main';
		$
				.openWindow("loadPage.do?nextPage=group.editMeeting&pageType=center&centerId="
						+ centerId + "&calendarId=" + calendarId);
	}

	//检监控储蓄操作
	function checkAction(status, action) {
		var result = checkStatus(status);
		if (action === result) {
			return true;
		} else {
			return false;
		}
	}

	//检查储蓄账户状态
	function checkStatus(status) {
		var value = $.trim(status);
		if (value.indexOf('S') > -1) {//待批准 可执行动作：批准
			return 1;
		} else if (value.indexOf('Ap') > -1) {//已经批准 可执行动作：取消批准和激活
			return 2;
		} else if (value.indexOf('Ac') > -1) {//激活 可执行动作：存款和取款
			return 3;
		} else if (value.indexOf('W') > -1) {//撤销 可执行动作：取消批准和激活
			return 2;
		} else if (value.indexOf('R') > -1) {//拒绝 可执行动作：取消批准和激活
			return 2;
		} else if (value.indexOf('C') > -1) {//关闭  可执行动作：取消批准和激活
			return 2;
		} else {
			return 5;
		}
	}

	/* 状态颜色判断 */
	function centerColor(centerStatus) {
		var status = [ "Pending", "Active", "Closed" ];
		var statusColor = [ "orange", "green", "dark" ];
		if ($.isEmpty(centerStatus))
			return statusColor[1];
		for (var i = 0; i < status.length; i++)
			if (status[i] === centerStatus)
				return statusColor[i];
		return statusColor[1];
	}

	$(function() {
		$('#myTab a:first').tab('show');//初始化显示哪个tab 

		$('#myTab a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为 
			$(this).tab('show');//显示当前选中的链接及关联的content 
		})
	})
</script>
</html>
