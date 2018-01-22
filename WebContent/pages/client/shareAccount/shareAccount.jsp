<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<body style="background: color:#fff">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<span class="glyphicon glyphicon-stop" id="changeColor" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
						<span style="font-size: 24px" id="productName"></span>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 column" id="buttonGroup">
						
					</div>
				</div>

			</div>
		</div>
		<br>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-6 column">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td><spring:message code="label.shareAccount.activatedOn"/> </td>
									<td id="activatedDate"><spring:message code="label.shareAccount.notActivated" /></td>
								</tr>
								<tr>
									<td><spring:message
									code="label.shareAccount.currency"/></td>
									<td id="currency"></td>
								</tr>
								<tr>
									<td><spring:message code="label.shareAccount.externalId" /></td>
									<td id="externalId"></td>
								</tr>
								<tr>
									<td><spring:message code="label.shareAccount.linkedSavingsAccount"/></td>
									<td id="savingsAccountNumber"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-6 column">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td><spring:message code="label.shareAccount.approvedShares"/></td>
									<td id="totalApprovedShares"></td>
								</tr>
								<tr>
									<td><spring:message code="label.shareAccount.pendingShares"/></td>
									<td id="totalPendingForApprovalShares"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="tabbable" id="tabs-615144">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#transactions_tab" data-toggle="tab">
								<spring:message code="label.shareAccount.tranView" />
							</a>
						</li>
						<li>
							<a href="#charges_tab" data-toggle="tab">
								<spring:message code="label.shareAccount.charges" />
							</a>
						</li>
						<li>
							<a href="#dividends_tab" data-toggle="tab">
								<spring:message code="label.shareAccount.dividends" />
							</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="transactions_tab">
							<table class="table table-hover" id="tranTable">
								<thead>
									<tr>
										<th><spring:message code="label.shareAccount.tranDate" /></th>
										<th><spring:message code="label.shareAccount.tranType" /></th>
										<th><spring:message code="label.shareAccount.totalShares" /></th>
										<th><spring:message code="label.shareAccount.price" /></th>
										<th><spring:message code="label.shareAccount.chargeAmount" /></th>
										<th><spring:message code="label.shareAccount.amountR" /></th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tab-pane" id="charges_tab">
							<table class="table table-hover" id="chargesTable">
								<thead>
									<tr>
										<th><spring:message code="label.shareAccount.name"/></th>
										<th><spring:message code="label.shareAccount.feePenalty"/></th>
										<th><spring:message code="label.shareAccount.payDueAt"/></th>
										<th><spring:message code="label.shareAccount.calcuType"/></th>
										<th><spring:message code="label.shareAccount.due"/></th>
										<th><spring:message code="label.shareAccount.paid"/></th>
										<th><spring:message code="label.shareAccount.waived"/></th>
										<th><spring:message code="label.shareAccount.outstanding"/></th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tab-pane" id="dividends_tab">
							<table class="table table-hover" id="dividendsTable">
								<thead>
									<tr>
										<th><spring:message code="label.shareAccount.tranDate" /></th>
										<th><spring:message code="label.shareAccount.amount" /></th>
										<th><spring:message code="label.shareAccount.tranRef" /></th>
										<th><spring:message code="label.shareAccount.status" /></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var shareAccountId = ${pd.shareAccountId};
		
		$(document).ready(
						function() {
							init();
							$('#myModal').on('hidden.bs.modal',
									function(event) {
										window.location.href="loadPage.do?nextPage=client.shareAccount.shareAccount&shareAccountId="+shareAccountId
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
					"url" : "api.v1.accounts.share." + shareAccountId
				},
				callback : "b_getShare"

			});
		}
		function b_getShare(param) {
			
		if (param.status.submittedAndPendingApproval) {// 提交未审批状态
				x = document.getElementById("changeColor")
				x.style.color = "rgb(255, 106, 64)";
				var arr = [];
				arr.push('<div class="btn-group" style="float: right;">');
				arr.push('<button type="button" class="btn btn-primary" id="modifyShare">');
				arr.push('<span class="glyphicon glyphicon-pencil"></span>');
				arr.push('<spring:message code="label.shareAccount.modifyShare"/></button>');
				arr.push('<button type="button" class="btn btn-primary" id="approveShare">');
				arr.push('<span class="glyphicon glyphicon-ok"></span>');
				arr.push('<spring:message code="label.shareAccount.approve"/></button>');
				arr.push('<div class="btn-group">');
				arr.push('<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">');
				arr.push('<spring:message code="label.shareAccount.more"/><span class="caret"></span></button>');
				arr.push('<ul class="dropdown-menu">');
				arr.push('<li><a href="javaScript:void(0)" id="rejectShare"><spring:message code="label.shareAccount.reject"/></a></li>');
				arr.push('<li><a href="javaScript:void(0)" id="deleteShare"><spring:message code="label.shareAccount.delete"/></a></li>');
				arr.push('</ul>');
				arr.push('</div>');
				arr.push('</div>');
				$('#buttonGroup').html(arr.join(''));
				$('#modifyShare').click(
								function() {
									$.openWindow("loadPage.do?nextPage=client.shareAccount.edit");
								});
				$('#approveShare').click(
								function() {
									$.openWindow("loadPage.do?nextPage=client.shareAccount.approve");
								});
				$('#rejectShare').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.reject");
						});
				$('#deleteShare').click(
						function() {
							deleteShare();
						});
			}

			if (param.status.approved) {// 审批成功
				x = document.getElementById("changeColor")
				x.style.color = "rgb(64, 106, 255)";
				var arr = [];
				arr.push('<div class="btn-group" style="float: right;">');
				arr.push('<button type="button" class="btn btn-primary" id="undoApproveShare">');
				arr.push('<span class="glyphicon glyphicon-repeat"></span>');
				arr.push('<spring:message code="label.shareAccount.undo"/></button>');
				arr.push('<button type="button" class="btn btn-primary" id="activateShare">');
				arr.push('<span class="glyphicon glyphicon-ok"></span>');
				arr.push('<spring:message code="label.shareAccount.act"/></button>');
				arr.push('</div>');
				$('#buttonGroup').html(arr.join(''));
				$('#activateShare').click(
								function() {
									$.openWindow("loadPage.do?nextPage=client.shareAccount.activate");
								});
				$('#undoApproveShare').click(
						function() {
							undoApproveShare();
						});
			}
			if (param.status.active) {// 激活成功
				x = document.getElementById("changeColor")
				x.style.color = "rgb(64, 255, 106)";
				var arr = [];
				arr.push('<div class="btn-group" style="float: right;">');
				arr.push('<button type="button" class="btn btn-primary" id="applyShare">');
				arr.push('<span class="glyphicon glyphicon-arrow-right"></span>');
				arr.push('<spring:message code="title.shareAccount.applyAddShares"/></button>');
				if(param.summary.totalPendingForApprovalShares>0){
					arr.push('<button type="button" class="btn btn-primary" id="approveAddShare">');
					arr.push('<span class="glyphicon glyphicon-arrow-right"></span>');
					arr.push('<spring:message code="label.shareAccount.approveAdd"/></button>');
					arr.push('<button type="button" class="btn btn-primary" id="rejectAddShare">');
					arr.push('<span class="glyphicon glyphicon-arrow-right"></span>');
					arr.push('<spring:message code="label.shareAccount.rejectAdd"/></button>');
				}
				arr.push('<button type="button" class="btn btn-primary" id="redeemShare">');
				arr.push('<span class="glyphicon glyphicon-arrow-left"></span>');
				arr.push('<spring:message code="label.shareAccount.redeemShares"/></button>');
				arr.push('<div class="btn-group">');
				arr.push('<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">');
				arr.push('<spring:message code="label.shareAccount.more"/><span class="caret"></span></button>');
				arr.push('<ul class="dropdown-menu"><li><a href="javaScript:void(0)"id="closeShare"><spring:message code="lable.close"/></a></li></ul>');
				arr.push('</div>');
				arr.push('</div>');
				$('#buttonGroup').html(arr.join(''));
				var activatedDate = $.formatDate(param.timeline.activatedDate,'yyyy-MM-dd');
				$('#activatedDate').text(activatedDate);
				$('#closeShare').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.close");
						});
				$('#applyShare').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.apply_additional");
						});
				$('#redeemShare').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.redeem");
						});
				$('#approveAddShare').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.approve_additional");
						});
				$('#rejectAddShare').click(
						function() {
							$.openWindow("loadPage.do?nextPage=client.shareAccount.reject_additional");
						});
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

			if (typeof (param.externalId) !== 'undefined') {
				$('#externalId').text(param.externalId);
			}
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

		}

		function drawTransactionsTable(purchasedShares, currencySymbol) {
			var arr = [];
			arr.push('<tbody>');
			$.each(purchasedShares, function(n, obj) {
				arr.push('<tr>');
				arr.push('<td>');
				var purchasedDate = $.formatDate(obj.purchasedDate,'yyyy-MM-dd');
				arr.push(purchasedDate);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.type.value + '(' + obj.status.value + ')');
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.numberOfShares);
				arr.push('</td>');
				arr.push('<td>');
				if($.type(obj.purchasedPrice)==='undefined'){
					obj.purchasedPrice='';
				}
				arr.push(currencySymbol + obj.purchasedPrice);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.chargeAmount);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.amount);
				arr.push('</td>');
				arr.push('</tr>');
			});

			arr.push('</tbody>');
			$("#tranTable").append(arr.join(''));
		}

		function drawChargesTable(charges, currencySymbol) {
			var arr = [];
			arr.push('<tbody>');
			$.each(charges, function(n, obj) {
				arr.push('<tr>');
				arr.push('<td>');
				arr.push(obj.name);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.chargeTimeType.value);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.chargeTimeType.value);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.chargeCalculationType.value);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.amount);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.amountPaid);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.amountWaived);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.amountOutstanding);
				arr.push('</td>');
				arr.push('</tr>');
			});

			arr.push('</tbody>');
			$("#chargesTable").append(arr.join(''));
		}

		function drawDividendsTable(dividends, currencySymbol) {
			var arr = [];
			arr.push('<tbody>');
			$.each(dividends, function(n, obj) {
				arr.push('<tr>');
				arr.push('<td>');
				var postedDate = $.formatDate(obj.postedDate, 'yyyy-MM-dd');
				arr.push(postedDate);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol + obj.amount);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.savingsTransactionId);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.status.value);
				arr.push('</td>');
				arr.push('</tr>');
			});

			arr.push('</tbody>');
			$("#dividendsTable").append(arr.join(''));
		}
		function deleteShare(){
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+shareAccountId
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
	</script>
</body>
</html>