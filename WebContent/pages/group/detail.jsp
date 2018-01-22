<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.a {
	display: block;
	padding: 3px 20px;
	clear: both;
	font-weight: normal;
	line-height: 1.42857;
	color: #333333;
	white-space: nowrap;
	cursor: pointer;
}

.circular {
	border-radius: 5px;
}

.square {
	width: 15px;
	height: 15px;
	margin-top: 5px"
}

.green {
	background: #00CE00;
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
}

.tab-marg {
	margin-top: 50px;
	margin-left: 10px;
	margin-right: 10px;
	margin-button: 0px;
}

th {
	font-weight: normal;
}

.dark {
	background: #666F73;
}

.orange {
	background: #FFA500;
}

.blue {
	background: #0F36E4;
}

.read {
	background: #FF0000;
}
.purple {
	background: #800080;
}
</style>
</head>
<body style="background: #FFFFFF">
	<form id="addEntryForm" class="form-horizontal marg">
		<fieldset>
				<div id="secondDiv" style="background: #FFFFFF; padding: 15px">
					<label style="width: 100%">
						<div id="titlePoint" class="marg pad col-md-1" style="width: 15px"></div>
						<div class="col-md-10 marg pad">
							<h4 class="marg">
								<span id="groupTitle"></span>
							</h4>
						</div>
					</label>
					<hr style="margin-top: 5; margin-bottom: 5">
					<div style="height: 50px">
						<ul id="groupFunction" class="nav nav-tabs">
							<li class="active">
								<a href="#groupDetailDiv">
									<spring:message code="lable.general" />
								</a>
							</li>
							<li>
								<a href="#groupNoteDiv">
									<spring:message code="lable.notes" />
								</a>
							</li>
							<li>
								<a href="#groupCommitteeDiv">
									<spring:message code="group.committee" />
								</a>
							</li>
						</ul>
					</div>
					<div class="tab-content" id="groupTableDiv">
						<div id="groupDetailDiv" class="tab-pane active">
							<div class="modal-body" style="padding: 0px;">
								<div id="groupFunctionButton" class="text-right marg pad">
									<a id="activeGroup" name="activeGroup" class="btn btn-primary ng-binding">
										<i class="fa fa-check"></i>
										<spring:message code="group.active" />
									</a>
									<a style="margin-top: 3px" id="editGroup" name="editGroup" class="btn btn-primary btn-offset">
										<i class="glyphicon glyphicon-edit"></i>
										<spring:message code="group.edit" />
									</a>
									<a id="groupDepositApply" style="margin-top: 3px" class="btn btn-primary btn-offset">
										<i class="glyphicon glyphicon-file"></i>
										<spring:message code="group.group.deposit.apply" />
									</a>
									<a id="groupLoanApply" style="margin-top: 3px" class="btn btn-primary btn-offset">
										<i class="glyphicon glyphicon-file"></i>
										<spring:message code="group.group.loan.apply" />
									</a>
									<a id="bulkJLGLoanApplication" style="margin-top: 3px" class="btn btn-primary btn-offset">
										<i class="glyphicon glyphicon-file"></i>
										<spring:message code="group.bulk.JLG.loan.application" />
									</a>
									<span class="dropdown">
									<button style="margin-top: 3px"
										class="btn btn-primary dropdown-toggle" type="button"
										id="more" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true">
										<spring:message code="group.more" />
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu  dropdown-menu-right" aria-labelledby="dropdownMenu1">
										<li id="attendance"><a class="ng-binding"> <spring:message
													code="group.attendance" />
										</a></li>
										<li id="appointStaff"><a class="ng-binding ng-hide">
												<spring:message code="group.appoint.staff" />
										</a></li>
										<li id="dismissStaff"><a class="ng-binding"> <spring:message
													code="group.dismiss.staff" />
										</a></li>
										<li id="groupDelete"><a class="ng-binding ng-hide"> <spring:message
													code="btn.delete" />
										</a></li>
										<li id="closeGroup"><a class="ng-binding"> <spring:message
													code="group.close" /></a></li>
										<li id="attachMeeting"><a class="ng-binding ng-hide">
												<spring:message code="group.attach.meeting" />
										</a></li>
									</ul>
								</span>
								</div>
							</div>

							<hr style="margin-top: 5; margin-bottom: 5">
							<div class="pad">
								<div class="col-md-9 circular marg pad">
									<div id="center" class="row" style="padding: 10px">
										<div class="form-group col-md-9">
										<div id="clientManage" style="padding-right: 10px;height: 35px;text-align:left">
												<a id="addClient" class="btn btn-primary pull-right ng-binding">
													<i class="fa fa-plus-sign-alt "></i><spring:message code="group.add" />
												</a>
												<a id="manageClient" class="btn btn-primary pull-right ng-binding">
													<i class="glyphicon glyphicon-edit"></i><spring:message code="group.manager.client" />
												</a>
												<a id="transforClient" class="btn btn-primary pull-right ng-binding">
													<i class="glyphicon glyphicon-arrow-right"></i><spring:message code="group.transfor.client" />
												</a>
											</div>
											<table id="clientTable">
												<thead>
													<tr>
														<th name="id" style="display: none"></th>
														<th name="accountNo" width='212'><spring:message code="group.account" /> #</th>
														<th name="displayName" width='150'><spring:message code="group.name" /></th>
														<th name="status.value" width='160' type="action"
														actionjs="if(row.status.value!='Closed' && row.status.value!='Pending')
														{setMenberButton(td,row.id,row.status.value)};"><spring:message code="group.action" /></th>
													</tr>
												</thead>
												<tbody></tbody>
											</table>
										</div>
										<div class="col-md-3 circular" style="padding: 0px">
											<div class="circular"
												style="border: 1px solid #ccc; background: #FCF8E3; padding: 15px; margin-left: 30px">
												<span>
													<spring:message code="group.next.metting.time" />
													:
												</span>
												<span id="mettingTime"></span>
												<br>
												<span id="mettingFrequencyTitle">
													<spring:message code="group.metting.frequency" />
													:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												</span>
												<span id="mettingFrequency"></span>
											</div>
										</div>
									</div>
																	</div>
								<div class="col-md-3" style="border: 1px solid #ccc; padding: 10px; margin: 0px; background: #FFFFFF">
									<h4>
										<strong id="groupDetail" class="ng-binding"></strong>
									</h4>
									<table class="table-minified">
										<tbody>
											<tr id="activationDateTr" class="ng-hide">
												<th class="ng-binding"><spring:message code="group.activation.date" />:</th>
												<td><span id="activeDate" class="padded-td ng-binding"></span></td>
											</tr>
											<tr id="staffNameTr" class="ng-hide">
												<th class="ng-binding"><spring:message code="group.staff" /></th>
												<td><span id="staffName" class="padded-td ng-binding"></span></td>
											</tr>
											<tr id="externalIdTr" class="ng-hide">
												<th class="ng-binding"><spring:message code="group.external.id" /></th>
												<td><span id="externalId" class="padded-td ng-binding"></span></td>
											</tr>
											<tr id="groupCenterTr" class="ng-hide">
												<td class="ng-binding"><spring:message code="group.center" /></td>
												<td><span class="padded-td">
														<a id="groupCenter" class="list-group-item-text ng-binding" href="#/viewcenter/"></a>
													</span></td>
											</tr>
										</tbody>
									</table>
									<h4>
										<strong class="ng-binding"><spring:message code="group.abstract" /></strong>
									</h4>
									<table class="table-minified">
										<tbody>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.client" />：</th>
												<td id="activeClients" class="ng-binding">0</td>
											</tr>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.group.loans" />：</th>
												<td id="activeGroupLoans" class="ng-binding">0</td>
											</tr>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.client.loan" />：</th>
												<td id="activeClientLoans" class="ng-binding">0</td>
											</tr>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.group.borrower" />：</th>
												<td id="activeBorrowers" class="ng-binding">0</td>
											</tr>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.client.borrower" />：</th>
												<td id="activeClientBorrowers" class="ng-binding">0</td>
											</tr>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.overdue.group.loan" />：</th>
												<td id="overdueGroupLoans" class="ng-binding">0</td>
											</tr>
											<tr>
												<th class="ng-binding"><spring:message code="group.active.overdue.client.loan" />：</th>
												<td id="overdueClientLoans" class="ng-binding">0</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div style="clear: both;"></div>
							</div>
								<div style="background: #FFFFFF">
									<div class="col-md-11 pad" style="background: #FFFFFF">
										<div id="activeLoanDiv">
												<div id="loanAccountButton" class="form-group tab-marg" style="padding: 0px">
													<div class="col-md-3" style="margin-top: 10px">
														<spring:message code="group.loan.accounts.overview" />
													</div>
													<div class="col-md-6"></div>
													<div class="col-md-3 text-right pad">
														<button type="button" onclick="changeTable('activeLoanDiv','closedLoanDiv')"
															class="btn-primary btn btn-sm ng-binding">
															<spring:message code="group.view.closed.loan" />
														</button>
													</div>
												</div>
												<div class="form-group" style="padding-left: 10px">
													<table id="ActiveLoanAccountTable">
														<thead>
															<tr>
																<th name="id" width='150' style="display: none"></th>
																<th name="timeline.expectedDisbursementDate" width='150' style="display: none"></th>
																<th name="accountNo" width='200'><spring:message code="group.account" /> #</th>
																<th name="productName" width='277'><spring:message code="group.product" /></th>
																<th name="originalLoan" width='80'><spring:message code="group.original.loan" /></th>
																<th name="loanBalance" width='80'><spring:message code="group.loan.balance" /></th>
																<th name="amountPaid" width='100'><spring:message code="group.pay.amount" /></th>
																<th name="loanType.value" width='70'><spring:message code="group.type" /></th>
																<th name="status.value" type="action" 
																actionjs="setLoanButton(td,row.id,row.status.value);"><spring:message code="group.action" /></th>
															</tr>
														</thead>
														<tbody></tbody>
													</table>
												</div>
											</div>
		
											<div id="closedLoanDiv" style="padding: 0px; display: none">
												<div class="form-group tab-marg" style="padding: 0px">
													<div class="col-md-4" style="margin-top: 10px">
														<spring:message code="group.loan.accounts.overview" />
													</div>
													<div class="col-md-5"></div>
													<div class="col-md-3 text-right pad">
														<button type="button" onclick="changeTable('closedLoanDiv','activeLoanDiv')"
															class="btn-primary btn btn-sm ng-binding">
															<spring:message code="group.view.active.loan" />
														</button>
													</div>
												</div>
												<div class="form-group" style="padding-left: 10px">
													<table  id="ClosedLoanAcccountTable">
														<thead>
															<tr>
																<th name="id" width='200' style="display: none"></th>
																<th name="accountNo" width='200'><spring:message code="group.account" /> #</th>
																<th name="productName" width='310'><spring:message code="group.product" /></th>
																<th name="loanType.value" width='200'><spring:message code="group.type" /></th>
																<th name="timeline" width='200'><spring:message code="group.close.date" /></th>
															</tr>
														</thead>
														<tbody></tbody>
													</table>
												</div>
											</div>
		
											<div id="ActiveSavingDiv">
												<div class="form-group tab-marg" style="padding: 0px">
													<div class="col-md-4" style="margin-top: 10px">
														<spring:message code="group.saving.account.overview" />
													</div>
													<div class="col-md-5"></div>
													<div class="col-md-3 text-right pad">
														<button type="button" onclick="changeTable('ActiveSavingDiv','ClosedSavingDiv')"
															class="btn-primary btn btn-sm ng-binding">
															<spring:message code="group.view.closed.saving" />
														</button>
													</div>
												</div>
												<div class="form-group" style="padding-left: 10px">
													<table id="ActiveSavingAccountTable">
														<thead>
															<tr>
																<th name="id" width='30' style="display: none"></th>
																<th name="accountNo" width='270'><spring:message code="group.account" /> #</th>
																<th name="productName" width='240'><spring:message code="group.product" /></th>
																<th name="accountBalance" width='200'><spring:message code="group.difference" /></th>
																<th name="status.value" width='200' type="action" 
																actionjs="setSavingButton(td,row.id,row.status.value);"><spring:message code="group.action" /></th>
															</tr>
														</thead>
														<tbody></tbody>
													</table>
												</div>
											</div>
		
											<div id="ClosedSavingDiv" style="padding: 0px; display: none">
												<div class="form-group tab-marg" style="padding: 0px">
													<div class="col-md-4" style="margin-top: 10px">
														<spring:message code="group.saving.account.overview" />
													</div>
													<div class="col-md-5"></div>
													<div class="col-md-3 text-right pad">
														<button type="button" onclick="changeTable('ClosedSavingDiv','ActiveSavingDiv')"
															class="btn-primary btn btn-sm ng-binding">
															<spring:message code="group.view.active.saving" />
														</button>
													</div>
												</div>
												<div class="form-group" style="padding-left: 10px">
													<table id="ClosedSavingAccountTable">
														<thead>
															<tr>
																<th name="id" width='250' style="display: none"></th>
																<th name="accountNo" width='300'><spring:message code="group.account" /> #</th>
																<th name="productName" width='300'><spring:message code="group.product" /></th>
																<th name="timeline" width='310'><spring:message code="group.close.date" /></th>
															</tr>
														</thead>
														<tbody></tbody>
													</table>
												</div>
											</div>
									</div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div id="groupNoteDiv" class="tab-pane">
							<div class="modal-body" style="height: 70px">
								<div style="height: 40px">
									<div class="form-horizontal" style="width: 850px">
										<div class="col-sm-11" style="padding-left: 0px; padding-right: 0px;">
											<textarea id="newNoteDetail" name="groupNote" style="width: 760px; height: 40px;"></textarea>
										</div>
										<div class="col-sm-1"
											style="width: 64px; height: 40px; padding-left: 10px; padding-right: 0px; padding-top: 3px">
											<button type="button" id="save" name="save" class="btn btn-primary" style="left: 50px">
												<spring:message code="btn.submit" />
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group" style="padding: 10px">
								<table id="noteList">
									<thead>
										<tr>
											<th name="note" width='591'><spring:message code="group.content" /></th>
											<th name="createdByUsername" width='200'><spring:message code="group.createBy" /></th>
											<th name="createdOn" width='200'><spring:message code="group.createOn" /></th>
										</tr>
									</thead>
								<tbody></tbody>
								</table>
							</div>
						</div>
						
						<div id="groupCommitteeDiv" class="tab-pane">
							<div class="modal-body" style="height: auto; padding-top: 0px">
								<div class="form-group" style="padding-left: 10px">
								<div class="row" style="margin: 5px 5px">
							      <button type='button' id="addRoleButton" name="add" class="btn btn-primary pull-right" onclick="addRole()"><spring:message code="btn.add"/></button>
						        </div>
									<table id="CommitteeList">
										<thead>
											<tr>
												<th name="id" style="display:none"></th>
												<th name="role.name" width='520'><spring:message code="group.role" /></th>
												<th name="clientName" width='200'><spring:message code="group.name" /></th>
												<th name="clientId" width='150'><spring:message code="group.client.id" /></th>
												<th name="clientId"  type="action" button=" true " 
												actionjs="setUnassignbutton(td,row.id)"><spring:message code="group.action" /></th>
											</tr>
										</thead>
									<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
		</fieldset>
	</form>
