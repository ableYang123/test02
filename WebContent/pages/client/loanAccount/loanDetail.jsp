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
		<div style="margin-top: 20px" class="row col-md-12 col-sm-12"">
			<span id="clientA" style="font-size: small;">
				<small><a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><span id="clientNa"></span></a></small>
			</span>
			<span id="groupA" style="font-size: small;display: none;">
				<small><a id="a" href="javascript:void(0)" onclick="group(this)" code="" style="text-decoration: none;"><span id="group"></span></a></small>
			</span>
			<span style="font-size: small;">
				<small><span id="clients"></span></small>
			</span>
		</div>
		<div class="row col-md-12 col-sm-12" style="margin-left: 0%">
			<span style="margin-left: 10px;font-size: 24px">
				<h3 style="font-size: x-large;">
					<span class="glyphicon glyphicon-stop" id="changeColor" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
					<span id="productName"></span>
				</h3>
			</span>
		</div><br>
		<div id="operate" style="position: relative;min-height: 1px;padding-left: 15px;padding-right: 15px;">
			<div style="float: right !important;position: relative;display: inline-block;vertical-align: middle;">
				<span id="addLC" style="display: none;">
					<button id="addLoanCharge" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-plus"></i>
						<spring:message code="lable.add.loan.charge"/>
					</button>
				</span>
				<span id="prepayLoan" style="display: none;">
					<button id="prepayLoans" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-minus"></i>
						<spring:message code="lable.prepay.loan"/>
					</button>
				</span>
				<span id="forecloure" style="display: none;">
					<button id="forecloures" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-usd"></i>
						<spring:message code="lable.forecloure"/>
					</button>
				</span>
				<span id="makerepayment" style="display: none;">
					<button id="makerepayments" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-usd"></i>
						<spring:message code="lable.make.repayment"/>
					</button>
				</span>
				<span id="disburse" style="display: none;">
					<button id="disburses" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-flag"></i>
						<spring:message code="lable.disburse"/>
					</button>
				</span>
				<span id="undodisburse" style="display: none;">
					<button id="undodisbursal" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-flag"></i>
						<spring:message code="lable.undoDisburse"/>
					</button>
				</span>
				<span id="disburseTo" style="display: none;">
					<button id="disburseToSaving" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-flag"></i>
						<spring:message code="lable.disburse.to.saving"/>
					</button>
				</span>
				<span id="approve" style="display: none;">
					<button id="approves" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-ok"></i>
						<spring:message code="lable.approve"/>
					</button>
				</span>
				<span id="modify" style="display: none;">
					<button id="modifyApp" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-plus"></i>
						<spring:message code="lable.modify.application"/>
					</button>
				</span>
				<span id="rej" style="display: none;">
					<button id="reject" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-remove"></i>
						<spring:message code="lable.reject"/>
					</button>
				</span>
				<span id="undoApp" style="display: none;">
					<button id="undoApprove" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-repeat"></i>
						<spring:message code="lable.undoApprove"/>
					</button>
				</span>
				<span id="assignloff" style="display: none;">
					<button id="assignLoanOfficer" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-plus"></i>
						<spring:message code="lable.assign.loan.officer"/>
					</button>
				</span>
				<span id="recoveryRe" style="display: none;">
					<button id="recoveryRepayment" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-card"></i>
						<spring:message code="lable.recovery.repayment"/>
					</button>
				</span>
				<span id="fund" style="display: none;">
					<button id="transferFund" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-resize-horizontal"></i>
						<spring:message code="lable.transfer.fund"/>
					</button>
				</span>
				<span id="more" class="dropdown">
					<button style="margin-top: 3px;margin-right:85px" class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					  <spring:message code="lable.more"/>
					  <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					  <li id="cha" style="display: none;"><a href="javascript:changeLoanOfficer();"><spring:message code="lable.change.loan.officer"/></a></li>
					  <li id="waivt" style="display: none;"><a href="javascript:waiveInterest();"><spring:message code="lable.waive.interest"/></a></li>
					  <li id="resc" style="display: none;"><a href="javascript:reschedule();" ><spring:message code="lable.reschedule"/></a></li>
					  <li id="wof" style="display: none;"><a href="javascript:writeOff();"><spring:message code="lable.write.off"/></a></li>
					  <li id="closeAs" style="display: none;"><a href="javascript:closeAsRescheduled();"><spring:message code="lable.close.as.reschedule"/></a></li>
					  <li id="close" style="display: none;"><a href="javascript:closeLoan();"><spring:message code="lable.close"/></a></li>
					  <li id="wbc" style="display: none;"><a href="javascript:void(0);" onclick="withdrawByClient()"><spring:message code="lable.withdraw.by.client"/></a></li>
					  <li id="delete" style="display: none;"><a href="javascript:withdrawByClient();"><spring:message code="lable.delete"/></a></li>
					  <li id="adc" style="display: none;"><a href="javascript:addCollateral();"><spring:message code="lable.add.collateral"/></a></li>
					  <li id="vig" style="display: none;"><a href="javascript:viewGuarantors();"><spring:message code="lable.view.guarantors"/></a></li>
					  <li id="crg" style="display: none;"><a href="javascript:createGuarantos();"><spring:message code="lable.create.guarantors"/></a></li>
					  <li id="lsr" style="display: none;"><a href="javascript:loanScreenReport()"><spring:message code="lable.loan.screen.report"/></a></li>
					  <li id="recover" style="display: none;"><a href="javascript:recoverGuarantor();"><spring:message code="lable.recover.from.guarantor"/></a></li>
					</ul>
				</span>
			</div>
		</div>
		<br><br>
		<div id="loanTable" style="margin-left: -1px;margin-right: 1px;position: relative ;">
			<div class="col-sm-7 col-md-7 ng-bliding">
				<div style="display: none;" id="balanceCurrency">
					<h3>
						<strong>
							<spring:message code="lable.current.balance"/>：<span id="currentBalance"></span>
						</strong>
					</h3>
					<h3>
						<small>
							<spring:message code="lable.arrears.by"/>：<span id="arrearsby"></span>
						</small>
					</h3>
				</div>
				<div id="officeTable" style="display: none;">
					<table class="table table-striped table-bordered" >
						<tr>
							<th style="width: 30%"><spring:message code="lable.disbursement.date"/></th>
							<td><span id="activatedIn"></span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.currency"/></th>
							<td><span id="currency"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.loan.officer"/></th>
							<td><span id="officer"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.external"/>ID</th>
							<td><span id="externalId"> </span></td>
						</tr>
					</table>
				</div>
				<div id="totalTable" style="display: none;">
					<table class="table table-striped table-bordered" >
						<thead>
							<tr>
								<th></th>
								<th><spring:message code="lable.original"/></th>
								<th><spring:message code="lable.paid"/></th>
								<th><spring:message code="lable.waived"/></th>
								<th><spring:message code="lable.written.off"/></th>
								<th><spring:message code="lable.out.standing"/></th>
								<th><spring:message code="lable.over.due"/></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><spring:message code="lable.principal"/></th>
								<th><span id="principalDisbursed"></span></th>
								<th><span id=principalPaid></span></th>
								<th><span id="principalWaived"></span></th>
								<th><span id="principalWrittenOff"></span></th>
								<th><span id="principalOutstanding"></span></th>
								<th><span id="principalOverdue" ></span></th>
							</tr>
							<tr>
								<th><spring:message code="lable.interest"/></th>	
								<th><span id="interestCharged"></span></th>
								<th><span id="interestPaid"></span></th>
								<th><span id="interestWaived"></span></th>
								<th><span id="interestWrittenOff"></span></th>
								<th><span id="interestOutstanding"></span></th>
								<th><span id="interestOverdue"></span></th>
							</tr>
							<tr>
								<th><spring:message code="lable.fees"/></th>
								<th><span id="feeChargesCharged"></span></th>
								<th><span id="feeChargesPaid"></span></th>
								<th><span id="feeChargesWaived"></span></th>
								<th><span id="feeChargesWrittenOff"></span></th>
								<th><span id="feeChargesOutstanding"></span></th>
								<th><span id="feeChargesOverdue"></span></th>
							</tr>
							<tr>
								<th><spring:message code="lable.penalties"/></th>
								<th><span id="penaltyChargesCharged"></span></th>
								<th><span id="penaltyChargesPaid"></span></th>
								<th><span id="penaltyChargesWaived"></span></th>
								<th><span id="penaltyChargesWrittenOff"></span></th>
								<th><span id="penaltyChargesOutstanding"></span></th>
								<th><span id="penaltyChargesOverdue"></span></th>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th><spring:message code="lable.total"/></th>
								<th><span id="totalExpectedRepayment"></span></th>
								<th><span id="totalRepayment"></span></th>
								<th><span id="totalWaived"></span></th>
								<th><span id="totalWrittenOff"></span></th>
								<th><span id="totalOutstanding"></span></th>
								<th><span id="totalOverdue"></span></th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="col-sm-5 col-md-5">
				<div id="amountTable" style="display: none;">
					<table class="table table-striped table-bordered" >
						<tr>
							<th style="width: 30%"><spring:message code="lable.loan.purpose"/></th>
							<td><span id="purpose"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.purposed.amount"/></th>
							<td><span id="proposedAmount"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.approved.amount"/></th>
							<td><span id="approvedAmpount"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.arreasby"/></th>
							<td><span id="arreasby"> </span></td>
						</tr>
					</table>
				</div>
				<div id="amountTotal" style="display: none;" class="form-group">
					<table class="table table-striped table-bordered" >
						<tr>
							<th colspan="2" style="text-align: center;"><spring:message code="lable.loan.detail"/></th>
						</tr>
						<tr>
							<th style="width: 30%"><spring:message code="lable.disbursement.date"/></th>
							<td><span id=disbursementDate></span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.loan.purpose"/></th>
							<td><span id="loanPurpose"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.loan.officer"/></th>
							<td><span id="loanOfficer"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.currency"/></th>
							<td><span id="loanCurrency"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.external"/>ID</th>
							<td><span id="loanExternalId"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.proposed.amount"/></th>
							<td><span id="loanProposedAmount"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.approved.amount"/></th>
							<td><span id="loanApprovedAmount"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.disbursed.amount"/></th>
							<td><span id="loanDisbursedAmount"> </span></td>
						</tr>
					</table>
				</div>
				<div id="historyTable" class="form-group" style="display: none;">
					<table class="table table-striped table-bordered" >
						<tr>
							<th style="width: 30%;text-align: center;" colspan="2"><spring:message code="lable.performance.history"/></th>
						</tr>
						<tr>
							<th style="width: 30%">#<spring:message code="lable.of.repayments"/></th>
							<td><span id="ofRepayments"></span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.maturity.date"/></th>
							<td><span id="maturityDate"> </span></td>
						</tr>
					</table>
				</div>
			</div>
	</div>
	<legend></legend>
	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#accountDetail"><spring:message code="lable.account.detail"/></a></li>
		<li style="display: none;"><a href="#originalSchedule" id="original"><spring:message code="lable.original.schedule"/></a></li>
		<li><a href="#repaymentSchedule"><spring:message code="lable.repayment.schedule"/></a></li>
		<li style="display: none;" id="trans"><a href="#loanTransaction"><spring:message code="lable.loan.transaction"/></a></li>
		<li style="display: none;" id="overcharges"><a href="#overCharge"><spring:message code="client.overcharges"/></a></li>
		<li style="display: none;" id="charges"><a href="#loanCharge"><spring:message code="client.charges"/></a></li>
		<li><a href="#loanDocument"><spring:message code="lable.loan.documents"/></a></li>
		<li><a href="#loanNote"><spring:message code="lable.notes"/></a></li>
	</ul>
	<legend></legend>
	<div class="tab-content">
		<div id="accountDetail" class="tab-pane active" style="margin-left:-1px;margin-top: -40px;margin-right: 1px;">
			<div >
				<div>
					<div style="padding: 5px;display: block;box-sizing: border-box;">
						<br><hr>
						<table class="table table-bordered ">
							<tr>
								<th><spring:message code="lable.repayment.strategy"/></th>
								<td><span id="repaymentStrategy"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.repayments"/></th>
								<td><span id="repayments"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.amortization"/></th>
								<td><span id="amortization"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.interest"/></th>
								<td><span id="interest"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.grace.on.principal.payment"/></th>
								<td><span id="principalPayment"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.grace.on.interest.payment"/></th>
								<td><span id="interestPayment"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.grace.on.arrears.ageing"/></th>
								<td><span id="arrearsAgeing"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.fund.source"/></th>
								<td><span id="fundSource"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.interest.free.period"/></th>
								<td><span id="freePeriod"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.interest.calculation.period"/></th>
								<td><span id="calculationPeriod"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.allow.partial.interest.calcualtion.with.same.as.repayment"/></th>
								<td><span id="same"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.interest.type"/></th>
								<td><span id="interestType"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.submitted.on"/></th>
								<td><span id="submitted"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.approved.on"/></th>
								<td><span id="approved"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.disbursed.on"/></th>
								<td><span id="disbursed"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.matures.on"/></th>
								<td><span id="matures"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.recalculate.interest"/></th>
								<td><span id="recalculateInterest"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.days.in.year"/></th>
								<td><span id="daysInYear"> </span></td>
							</tr>
							<tr>
								<th><spring:message code="lable.days.in.month"/></th>
								<td><span id="daysInMonth"> </span></td>
							</tr>
							<div id="extend" style="display: none;">
								<tr>
									<th><spring:message code="lable.interest.recalculating"/></th>
									<td><span id="recalculating"> </span></td>
								</tr>
								<tr>
									<th><spring:message code="lable.advance.payments"/></th>
									<td><span id="advance"> </span></td>
								</tr>
								<tr>
									<th><spring:message code="lable.frequency.for.recalculate"/></th>
									<td><span id="frequencyFor"> </span></td>
								</tr>
							</div>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="originalSchedule" class="tab-pane" style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<div >
				<div>
					<div style="padding: 5px;display: block;box-sizing: border-box;">
						<table class="table table-striped" id="originalList" style="font-size: small;text-align: center;">
							<thead>
								<tr>
									<th colspan="1"></th>
									<th colspan="2"><spring:message code="lable.loan.amount.and.balance"/></th>
									<th colspan="3"><spring:message code="lable.total.cost.of.loan"/></th>
									<th colspan="6"><spring:message code="lable.installment.totals"/></th>
								</tr>
								<tr>
									<th><spring:message code="lable.date"/></th>
									<th><spring:message code="lable.principal.due"/></th>
									<th><spring:message code="lable.balance.of.loan"/></th>
									<th><spring:message code="lable.interest"/></th>
									<th><spring:message code="lable.fees"/></th>
									<th><spring:message code="lable.penalties"/></th>
									<th><spring:message code="lable.outstanding"/></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
							<tfoot>
								<tr>
									<th></th>
									<th style="text-align: center;"><spring:message code="lable.total"/></th>
									<th style="text-align: center;" id="totalPrincipalDue"></th>
									<th style="text-align: center;">&nbsp;</th>
									<th style="text-align: center;" id="totalInterest"></th>
									<th style="text-align: center;" id="totalFees"></th>
									<th style="text-align: center;" id="totalPenalties"></th>
									<th style="text-align: center;" id="totalOutstand"></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="repaymentSchedule" class="tab-pane" style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<div >
				<div>
					<div style="padding: 5px;display: block;box-sizing: border-box;">
						<table class="table table-striped" id="rescheduleList" style="font-size: small;text-align: center;">
							<thead>
								<tr>
									<th colspan="5"></th>
									<th colspan="2"><spring:message code="lable.loan.amount.and.balance"/></th>
									<th colspan="3"><spring:message code="lable.total.cost.of.loan"/></th>
									<th colspan="6"><spring:message code="lable.installment.totals"/></th>
								</tr>
								<tr>
									<th>#</th>
									<th><spring:message code="lable.days"/></th>
									<th><spring:message code="lable.date"/></th>
									<th><spring:message code="lable.paid.date"/></th>
									<th>&nbsp;</th>
									<th><spring:message code="lable.principal.due"/></th>
									<th><spring:message code="lable.balance.of.loan"/></th>
									<th><spring:message code="lable.interest"/></th>
									<th><spring:message code="lable.fees"/></th>
									<th><spring:message code="lable.penalties"/></th>
									<th><spring:message code="lable.due"/></th>
									<th><spring:message code="lable.paid"/></th>
									<th><spring:message code="lable.in.advance"/></th>
									<th><spring:message code="lable.late"/></th>
									<th><spring:message code="lable.outstanding"/></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
							<tfoot>
								<tr>
									<th></th>
									<th style="text-align: center;" id="loanTermInDays"></th>
									<th style="text-align: center;">Total</th>
									<th></th>
									<th></th>
									<th style="text-align: center;" id="totalPrincipalDisbursed"></th>
									<th></th>
									<th style="text-align: center;" id="totalInterestCharged"></th>
									<th style="text-align: center;" id="totalFeeChargesCharged"></th>
									<th style="text-align: center;" id="totalPenaltyChargesCharged"></th>
									<th style="text-align: center;" id="totalRepaymentExpected"></th>
									<th style="text-align: center;" id="totalPrincipalPaid"></th>
									<th style="text-align: center;" id="totalPaidInAdvance"></th>
									<th style="text-align: center;" id="totalPaidLate"></th>
									<th style="text-align: center;" id="totalOutstandings"></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="loanTransaction" class="tab-pane" style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<span>
				<div style="margin-right: 3px;float: left;padding-left: 740px;margin-top: 5px;padding-right: 3px;">
					<input type="checkbox" id="hide">
					<lable><spring:message code="lable.hide.accruals"/></lable>
				</div>
			</span>
			<span>
				<button id="viewJournalEntries" style="margin-right: 3px;float: left;" class="btn btn-primary btn-offset">
					<i class=""></i>
					<spring:message code="lable.view.journal.entries"/>
				</button>
			</span>
			<span>
				<button id="Export" style="margin-right: 3px;float: right;" class="btn btn-primary btn-offset">
					<i class=""></i>
					<spring:message code="lable.export"/>
				</button>
			</span>
			<table id="transactionList" class="table table-striped" style="font-size: small;text-align: center;">
				<thead>
					<tr>
						<th>ID</th>
						<th><spring:message code="lable.office"/></th>
						<th><spring:message code="lable.transaction.date"/></th>
						<th><spring:message code="lable.transaction.type"/></th>
						<th><spring:message code="lable.amount"/></th>
						<th colspan="4"><spring:message code="lable.break.down"/></th>
						<th><spring:message code="lable.loan.balance"/></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th><spring:message code="lable.principal"/></th>
						<th><spring:message code="lable.interest"/></th>
						<th><spring:message code="lable.fees"/></th>
						<th><spring:message code="lable.penalties"/></th>
					</tr>
				</thead>
				<tbody label="tran"></tbody>
			</table>
		</div>
		<div id="overCharge" class="tab-pane" style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<table id="overChargeList" class="table table-striped" style="font-size: small;text-align: center;">
				<thead>
					<tr>
						<th><spring:message code="lable.name"/></th>
						<th><spring:message code="lable.type"/></th>
						<th><spring:message code="lable.amount"/></th>
						<th><spring:message code="lable.chargeTimeType"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div id="loanCharge" class="tab-pane" style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<table id="loanChargeList" class="table table-striped" style="font-size: small;text-align: center;">
				<thead>
					<tr>
						<th><spring:message code="lable.name"/></th>
						<th><spring:message code="lable.fees"/>/<spring:message code="lable.penalties"/></th>
						<th><spring:message code="lable.payment.due.at"/></th>
						<th><spring:message code="lable.due.as.of"/></th>
						<th><spring:message code="lable.calculation.type"/></th>
						<th><spring:message code="lable.due"/></th>
						<th><spring:message code="lable.paid"/></th>
						<th><spring:message code="lable.waived"/></th>
						<th><spring:message code="lable.outstanding"/></th>
						<th><spring:message code="lable.action"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div id="loanDocument" class="tab-pane" style="margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<table id="documentList">
				<thead>
					<tr>
						<th name='id' width='100' style="display: none;">ID</th>
						<th name="name" width='150'><spring:message code="lable.name"/></th>
						<th name="description" width='150'><spring:message code="lable.description"/></th>
						<th name="fileName" width='150'><spring:message code="lable.fileName"/></th>
					</tr>
				</thead>
			</table>	
		</div>
		<div id="loanNote" class="tab-pane";margin-left:-1px;margin-top: -20px; margin-right: 1px; padding: 10px;">
			<table id="noteList">
				<thead>
					<tr>
						<th name='id' width='100'>ID</th>
						<th name="note" width='300'><spring:message code="lable.content"/></th>
						<th name="createdByUsername" width='200'><spring:message code="lable.created.by"/></th>
						<th name="createdOn" width='200' type="date"><spring:message code="lable.created.on"/></th>
					</tr>
				</thead>
			</table>	
		</div>
	</div>
