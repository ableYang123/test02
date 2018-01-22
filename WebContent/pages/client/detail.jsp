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
	<script src="<c:url value='/js/jquery.webcam.min.js'/>"></script>
</head>
<body>
<div>
	<div style="margin-top: 20px">
		<h3 style="font-size: x-large;">
			<small><input readonly="readonly" name="office" type="text" style="border: none;"></small>
		</h3>
	</div>
	<legend>
		<div class="row col-md-12 col-sm-12">
			<span>
				<i class="glyphicon glyphicon-stop" name="color" id="color" style="font-size: 20px; color: rgb(255, 255, 255);"></i>
				<span style="font-size: x-large;" id="fullName"></span>
			</span>
			<span style="font-size: medium;">
				<small><input name="client" readonly="readonly" type="text" style="border: none;width: 400;"></small>
			</span>
		</div>
	</legend>
	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#generalList"><spring:message code="lable.general"/></a></li>
		<li><a href="#identityAdd"><spring:message code="lable.identities"/></a></li>
		<li><a href="#documentAdd"><spring:message code="lable.documents"/></a></li>
		<li><a href="#noteAdd"><spring:message code="lable.notes"/></a></li>
	</ul>
	<legend></legend>
	<div class="tab-content" id="myTabContent">
		<div id="generalList" class="tab-pane active">
			<div>
				<div class="row col-md-12 col-sm-12">
					<span id="edt">
						<button style="margin-top: 3px" id="edit" name="edit" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-edit"></i>
							<spring:message code="lable.edit"/>
						</button>
					</span>
					<span id="loan">
						<button style="margin-top: 3px" id="newLoan" name="newLoan" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-plus"></i>
							<spring:message code="lable.new.loan"/>
						</button>
					</span>
					<span id="saving">
						<button style="margin-top: 3px" id="newSaving" name="newSaving" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-plus"></i>
							<spring:message code="lable.new.saving"/>
						</button>
					</span>
					<span id="share">
						<button style="margin-top: 3px" id="newShare" name="newShare" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-plus"></i>
							<spring:message code="lable.new.share"/>
						</button>
					</span>
					<span id="charge">
						<button style="margin-top: 3px" id="addCharge" name="addCharge" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-plus"></i>
							<spring:message code="lable.charges"/>
						</button>
					</span>
					<span id="transfer">
						<button style="margin-top: 3px" id="transferClient" name="transferClient" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-arrow-right"></i>
							<spring:message code="lable.transfer.client"/>
						</button>
					</span>
					<span id="alive">
						<button style="margin-top: 3px" id="active" name="active" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-ok"></i>
							<spring:message code="client.activeClient"/>
						</button>
					</span>
					<span id="relive">
						<button style="margin-top: 3px" id="reactive" name="reactive" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-ok"></i>
							<spring:message code="lable.reactive.client"/>
						</button>
					</span>
					<span id="clo">
						<button style="margin-top: 3px" id="close" name="close" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="client.close.client"/>
						</button>
					</span>
					<span id="rej">
						<button style="margin-top: 3px" id="reject" name="reject" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.reject.client"/>
						</button>
					</span>
					<span id="wit">
						<button style="margin-top: 3px" id="withdraw" name="withdraw" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.client.withdraw"/>
						</button>
					</span>
					<span id="del">
						<button style="margin-top: 3px" id="delete" name="delete" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-trash"></i>
							<spring:message code="btn.delete"/>
						</button>
					</span>
					<span id="assi">
						<button style="margin-top: 3px" id="assignStaff" name="assignStaff" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-user"></i>
							<spring:message code="client.assignStaff"/>
						</button>
					</span>
					<span id="unassi">
						<button style="margin-top: 3px" id="unAssignStaff" name="unAssignStaff" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-user"></i>
							<spring:message code="client.unassignStaff"/>
						</button>
					</span>
					<span id="default">
						<button style="margin-top: 3px" id="updateDefaultSavings" name="updateDefaultSavings" class="btn btn-primary btn-offset">
							<i class="glyphicon glyphicon-edit"></i>
							<spring:message code="lable.update.default.saving.account"/>
						</button>
					</span>
					<span id="acceptTrans">
						<button style="margin-top: 3px" id="acceptTransfer" name="acceptTransfer" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.accept.transfer"/>
						</button>
					</span>
					<span id="rejectTrans">
						<button style="margin-top: 3px" id="rejectTransfer" name="rejectTransfer" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.reject.transfer.client"/>
						</button>
					</span>
					<span id="undoTrans">
						<button style="margin-top: 3px" id="undoTransfer" name="undoTransfer" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.untransfer.client"/>
						</button>
					</span>
					<span id="undoRej">
						<button style="margin-top: 3px" id="undoReject" name="undoReject" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.undorejection"/>
						</button>
					</span>
					<span id="undoWit">
						<button style="margin-top: 3px" id="undoWithdrawal" name="undoWithdrawal" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.undowithdrawal"/>
						</button>
					</span>
					<span class="dropdown">
						<button style="margin-top: 3px" class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						  <spring:message code="lable.more"/>
						  <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						  <li id="csr"><a href="javascript:void(0);" onclick="clientScreenReport()"><spring:message code="lable.screen.reports"/></a></li>
						  <li id="ucs"><a href="javascript:void(0);" onclick="uploadClientSignature()"><spring:message code="lable.upload.signature"/></a></li>
						  <li id="vsi"><a href="javascript:void(0);" onclick="viewStandingInstraction()"><spring:message code="lable.view.standing"/></a></li>
						  <li id="csi"><a href="javascript:void(0);" onclick="createStandingInstraction()"><spring:message code="lable.create.standing.instruction"/></a></li>
						  <li id="nfd"><a href="javascript:void(0);" onclick="newFixedDeposit()"><spring:message code="lable.new.fixed.deposit"/></a></li>
						  <li id="nrd"><a href="javascript:void(0);" onclick="newRecurringDeposit()"><spring:message code="lable.new.recurring.deposit"/></a></li>
						  <li id="cov"><a href="javascript:void(0);" onclick="chargesOverview()"><spring:message code="lable.charges.overview"/></a></li>
						  <li id="sur"><a href="javascript:void(0);" onclick="survey()"><spring:message code="lable.survey"/></a></li>
						</ul>
					</span>
			</div><br><br>
			<div id="closeInfo">
				<span>
					<h3>Client&nbsp;&nbsp;<input type="text" readonly="readonly" style="border: none;width: 30%"name="statusValue"/></h3>
				</span>
			</div>
		</div>
		<div id="rateChart">
			<div class="col-sm-9">
				<div id="charge-view">
					<div class="text-right" style="padding-right: 80px;">
						<button id="chargeviews" name="chargeviews" style="margin-top:50px" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.charge.overview"/>
						</button>
					</div>
					<div class="text-left">
							<label><spring:message code="lable.charge.overview"/></label>
					</div>
					<div  id="chargetView">
						<table id="chargeList">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name="name" width='150'><spring:message code="lable.name"/></th>
									<th name="dueDate" width='100' type="date"><spring:message code="lable.dueDate"/></th>
									<th width='70' name="amount"><spring:message code="lable.amount"/></th>
									<th width='80' name="amountPaid"><spring:message code="lable.amountPaid"/></th>
									<th width='75' name="amountWaived"><spring:message code="lable.amountWaived"/></th>
									<th name="amountOutstanding" width='90'><spring:message code="lable.amountOutstanding"/></th>
									<th name="action" width="160" style="font-size: small;"><spring:message code="lable.action"/></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div id="loan-account">
					<div class="text-right" style="padding-right: 80px;">
						<input type="button" id="loanview" name="loanview" label="closed" value="<spring:message code='lable.view.closed.loans'/>" style="margin-top:50px" class="btn btn-primary btn-offset">
					</div>
					<div class="text-left">
							<label><spring:message code="lable.loan.account.overview"/></label>
					</div>
					<div  id="loanAccountView">
						<table id="loanList">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name="accountNo" width='150'><spring:message code="lable.accountNo"/></th>
									<th name="productName" width='150'><spring:message code="lable.productName"/></th>
									<th width='60' name="originalLoan"><spring:message code="lable.original.loan"/></th>
									<th width='80' name="loanBalance"><spring:message code="lable.loan.balance"/></th>
									<th width='80' name="amountPaid"><spring:message code="lable.amount.paid"/></th>
									<th name="loanType.value" width='100'><spring:message code="lable.type"/></th>
									<th name="action" width="110" style="font-size: small;"><spring:message code="lable.action"/></th>
								</tr>
							</thead>
						</table>
						<table id="loanClosed">
							<thead>
							<tr>
								<th name='id' style='display: none;'>id</th>
								<th name="accountNo" width='150'><spring:message code="lable.accountNo"/></th>
								<th name="productName" width='150'><spring:message code="lable.productName"/></th>
								<th width='60' name="originalLoan"><spring:message code="lable.original.loan"/></th>
								<th width='80' name="loanBalance"><spring:message code="lable.loan.balance"/></th>
								<th width='80' name="amountPaid"><spring:message code="lable.amount.paid"/></th>
								<th name="loanType.value" width='100'><spring:message code="lable.type"/></th>
								<th name="timeline.closedOnDate" width='110' type="date"><spring:message code="client.closure.date"/></th>
							</tr>
							</thead>
						</table>
					</div>
				</div>
				<div id="saving-account">
					<div  class="text-right" style="padding-right: 80px">
						<input type="button" label="closed" id="savingview" value="<spring:message code='lable.view.closed.loans'/>" name="savingview" style="margin-top:50px" class="btn btn-primary btn-offset">
					</div>
					<div class="text-left">
						<label><spring:message code="lable.saving.overview"/></label>
					</div>
					<div id="savingAccountView">
						<table id="savingList">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name='depositType.value' style='display:none'>depositType</th>
									<th name="accountNo" width='200'><spring:message code="lable.accountNo"/></th>
									<th name="productName" width='150'><spring:message code="lable.original.loan"/></th>
									<th name="lastActiveTransactionDate" width='100' type="date"><spring:message code="lable.last.active"/></th>
									<th name="accountBalance" width='125'><spring:message code="lable.balance"/></th>
									<th name="action" width="150" style="font-size: small;"><spring:message code="lable.action"/></th>
								</tr>
							</thead>
						</table>
						<table id="savingclosed">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name="accountNo" width='200'><spring:message code="lable.accountNo"/></th>
									<th name="productName" width='200'><spring:message code="lable.original.loan"/></th>
									<th name="timeline.closedOnDate" width='200' type="date"><spring:message code="client.closure.date"/></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div id="share-account">
					<div  class="text-right" style="padding-right: 80px">
						<input type="button" id="shareview" label="closed" name="shareview" value="<spring:message code='lable.view.closed.loans'/>" style="margin-top:50px" class="btn btn-primary btn-offset">
					</div>
					<div class="text-left">
						<label><spring:message code="lable.share.overview"/></label>
					</div>
					<div id="shareAccountView">
						<table id="shareList">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name="accountNo" width='200'><spring:message code="lable.accountNo"/></th>
									<th name="productName" width='130'><spring:message code="lable.original.loan"/></th>
									<th name="totalApprovedShares" width='150'><spring:message code="lable.approved.shares"/></th>
									<th name="totalPendingForApprovalShares" width='150'><spring:message code="lable.pendding.for.approval.shares"/></th>
									<th name="action" width="100" style="font-size: small;"><spring:message code="lable.action"/></th>
								</tr>
							</thead>
						</table>
						<table id="shareClosed">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name="accountNo" width='180'><spring:message code="lable.accountNo"/></th>
									<th name="productName" width='200'><spring:message code="lable.original.loan"/></th>
									<th name="totalApprovedShares" width='200'><spring:message code="lable.approved.shares"/></th>
									<th name="totalPendingForApprovalShares" width='150'><spring:message code="lable.pendding.for.approval.shares"/></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div id="image" class="col-sm-3">
				<span id="displayName" style="font-size: large;"></span>
				<div class="form-group">
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/client.png" height="128px;" width="128px;" id="articleImg" alt="">
					</div>
				</div>
				<div>
					<button id="imageUpload" style="margin-top: 120px;" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-camera"></i>
					</button>
				</div>
				<div class="form-group" style="border: blue;">
					<table id="clientInfo" style="border: none;font-size: small;">
						<tr>
							<th><spring:message code="lable.active.date"/></th>
							<td><span id="activationDate"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.member.of"/></th>
							<td><span id="memberOf"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.input.isStaff"/></th>
							<td><span id="isStaff"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.mobleNo"/></th>
							<td><span id="mobileNo"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.gender"/></th>
							<td><span id="gender"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="client.clientType"/></th>
							<td><span id="clientType"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="client.classic"/></th>
							<td><span id="clientClassic"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.birthday"/></th>
							<td><span id="dateOfBirth"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.performance.history"/></th>
							<td><span id="history"></span></td>						
						</tr>
						<tr>
							<th>#<spring:message code="lable.of.loan.cycle"/></th>
							<td><span id="loanCycle"></span></td>						
						</tr>
						<tr>
							<th><spring:message code="lable.last.loan.amount"/></th>
							<td><span id="lastLoanAmount"></span></td>						
						</tr>
						<tr>
							<th>#<spring:message code="lable.of.active.loans"/></th>
							<td><span id="activeLoans"></span></td>						
						</tr>
						<tr id="BSD" style="display: none;">
							<th>#<spring:message code="lable.total.saving.bsd"/></th>
							<td><span id="savingBSD"></span></td>					
						</tr>
						<tr id="USD" style="display: none;">
							<th>#<spring:message code="lable.total.saving.usd"/></th>
							<td><span id="savingUSD"></span></td>						
						</tr>
						<tr">
							<th>#<spring:message code="lable.of.active.savings"/></th>
							<td><span id="activeSavings"></span></td>						
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
		<div id="identityAdd" class="tab-pane text-right" style="padding-right: 80px">
			<table id="identityList">
				<thead>
					<tr>
						<th name="id" style="display: none;">id</th>
						<th name='documentKey' width='100'>ID</th>
						<th name="description" width='300'><spring:message code="lable.description"/></th>
						<th name="documentType.name" width='200'><spring:message code="lable.type"/></th>
						<!-- <th name="test" width='200'>文件</th> -->
						<th name="status" width='250'><spring:message code="lable.status"/></th>
					</tr>
				</thead>
			</table>	
		</div>
		<div id="documentAdd" class="tab-pane text-right" style="padding-right: 80px">
			<table id="documentList">
				<thead>
					<tr>
						<th name='id' width='100' style="display: none;">ID</th>
						<th name="name" width='150'><spring:message code="lable.name"/></th>
						<th name="description" width='150'><spring:message code="lable.description"/></th>
						<th name="fileName" width='150'><spring:message code="lable.fileName"/></th>
						<th name="action" width="150" style="font-size: small;"><spring:message code="lable.action"/></th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="noteAdd" class="tab-pane text-right" style="padding-right: 80px">
			<table id="noteList">
				<thead>
					<tr>
						<th name='id' width='100'>ID</th>
						<th name="note" width='300'>内容</th>
						<th name="createdByUsername" width='200'>记录人</th>
						<th name="createdOn" width='200' type="date">记录时间</th>
					</tr>
				</thead>
			</table>			
		</div>
	</div>