</body>
<script type="text/javascript">
	 /* var groupId = ${pd.groupId};
	 var staffId =  ${pd.staffId};
	 var userId = ${pd.userId}; */
	 var groupId = ${pd.groupId};
	 var staffId;
	 var initGroupJson;
	 var accountsJson;
	 var functionName = false;
	 var groupStatus;
	 var clientId;
	 var calendarId;
	 var userId=${userId};
	 var officeId;
	 var officeName;
	 var requestType =2;
	$(document).ready(function initDetailPage() {
		clientGrid = $('#clientTable').flexigrid({});
		ActiveLoanGrid = $('#ActiveLoanAccountTable').flexigrid({});
		ClosedLoanGrid = $('#ClosedLoanAcccountTable').flexigrid({});
		ActiveSavingGrid = $('#ActiveSavingAccountTable').flexigrid({});
		ClosedSavingGrid = $('#ClosedSavingAccountTable').flexigrid({});
		noteGrid = $('#noteList').flexigrid({});
		CommitteeGrid = $('#CommitteeList').flexigrid({});

		initGroupDetail();
		groupAbstract();
		getAcounInfo();
		getNoteList();
		getTable();
	});
	
	function clientAddJLGLoan(){
		 clientId = clientGrid.colVal('id');
		$.openWindow("loadPage.do?nextPage=client.loanClient");
	}
	/* 组详情的js */

	function setLoanButton(td,id,statu){
 		var status = [ "Submitted and pending approval", "Approved", "Active","Overpaid",
			"Withdrawn by applicant", "Closed"];
		var onclick =["approveLoan("+id+")","disburseLoan("+id+")","makeRepayment("+id+")","disburseLoan("+id+")"]; 
		var logoAndValue =["<i class='glyphicon glyphicon-ok'></i>批准","<i class='glyphicon glyphicon-flag'></i>支付","<i class='glyphicon glyphicon-usd'></i>还款","<i class='glyphicon glyphicon-flag'></i>支付"];
		var statusType = distinguishType(status,statu);
		if(statusType<onclick.length)
			var button = "<button type='button' id='setLoanButton' class='btn-primary btn btn-sm ng-binding'"
					+"onclick="+onclick[statusType]+">"+logoAndValue[statusType]+"</button>";
		$(td).append(button);
	}
	
	function setSavingButton(td,id,statu){
 		var status = ["Approved", "Active","Submitted and pending approval"];
		var onclickOne =["unapproveSaving("+id+")","Deposit("+id+")","approveSaving("+id+")"]; 
		var onclickTwo =["activeSaving("+id+")","Withdrawal("+id+")"]; 
		var logoAndValueOne =["<i class='glyphicon glyphicon-repeat'></i>撤销批准","<i class='glyphicon glyphicon-arrow-right'></i>存款","<i class='glyphicon glyphicon-ok'></i>批准"];
		var logoAndValueTwo =["<i class='glyphicon glyphicon-ok'></i>激活","<i class='glyphicon glyphicon-arrow-left'></i>撤回"];
		var statusType = distinguishType(status,statu);
		var button="";
		if(statusType<onclickOne.length)
			 button = button + "<button type='button' class='btn-primary btn btn-sm ng-binding'"
					+"onclick="+onclickOne[statusType]+">"+logoAndValueOne[statusType]+"</button>";
		if(statusType<onclickTwo.length)
			 button = button + "<button type='button' class='btn-primary btn btn-sm ng-binding'"
					+"onclick="+onclickTwo[statusType]+">"+logoAndValueTwo[statusType]+"</button>";
		$(td).append(button);
	}
	
	function setMenberButton(td,id){
		$(td).append("<button type='button' class='btn-primary btn btn-sm ng-binding' onclick='clientAddJLGLoan("+id+")'><i class='glyphicon glyphicon-plus'></i>LJG贷款申请</button>");
	}
		
	function setUnassignbutton(td,id){
		if(groupStatus!="Closed")
			$(td).append("<button type='button' class='btn-primary btn btn-sm ng-binding' onclick='dismissalRole("+id+")'>Unassign</button>");
	}
	/* 初始化组信息 */
	function initGroupDetail() {
		initGroupJson ={
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"url" : "api.v1.groups." + groupId + "?associations=all"
				},
				callback : "initGroupInfo"
			}
		$.nest(initGroupJson);
	}
	var clientMember;
	/* 处理组信息 */
	function initGroupInfo(param) {
		officeId =param.officeId;
		officeName=param.officeName;
		groupStatus = param.status.value;
		groupView(param);
		setTitle(param);
		initMetting(param.collectionMeetingCalendar);
		var clientMenber = param.clientMembers;
		setStatusColor(clientMenber);
		clientGrid.addRows(clientMenber);
		groupDetail(param);
		CommitteeGrid.addRows(param.groupRoles);
		if(!jude(param.collectionMeetingCalendar))
		calendarId = param.collectionMeetingCalendar.id;
	}
	
	/* 委员会 */
	function dismissalRole(id) {
		if(confirm("Unassign"))
			$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "get",
			data : {
				"dataType" : "post",
				"url" : "api.v1.groups." + groupId
						+ "?command=unassignRole&roleId=" + id,
			},
				callback : "reloadPage"
		});
	}

	function addRole() {
		$.openWindow("loadPage.do?nextPage=group.addRole");
	}

	/* 委员会 */

	 var account = $.fn.bootstrapValidator.i18n.group.account;
	 var office = $.fn.bootstrapValidator.i18n.group.office;
	 var center = $.fn.bootstrapValidator.i18n.group.center;
	/* 初始化标题 */
	function setTitle(param) {
		$("#titlePoint").html(
				"<div id='titlePoint' class='"
						+ accountColor(param.status.value)
						+ " circle  marg'></div>");
		var groupTitle = param.name + "|"+account+"#:" + "\"" + param.accountNo + "\""
				+ "|"+office+":" + "\"" + unde(param.officeName) + "\"" + "|"+center+":"
				+ "\"" + unde(param.centerName) + "\""
		setSpan("groupTitle", groupTitle);
	}
	
	/* 初始化会议 */
	var unassigned = $.fn.bootstrapValidator.i18n.group.unassigned;
	function initMetting(collectionMeetingCalendar) {
		if (jude(collectionMeetingCalendar)){
			setSpan("mettingTime",unassigned);
			$.hide("mettingFrequencyTitle");
			return 0;
		}
		/* 能否编辑会议 */
		var editbutton = "";
		if (collectionMeetingCalendar.entityType.value != "CENTERS")
			editbutton = ' <a onclick="editMetting()"><i class="glyphicon glyphicon-edit"></i></a>';
		setSpan("mettingTime", $.formatDate(collectionMeetingCalendar.nextTenRecurringDates[0]) + editbutton);
		setSpan("mettingFrequency", collectionMeetingCalendar.humanReadable);
	}

	var detail = $.fn.bootstrapValidator.i18n.group.detail;
	/* 组详情的js */
	function groupDetail(param) {
		setSpan("groupDetail", param.name + " "+detail);
		if (!jude(param.activationDate))
			var activationDate = $.formatDate (param.activationDate);
		setGroupDetail("activeDate", activationDate);
		setGroupDetail("staffName", param.staffName);
		staffId = param.staffId; 
		setGroupDetail("externalId", param.externalId);
		setGroupDetail("groupCenter", param.centerName);
		setGroupDetail("groupCenter", param.centerName);
		$("#groupCenter").prop("href","loadPage.do?nextPage=center.detail&centerId=" +param.centerId);
	}

	/* 组不同状态的显示控制 */
	function groupView(param) {
		/* 关闭状态的组 */
		if (param.status.value == "Closed")
			$.hide("groupFunctionButton","savingAccountButton",
					"ActiveSavingAccountDiv","ClosedSavingAccountDiv","loanAccountButton",
					"ActiveLoanAccountDiv","ClosedLoanAcccountDiv","clientManage","CommitteeList","addRoleButton");
					
		/* 判断委任职员还是解除职员  appointStaff dismissStaff*/
		if (jude(param.staffName))
			$.hide("dismissStaff");
		else
			$.hide("appointStaff");
		/* 是否隐藏添加会议 */
		if (!jude(param.collectionMeetingCalendar)){
			$.hide("attachMeeting");
			$.show("attendance");
		}
		else
			$.hide("attendance");
		/* 判断是否隐藏删除及激活组按钮 */
		if (param.status.value == "Active")
			$.hide("groupDelete","activeGroup");
		/* 大量JLG贷款按钮 */
		if ((jude(param.activeClientMembers) && jude(param.clientMembers))
				|| param.status.value != "Active")
			$.hide("bulkJLGLoanApplication");
		/*刚创建没激活的组   groupDepositApply groupLoanApply */
		if (param.status.value == "Pending")
			$.hide("groupDepositApply","groupLoanApply","attachMeeting");
	}

	/* 设置组详情 */
	function setGroupDetail(id, text) {
		if (jude(text))
			return 0;
		$("#" + id + "Tr").prop("class", "");
		setSpan(id, text);
	}
	/* 组摘要 */
	function groupAbstract() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "get",
			data : {
				"dataType" : "GET",
				"url" : "api.v1.runreports.GroupSummaryCounts?R_groupId="
						+ groupId + "&genericResultSet=false"
			},
			callback : "initgroupAbstract"
		});
	}

	function initgroupAbstract(param) {
		var abs = param[0];
		setSpan("activeClients", abs.activeClients);
		setSpan("activeClientLoans", abs.activeClientLoans);
		setSpan("activeGroupLoans", abs.activeGroupLoans);
		setSpan("activeBorrowers", abs.activeGroupBorrowers);
		setSpan("activeClientBorrowers", abs.activeClientBorrowers);
		setSpan("overdueClientLoans", abs.overdueClientLoans);
		setSpan("overdueGroupLoans", abs.overdueGroupLoans);
	}

	/* 账户信息 */
	function getAcounInfo() {
			accountsJson = {
			url : "<c:url value='/fineract.do'/>",
			type : "get",
			data : {
				"dataType" : "GET",
				"url" : "api.v1.groups." + groupId + ".accounts"
			},
			callback : "initAcount"
		}
		$.nest(accountsJson);
	}

	function initAcount(param) {
		addAccount(param.loanAccounts, ActiveLoanGrid, 'activeLoanDiv',
				ClosedLoanGrid, 'closedLoanDiv');
		addAccount(param.savingsAccounts, ActiveSavingGrid, 'ActiveSavingDiv',
				ClosedSavingGrid, 'ClosedSavingDiv');
	}
	var AccountStatus=["Submitted and pending approval", "Approved", "Active"];
	/* 把账户填入表格 */
	function addAccount(Accounts, grad1, id1, grad2, id2) {
		if (jude(Accounts)) {
			$.hide(id1,id2);
			return 0;
		}
		setStatusColor(Accounts);
		var Active = [];
		var Closed = [];
		for (var i = 0; i < Accounts.length; i++)
			if (jude(Accounts[i].timeline.closedOnDate))
				Active.push(Accounts[i]);
			 else {
				Accounts[i].timeline = $.formatDate(Accounts[i].timeline.closedOnDate);
				Closed.push(Accounts[i]);
			}
		grad1.addRows(Active);
		grad2.addRows(Closed);
		if (Active.length < 1 && Closed.length < 1)
			$.hide(id1,id2);
		 else if (Active.length<1 && Closed.length>0)
			changeTable(id1, id2);
	}

	/* 状态颜色判断 */
	function setStatusColor(param) {
		if(!jude(param))
		 $.each(param,function(index,item){
			item.accountNo= "<div style='height:30px'><div style='width:15px;height:15px' class='"
			+ accountColor(item.status.value)+ " col-md-1'></div><div class='col-md-11' style='padding:0px'>&nbsp"
			+item.accountNo+"</div></div>";
		});
	}	
	
	/* 切换表单 */
	function changeTable(id1, id2) {
		$.hide(id1);
		$.show(id2);
	}

	/* note的js */
	/* 初始化Note列表 */
	function getNoteList() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"url" : "api.v1.groups." + groupId + ".notes"
			},
			callback : "initNoteList"
		});
	}

	function initNoteList(param) {
		for (var i = 0; i < param.length; i++)
			param[i].createdOn = $.formatDate (param[i].createdOn);
		noteGrid.addRows(param);
	}
	
	/* 添加Note */
	$("#save").click(function() {
		var note = $("#newNoteDetail").val();
		var validNote = $.trim(note);
		if (validNote.length > 0) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					"dataType" : "post",
					"mydata" : {
						'note' : note
					},
					"url" : "api.v1.groups." + groupId + ".notes"
				},
				callback : "getNoteList"
			});
		}
	});
	
	/* note的js */
	/* 表格的js*/
	//初始化加载数据
	function getTable() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.datatables?apptable=m_group"
			},
			callback : "dataTable"
		});
	};
	function dataTable(param) {
		if (param.length > 0) {
			for (var i = 0; i < param.length; i++) {
				var btnjson = param[i];
				var name = $.replaceTemplate(btnjson.registeredTableName, " ",
						"");
				var tableHeader = btnjson.columnHeaderData;
				var url = "loadPage.do?nextPage=system.datatable.app_datatable_add";
				if (tableHeader != undefined && tableHeader[0] != undefined
						&& tableHeader[0].columnName == "id") {
					url = "loadPage.do?nextPage=system.datatable.app_datatable_list";
				}
				url += "&datatablename=" + btnjson.registeredTableName
						+ "&notesid=" + groupId;
				$("#groupFunction").append(
						"<li><a href='#"+name+"'>"
								+ btnjson.registeredTableName + "</a></li> ");
				$("#groupTableDiv")
						.append(
								"<div class='tab-pane' id='"+name+"' action='"+url+"'><div class='iframe-div'><iframe id='"+name+"Frm' class='iframe-style' src='''></iframe></div></div> ");
			/* if(groupStatus=="Closed")
				$.hide(name+"Frm"); */
			}
			/* 初始化按钮 */
			$('#groupFunction a:first').tab('show');//初始化显示哪个tab 
			$($('#groupFunction a:first').attr("href") + "Frm").attr("src",
					$($('#groupFunction a:first').attr("href")).attr("action"));
			$('#groupFunction a').click(
					function(e) {
						e.preventDefault();//阻止a链接的跳转行为 
						$(this).tab('show');//显示当前选中的链接及关联的content 
						$($(this).attr("href") + "Frm").attr("src",
								$($(this).attr("href")).attr("action"));
					})
		}
	}

	$(function() {
		$('#groupFunction a:first').tab('show');//初始化显示哪个tab 

		$('#groupFunction a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为 
			$(this).tab('show');//显示当前选中的链接及关联的content 
		})
	})

	/* 表格的js*/
	/* 整合功能 */
	$.getWidget("activeGroup").click(function() {
		$.openWindow("loadPage.do?nextPage=group.activeGroup");
	});

	$.getWidget("editGroup").click(function() {
		clientId = false;
		$.openWindow("loadPage.do?nextPage=group.editGroup");
	});

	$.getWidget("groupDepositApply").click(function() {
		$.openWindow('loadPage.do?nextPage=client.savingClient&pageType=group');
	});

	$.getWidget("groupLoanApply").click(function() {
		$.openWindow("loadPage.do?nextPage=client.loanClient");
	});

	$.getWidget("bulkJLGLoanApplication").click(function() {
		$.openWindow("loadPage.do?nextPage=group.largeJLGLoanApply");
	});

	$.getWidget("attendance").click(function() {
		$.openWindow("loadPage.do?nextPage=group.groupAttendance");
	});

	$.getWidget("appointStaff").click(function() {
		$.openWindow("loadPage.do?nextPage=group.assignStaff");
	});

	$.getWidget("dismissStaff").click(function() {
		$.openWindow("loadPage.do?nextPage=group.unassignStaff");
	});

	$.getWidget("closeGroup").click(function() {
		$.openWindow("loadPage.do?nextPage=group.closureGroup");
	});

	$.getWidget("groupDelete").click(function() {
		if(confirm("Delete"))
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "DELETE",
			data : {
				"dataType" : "DELETE",
				"mydata" : "",
				"url" : "api.v1.groups." + groupId
			}
		});
		functionName = true;
	});

	$.getWidget("attachMeeting").click(function() {
		$.openWindow("loadPage.do?nextPage=group.attachMeeting");
	});

	function editMetting() {
		$.openWindow("loadPage.do?nextPage=group.editMeeting");
	}


	/* 整合功能-客户功能整合 */
	$.getWidget("addClient").click(function() {
		$.openWindow("loadPage.do?nextPage=client.addClient");
	});
	$.getWidget("manageClient").click(function() {
		$.openWindow("loadPage.do?nextPage=group.manageClient");
	});
	$.getWidget("transforClient").click(function() {
		$.openWindow("loadPage.do?nextPage=group.transferClient");
	});
	
	//点击一下某一客户成员，则弹出该客户的详情页面
	$.getWidget("clientTable").click(function(){
		 if(!$.isEmpty(clientGrid.colVal('id'))){
		clientId = clientGrid.colVal('id');
		if(clientId) 
			$.openWindow("loadPage.do?nextPage=client.detail&clientId=" + clientId
					+ "&userId=" + userId, "iframe", "100%", "90%");
		 }
	});
	
	/* 整合功能-客户功能整合 */

	/* 整合功能-存款贷款 表格功能整合BEG */
	var loanId;
	/* 批准 */
	function approveLoan(id) {
		loanId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.approve"/>');
	}

	function disburseLoan(id) {
		loanId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.disburse"/>');
	}

	function makeRepayment(id) {
		loanId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.makeRepayment"/>');
	}
	//点击一下某一活跃贷款账户，则弹出该账户的详情页面
	$.getWidget("ActiveLoanAccountTable").click(function(){
		 if(!$.isEmpty(ActiveLoanGrid.colVal('id'))){
		loanId = ActiveLoanGrid.colVal('id');
		if(loanId) 
			window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+2+"&groupId"+groupId;
		 }
	});
	
	//点击一下某一关闭贷款账户，则弹出该账户的详情页面
	$.getWidget("ClosedLoanAcccountTable").click(function(){
		 if(!$.isEmpty(ClosedLoanGrid.colVal('id'))){
		loanId = ClosedLoanGrid.colVal('id');
		if(loanId) 
			window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+2+"&groupId"+groupId;
		 }
	});
	
	/* 存款账户的功能 */
	var savingsId;
	var savingAccountId;
	function approveSaving(id) {
		savingsId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.approveSaving"/>');
	}
	function unapproveSaving(id) {
		 savingAccountId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.unapproveSaving"/>');
	}
	function activeSaving(id) {
		 savingsId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.activeAccount"/>');
	}
	function Withdrawal(id) {
		savingAccountId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.withdrawalClient"/>');
	}
	function Deposit(id) {
		 savingAccountId = id;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.depositClient"/>');
	}
	//点击一下某一活跃存款账户，则弹出该账户的详情页面
	$.getWidget("ActiveSavingAccountTable").click(function(){
		 if(!$.isEmpty(ActiveSavingGrid.colVal('id'))){
		 savingsId = ActiveSavingGrid.colVal('id');
		if(savingsId) 
			window.location.href = "loadPage.do?nextPage=client.savingsaccounts&savingsId="
				+ savingsId+"&groupId="+groupId+"&pageType=group";
		 }
	});
	
	//点击一下某一关闭的存款账户，则弹出该账户的详情页面
	$.getWidget("ClosedSavingAccountTable").click(function(){
		 if(!$.isEmpty(ClosedSavingGrid.colVal('id'))){
		 savingsId = ClosedSavingGrid.colVal('id');
		if(savingsId) 
			window.location.href = "loadPage.do?nextPage=client.savingsaccounts&savingsId="
				+ savingsId+"&groupId="+groupId+"&pageType=group";
		 }
	});
	
	/* 整合功能-存款贷款 表格功能整合END */
	/* 整合功能 */
	$("#centerId").click(function() {
		var centerId = parseInt($("#groupCenter").html());
	});
	/* 工具 */
	/* 设置span内容 */
	function setSpan(id, text) {
		if(jude(text))
			text="";
		$("#" + id).html(text);
	}
	/* 判断变量是否为空，位空就返回“” */
	function unde(param) {
		if (jude(param))
			return "";
		return param;
	}
	/* 判断一个值是否定义 */
	function jude(param) {
		if (typeof (param) == "undefined")
			return true;
		return false;
	}
	
	/* 状态颜色判断 */
	function accountColor(statu) {
		var status = [ "Submitted and pending approval", "Approved", "Active",
			"Withdrawn by applicant", "Closed","Rejected","Overpaid"];
		var statusColor = [ "orange", "blue", "green", "dark", "dark", "dark", "purple"];
		if (jude(statu))
			return statusColor[0];
		return statusColor[distinguishType(status,statu)];
	}
	/* 判断颜色类型 */
	function distinguishType(status,statu){
		if (jude(statu))
			$.bAlert("statu undifund");
		for (var i = 0; i < status.length; i++)
			if (status[i].substring(0,5) == statu.substring(0,5))
				return i;
		return -1;
	}
	/* 模态框回掉 */
		$('#myModal').on('hidden.bs.modal', function (event) {
			reloadPage();
		});
	/* 页面重载*/
	function reloadPage(){
		if(functionName){
			functionName= false;
			return 0;
		}
		$.nest(initGroupJson);
		$.nest(accountsJson);
	}
</script>
</html>