</div>
</body>
	<script type="text/javascript">
	var accountNo;
	var loanId = ${pd.loanId};
	var requestType = ${pd.requestType};
	var documentId;
	var loanProductId;
	var groupId = '';
	var clientId;
	var grid_note;
	var grid_document;
	var grid_transaction;
	var grid_reschedule;
	var isInit="";
	var transactionId;
	var officeId;
	var status;
	var userId = <%=request.getSession().getValue("userId") %>
	function detail(){
		window.location.href="loadPage.do?nextPage=client.client.detail&clientId="+clientId;
	}
	function group(obj){
		var groupId = $(obj).attr('code');
		window.location.href="loadPage.do?nextPage=group.detail&groupId="+groupId+"&officeId="+officeId+"&userId="+userId;
	}
	
	function init(){
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.loans."+loanId+"?associations=all&exclude=guarantors,futureSchedule"
				},
			callback : "callback"
		});
	}
	
	$(document).ready(function(){
		init();
		$('#myModal').on('hidden.bs.modal',
				function(event) {
					window.location.href="loadPage.do?nextPage=client.loanAccount.loanDetail&loanId="+loanId+"&requestType="+requestType
				});
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.datatables?apptable=m_loan"
			},
			callback : "dataTable"
		}); 
		$.getWidget('hide').click(function(){
			if($(this).is(':checked')){
				$('#transactionList tbody[label="tran"] tr').each(function(){
					var tdVal = $(this).children().eq(3).text();
					if(tdVal === 'Accrual'){
						$(this).hide();
						$(this).attr('label','td_hi');
					}
				});
			}else{
				$('tbody[label="tran"] tr[label="td_hi"]').each(function(){
					$(this).show();
				});
			}
			
		});
		function init_note(){
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.loans.'+loanId+'.notes'
				},
				callback : function(param){
					grid_note.addRows(param);
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
					'url' : 'api.v1.loans.'+loanId+'.documents'
				},
				callback : function(param){
					grid_document.addRows(param);
				}
			});
		}
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
					},
					{
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
						bclass : 'delete',
						onpress : deleteFile
				}]
		});
		init_note();
		init_document();
		$('#myModal').on('hidden.bs.modal',
		function(event) {
			if(isInit=="note"){
				init_note();
			}else if(isInit=="document"){
				init_document();
			}
			isInit="";
		});
	});
	function callback(param){
		accountNo=param.accountNo;
		clientId = param.clientId;
		officeId = param.clientOfficeId;
		loanProductId = param.loanProductId;
		if(param.status.value == 'Approved'){
			x = document.getElementById("changeColor")
			x.style.color = "rgb(64, 106, 255)";
			$.show('addLC');
			$.show('officeTable');
			$.show('amountTable');
			$.show('operate');
			$.show('disburse');
			$.show('disburseTo');
			$.show('undoApp');
			$.show('vig');
			$.show('crg');
			$.show('lsr');
		}else if(param.status.value == 'Submitted and pending approval'){
			x = document.getElementById("changeColor")
			x.style.color = "rgb(255, 106, 64)";
			$.show('addLC');
			$.show('officeTable');
			$.show('amountTable');
			$.show('operate');
			$.show('approve');
			$.show('modify');
			$.show('rej');
			$.show('wbc');
			$.show('delete');
			$.show('adc');
			$.show('vig');
			$.show('crg');
			$.show('csr');
			$.show('lsr');
		}else if(param.status.value == 'Active'){
			x = document.getElementById("changeColor")
			x.style.color = "rgb(64, 255, 106)";
			$.show('addLC');
			$.show('balanceCurrency');
			$.show('totalTable');
			$.show('amountTotal');
			$.show('history');
			$.show('operate');
			$.show('prepayLoan');
			$.show('forecloure');
			$.show('undodisburse');
			$.show('makerepayment');
			$.show('waivt');
			$.show('resc');
			$.show('wof');
			$.show('close');
			$.show('closeAs');
			$.show('vig');
			$.show('crg');
			$.show('csr');
			$.show('lsr')
			$.show('recover');
			$.show('historyTable');
			if(typeof param.summary != undefined){
				$('#currentBalance').append(param.summary.currency.displaySymbol+' '+param.summary.totalOutstanding);
				$('#arrearsby').append(0);
				
				if(typeof param.summary.principalDisbursed != undefined){
					$('#principalDisbursed').append(param.summary.principalDisbursed);
				}else{
					$('#principalDisbursed').append('');
				}
				if(typeof param.summary.principalPaid != undefined){
					$('#principalPaid').append(param.summary.principalPaid);
				}else{
					$('#principalPaid').append('');
				}
				if(typeof param.summary.principalWaived != undefined){
					$('#principalOriginal').append(param.summary.principalWaived);
				}else{
					$('#principalOriginal').append('');
				}
				if(typeof param.summary.principalWrittenOff != undefined){
					$('#principalWrittenOff').append(param.summary.principalWrittenOff);
				}else{
					$('#principalWrittenOff').append('');
				}
				if(typeof param.summary.principalOutstanding != undefined){
					$('#principalOutstanding').append(param.summary.principalOutstanding);
				}else{
					$('#principalOutstanding').append('');
				}
				if(typeof param.summary.principalOverdue != undefined){
					$('#principalOverdue').append(param.summary.principalOverdue);
				}else{
					$('#principalOverdue').append('');
				}
				
				if(typeof param.summary.interestCharged != undefined){
					$('#interestCharged').append(param.summary.interestCharged);
				}else{
					$('#interestCharged').append('');
				}
				if(typeof param.summary.interestPaid != undefined){
					$('#interestPaid').append(param.summary.interestPaid);
				}else{
					$('#interestPaid').append('');
				}
				if(typeof param.summary.interestWaived != undefined){
					$('#interestWaived').append(param.summary.interestWaived);
				}else{
					$('#interestWaived').append('');
				}
				if(typeof param.summary.interestWrittenOff != undefined){
					$('#interestWrittenOff').append(param.summary.interestWrittenOff);
				}else{
					$('#interestWrittenOff').append('');
				}
				if(typeof param.summary.interestOutstanding != undefined){
					$('#interestOutstanding').append(param.summary.interestOutstanding);
				}else{
					$('#interestOutstanding').append('');
				}
				if(typeof param.summary.interestOverdue != undefined){
					$('#interestOverdue').append(param.summary.interestOverdue);
				}else{
					$('#interestOverdue').append('');
				}
				
				if(typeof param.summary.feeChargesCharged != undefined){
					$('#feeChargesCharged').append(param.summary.feeChargesCharged);
				}else{
					$('#feeChargesCharged').append('');
				}
				if(typeof param.summary.feeChargesPaid != undefined){
					$('#feeChargesPaid').append(param.summary.feeChargesPaid);
				}else{
					$('#feeChargesPaid').append('');
				}
				if(typeof param.summary.feeChargesWaived != undefined){
					$('#feeChargesWaived').append(param.summary.feeChargesWaived);
				}else{
					$('#feeChargesWaived').append('');
				}
				if(typeof param.summary.feeChargesWrittenOff != undefined){
					$('#feeChargesWrittenOff').append(param.summary.feeChargesWrittenOff);
				}else{
					$('#feeChargesWrittenOff').append('');
				}
				if(typeof param.summary.feeChargesOutstanding != undefined){
					$('#feeChargesOutstanding').append(param.summary.feeChargesOutstanding);
				}else{
					$('#feeChargesOutstanding').append('');
				}
				if(typeof param.summary.feeChargesOverdue != undefined){
					$('#feeChargesOverdue').append(param.summary.feeChargesOverdue);
				}else{
					$('#feeChargesOverdue').append('');
				}
				
				if(typeof param.summary.penaltyChargesCharged != undefined){
					$('#penaltyChargesCharged').append(param.summary.penaltyChargesCharged);
				}else{
					$('#penaltyChargesCharged').append('');
				}
				if(typeof param.summary.penaltyChargesPaid != undefined){
					$('#penaltyChargesPaid').append(param.summary.penaltyChargesPaid);
				}else{
					$('#penaltyChargesPaid').append('');
				}
				if(typeof param.summary.penaltyChargesWaived != undefined){
					$('#penaltyChargesWaived').append(param.summary.penaltyChargesWaived);
				}else{
					$('#penaltyChargesWaived').append('');
				}
				if(typeof param.summary.penaltyChargesWrittenOff != undefined){
					$('#penaltyChargesWrittenOff').append(param.summary.penaltyChargesWrittenOff);
				}else{
					$('#penaltyChargesWrittenOff').append('');
				}
				if(typeof param.summary.penaltyChargesOutstanding != undefined){
					$('#penaltyChargesOutstanding').append(param.summary.penaltyChargesOutstanding);
				}else{
					$('#penaltyChargesOutstanding').append('');
				}
				if(typeof param.summary.penaltyChargesOverdue != undefined){
					$('#penaltyChargesOverdue').append(param.summary.penaltyChargesOverdue);
				}else{
					$('#penaltyChargesOverdue').append('');
				}
				
				if(typeof param.summary.totalExpectedRepayment != undefined){
					$('#totalExpectedRepayment').append(param.summary.totalExpectedRepayment);
				}else{
					$('#totalExpectedRepayment').append('');
				}
				if(typeof param.summary.totalRepayment != undefined){
					$('#totalRepayment').append(param.summary.totalRepayment);
				}else{
					$('#totalRepayment').append('');
				}
				if(typeof param.summary.totalWaived != undefined){
					$('#totalWaived').append(param.summary.totalWaived);
				}else{
					$('#totalWaived').append('');
				}
				if(typeof param.summary.totalWrittenOff != undefined){
					$('#totalWrittenOff').append(param.summary.totalWrittenOff);
				}else{
					$('#totalWrittenOff').append('');
				}
				if(typeof param.summary.totalOutstanding != undefined){
					$('#totalOutstanding').append(param.summary.totalOutstanding);
				}else{
					$('#totalOutstanding').append('');
				}
				if(typeof param.summary.totalOverdue != undefined){
					$('#totalOverdue').append(param.summary.totalOverdue);
				}else{
					$('#totalOverdue').append('');
				}
			}
		}else if(param.status.value == 'Overpaid'){
			x = document.getElementById("changeColor")
			x.style.color = "rgb(128, 0, 128)";
			$.show('balanceCurrency');
			$.show('totalTable');
			$.show('amountTotal');
			$.show('historyTable');
			$.show('fund');
			$.hide('more');
		}else{
			x = document.getElementById("changeColor")
			x.style.color = "rgb(0, 0, 0)";
			$.show('balanceCurrency');
			$.show('totalTable');
			$.show('amountTotal');
			$.show('historyTable');
		}
		
		if(typeof param.transactions != 'undefined'){
			$.show('trans');
			for(var i=0;i<param.transactions.length;i++){
				param.transactions[i].date = $.formatDate(param.transactions[i].date,'yyyy-MM-dd');
				var str = '<tr id="'+param.transactions[i].id+'"><td>'+param.transactions[i].id+'</td>'+
				'<td>'+param.transactions[i].officeName+'</td>'+
				'<td>'+param.transactions[i].date+'</td>'+
				'<td>'+param.transactions[i].type.value+'</td>'+
				'<td>'+param.transactions[i].amount+'</td>'+
				'<td>'+param.transactions[i].principalPortion+'</td>'+
				'<td>'+param.transactions[i].interestPortion+'</td>'+
				'<td>'+param.transactions[i].feeChargesPortion+'</td>'+
				'<td>'+param.transactions[i].penaltyChargesPortion+'</td>'+
				'<td>'+param.transactions[i].outstandingLoanBalance+'</td>'+
				'<td><span><a href="javascript:viewReceipt();"><li class="glyphicon glyphicon-list-alt"></li></a></span></td>'+
				'<td><span><a href="javascript:viewEntries();"><li class="glyphicon glyphicon-circle-arrow-right"></li></a></span></td>'+
				'</tr>';
				$('#transactionList tbody[label="tran"]').append(str);
			}
		}
		if(typeof param.charges != 'undefined'){
			status = param.status.value;
			$.show('charges');
			var chargeType = '';
			for(var i=0;i<param.charges.length;i++){
				if(typeof param.charges[i].dueDate != 'undefined'){
					param.charges[i].dueDate = $.formatDate(param.charges[i].dueDate);
				}else{
					param.charges[i].dueDate = '';
				}
				if(typeof param.charges[i].action == 'undefined'){
					if(param.status.value == 'Active'){
						param.charges[i].action = '<span><a href="javascript:waiveLoanCharge();"><li class="glyphicon glyphicon-flag"></li></a></span>'
							+' <span><a href="javascript:loanChargeDetail();"><li class="glyphicon glyphicon-eye-open"></li></a></span>';
					}else if(param.status.value == 'Approved'){
						param.charges[i].action = '<span><a href="javascript:loanChargeDetail();"><li class="glyphicon glyphicon-eye-open"></li></a></span>';
					}else if(param.status.value == 'Submitted and pending approval'){
						param.charges[i].action = '<span><a href="javascript:editLoanCharge();"><li class="glyphicon glyphicon-pencil"></li></a></span>'
							+' <span><a href="javascript:deleteLoanCharge();"><li class="glyphicon glyphicon-remove"></li></a></span>'
							+' <span><a href="javascript:loanChargeDetail();"><li class="glyphicon glyphicon-eye-open"></li></a></span>';
					}
				}
				if(param.charges[i].penalty == true){
					chargeType = 'penalty';
				}else if(param.charges[i].paid == true){
					chargeType = 'paid';
				}else if(param.charges[i].waived == true){
					chargeType = 'waived';
				}
				var str = '<tr><td style="display:none;">'+param.charges[i].id+'</td>'+
				'<td>'+param.charges[i].name+'</td>'+
				'<td>'+chargeType+'</td>'+
				'<td>'+param.charges[i].chargeTimeType.value+'</td>'+
				'<td>'+param.charges[i].dueDate+'</td>'+
				'<td>'+param.charges[i].chargeCalculationType.value+'</td>'+
				'<td>'+param.charges[i].currency.displaySymbol+param.charges[i].amount+'</td>'+
				'<td>'+param.charges[i].amountPaid+'</td>'+
				'<td>'+param.charges[i].amountWaived+'</td>'+
				'<td>'+param.charges[i].amountOutstanding+'</td>'+
				'<td>'+param.charges[i].action+'</td>'+
				'</tr>';
				$('#loanChargeList').append(str);
			}
		}
		if(typeof param.overdueCharges != 'undefined' && param.overdueCharges != ''){
			$.show('overcharges');
			for(var i=0;i<param.overdueCharges.length;i++){
				var str = '<tr><td>'+param.overdueCharges[i].name+','+param.overdueCharges[i].currency.displaySymbol+'</td>'
				+'<td>'+param.overdueCharges[i].chargeCalculationType.value+'</td>'
				+'<td>'+param.overdueCharges[i].amount+'</td>'
				+'<td>'+param.overdueCharges[i].chargeTimeType.value+'</td>'
				+'</tr>';
				$('#overChargeList').append(str);
			}
		}
		if(typeof param.originalSchedule != 'undefined'){
			$.show('origi');
			for(var i=0;i<param.originalSchedule.periods.length;i++){
				var dueDate = $.formatDate(param.originalSchedule.periods[i].dueDate);
				if(typeof param.originalSchedule.periods[i].principalDue == 'undefined'){
					param.originalSchedule.periods[i].principalDue = '';
				}
				if(typeof param.originalSchedule.periods[i].interestDue == 'undefined'){
					param.originalSchedule.periods[i].interestDue = '';
				}
				if(typeof param.originalSchedule.periods[i].penaltyChargesDue == 'undefined'){
					param.originalSchedule.periods[i].penaltyChargesDue = '';
				}
				if(typeof param.originalSchedule.periods[i].totalOutstandingForPeriod == 'undefined'){
					param.originalSchedule.periods[i].totalOutstandingForPeriod = '';
				}
				$('#originalList').append('<tr><td>'+dueDate+'<td/>'
					+'<td>'+param.originalSchedule.periods[i].principalDue+'</td>'	
					+'<td>'+param.originalSchedule.periods[i].principalLoanBalanceOutstanding+'</td>'
					+'<td>'+param.originalSchedule.periods[i].interestDue+'</td>'
					+'<td>'+param.originalSchedule.periods[i].feeChargesDue+'</td>'
					+'<td>'+param.originalSchedule.periods[i].penaltyChargesDue+'</td>'
					+'<td>'+param.originalSchedule.periods[i].totalOutstandingForPeriod+'</td>'
					+'</tr>');
			}
			$('#totalPrincipalDue').append(param.originalSchedule.totalPrincipalDisbursed);
			$('#totalInterest').append(param.originalSchedule.totalInterestCharged);
			$('#totalFees').append(param.originalSchedule.totalFeeChargesCharged);
			$('#totalPenalties').append(param.originalSchedule.totalPenaltyChargesCharged);
			$('#totalOutstand').append(param.originalSchedule.totalRepaymentExpected);
		}
		if(typeof param.repaymentSchedule != 'undefined'){
			var str = param.repaymentSchedule.periods;
			for(var i=0;i<str.length;i++){
				if(typeof str[i].daysInPeriod == 'undefined'){
					str[i].daysInPeriod = '';
				}
				str[i].dueDate = $.formatDate(str[i].dueDate);
				if(typeof str[i].paidDate == 'undefined'){
					str[i].paidDate = '';
				}
				if(typeof str[i].principalDue == 'undefined'){
					str[i].principalDue = '';
				}
				if(typeof str[i].interestDue == 'undefined'){
					str[i].interestDue = '';
				}
				if(typeof str[i].feeChargesWaived == 'undefined'){
					str[i].feeChargesWaived = '';
				}
				if(typeof str[i].totalPaidInAdvanceForPeriod == 'undefined'){
					str[i].totalPaidInAdvanceForPeriod = '';
				}
				if(typeof str[i].totalPaidLateForPeriod == 'undefined'){
					str[i].totalPaidLateForPeriod = '';
				}
				if(typeof str[i].totalOutstandingForPeriod == 'undefined'){
					str[i].totalOutstandingForPeriod = '';
				}
				if(i ==0){
					$('#rescheduleList').append('<tr><td></td>'+
							'<td>'+str[i].daysInPeriod+'</td>'+
							'<td>'+str[i].dueDate+'</td>'+
							'<td>'+str[i].paidDate+'</td>'+
							'<td></td>'+
							'<td>'+str[i].principalDue+'</td>'+
							'<td>'+str[i].principalLoanBalanceOutstanding+'</td>'+
							'<td>'+str[i].interestDue+'</td>'+
							'<td>'+str[i].feeChargesDue+'</td>'+
							'<td>'+str[i].feeChargesWaived+'</td>'+
							'<td>'+str[i].totalDueForPeriod+'</td>'+
							'<td>'+str[i].totalPaidForPeriod+'</td>'+
							'<td>'+str[i].totalPaidInAdvanceForPeriod+'</td>'+
							'<td>'+str[i].totalPaidLateForPeriod+'</td>'+
							'<td>'+str[i].totalOutstandingForPeriod+'</td></tr>');
				}else{
					$('#rescheduleList').append('<tr><td>'+i+'</td>'+
							'<td>'+str[i].daysInPeriod+'</td>'+
							'<td>'+str[i].dueDate+'</td>'+
							'<td>'+str[i].paidDate+'</td>'+
							'<td></td>'+
							'<td>'+str[i].principalDue+'</td>'+
							'<td>'+str[i].principalLoanBalanceOutstanding+'</td>'+
							'<td>'+str[i].interestDue+'</td>'+
							'<td>'+str[i].feeChargesDue+'</td>'+
							'<td>'+str[i].feeChargesWaived+'</td>'+
							'<td>'+str[i].totalDueForPeriod+'</td>'+
							'<td>'+str[i].totalPaidForPeriod+'</td>'+
							'<td>'+str[i].totalPaidInAdvanceForPeriod+'</td>'+
							'<td>'+str[i].totalPaidLateForPeriod+'</td>'+
							'<td>'+str[i].totalOutstandingForPeriod+'</td></tr>');
				}
			}
			$('#loanTermInDays').append(param.repaymentSchedule.loanTermInDays);
			$('#totalPrincipalDisbursed').append(param.repaymentSchedule.totalPrincipalDisbursed);
			$('#totalInterestCharged').append(param.repaymentSchedule.totalInterestCharged);
			$('#totalFeeChargesCharged').append(param.repaymentSchedule.totalFeeChargesCharged);
			$('#totalPenaltyChargesCharged').append(param.repaymentSchedule.totalPenaltyChargesCharged);
			$('#totalRepaymentExpected').append(param.repaymentSchedule.totalRepaymentExpected);
			$('#totalPrincipalPaid').append(param.repaymentSchedule.totalPrincipalPaid);
			$('#totalPaidInAdvance').append(param.repaymentSchedule.totalPaidInAdvance);
			$('#totalPaidLate').append(param.repaymentSchedule.totalPaidLate);
			$('#totalOutstandings').append(param.repaymentSchedule.totalOutstanding);
		} 
		$('#clientNa').append(' '+param.clientName+' /');
		if(requestType == 2){
			$.hide('clientA');
			$.show('groupA');
			$('#group').append(' '+param.group.name+' /');
			$('#a').attr('code',param.group.id);
		}else{
			$.show('clientA');
			$.hide('groupA');
		}
		
		$('#clients').append(' '+param.loanProductName+'('+param.accountNo+')');
		$('#productName').append(param.loanProductName + '(#'+param.accountNo+')');
		if(typeof param.timeline.actualDisbursementDate != 'undefined'){
			$('#activatedIn').append(param.timeline.actualDisbursementDate);
			$('#disbursementDate').append(param.timeline.actualDisbursementDate);
		}else{
			$('#activatedIn').append('<spring:message code="lable.not.available"/>');
			$('#disbursementDate').append('<spring:message code="lable.not.available"/>');
		}
		if(typeof param.loanOfficerName != 'undefined'){
			$('#officer').append(param.loanOfficerName+
					' <a href="javascript:void(0)"  onclick="javascript:unAssignLoanOfficer()" style="margin-top: 3px">'
					+'<i class="glyphicon glyphicon-remove"></i></a>');
			$.show('cha');
			$('#loanOfficer').append(param.loanOfficerName+
					' <a href="javascript:void(0)"  onclick="javascript:unAssignLoanOfficer()" style="margin-top: 3px">'
					+'<i class="glyphicon glyphicon-remove"></i></a>');
		}else{
			$.show('assignloff');
			$('#officer').append('<spring:message code="lable.Unassigned"/>');
			$('#loanOfficer').append('<spring:message code="lable.Unassigned"/>');
		}
		if(typeof param.externalId != 'undefined'){
			$('#externalId').append(param.externalId);
			$('#loanExternalId').append(param.externalId);
		}else{
			$('#externalId').append('<spring:message code="lable.not.provided"/>');
			$('#loanExternalId').append('<spring:message code="lable.not.provided"/>');
		}
		$('#currency').append(param.currency.name);
		$('#loanCurrency').append(param.currency.name);
		if(typeof param.loanPurposeName != 'undefined'){
			$('#purpose').append(param.loanPurposeName);
			$('#loanPurpose').append(param.loanPurposeName);
		}else{
			$('#purpose').append('<spring:message code="lable.not.provided"/>');
			$('#loanPurpose').append('<spring:message code="lable.not.provided"/>');
		}
		$('#proposedAmount').append(param.proposedPrincipal);
		$('#loanProposedAmount').append(param.proposedPrincipal);
		$('#approvedAmpount').append(param.approvedPrincipal);
		$('#loanApprovedAmount').append(param.approvedPrincipal);
		$('#loanDisbursedAmount').append(param.principal);
		
		
		$('#ofRepayments').append(param.numberOfRepayments);
		
		$('#arreasby').append('<spring:message code="lable.not.provided"/>');
		$('#repaymentStrategy').append(param.transactionProcessingStrategyName);
		$('#repayments').append(param.numberOfRepayments+' every '+param.repaymentEvery+' '+ param.repaymentFrequencyType.value);
		$('#amortization').append(param.amortizationType.value);
		$('#interest').append(param.annualInterestRate +' per annum '+'('+param.interestRatePerPeriod+'% '+param.interestRateFrequencyType.value+') - '+param.interestType.value);
		if(typeof param.graceOnPrincipalPayment != 'undefined'){
			$('#principalPayment').append(param.graceOnPrincipalPayment);
		}
		if(typeof param.graceOnInterestPayment != 'undefined'){
			$('#interestPayment').append(param.graceOnInterestPayment);
		}
		if(typeof param.graceOnInterestPayment != 'undefined'){
			$('#arrearsAgeing').append(param.graceOnArrearsAgeing);
		}
		if(typeof param.fundName != 'undefined'){
			$('#fundSource').append(param.fundName);
		}
		if(typeof param.graceOnInterestCharged != 'undefined'){
			$('#freePeriod').append(param.graceOnInterestCharged);
		}
		if(param.isInterestRecalculationEnabled == true){
			$('#recalculateInterest').append('<spring:message code="lable.yes"/>');
			$.show('extend');
			$('#recalculating').append(param.interestRecalculationData.interestRecalculationCompoundingType.value);
			$('#advance').append(param.interestRecalculationData.rescheduleStrategyType.value);
			$('#frequencyFor').append(param.interestRecalculationData.calendarData.humanReadable);
		}else{
			$('#recalculateInterest').append('<spring:message code="lable.no"/>');
		}
		$('#calculationPeriod').append(param.interestCalculationPeriodType.value);
		$('#same').append(param.allowPartialPeriodInterestCalcualtion);
		$('#interestType').append(param.interestType.value);
		
		var submittedOnDate = $.formatDate(param.timeline.submittedOnDate);
		$('#submitted').append(submittedOnDate);
		
		if(typeof param.timeline.approvedOnDate != 'undefined'){
			var approvedOnDate = $.formatDate(param.timeline.approvedOnDate);
			$('#approved').append(approvedOnDate);
		}
		if(typeof param.timeline.actualDisbursementDate != 'undefined'){
			var disbursedOnDate = $.formatDate(param.timeline.actualDisbursementDate);
			$('#disbursed').append(disbursedOnDate);
		}
		
		var expectedMaturityDate = $.formatDate(param.timeline.expectedMaturityDate);
		$('#matures').append(expectedMaturityDate);
		$('#maturityDate').append(expectedMaturityDate);
		
		$('#daysInMonth').append(param.daysInMonthType.value);
		$('#daysInYear').append(param.daysInYearType.value);
		
	}
	
	function viewReceipt(){
		$("#transactionList tr").each(function(){
			transactionId = $(this).find("td:first").text();
		    $.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.loanRunreport"/>');
		})
	}
	
	function viewEntries(){
		$("#transactionList tr").each(function(){
			transactionId = $(this).find("td:first").text();
			window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.serach&officeId="+officeId+"&glAccountId="+loanId+"requestType="+requestType;
		})
	}
	
	function waiveLoanCharge(){
		$("#loanChargeList tr").each(function(){
		    chargeId = $(this).find("td:first").text();
		    $.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.waiveLoanCharge"/>');
		})
	}
	
	function loanChargeDetail(){
		$("#loanChargeList tr").each(function(){
		    chargeId = $(this).find("td:first").text();
		    window.location.href="loadPage.do?nextPage=client.loanAccount.viewCharge&loanId="+loanId+"&chargeId="+chargeId+"&status="+status+"&requestType="+requestType;
		})
	}
	
	function editLoanCharge(){
		$("#loanChargeList tr").each(function(){
		    chargeId = $(this).find("td:first").text();
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.editLoanCharge"/>');
		})
	}
	
	function deleteLoanCharge(){
		$("#loanChargeList tr").each(function(){
		    chargeId = $(this).find("td:first").text();
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.deleteLoanCharge"/>');
		})
	}
	
	$('#Export').click(function(){
		$.openWindow("loadPage.do?nextPage=client.loanAccount.generateReport");
	});
	
	$('#transferFund').click(function(){
		
	});
	
	$('#viewJournalEntries').click(function(){
		window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.serach&officeId="+officeId+"&glAccountId="+loanId+"requestType="+requestType;
	});
	
	$('#viewJournalEntries').click(function(){
		window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.serach&officeId="+officeId+"&glAccountId="+loanId+"requestType="+requestType;
	});
	
	function noteAdd(){
		isInit = "note";
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.loanNotes"/>');
	}
	
	function documentsUplaod(){
		isInit = "document";
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.loanDocument"/>');
	}
	
	function deleteFile(){
		documentId = grid_document.colVal('id');
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.deleteLoanDocument&loanId='+loanId+'"/>');
	}
	
	$('#addLoanCharge').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.addLoanCharge"/>');
	});
	
	$('#prepayLoans').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.prepayLoan"/>');
	});
	
	$('#forecloures').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.foreclosure"/>');
	});
	
	$('#approves').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.approve"/>');
	})
	
	$('#undoApprove').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.undoApproveLoanAccount"/>');
	});
	
	$('#disburses').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.disburse"/>');
	});
	
	$('#makerepayments').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.makeRepayment"/>');
	});
	
	$('#undodisbursal').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.undoDisburseLoanAccount"/>');
	})
	
	$('#disburseToSaving').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.disburseToSaving"/>');
	});
	
	$('#modifyApp').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.editLoan"/>');
	});
	
	$('#reject').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.rejectLoanAccount"/>');
	});
	
	$('#assignLoanOfficer').click(function(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.assignLoanOfficer"/>');
	});
	
	$('#recoveryRepayment').click(function(){
		
	});
	
	function unAssignLoanOfficer(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.unAssignLoanOfficer"/>');
	}
	
	function changeLoanOfficer(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.changeLoanOfficer"/>');
	}
	
	function addCollateral(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.addCollateral"/>');
	}
	
	function waiveInterest(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.waiveInterest"/>');
	}
	
	function reschedule(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.rescheduleLoan"/>');
	}
	
	function writeOff(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.writeOffLoanAccount"/>');
	}
	
	function closeAsRescheduled(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.closeLoanAccountAsReschedule"/>');
	}
	
	function closeLoan(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.closeLoanAccount"/>');
	}
	
	function withdrawByClient(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.withdrawByClient"/>');
	}
	
	function viewGuarantors(){
		window.location.href="loadPage.do?nextPage=client.loanAccount.viewGuarantor&loanId="+loanId+"&requestType="+requestType;
	}
	
	function createGuarantos(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.createGuarantor"/>');
	}
	
	function loanScreenReport(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.loanScreenReport"/>');
	}
	
	function recoverGuarantor(){
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.loanAccount.recoverFromGuarantor"/>');
	}
	
	
	function Delete(){
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			type : 'post',
			data : {
				'dataType' : 'DELETE',
				'mydata' : '',
				'url' : 'api.v1.loans.'+loanId
			},
			callback : 'deleteLoan'
		});
	}
	
	function deleteLoan(param){
		if(param != null || param != ''){
			var clientId = param.clientId;
			if(requsetType==2){
				window.location.href="loadPage.do?nextPage=group.detail&groupId="+groupId;
				return 0;
			}
			window.location.href="loadPage.do?nextPage=client.client.detail&clientId="+clientId;
		}
	}
	
	$(function () { 
        $('#myTab a:first').tab('show');//初始化显示哪个tab 
      
        $('#myTab a').click(function (e) { 
          e.preventDefault();//阻止a链接的跳转行为 
          $(this).tab('show');//显示当前选中的链接及关联的content 
        }) 
      }) 
      
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
					url += "&datatablename="+btnjson.registeredTableName+"&notesid="+loanId;
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
	</script>
</html>