</div>
</body>
	<script type="text/javascript">
		var grid1;
		var grid11;
		var grid2;
		var grid22;
		var grid3;
		var grid4;
		var grid44;
		var grid_note;
		var grid_document;
		var grid_identity;
		var clientId = ${pd.clientId};
		var groupId = '';
		var fromOfficeId;
		var officeName;
		var userId = <%=request.getSession().getValue("userId") %>
		var status;
		var isInit="";
		var loanAccounts = [];
		var loanClosed = [];
		var documentId;
		var identityId;
		var chargeId;
		var imagePresent;
		var requestType=1;
		/*查看有效或无效的贷款账户*/
		$("#loanview").click(function(){
			var subDivF = $('#loanAccountView').children(':first');
			if($("#loanview").attr('label')=="closed"){
				$("#loanview").attr("label","actived");
				$("#loanview").prop("value","<spring:message code='lable.view.actived.loans'/>");
				subDivF.hide();
				subDivF.next().show();
			}else{
				$("#loanview").attr("label","closed");
				$("#loanview").prop("value","<spring:message code='lable.view.closed.loans'/>");
				subDivF.show();
				subDivF.next().hide();
			}
		});
		
		/*查看有效或无效的存款账户*/
		$("#savingview").click(function(){
			var subDivF = $('#savingAccountView').children(':first');
			if($("#savingview").attr('label')=="closed"){
				$("#savingview").attr("label","actived");
				$("#savingview").prop("value","<spring:message code='lable.view.actived.loans'/>");
				subDivF.hide();
				subDivF.next().show();
			}else{
				$("#savingview").attr("label","closed");
				$("#savingview").prop("value","<spring:message code='lable.view.closed.loans'/>");
				subDivF.show();
				subDivF.next().hide();
			}
		});
		
		/*查看有效或无效的股金账户*/
		$("#shareview").click(function(){
			var subDivF = $('#shareAccountView').children(':first');
			if($("#shareview").attr('label')=="closed"){
				$("#shareview").attr("label","actived");
				$("#shareview").prop("value","<spring:message code='lable.view.actived.loans'/>");
				subDivF.hide();
				subDivF.next().show();
			}else{
				$("#shareview").attr("label","closed");
				$("#shareview").prop("value","<spring:message code='lable.view.closed.loans'/>");
				subDivF.show();
				subDivF.next().hide();
			}
		});
		
		function init(){
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.clients.'+clientId
				},
				callback : 'client'
			});
		}
		
		$(document).ready(function(){
			/*客户详情*/
			init();
			$('#myModal').on('hidden.bs.modal',
					function(event) {
						window.location.href="loadPage.do?nextPage=client..detail&clientId="+clientId+"&userId="+userId
					});
			
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.runreports.ClientSummary?R_clientId='+clientId+'&genericResultSet=false'
				},
				callback : 'generic'
			});
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.datatables?apptable=m_client"
				},
				callback : "dataTable"
			}); 
			
			grid1 = $('#loanList').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
			});
			grid11 = $('#loanClosed').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
				buttons : [{
					name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,
					bclass : 'detail',
					onpress : loanClosedDetail
				}]
			});
			grid2 = $('#savingList').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
			});
			grid22 = $('#savingclosed').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
				buttons : [
					{
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,
						bclass : 'detail',
						onpress : closedDetail
					}]
			});
			grid3 = $('#chargeList').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
				
			});
			grid4 = $('#shareList').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
			});
			grid44 = $('#shareClosed').flexigrid({
				height : 'auto',
				usepager: false,
				showToggleBtn: false,
				buttons : [{
					name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,
					bclass : 'detail',
					onpress : closedShareDetail
				}]
			});
			grid_note = $('#noteList').flexigrid({
				usepager: false,
				showToggleBtn: false,
				buttons : [{
								name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
								bclass : 'add',
								onpress : noteAdd
						}]
			});
			grid_document = $('#documentList').flexigrid({
				usepager: false,
				showToggleBtn: false,
				buttons : [{
								name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
								bclass : 'add',
								onpress : documentsUplaod
						}/* ,{
							name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDown,
							bclass : 'down',
							onpress : documentsDownlaod
						},
						{
							name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
							bclass : 'delete',
							onpress : deleteFile
					} */]
			});

			grid_identity = $('#identityList').flexigrid({
				usepager: false,
				showToggleBtn: false,
				buttons : [{
								name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
								bclass : 'add',
								onpress : identitiesAdd
						},
						{
							name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
							bclass : 'delete',
							onpress : deleteIdentity
					}]
			});
			
						
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.clients.'+clientId+'.accounts'
				},
				callback : 'accounts'
			});
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.clients.'+clientId+'.charges?pendingPayment=true'
				},
				callback : 'charges'
			});
			
			function init_note(){
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'GET',
						'mydata' : '',
						'url' : 'api.v1.clients.'+clientId+'.notes'
					},
					callback : function(param){
						if(param != null || param.length>0){
							grid_note.addRows(param);
						}
					}
				});			
			}
			
			function init_identity(){
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'GET',
						'mydata' : '',
						'url' : 'api.v1.clients.'+clientId+'.identifiers'
					},
					callback : function(param){
						var data = [];
						if(typeof param != 'undefined' && param != null){
							for(var i=0;i<param.length;i++){
								if(param[i].status == 'clientIdentifierStatusType.active'){
									param[i].status = 'Active';
									data.push(param[i]);
								}
								grid_identity.addRows(data);
							}
						}
					}
				});			
			}
			function init_document(){
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'GET',
						'mydata' : '',
						'url' : 'api.v1.clients.'+clientId+'.documents'
					},
					callback : function(param){
						var documents = [];
						if(param != null || param.length>0){
							for(var i=0;i<param.length;i++){
								if(typeof param[i].action == 'undefined')
								param[i].action = '<a href="javascript:void(0)" onclick="documentsDownlaod(this)" id="dd" style="margin-top: 3px" class="btn btn-primary btn-offset">'
									+'<i class="glyphicon glyphicon-save"></i>'
									+'</a>'
									+'<a href="javascript:void(0)" onclick="deleteFile(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
									+'<i class="glyphicon glyphicon-remove"></i>'
									+'</a>';
									documents.push(param[i]);
							}
							grid_document.addRows(documents);
						}
					}
				});
			}
			
			init_note();
			init_identity();
			init_document();
			$('#myModal').on('hidden.bs.modal',
			function(event) {
				if(isInit=="note"){
					init_note();
				}else if(isInit=="identity"){
					init_identity();
				}else if(isInit=="document"){
					init_document();
				}
				isInit="";
			});
		});
		
		function dataTable(param){
			if(param.length>0){
				for(var i=0;i<param.length;i++){
					var btnjson = param[i];
					var name = $.replaceTemplate(btnjson.registeredTableName," ","");
					var tableHeader = btnjson.columnHeaderData;
					var url = "loadPage.do?nextPage=system.datatable.app_datatable_add";
					if(tableHeader != undefined && tableHeader[0] != undefined && tableHeader[0].columnName=="id"){
						url = "loadPage.do?nextPage=system.datatable.app_datatable_list";
					}
					url += "&datatablename="+btnjson.registeredTableName+"&notesid="+clientId;
					$("#myTab").append("<li><a href='#"+name+"'>"+btnjson.registeredTableName+"</a></li> ");
					$("#myTabContent").append("<div class='tab-pane' id='"+name+"' action='"+url+"'><div class='iframe-div'><iframe id='"+name+"Frm' class='iframe-style' src='''></iframe></div></div> ");
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
		
		function img(param){
			if(param != '' || param != null){
				$("#articleImg").attr('src',param.result);
			}
		}
		
		
		$.getWidget("savingList").click(function(){
			
			if(!$.isEmpty(grid2.colVal('id')))	{
				accountId = grid2.colVal('id');
				var depositType = grid2.colVal('deposiType');
				if(depositType == 'Fixed Deposit'){
					window.location.href="loadPage.do?nextPage=client.fixedDeposit.fixedDepositDetail&fixedDepositId="+accountId;
				}else if(depositType == 'Recurring Deposit'){
					window.location.href="loadPage.do?nextPage=client.recurringDeposit.recurringDepositDetail&recurringDepositId="+accountId;
				}else{
					window.location.href="loadPage.do?nextPage=client.savingsaccounts&savingsId="+accountId+"&officeId="+fromOfficeId;
				}
			}			
		});
		function closedDetail(){
			var savingsId = grid22.colVal('id');
			window.location.href="loadPage.do?nextPage=client.savingsaccounts&savingsId="+savingsId;
		}
		$.getWidget("shareList").click(function(){
			
			if(!$.isEmpty(grid4.colVal('id')))	{
				shareId = grid4.colVal('id');
				window.location.href="loadPage.do?nextPage=client.shareAccount.shareAccount&shareAccountId="+shareId;
			}			
		});
		function closedShareDetail(){
			var shareId = grid44.colVal('id');
			window.location.href="loadPage.do?nextPage=client.shareAccount.shareAccount&shareAccountId="+shareId;
		}
		
		$.getWidget("loanList").click(function(){
			
			if(!$.isEmpty(grid1.colVal('id')))	{
				loanId = grid1.colVal('id');
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;

			}			
		});
		
		
		function loanClosedDetail(){
			var loanId = grid11.colVal('id');
			window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId;
		}
		
		function generic(param){
			for(var i=0;i<param.length;i++){
				$('#activeLoans').append(param[i].activeLoans);
				$('#activeSavings').append(param[i].activeSavings);
				$('#lastLoanAmount').append(param[i].lastLoanAmount);
				$('#loanCycle').append(param[i].loanCycle);
			}
		}
		
		function callbackImage(param) {
			$("#articleImg").attr('src',param.result);
		}
		
		/*组详情*/
		function groupDetail(obj){
			var groupId = $(obj).attr('code');
			window.location.href = "loadPage.do?nextPage=group.detail&groupId="+groupId+"&officeId="+fromOfficeId+"&userId="+userId+"&officeName="+officeName;
		}
		
		/*填充客户信息*/
		function client(param){
			imagePresent = param.imagePresent;
			status = param.status.value;
			fromOfficeId = param.officeId;
			var externalId = param.externalId;
			var staffName = param.staffName;
			var name;
			
			if(typeof imagePresent != 'undefined'){
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'GET',
						'mydata' : '',
						'url' : 'api.v1.clients.'+clientId+'.images?maxHeight=150'
					},
					callback : 'img'
				});
			}
			
			if(typeof param.fullname == 'undefined'){
				name = param.displayName;
			}else{
				name = param.fullname
			}
			
			if(typeof param.activationDate != 'undefined'){
				var activationDate = $.formatDate(param.activationDate);
				$('#activationDate').append(activationDate);
			}
			if(param.groups != '' && param.groups.length > 0){
				for(var i=0; i< param.groups.length;i++){
					if(i<param.groups.length-1){
						$('#memberOf').append('<a href="javascript:void(0)"  onclick="javascript:groupDetail(this)" code="'+param.groups[i].id+'">'+param.groups[i].name+'|'+'</a>');
					}else{
						$('#memberOf').append('<a href="javascript:void(0)"  onclick="javascript:groupDetail(this)" code="'+param.groups[i].id+'">'+param.groups[i].name+'</a>');
					}
				}
			}
			if(typeof param.mobileNo != 'undefined'){
				$('#mobileNo').append(param.mobileNo);
			}
			if(typeof param.gender != 'undefined'){
				$('#gender').append(param.gender.name);
			}
			if(typeof param.clientType != 'undefined'){
				$('#clientType').append(param.clientType.name);
			}
			if(typeof param.clientClassification != 'undefined'){
				$('#clientClassic').append(param.clientClassification.name);
			}
			if(typeof param.dateOfBirth != 'undefined'){
				var dateOfBirth = $.formatDate(param.dateOfBirth);
				$('#dateOfBirth').append(dateOfBirth);
			}
			
			if(typeof externalId == 'undefined'){
				externalId = '';
			}
			if(typeof staffName == 'undefined'){
				staffName = '';
				$.hide('unassi');
			}else{
				$.hide('assi');
			}
			
			$('#displayName').append(param.displayName);
			officeName = param.officeName;
			$('#fullName').append(name+'     ');
			$.assign({
				'office' : officeName+' /',
				'client' : 'Client#：'+param.accountNo+' | External id：'+externalId+' | Staff：'+staffName,
				'statusValue' : param.status.value
			});
			
			/*根据客户状态，显示操作按钮*/
			if(status == 'Pending'){
				x = document.getElementById("color")
				x.style.color = "rgb(255, 106, 64)";
				$.hide('loan');
				$.hide('saving');
				$.hide('share');
				$.hide('charge');
				$.hide('transfer');
				$.hide('relive');
				$.hide('rejectTrans');
				$.hide('acceptTrans');
				$.hide('undoTrans');
				$.hide('default');
				$.hide('nfd');
				$.hide('cov');
				$.hide('ad');
				$.hide('closeInfo');
				$.hide('undoRej'),
				$.hide('undoWit');
			}else if(status == 'Active'){
				x = document.getElementById("color")
				x.style.color = "rgb(64, 255, 106)";
				$.hide('alive');
				$.hide('rej');
				$.hide('wit');
				$.hide('del');
				$.hide('relive');
				$.hide('rejectTrans');
				$.hide('acceptTrans');
				$.hide('undoTrans');
				$.hide('ad');
				$.hide('closeInfo');
				$.hide('undoRej'),
				$.hide('undoWit');
			}else if(status == 'Transfer in progress'){
				x = document.getElementById("color")
				x.style.color = "rgb(255, 0, 0)";
				$.hide('edt');
				$.hide('loan');
				$.hide('saving');
				$.hide('share');
				$.hide('relive');
				$.hide('charge');
				$.hide('transfer');
				$.hide('clo');
				$.hide('default');
				$.hide('alive');
				$.hide('assi')
				$.hide('rej');
				$.hide('wit');
				$.hide('del');
				$.hide('nfd');
				$.hide('nrd');
				$.hide('ad');
				$.hide('closeInfo');
				$.hide('undoRej'),
				$.hide('undoWit');
			}else if(status == 'Transfer on hold'){
				x = document.getElementById("color")
				x.style.color = "rgb(255, 0, 0)";
				$.hide('edt');
				$.hide('loan');
				$.hide('saving');
				$.hide('share');
				$.hide('relive');
				$.hide('charge');
				$.hide('transfer');
				$.hide('clo');
				$.hide('default');
				$.hide('alive');
				$.hide('assi')
				$.hide('rej');
				$.hide('wit');
				$.hide('del');
				$.hide('nfd');
				$.hide('nrd');
				$.hide('rejectTrans');
				$.hide('acceptTrans');
				$.hide('nrd');
				$.hide('ad');
				$.hide('closeInfo');
				$.hide('undoRej'),
				$.hide('undoWit');
			}else if(status == 'Closed'){
				x = document.getElementById("color")
				x.style.color = "rgb(0, 0, 0)";
				$.hide('edt');
				$.hide('loan');
				$.hide('saving');
				$.hide('share');
				$.hide('charge');
				$.hide('transfer');
				$.hide('clo');
				$.hide('default');
				$.hide('alive');
				$.hide('assi')
				$.hide('rej');
				$.hide('wit');
				$.hide('del');
				$.hide('nfd');
				$.hide('nrd');
				$.hide('rejectTrans');
				$.hide('acceptTrans');
				$.hide('nrd');
				$.hide('ad');
				$.hide('undoTrans');
				$.hide('undoRej'),
				$.hide('undoWit');
			}else if(status == 'Rejected'){
				x = document.getElementById("color")
				x.style.color = "rgb(0, 0, 0)";
				$.hide('edt');
				$.hide('loan');
				$.hide('saving');
				$.hide('share');
				$.hide('charge');
				$.hide('transfer');
				$.hide('clo');
				$.hide('default');
				$.hide('alive');
				$.hide('relive');
				$.hide('assi')
				$.hide('rej');
				$.hide('wit');
				$.hide('del');
				$.hide('nfd');
				$.hide('nrd');
				$.hide('rejectTrans');
				$.hide('acceptTrans');
				$.hide('nrd');
				$.hide('ad');
				$.hide('undoTrans');
				$.hide('undoWit');
			}else if(status == 'Withdrawn'){
				x = document.getElementById("color")
				x.style.color = "rgb(0, 0, 0)";
				$.hide('edt');
				$.hide('loan');
				$.hide('saving');
				$.hide('share');
				$.hide('charge');
				$.hide('transfer');
				$.hide('clo');
				$.hide('default');
				$.hide('alive');
				$.hide('relive');
				$.hide('assi')
				$.hide('rej');
				$.hide('wit');
				$.hide('del');
				$.hide('nfd');
				$.hide('nrd');
				$.hide('rejectTrans');
				$.hide('acceptTrans');
				$.hide('nrd');
				$.hide('ad');
				$.hide('undoTrans');
				$.hide('undoRej');
			}
		} 
		
		/*贷款，存款，股金账户列表*/
		function accounts(param){
			if(typeof param != 'undefined'){
				if(typeof param.loanAccounts != 'undefined'){
					for(var i=0;i<param.loanAccounts.length;i++){
						if(param.loanAccounts[i].status.value == 'Submitted and pending approval' 
								|| param.loanAccounts[i].status.value == 'Approved' || 
								param.loanAccounts[i].status.value == 'Active'){
							if(param.loanAccounts[i].status.value == 'Submitted and pending approval'){
								param.loanAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(255, 106, 64);'></i>"+" "+param.loanAccounts[i].accountNo;
								if(typeof param.loanAccounts[i].action == 'undefined'){
									param.loanAccounts[i].action = '<a href="javascript:approve();" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-ok"></i>'
										+'<spring:message code="lable.approve"/></a>';
								}
							}else if(param.loanAccounts[i].status.value == 'Approved'){
								param.loanAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 255);'></i>"+" "+param.loanAccounts[i].accountNo;
								if(typeof param.loanAccounts[i].action == 'undefined'){
									param.loanAccounts[i].action = '<a href="javascript:disburse();" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-flag"></i>'
										+'<spring:message code="lable.disburse"/></a>';
								}
							}else if(param.loanAccounts[i].status.value == 'Active'){
								param.loanAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+' '+param.loanAccounts[i].accountNo;
								if(typeof param.loanAccounts[i].action == 'undefined'){
									param.loanAccounts[i].action = '<a href="javascript:void(0);" onclick="makeRepayment(this);" onclick="" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-usd"></i>'
										+'<spring:message code="lable.make.repayment"/></a>';
								}
							}else if(param.loanAccounts[i].status.value == 'Overpaid'){
								param.loanAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(128, 0, 128);'></i>"+' '+param.loanAccounts[i].accountNo;
								if(typeof param.loanAccounts[i].action == 'undefined'){
									param.loanAccounts[i].action = '<a href="javascript:disburse();" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-flag"></i>'
										+'<spring:message code="lable.disburse"/></a>';
								}
							}
							loanAccounts.push(param.loanAccounts[i]);
						}else{
							if(typeof param.loanAccounts[i].timeline.closedOnDate != 'undefined'){
								param.loanAccounts[i].timeline.closedOnDate = $.formatDate(param.loanAccounts[i].timeline.closedOnDate);
							}
							param.loanAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 0);'></i>"+" "+param.loanAccounts[i].accountNo;
							loanClosed.push(param.loanAccounts[i]);
						}
					}
					
					grid1.addRows(loanAccounts);
					grid11.addRows(loanClosed);
					$('#loanAccountView').children(':last').hide();
				}else{
					$.hide('loan-account');
				}
				if(typeof param.savingsAccounts != 'undefined'){
					var totalBSD = 0;
					var totalUSD = 0;
					$.show('USD');
					$.show('BSD');
					var savingsAccounts = [];
					var savingsclosed = [];
					for(var i=0;i<param.savingsAccounts.length;i++){
						if(typeof param.savingsAccounts[i].accountBalance == 'undefined'){
							param.savingsAccounts[i].accountBalance = '';
						}
						if(typeof param.savingsAccounts[i].lastActiveTransactionDate != 'undefined'){
							param.savingsAccounts[i].lastActiveTransactionDate = $.formatDate(param.savingsAccounts[i].lastActiveTransactionDate);
						}else{
							var json = {'lastActiveTransactionDate':''};
							var obj = $.extend(true,param.savingsAccounts[i],json);
						}
						if(typeof param.savingsAccounts[i].timeline.closedOnDate != 'undefined'){
							param.savingsAccounts[i].timeline.closedOnDate = $.formatDate(param.savingsAccounts[i].timeline.closedOnDate);
						}else{
							var json = {'timeline.closedOnDate':''};
							var obj = $.extend(true,param.savingsAccounts[i],json);
						}
						if(param.savingsAccounts[i].currency.code == 'BSD'){
							totalBSD += param.savingsAccounts[i].accountBalance;
						}
						if(param.savingsAccounts[i].currency.code == 'USD'){
							totalUSD += param.savingsAccounts[i].accountBalance;
						}
						if(param.savingsAccounts[i].status.value == 'Submitted and pending approval' 
								|| param.savingsAccounts[i].status.value == 'Approved' || 
								param.savingsAccounts[i].status.value == 'Active'){
							if(param.savingsAccounts[i].status.value == 'Submitted and pending approval'){
								param.savingsAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(255, 106, 64);'></i>"+" "+param.savingsAccounts[i].accountNo;
								if(typeof param.savingsAccounts[i].action == 'undefined'){
									param.savingsAccounts[i].action = '<a href="javascript:void(0)" onclick="javascript:approveSaving(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-ok"></i>'
										+'<spring:message code="client.savingaccount.approve"/></a>';
								}
							}else if(param.savingsAccounts[i].status.value == 'Approved'){
								param.savingsAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 255);'></i>"+" "+param.savingsAccounts[i].accountNo;
								if(typeof param.savingsAccounts[i].action == 'undefined'){
									param.savingsAccounts[i].action = '<a href="javascript:void(0)" onclick="unapproveSaving(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-repeat"></i>'
										+'<spring:message code="client.savingaccount.undoapproval"/></a>'
										+'<a href="javascript:void(0)" onclick="activeAccount(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-ok"></i>'
										+'<spring:message code="client.savingaccount.activeAccount"/></a>';
								}
							}else if(param.savingsAccounts[i].status.value == 'Active'){
								param.savingsAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+" "+param.savingsAccounts[i].accountNo;
								if(typeof param.savingsAccounts[i].action == 'undefined'){
									param.savingsAccounts[i].action = '<a href="javascript:void(0)" onclick="Deposit(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-arrow-right"></i>'
										+'<spring:message code="client.savingaccount.deposit"/></a>'
										+'<a href="javascript:void(0)" onclick="Withdrawal(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-arrow-left"></i>'
										+'<spring:message code="client.savingaccount.withdrawal"/></a>';
								}
							}
							savingsAccounts.push(param.savingsAccounts[i]);
						}else{
							param.savingsAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 0);'></i>"+" "+param.savingsAccounts[i].accountNo;
							savingsclosed.push(param.savingsAccounts[i]);
						}
					}
					grid2.addRows(savingsAccounts);
					grid22.addRows(savingsclosed);
					$('#savingAccountView').children(':last').hide();
					
					$('#savingBSD').append(totalBSD);
					$('#savingUSD').append(totalUSD);
				}else{
					$.hide('default');
					$.hide('vsi');
					$.hide('csi');
					$.hide('saving-account');
				}
				if(typeof param.shareAccounts != 'undefined'){
					var shareAccount = [];
					var shareClosed = [];
					for(var i=0;i<param.shareAccounts.length;i++){
						if(param.shareAccounts[i].status.value == 'Submitted and pending approval' || param.shareAccounts[i].status.value == 'Approved' || param.shareAccounts[i].status.value == 'Active'){
							if(param.shareAccounts[i].status.value == 'Submitted and pending approval'){
								param.shareAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(255, 106, 64);'></i>"+" "+param.shareAccounts[i].accountNo;
								if(typeof param.shareAccounts[i].action == 'undefined'){
									param.shareAccounts[i].action = '<a href="javascript:void(0)" onclick="javascript:approveShare(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-ok"></i>'
										+'<spring:message code="lable.approve"/></a>';
								}
							}else if(param.shareAccounts[i].status.value == 'Approved'){
								param.shareAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 255);'></i>"+" "+param.shareAccounts[i].accountNo;
								if(typeof param.shareAccounts[i].action == 'undefined'){
									param.shareAccounts[i].action = '<a href="javascript:void(0)" onclick="unapproveShare(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-repeat"></i>'
										+'<spring:message code="client.savingaccount.undoapproval"/></a>'
										+'<a href="javascript:void(0)" onclick="activeShare(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
										+'<i class="glyphicon glyphicon-ok"></i>'
										+'<spring:message code="client.savingaccount.activeAccount"/></a>';
									}
								}else if(param.shareAccounts[i].status.value == 'Active'){
									param.shareAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+" "+param.shareAccounts[i].accountNo;
									if(typeof param.shareAccounts[i].action == 'undefined'){
										param.shareAccounts[i].action = '';
									}
								}
							shareAccount.push(param.shareAccounts[i]);
						}else{
							param.shareAccounts[i].accountNo = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(0, 0, 0);'></i>"+" "+param.shareAccounts[i].accountNo;
							shareClosed.push(param.shareAccounts[i]);
						}
					}
					grid4.addRows(shareAccount);
					grid44.addRows(shareClosed);
					$('#shareAccountView').children(':last').hide();
				}else{
					$.hide('share-account');
				}
			}
		}
		/*费用列表*/
		function charges(param){
			if(param.pageItems.length > 0 ){
				var charges = [];
				for(var i=0;i<param.pageItems.length;i++){
					param.pageItems[i].name = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+' '+param.pageItems[i].name;
					param.pageItems[i].dueDate = $.formatDate(param.pageItems[i].dueDate);
					if(typeof param.pageItems[i].action == 'undefined'){
						param.pageItems[i].action = '<a href="javascript:void(0)" onclick="payCharge(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
							+'<i class="glyphicon glyphicon-usd"></i>'
							+'<spring:message code="pay.Charge"/></a>'
							+'<a href="javascript:void(0)" onclick="waiveCharge(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
							+'<i class="glyphicon glyphicon-flag"></i>'
							+'<spring:message code="lable.waive.charge"/></a>';
					}
					charges.push(param.pageItems[i]);
				}
				grid3.addRows(charges);
			}else{
				$.hide('charge-view');
			}
		}
		/*付费*/
		function payCharge(obj){
			//chargeId = grid2.colVal('id');
			var trNode = obj.closest('tr');
			chargeId = $(trNode).find('div:first').text();
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.payCharge"/>');
		}
		/*放弃费用*/
		function waiveCharge(obj){
			//chargeId = grid3.colVal('id');
			var trNode = obj.closest('tr');
			chargeId = $(trNode).find('div:first').text();
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : "",
					"url" : "api.v1.clients."+clientId+".charges."+chargeId+"?command=waive"
				},
				callback : "callback"
			});
		}
			
			$.getWidget("chargeList").click(function(){
				
				if(!$.isEmpty(grid3.colVal('id')))	{
					chargeId = grid3.colVal('id');
					window.location.href="loadPage.do?nextPage=client.chargeDetail&chargeId="+chargeId+"&clientId="+clientId;

				}	
		});
		
		
		
		/*放弃费用，回调函数*/
		function callback(param){
			if(param != null || param != ''){
				var clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
		
		$('#chargeviews').click(function(){
			window.location.href="loadPage.do?nextPage=client.chargesOverview&clientId="+clientId;
		});
		
		function chargesOverview(){
			window.location.href="loadPage.do?nextPage=client.chargesOverview&clientId="+clientId;
		}
		
		function survey(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.createSurvey"/>&clientId='+clientId);
		}
		
/*功能*/
	$('#edit').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.editClient"/>');
	});
	$('#delete').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.delete"/>');
	});
	
	$('#unAssignStaff').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.unAssign"/>');
	});

	$('#active').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.activeClient"/>');
	});
	
	$('#reactive').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.reactiveClient"/>');
	});
	
	/* $('#active').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.reactiveClient"/>');
	}); */

	$('#close').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.closureClient"/>');
	});

	$('#reject').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.rejectClient"/>');
	});
	
	$('#undoReject').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.undoReject"/>');
	});
	
	$('#withdraw').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.withdrawClient"/>');
	});
	
	$('#undoWithdrawal').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.undoWithdrawal"/>');
	});
	
	$('#newLoan').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanClient"/>');
	});
	
	$('#newSaving').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.savingClient"/>');
	});
	
	$('#newShare').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.shareAccount.new"/>');
	});
	
	$('#addCharge').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.chargeClient"/>');
	});
	
	$('#transferClient').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.transferClient"/>');
	});
	
	$('#rejectTransfer').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.rejectTransferClient"/>');;
	})
	
	$('#undoTransfer').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.undoTransferClient"/>');
	});
	
	$('#assignStaff').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.assignStaff"/>');
	});
	
	$('#acceptTransfer').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.acceptTransferClient"/>');
	});
	
	function documentsUplaod(){
		isInit = "document";
		documentId = grid_document.colVal('id');
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.documentClient"/>');
	}
	function documentsDownlaod(obj){
		var trNode = obj.closest('tr');
		documentId = $(trNode).find('div:first').text();
		fileName = $(trNode).find('div').eq(3).text();
		window.location.href="document.do?docPath=api.v1.clients."+clientId+".documents."+documentId+".attachment&fileName="+fileName;
	}
	function deleteFile(obj){
		var trNode = obj.closest('tr');
		documentId = $(trNode).find('div:first').text();
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.deleteDocument"/>');
	}
	
	function deleteIdentity(){
	    identityId = grid_identity.colVal('id');
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.deleteIdentity"/>');
	}
	
	function identitiesAdd(){
		isInit = "identity";
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.identityClient"/>');
	}
	
	$('#imageUpload').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.imageClient"/>');
	});
	
	function noteAdd(){
		isInit = "note";
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.noteClient"/>');
	}
	
	$('#updateDefaultSavings').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.updateDefaultSavingAccountClient"/>');
	});
	
	function newFixedDeposit(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.fixedDepositClient"/>');
	}
	
	function newRecurringDeposit(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.recurringDepositClient"/>');
	}
	
	function approve(){
	//	var trNode = obj.closest('tr');
	//	loanId = $(trNode).find('div:first').text();
	//	$.openWindow('<c:url value="/loadPage.do?nextPage=client.approve"/>');
		$("#loanList tr").each(function(){
		    loanId = $(this).find("td:first").text();
		    $.openWindow('<c:url value="/loadPage.do?nextPage=client.approve"/>');
		})
	}
	function disburse(){
	//	var trNode = obj.closest('tr');
	//	loanId = $(trNode).find('div:first').text();
	//	$.openWindow('<c:url value="/loadPage.do?nextPage=client.disburse"/>');
		$("#loanList tr").each(function(){
		    loanId = $(this).find("td:first").text();
		    $.openWindow('<c:url value="/loadPage.do?nextPage=client.disburse"/>');
		})
	}
	
	function makeRepayment(obj){
		var trNode = obj.closest('tr');
		loanId = $(trNode).find('div:first').text();
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.makeRepayment"/>');
	}
	
	function Deposit(obj){
		var trNode = obj.closest('tr');
		savingsId = $(trNode).find('div:first').text();
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountDeposit"/>');
	}
	
	function Withdrawal(obj){
		var trNode = obj.closest('tr');
		savingsId = $(trNode).find('div:first').text();
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountWithdrawal"/>');
	}
	
	function approveSaving(obj){
		var trNode = obj.closest('tr');
		savingsId = $(trNode).find('div:first').next;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.approveSaving"/>');
	}
	
	function unapproveSaving(obj){
		var trNode = obj.closest('tr');
		savingAccountId = $(trNode).find('div:first').next;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.unapproveSaving"/>');
	}
	
	function activeAccount(obj){
		var trNode = obj.closest('tr');
		savingAccountId = $(trNode).find('div:first').next;
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.activeAccount"/>');
	}
	
	function approveShare(obj){
		var trNode = obj.closest('tr');
		shareAccountId = $(trNode).find('div:first').next;
		$.openWindow("loadPage.do?nextPage=client.shareAccount.approve");
	}
	
	function unapproveShare(obj){
		var trNode = obj.closest('tr');
		shareAccountId = $(trNode).find('div:first').next;
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"contentType" : "application/json",
				"dataType" : "POST",
				"mydata" : {},
				"url" : "api.v1.accounts.share."+shareAccountId+"?command=undoapproval"
			},
			callback : "b_undoApproveShare"
		});
	}
	var shareAccountId;
	function b_undoApproveShare(){
		window.location.href="loadPage.do?nextPage=client.shareAccount.shareAccount&shareAccountId="+shareAccountId
	}
	
	function activeShare(obj){
		var trNode = obj.closest('tr');
		shareAccountId = $(trNode).find('div:first').next;
		$.openWindow("loadPage.do?nextPage=client.shareAccount.activate");
	}
	
	function clientScreenReport(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.clientScreenReports"/>');
	}
	
	function uploadClientSignature(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.uploadClientSignature"/>');
	}
	
	function viewStandingInstraction(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.viewStandingInstruction"/>');
	}
	
	function createStandingInstraction(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.standingInstruction"/>');
	}
	
	$(function () { 
        $('#myTab a:first').tab('show');//初始化显示哪个tab 
      
        $('#myTab a').click(function (e) { 
          e.preventDefault();//阻止a链接的跳转行为 
          $(this).tab('show');//显示当前选中的链接及关联的content 
        }) 
      }) 
	</script>
</html>

