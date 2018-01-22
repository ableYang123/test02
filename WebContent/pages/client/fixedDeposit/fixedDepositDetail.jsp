<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<body style="background: color:#fff">
	<div class="container">
		<ul class="breadcrum">
			<li><a href="javascript:clientDetail();"><span id="clientName"></span></a></li>
		</ul>
		<div class="card well">
			<div>
				<div class="span gray-head">
					<strong>
						<span class="glyphicon glyphicon-stop" id="changeColor" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
						<span id="fixedName"></span>
					</strong>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 column" id="buttonGroup">
						
					</div>
				</div>
			</div>
			<hr>
			<div id="balance" class="col-sm-12">
				<h3>
					<span id="currentBalance"></span>
					<span id="avilableBalance"></span>
				</h3>
			</div>
			<div id="tables" class="row">
				<div class="col-sm-6">
					<table id="savingsDetail" class="table table-bordered table-striped ng-hide">
						<tbody>
							<tr>
								<th colspan="2"><center>Savings Details</center></th>
							</tr>
							<tr>
								<th>Field Officer</th>
								<td><span id="fieldOfficer"></span></td>
							</tr>
							<tr>
								<th>Activation Date</th>
								<td><span id="activationDate"></span></td>
							</tr>
							<tr id="closeDate">
								<th>Closed On Date </th>
								<td><span id="closedOnDate "></span></td>
							</tr>
							<tr>
								<th>Maturity Date</th>
								<td><span id="maturityDate"></span></td>
							</tr>
							<tr>
								<th>Period</th>
								<td><span id="period"></span></td>
							</tr>
							<tr>
								<th> Withhold Tax group</th>
								<td><span id=" withholdTaxGroup"></span></td>
							</tr>
						</tbody>
					</table>
					<table id="interestDetail" class="table table-bordered table-striped ng-hide">
						<tbody>
							<tr>
								<th colspan="2"><center>Interest Details</center></th>
							</tr>
							<tr>
								<th>Nominal interest rate</th>
								<td><span id="normalInterestRate"></span></td>
							</tr>
							<tr>
								<th>Interest compounding period</th>
								<td><span id="interestCompoundingPeriod"></span></td>
							</tr>
							<tr>
								<th>Interest posting period</th>
								<td><span id="interestPostingPeriod"></span></td>
							</tr>
							<tr>
								<th>Interest calculated using</th>
								<td><span id="interestCalculatedUsing"></span></td>
							</tr>
							<tr>
								<th># Days in Year</th>
								<td><span id="daysInYear"></span></td>
							</tr>
							<tr>
								<th>Pre-closure penal Interest (less)</th>
								<td><span id="preClosure"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-sm-6">
					<table id="performanceHistory" class="table table-bordered table-striped ng-hide">
						<tbody>
							<tr>
								<th colspan="2"><center>Performance History</center></th>
							</tr>
							<tr>
								<th>Principal Amount</th>
								<td><span id="principalAmount"></span></td>
							</tr>
							<tr>
								<th>Maturity Amount</th>
								<td><span id="maturityAmount"></span></td>
							</tr>
							<tr id="totalDepos">
								<th>Total Deposits</th>
								<td><span id="totalDeposit"></span></td>
							</tr>
							<tr id="totalWith">
								<th>Total withdrawals</th>
								<td><span id="totalWithdrawals"></span></td>
							</tr>
							<tr id="interestEarn">
								<th>Interest earned</th>
								<td><span id="interestEarned"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#accountDetail"><spring:message code="lable.account.detail"/></a></li>
			</ul>
			<div class="tab-content">
				<div id="accountDetail" class="tab-pane active" style="margin-left:-1px;margin-top: -40px;margin-right: 1px;">
					<label>Interest Rate Chart</label>
					<table id="interestRateChart">
						<tbody>
							<tr>
								<td>Period Type</td>
								<td>Period From / To</td>
								<td>Amount Range</td>
								<td>Interest</td>
								<td>Description</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var fixedDepositId = ${pd.fixedDepositId};
		var clientId;
		function clientDetail(){
			window.location.href="loadPage.do?nextPage=client.detaild&clientId="+clientId
		}
		$(document).ready(
						function() {
							init();
							$('#myModal').on('hidden.bs.modal',
									function(event) {
										window.location.href="loadPage.do?nextPage=client.fixedDeposit.fixedDepositDetail&fixedDepositDetail="+fixedDepositId
									});
						});
		function init(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.fixeddepositaccounts."+fixedDepositId+"?associations=all"
				},
				callback : "b_getFixed"

			});
		}
		function b_getFixed(param) {
			clientId = param.clientId;
			$('#clientName').append(param.clientName);
			$('#fixedName').append(param.depositProductName+'(#'+param.accountNo+')'); 
			if (param.status.submittedAndPendingApproval) {// 提交未审批状态
				x = document.getElementById("changeColor");
				x.style.color = "rgb(255, 106, 64)";
				var arr = [];
				arr.push('<div class="btn-group" style="float: right;">');
				arr.push('<button type="button" class="btn btn-primary" id="modifyFixed">');
				arr.push('<span class="glyphicon glyphicon-pencil"></span>');
				arr.push('<spring:message code="label.shareAccount.modifyShare"/></button>');
				arr.push('<button type="button" class="btn btn-primary" id="approveFixed">');
				arr.push('<span class="glyphicon glyphicon-ok"></span>');
				arr.push('<spring:message code="label.shareAccount.approve"/></button>');
				arr.push('<div class="btn-group">');
				arr.push('<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">');
				arr.push('<spring:message code="label.shareAccount.more"/><span class="caret"></span></button>');
				arr.push('<ul class="dropdown-menu">');
				arr.push('<li><a href="javaScript:rejectFixed();"><spring:message code="label.shareAccount.reject"/></a></li>');
				arr.push('<li><a href="javaScript:deleteFixed();"><spring:message code="label.shareAccount.delete"/></a></li>');
				arr.push('<li><a href="javaScript:addCharge();"><spring:message code="label.add.charge"/></a></li>');
				arr.push('<li><a href="javaScript:withdrawnByClient();"><spring:message code="label.shareAccount.delete"/></a></li>');
				arr.push('</ul>');
				arr.push('</div>');
				arr.push('</div>');
				$('#balance').hide();
				$('#tables').hide();
				$('#buttonGroup').html(arr.join(''));
				$('#modifyFixed').click(
								function() {
									$.openWindow("loadPage.do?nextPage=client.fixedDeposit.edit");
								});
				$('#approveFixed').click(
								function() {
									$.openWindow("loadPage.do?nextPage=client.fixedDeposit.approve");
								});
				function rejectFixed() {
					$.openWindow("loadPage.do?nextPage=client.fixedDeposit.reject");
				}
				function addCharge(){
					$.openWindow("loadPage.do?nextPage=client.shareAccount.approve_additional");
				}
				function withdrawnByClient(){
					
				}
				function deleteFixed() {
					deleteFixed();
				}
			}

			if (param.status.approved) {// 审批成功
				x = document.getElementById("changeColor")
				x.style.color = "rgb(64, 106, 255)";
				var arr = [];
				arr.push('<div class="btn-group" style="float: right;">');
				arr.push('<button type="button" class="btn btn-primary" id="undoApproveFixed">');
				arr.push('<span class="glyphicon glyphicon-repeat"></span>');
				arr.push('<spring:message code="label.shareAccount.undo"/></button>');
				arr.push('<button type="button" class="btn btn-primary" id="activateFixed">');
				arr.push('<span class="glyphicon glyphicon-ok"></span>');
				arr.push('<spring:message code="label.shareAccount.act"/></button>');
				arr.push('</div>');
				$.hide('closeDate');
				$.hide('totalDepos');
				$.hide('totalWith');
				$.hide('interestEarn');
				$('#buttonGroup').html(arr.join(''));
				$('#activateFixed').click(
								function() {
									$.openWindow("loadPage.do?nextPage=client.shareAccount.activate");
								});
				$('#undoApproveFixed').click(
						function() {
							undoApproveShare();
						});
			}
			if (param.status.active) {// 激活成功
				x = document.getElementById("changeColor")
				x.style.color = "rgb(64, 255, 106)";
				var arr = [];
				arr.push('<div class="btn-group" style="float: right;">');
				arr.push('<button type="button" class="btn btn-primary" id="permatureClose">');
				arr.push('<span class="glyphicon glyphicon-arrow-left"></span>');
				arr.push('<spring:message code="lable.permatureClose"/></button>');
				arr.push('<button type="button" class="btn btn-primary" id="calculateInterest">');
				arr.push('<span class="glyphicon glyphicon-th"></span>');
				arr.push('<spring:message code="label.calculateInterest"/></button>');
				arr.push('<div class="btn-group">');
				arr.push('<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">');
				arr.push('<spring:message code="label.shareAccount.more"/><span class="caret"></span></button>');
				arr.push('<ul class="dropdown-menu"><li><a href="javaScript:postInterest();"><spring:message code="lable.post.interest"/></a></li></ul>');
				arr.push('<ul class="dropdown-menu"><li><a href="javaScript:addCharge();><spring:message code="lable.addCharge"/></a></li></ul>');
				arr.push('</div>');
				arr.push('</div>');
				$.show('balance');
				$.hide('closeDate');
				$('#currentBalance').append(param.summary.currency.displaySymbol+' '+param.summary.accountBalance);
				$('#avilableBalance').append(param.summary.currency.displaySymbol+' '+param.summary.totalDeposits);
				if(typeof param.fieldOfficerName != 'undefined'){
					$('#fieldOfficer').append(param.fieldOfficerName);
				}else{
					$('#fieldOfficer').append('unsupport');
				}
				if(typeof param.timeline.activatedOnDate != 'undefined'){
					$('#activationDate').append($.formatDate(param.timeline.activatedOnDate));
				}
				if(typeof param.depositPeriod != 'undefined'){
					$('#period').append($.formatDate(param.depositPeriod+' '+param.depositPeriodFrequency.value));
				}
				if(typeof param.maturityDate != 'undefined'){
					$('#maturityDate').append($.formatDate(param.maturityDate));
				}
				if(typeof param.depositAmount != 'undefined'){
					$('#principalAmount').append(param.depositAmount);
				}
				if(typeof param.maturityAmount != 'undefined'){
					$('#maturityAmount').append(param.maturityAmount);
				}
				if(typeof param.summary.totalDeposits != 'undefined'){
					$('#totalDeposit').append(param.summary.totalDeposits);
				}
				if(typeof param.summary.totalInterestEarned != 'undefined'){
					$('#interestEarned').append(param.summary.totalInterestEarned);
				}
				if(typeof param.nominalAnnualInterestRate != 'undefined'){
					$('#normalInterestRate').append(param.nominalAnnualInterestRate+'%');
				}
				if(typeof param.interestCompoundingPeriodType != 'undefined'){
					$('#interestCompoundingPeriod').append(param.interestCompoundingPeriodType.value);
				}
				if(typeof param.interestPostingPeriodType != 'undefined'){
					$('#interestPostingPeriod').append(param.interestPostingPeriodType.value);
				}
				if(typeof param.interestCalculationType != 'undefined'){
					$('#interestCalculatedUsing').append(param.interestCalculationType.value);
				}
				if(typeof param.interestCalculationDaysInYearType != 'undefined'){
					$('#daysInYear').append(param.interestCalculationDaysInYearType.value);
				}
				if(typeof param.preClosurePenalInterest != 'undefined'){
					$('#preClosure').append(param.preClosurePenalInterest+'%'+ ' on ' +param.preClosurePenalInterestOnType.value);
				}
				$('#buttonGroup').html(arr.join(''));
				var activatedDate = $.formatDate(param.timeline.activatedDate,'yyyy-MM-dd');
				$('#activatedDate').text(activatedDate);
				$('#permatureClose').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.close");
						});
				$('#calculateInterest').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.apply_additional");
						});
				function postInterest(){
					$.openWindow("loadPage.do?nextPage=client.shareAccount.redeem");
				}
				function addCharge(){
					$.openWindow("loadPage.do?nextPage=client.shareAccount.approve_additional");
				}
			}
			if (param.status.closed) {// 关闭状态
				x = document.getElementById("changeColor")
				x.style.color = "rgb(0, 0, 0)";
				if(!param.status.rejected){// 拒绝审批  not activateDate
					var activatedDate = $.formatDate(param.timeline.activatedDate,'yyyy-MM-dd');
					$('#activatedDate').text(activatedDate);
				}
			}

			$('#productName').text(param.productName + '(#' + param.accountNo + ')');
			$('#currency').text(param.currency.displayLabel);
			$('#savingsAccountNumber').text(param.savingsAccountNumber);
			$('#totalApprovedShares').text(param.summary.totalApprovedShares);
			$('#totalPendingForApprovalShares').text(param.summary.totalPendingForApprovalShares);

			var currencySymbol='';
			if($.type(param.currency.displaySymbol)!=='undefined'){
				currencySymbol=param.currency.displaySymbol;
			}
			drawTransactionsTable(param.purchasedShares,currencySymbol);//画表

			if (param.charges.length > 0) {
				drawChargesTable(param.charges, currencySymbol);//画表
			}
			if (param.dividends.length > 0) {
				drawDividendsTable(param.dividends,currencySymbol);//画表
			}
			
			if(param.accountChart.chartSlabs != ''){
				var json = param.accountChart.chartSlabs;
				for(var i=0;i<json.length;i++){
					if(typeof chartSlabs[i].description == 'undefined'){
						chartSlabs[i].description = '';
					}
					var str = '<tr><td>'+chartSlabs[i].periodType.value+'</td>'
					+'<td>'+chartSlabs[i].fromPeriod+'-'+chartSlabs[i].toPeriod+'</td>'
					+'<td>-</td>'
					+'<td>'+chartSlabs[i].annualInterestRate+'</td>'
					+'<td>'+chartSlabs[i].description+'</td>'
					+'<td><a href="">Incentives</a></td>'
					+'</tr>';
					$('#interestRateChart').append(str);
				}
			}
			

		}

		function deleteFixed(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.fixeddepositaccounts."+fixedDepositId
				},
				callback : "b_deleteShare"
			});
		}
		function b_deleteShare(param){
			
			var groupId =param.groupId;
			var statusValue = "active";
			window.parent.location.href="loadPage.do?nextPage=group.detail&groupId="+groupId+"&statusValue="+statusValue;
		}
		function undoApproveShare(){
			
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
		function b_undoApproveShare(){
			window.location.href="loadPage.do?nextPage=client.shareAccount.shareAccount&shareAccountId="+shareAccountId
		}
		
		$(function () { 
	        $('#myTab a:first').tab('show');//初始化显示哪个tab 
	      
	        $('#myTab a').click(function (e) { 
	          e.preventDefault();//阻止a链接的跳转行为 
	          $(this).tab('show');//显示当前选中的链接及关联的content 
	        }) 
	      }) 
	</script>
</body>
</html>