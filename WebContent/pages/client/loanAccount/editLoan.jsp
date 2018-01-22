<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form class="form-horizontal"></form>
	<div>
		<label><spring:message code="group.new.loan.apply" /></label>
	</div>
	<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
	<!-- 1 -->
	<div id="informationPage" class="modal-body"
		style="height: auto; padding: 0px;">
		<div class="modal-body" style="height: 53px; padding: 5px">
			<div class=" col-md-6" style="padding: 5px; height: 34px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.product" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<select id="LoanproductList" class="form-control"
						onchange="changeLoanProduct()" style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.loan.officer" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<select id="loanOfficer" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<!-- 2 -->
		<div class="modal-body" style="height: 53px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.loan.purpose" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<select id="loanPurpose" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.fund" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<select id="fund" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
		</div>
		<!-- 3 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 53px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.submit.on" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<input id="submittedOn" name="submittedOn" type="text"
						class="form-control" datetype="date"
						local-date="true">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.disbursement.on" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<input id="disbursementOn" name="disbursementOn" type="text"
						class="form-control" datetype="date"
						local-date="false">
				</div>
			</div>
		</div>
		<!-- 4 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 53px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.external.id" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<input class="form-control" id="externalId" name="externalId"
						type="text" style="width: 200px">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px"></div>
		</div>
		<!-- 5 -->
		<!-- 会议详情面板 -->
		<div id="Metting" style="display: none">
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<div style="height: 15px">
				<div class="modal-body col-md-12" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.meeting.details" />
					</label>
				</div>
			</div>
			<div id="addMettingPanel"></div>
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<div class="modal-body" style="height: 53px; padding: 5px">
				<div class="col-md-6" style="padding: 5px">
					<div class="col-md-4" style="padding: 5px">
						<input type="checkbox" id="syncRepayments">
					</div>
					<div class="" style="padding-left: 0px">
						<label
							style="padding-top: 3px; font-size: 16px; font-weight: normal">
							<spring:message code="group.sync.repayments.with.meeting" />
						</label>
					</div>
				</div>
				<div class="col-md-6" style="padding: 5px">
					<div class="col-md-4" style="padding: 5px">
						<input type="checkbox" id="syncDisbursement">
					</div>
					<div class="" style="padding-left: 0px">
						<label
							style="padding-top: 3px; font-size: 16px; font-weight: normal">
							<spring:message code="group.sync.disbursement.date.with.meeting" />
						</label>
					</div>
				</div>
			</div>
		</div>
		<!-- 6 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div style="height: 15px">
			<div class="modal-body col-md-12" style="padding: 5px">
				<label
					style="padding-top: 3px; font-size: 16px; font-weight: normal">
					<spring:message code="group.savings.linkage" />
				</label>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<!-- 7 -->
		<div class="modal-body" style="height: 50px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.link.savings" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px; padding-top: 5px">
					<select id="linkSaving" class="form-control" style="width: 200">
						<option value='0'><spring:message code='group.select'/></option>
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-10" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.create.standing.instructions.at.disbursement" />
					</label>
				</div>
				<div class="col-md-2" style="padding-left: 0px; padding-top: 5px">
					<input id="makePaymentInstructions" type="checkbox">
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<!-- 8 -->
		<div style="height: 15px">
			<div class="modal-body col-md-12" style="padding: 5px">
				<label
					style="padding-top: 3px; font-size: 16px; font-weight: normal">
					<spring:message code="group.terms" />
				</label>
			</div>
		</div>

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="font-size: 16px; font-weight: normal; margin-button: 0px">
						<spring:message code="group.principal" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input class="form-control" id="principal" style="width: 200px">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 2px">
					<label
						style="font-size: 14px; font-weight: normal; margin-button: 0px"><spring:message
							code="group.loan.term" /> </label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<div class="col-md-7" style="padding: 0px">
						<input class="form-control" id="loanTerm" style="width: 150px">
					</div>
					<div class="col-md-5" style="padding: 0px">
						<select id="termFrequencyTypeOptions" class="form-control"
							style="width: 100">
						</select>
					</div>
				</div>
			</div>
		</div>
		<!-- 9 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 50px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="font-size: 16px; font-weight: normal; margin-button: 0px">
						<spring:message code="group.number.of.repayments" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input class="form-control" id="numberOfRepayments"
						style="width: 200px">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 2px">
					<label
						style="font-size: 14px; font-weight: normal; margin-button: 0px"><spring:message
							code="group.repaid.every" /> </label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<div class="col-md-7" style="padding: 0px">
						<input class="form-control" id="repaidEver" style="width: 150px">
					</div>
					<div class="col-md-5" style="padding: 0px">
						<select id="repaidEverList" class="form-control"
							onchange="checkMonth()" style="width: 100">
						</select>
					</div>
				</div>
			</div>
		</div>
		<div id="detailTime" class="modal-body"
			style="height: 50px; padding: 5px; display: none">
			<div class="col-md-6" style="padding: 0px"></div>
			<div class="col-md-6" style="padding: 0px">
				<div class="col-md-4" style="padding: 0px"></div>
				<div class="col-md-1" style="padding: 0px; padding-top: 5px">
					<label
						style="font-size: 14px; font-weight: normal; font-align: right; margin-button: 0px"><spring:message
							code="group.on" /></label>
				</div>
				<div class="col-md-3" style="padding: 0px">
					<select id="repaymentFrequencyNthDayType" class="form-control"
						style="width: 100">
						<option value='0'><spring:message code='group.select'/></option>
					</select>
				</div>
				<div class="col-md-3" style="padding: 0px">
					<select id="repaymentFrequencyDayOfWeekType" class="form-control"
						style="width: 100">
						<option value='0'><spring:message code='group.select'/></option>
					</select>
				</div>
			</div>
		</div>
		<!-- 10 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.first.repayment.on" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="firstRepaymentOn" name="firstRepaymentOn" type="text"
						class="form-control" datetype="date" name="activeDate"
						 local-date="false">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.interest.charged.from" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="interestChargedFrom" name="interestChargedFrom"
						type="text" class="form-control" datetype="date" name="activeDate"
						 local-date="false">
				</div>
			</div>
		</div>

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<!-- 11 -->
		<div class="modal-body" style="height: 70px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.nominal.interest.rate" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input type="text" class="form-control" id="nominalInterestRate"
						style="width: 200px">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.interest.method" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="interestMethod" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 50px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.amortization" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px; padding-top: 5px">
					<select id="amortization" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px"></div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 50px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.interest.calculation.period" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px; padding-top: 5px">
					<select id="interestCalculationPeriod" class="form-control"
						style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-8" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.calculate.interest.for.exact.days.in.partial.period" />
					</label>
				</div>
				<div class="col-md-4" style="padding-left: 0px; padding-top: 5px">
					<input type="checkbox" id="calculateInterests">
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">


		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.arrears.tolerance" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<div class="col-md-10" style="padding: 0px">
						<input class="form-control" id="arrearsTolerance"
							style="width: 200px">
					</div>
					<div class="col-md-2" style="padding: 0px">
						<label
							style="font-size: 14px; font-weight: normal; margin-top: 5px">
							<spring:message code="group.us.dollar" />
						</label>
					</div>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.interest.free.period" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input class="form-control" id="InterestFreePeriod"
						style="width: 200px">
				</div>
			</div>
		</div>


		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.repayment.strategy" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="RepaymentStrategy" class="form-control"
						style="width: 200px">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px;">
				<div class="col-md-2" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.moratorium" />
					</label>
				</div>
				<div class="col-md-10" style="padding: 0px">
					<div class="col-md-4" style="padding: 0px">
						<div class="col-md-6" style="padding: 0px">
							<label
								style="font-size: 14px; font-weight: normal; margin-top: 5px">
								<spring:message code="group.on.principal.payment" />
							</label>
						</div>
						<div class="col-md-6" style="padding: 0px">
							<input style="width: 50px" class="form-control"
								id="OnPrincipalPayment">
						</div>
					</div>
					<div class="col-md-4" style="padding: 0px">
						<div class="col-md-6" style="padding: 0px">
							<label
								style="font-size: 14px; font-weight: normal; margin-top: 5px">
								<spring:message code="group.on.interest.payment" />
							</label>
						</div>
						<div class="col-md-6" style="padding: 0px">
							<input style="width: 50px" class="form-control"
								id="OnInterestPayment">
						</div>
					</div>
					<div class="col-md-4" style="padding: 0px">
						<div class="col-md-6" style="padding: 0px">
							<label
								style="font-size: 14px; font-weight: normal; margin-top: 5px">
								<spring:message code="group.on.arrears.aging" />
							</label>
						</div>
						<div class="col-md-6" style="padding: 0px">
							<input style="width: 50px" class="form-control"
								id="OnArrearsAging">
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 产品附加信息 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 30px; padding: 5px">
			<div class="col-md-6">
				<div class="col-md-5" style="padding: 0px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.recalculate.interest" />
					</label>
				</div>
				<div class="col-md-7" style="padding-left: 0px">
					<span id="isInterestRecalculationEnabled"></span>
				</div>
			</div>
			<div class="col-md-6">
				<div class="col-md-5" style="padding: 0px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.days.in.year" />
					</label>
				</div>
				<div class="col-md-7" style="padding-left: 0px">
					<span id="daysInYearType"></span>
				</div>
			</div>
		</div>
		<!-- 产品附加信息-2 -->
		<div id="ReCalculateInterest" style="display: none">
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<!-- 2 -->
			<div class="modal-body" style="height: 30px; padding: 5px">
				<div class="col-md-6">
					<div class="col-md-5" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.advance.payments.adjustment.type" />
						</label>
					</div>
					<div class="col-md-7" style="padding-left: 0px">
						<span id="rescheduleStrategyType"></span>
					</div>
				</div>
				<div class="col-md-6">
					<div class="col-md-5" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.days.in.month" />
						</label>
					</div>
					<div class="col-md-7" style="padding-left: 0px">
						<span id="daysInMonthType"></span>
					</div>
				</div>
			</div>
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<!-- 3 -->
			<div class="modal-body" style="height: 30px; padding: 5px">
				<div class="col-md-6">
					<div class="col-md-5" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.interest.recalculation.compounding.on" />
						</label>
					</div>
					<div class="col-md-7" style="padding-left: 0px">
						<span id="interestRecalculationCompoundingType"></span>
					</div>
				</div>
				<div class="col-md-6">
					<div class="col-md-5" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.frequency.for.recalculate.outstanding.principal" />
						</label>
					</div>
					<div class="col-md-7" style="padding-left: 0px">
						<span id="frequencyOutstanding"></span>
					</div>
				</div>
			</div>
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<!-- 4 -->
			<div class="modal-body" style="height: 30px; padding: 5px">
				<div class="col-md-6">
					<div class="col-md-5" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.frequency.interval.for.recalculation" />
						</label>
					</div>
					<div class="col-md-7" style="padding-left: 0px">
						<span id="recalculationRestFrequencyInterval"></span>
					</div>
				</div>
				<div class="col-md-6"></div>
			</div>
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<!-- 5 -->
			<div class="modal-body" style="height: 30px; padding: 5px">
				<div class="col-md-6">
					<div class="col-md-5" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.frequency.for.compounding" />
						</label>
					</div>
					<div class="col-md-7" style="padding-left: 0px">
						<span id="recalculationCompoundingFrequencyType"></span>
					</div>
				</div>
				<div class="col-md-6"></div>
			</div>
		</div>
		<!-- 产品附加信息-2 -->

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 40px; padding: 5px">
			<div class="col-md-1" style="padding: 5px">
				<label style="font-size: 16px; font-weight: normal"> <spring:message
						code="group.charges" />
				</label>
			</div>
			<div class="col-md-11" style="padding: 0px">
				<div class="col-md-3" style="padding: 0px">
					<select id="chargeOptions" class="form-control" style="width: 180">
						<option value='0'><spring:message code='group.select'/></option>
					</select>
				</div>
				<div class="col-md-1" style="padding: 0px">
				<img src="${pageContext.request.contextPath}/images/t01.png" style="CURSOR: hand" onclick="addCharge()" >
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div id="chargesTable" class="modal-body"
			style="padding: 5px; display: none">
			<table id="chargesList" style="width: 868px">
				<thead style="background-color: #EAEAEA; width: 100%">
					<th name="chargesName" style="width: 110px"><spring:message
							code="group.name" /></th>
					<th name="chargesType" style="width: 50px"><spring:message
							code="group.type" /></th>
					<th name="chargesAmount" style="width: 110px"><spring:message
							code="group.amount" /></th>
					<th name="chargesCollectionTime"><spring:message
							code="group.collection.time" /></th>
					<th name="chargesDate"><spring:message
							code="group.date" /></th>
					
					<%-- <th name="chargesRepaymentsEvery"><spring:message
							code="group.repayments.every" /></th> --%>
					<th name="chargesOption"><spring:message
							code="group.action" /></th>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<div id="overdueCharges" class="modal-body"
			style="padding: 5px; display: none; margin-top: 10px">
			<table id="overdueChargesList" style="width: 868px">
				<thead style="background-color: #EAEAEA; width: 100%">
					<th name="chargesName" style="width: 260px"><spring:message
							code="group.name" /></th>
					<th name="chargesType" style="width: 260px"><spring:message
							code="group.type" /></th>
					<th name="chargesAmount" style="width: 60px"><spring:message
							code="group.amount" /></th>
					<th name="chargesCollectionTime" style="width: 200px"><spring:message
							code="group.collection.time" /></th>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<!-- 最后的二级联动 -->
		<div class="modal-body" style="height: 40px; padding: 5px">
			<div class="col-md-1" style="padding: 1px">
				<label style="font-size: 16px; font-weight: normal"> <spring:message
						code="group.collateral" />
				</label>
			</div>
			<div class="col-md-11" style="padding: 0px">
				<div class="col-md-3" style="padding: 1px">
					<select id="collateralOptions" class="form-control">
						<option value='0'><spring:message code='group.select'/></option>
					</select>
				</div>
				<div class="col-md-3" style="padding: 1px">
					<input type="text" id="collateralValue" class="form-control"
						placeholder='Value' />
				</div>
				<div class="col-md-3" style="padding: 1px">
					<input type="text" id="collateralDescription" class="form-control"
						placeholder='Description' />
				</div>
				<div class="col-md-1" style="padding: 0px">
				<img src="${pageContext.request.contextPath}/images/t01.png" style="CURSOR: hand" onclick="addCollateral()" >
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div id="collateralTable" class="modal-body"
			style="padding: 5px; display: none">
			<table id="collateralList" style="width: 868px">
				<thead style="background-color: #EAEAEA; width: 100%">
					<th style="width: 170px"><spring:message code="group.type" /></th>
					<th style="width: 170px"><spring:message code="group.value" /></th>
					<th style="width: 200px"><spring:message
							code="group.description" /></th>
					<th style="width: 50px"><spring:message code="group.action" /></th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		</div>


		<div id="optionButton" class="text-center" style="margin-top: 20px">
			<button class="btn btn-default" data-dismiss="modal">
				<spring:message code="btn.cancle"/>
			</button>
			<button type="button" id="submite" name="submite"
				class="btn btn-primary">
				<spring:message code="btn.submit"/>
			</button>
		</div>
	</div>
	<script type="text/javascript">
	var LoanListUrl;
		$(document).ready(function() {
			$.datetimepicker();
			/* if(groupId)
				LoanListUrl = "api.v1.loans.template?activeOnly=true&groupId="
				+ groupId+ "&staffInSelectedOfficeOnly=true&templateType=group";
			if(clientId)
				LoanListUrl = "api.v1.loans.template?activeOnly=true&clientId="
						+clientId+"&staffInSelectedOfficeOnly=true&templateType=individual"
			getLoanproductOptionList();  */
			var url = "api.v1.loans."+loanId+"?associations=charges,collateral,meeting,multiDisburseDetails&staffInSelectedOfficeOnly=true&template=true";
			
			$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
							"dataType" : "GET",
							"url" : url
						},
						callback : "initInformationPage"
					});

			$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
							"dataType" : "GET",
							"url" : "api.v1.loans.template?fields=id,loanCollateralOptions&productId="+loanProductId+"&templateType=collateral"
						},
						callback : "initCollateralOptions"
					});
		});

		/* 获得产品列表 */
		/* function getLoanproductOptionList() {
			$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
							"dataType" : "GET",
							"url" : LoanListUrl
						},
						callback : "initproductOptionList"
					});
		} */

		/* function initproductOptionList(param) {
			$.setSelect('LoanProductSelectList', param.productOptions, 'id',
					'name');
			$.setSelect('LoanproductList', param.productOptions, 'id', 'name');
		} */

		/* 选择产品时的触发事件-保存选择项信息 -初始化页面信息*/
		function selectProduct() {
			var selectedValue = parseInt($("#LoanProductSelectList").find(
					"option:selected").attr("value"));
			$("#LoanproductList").val(selectedValue);
			getInformationPageContent(selectedValue);
			//changePage();
		}

		/* 选择产品时触发事件-重新初始化页面 */
		function changeLoanProduct() {
			var selectedProductId = parseInt($("#LoanproductList").find(
					"option:selected").attr("value"));
			getInformationPageContent(selectedProductId);
		}

		/* 设置隐藏产品选择页打开信息填写页 */
		/* function changePage() {
			$("#productSelectPage").remove();
			$("#informationPage").css("display", "block");
		} */

		/* 初始化信息填写页面 -每次选择产品都会进行一次初始化*/
		function getInformationPageContent(productId) {
			var LoanProductDetail;
			if(groupId)
				LoanProductDetail = "api.v1.loans.template?activeOnly=true&groupId="
					+ groupId
					+ "&productId="
					+ productId
					+ "&staffInSelectedOfficeOnly=true&templateType=group";
			if(clientId)
				LoanProductDetail = "api.v1.loans.template?activeOnly=true&clientId="+clientId+"&productId="
						+ productId+"&staffInSelectedOfficeOnly=true&templateType=individual";
		$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"url" : LoanProductDetail
					},
					callback : "initInformationPage"
				});

		$
				.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"url" : "api.v1.loans.template?fields=id,loanCollateralOptions&productId="+productId+"&templateType=collateral"
					},
					callback : "initCollateralOptions"
				});
	}
				

		/* 初始化抵押品select */
		function initCollateralOptions(param) {
			$.setSelect('collateralOptions', param.loanCollateralOptions, 'id',
					'name');
		}

		/* 初始化页面的select及其他 */
		function initInformationPage(param) {
			/*贷款产品*/
			$("#LoanproductList").empty();
			$.setSelect('LoanproductList',param.productOptions,'id','name');
			$('#LoanproductList option[value="' + param.loanProductId + '"]').attr('selected', true);
			/* 贷款职员 */
			$("#loanOfficer").empty();
			$.setSelect('loanOfficer', param.loanOfficerOptions, 'id',
					'displayName');
			/* 贷款目的 */
			$("#loanPurpose").empty();
			$.setSelect('loanPurpose', param.loanPurposeOptions, 'id', 'name');

			/*时间*/
			if(typeof param.timeline.expectedDisbursementDate != 'undefnied'){
				param.timeline.expectedDisbursementDate = $.formatDate(param.timeline.expectedDisbursementDate);
				$.assign({
					'disbursementOn' : param.timeline.expectedDisbursementDate
				})
			}
			
			/* 贷款基金*/
			$("#fund").empty();
			$.setSelect('fund', param.fundOptions, 'id', 'name');
			$("#fund").val(param.fundId);
			/* 设置会议信息 */
			initCalendarOptions(param);
			/* 连接储蓄*/
			$.setSelect('linkSaving', param.accountLinkingOptions, 'id',
					'productName');
			/* ------条款---- */
			/* 条款1-1贷款本金 */
			$("#principal").val(param.principal);
			/* 条款1-2.1贷款期限 */
			$("#loanTerm").val(param.termFrequency);
			/* 条款1-2.2贷款期限 */
			$("#termFrequencyTypeOptions").empty();
			$.setSelect('termFrequencyTypeOptions',
					param.termFrequencyTypeOptions, 'id', 'value');
			$("#termFrequencyTypeOptions")
					.val(param.termPeriodFrequencyType.id);
			/* 条款2-1还款金额 */
			$("#numberOfRepayments").val(param.numberOfRepayments);
			/* 条款2-2.1每笔金额 */
			$("#repaidEver").val(param.product.repaymentEvery);
			/* 条款2-2.2每笔金额 */
			$("#repaidEverList").empty();
			$.setSelect('repaidEverList', param.repaymentFrequencyTypeOptions,
					'id', 'value');
			$("#repaidEverList").val(param.product.repaymentFrequencyType.id);
			/* 条款2-2.3第几周 */
			$.setSelect('repaymentFrequencyNthDayType',
					param.repaymentFrequencyNthDayTypeOptions, 'id', 'value');
			/* 条款2-2.4星期几 */
			$.setSelect('repaymentFrequencyDayOfWeekType',
					param.repaymentFrequencyDaysOfWeekTypeOptions, 'id',
					'value');
			/* 条款4-1名义利率 */
			$("#nominalInterestRate").val(param.product.interestRatePerPeriod);
			/* 条款4-2实际利息计算方法 */
			$("#interestMethod").empty();
			$.setSelect('interestMethod', param.interestTypeOptions, 'id',
					'value');
			$("#interestMethod").val(param.interestType.id);
			/* 条款5-1分期偿还 */
			$("#amortization").empty();
			$.setSelect('amortization', param.amortizationTypeOptions, 'id',
					'value');
			$("#amortization").val(param.amortizationType.id);
			/* 条款6-1利息计算期 */
			$("#interestCalculationPeriod").empty();
			$.setSelect('interestCalculationPeriod',
					param.interestCalculationPeriodTypeOptions, 'id', 'value');
			$("#interestCalculationPeriod").val(
					param.interestCalculationPeriodType.id);
			/* 条款7-1拖欠宽限 */
			$("#arrearsTolerance").val(param.inArrearsTolerance);
			/* 条款7-2 免息期 */
			$("#InterestFreePeriod").val(param.graceOnInterestCharged);
			/* 条款8-1还款策略 */
			$("#RepaymentStrategy").empty();
			$.setSelect('RepaymentStrategy',
					param.transactionProcessingStrategyOptions, 'id', 'name');
			$("#RepaymentStrategy").val(param.transactionProcessingStrategyId);
			/* 条款8-2.1主要付款 */
			$("#OnPrincipalPayment").val(param.graceOnPrincipalPayment);
			/* 条款8-2.2利息支付*/
			$("#OnInterestPayment").val(param.graceOnInterestPayment);
			/* 条款8-2.3拖欠期限*/
			$("#OnArrearsAging").val(param.graceOnArrearsAgeing);

			/* 设置下部信息 */
			var product = param.product;
			if (typeof (product) != "undefined") {
				/* 1-1 */
				var isInterestRecalculationEnabled = product.isInterestRecalculationEnabled;
				$("#isInterestRecalculationEnabled").text(
						isInterestRecalculationEnabled);
				/* 1-2 */
				var daysInYearType = product.daysInYearType.value;
				$("#daysInYearType").text(daysInYearType);
				/* 2-2 */
				var daysInMonthType = product.daysInMonthType.value;
				$("#daysInMonthType").text(daysInMonthType);
				var interestRecalculationData = product.interestRecalculationData;
				if (typeof (interestRecalculationData) != "undefined") {
					display("ReCalculateInterest");
					/* 2-1 */
					var rescheduleStrategyType = interestRecalculationData.rescheduleStrategyType.value;
					$("#rescheduleStrategyType").text(rescheduleStrategyType);
					/* 3-1 */
					var interestRecalculationCompoundingType = interestRecalculationData.interestRecalculationCompoundingType.value;
					$("#interestRecalculationCompoundingType").text(
							interestRecalculationCompoundingType);
					/* 3-2 */
					var recalculationRestFrequencyType = interestRecalculationData.recalculationRestFrequencyType.value;
					var recalculationRestFrequencyNthDay = interestRecalculationData.recalculationRestFrequencyNthDay.value;
					var recalculationRestFrequencyWeekday = interestRecalculationData.recalculationRestFrequencyWeekday.value;
					var frequencyOutstanding = recalculationRestFrequencyType
							+ " on " + recalculationRestFrequencyNthDay + " "
							+ recalculationRestFrequencyWeekday;

					$("#frequencyOutstanding").text(frequencyOutstanding);
					/* 4-1 */
					var recalculationRestFrequencyInterval = interestRecalculationData.recalculationRestFrequencyInterval;
					$("#recalculationRestFrequencyInterval").text(
							recalculationRestFrequencyInterval);
					/* 5-1 */
					var recalculationCompoundingFrequencyType = interestRecalculationData.recalculationCompoundingFrequencyType.value;
					$("#recalculationCompoundingFrequencyType").text(
							recalculationCompoundingFrequencyType);
				}
			}
			/* 收费初始化 */
			$("#chargesList tbody").html("");
			addPristinecharge(param.charges);
			showTable("chargesTable");
			setSubmmitMargin("chargesTable");
			$.setSelect('chargeOptions', param.chargeOptions, 'id', 'name');
			/* 逾期费用初始化 overdueCharges*/
			initOverdueCharges(param.overdueCharges);
			checkMonth();
		}

		/* 设置会议信息 */
		function initCalendarOptions(param) {
			var calendarOptions = param.calendarOptions;
			if (typeof (calendarOptions) != "undefined") {
				display("Metting");
				for (var i = 0; i < calendarOptions.length; i++) {
					var humanReadable = calendarOptions[i].humanReadable;
					var startDate = calendarOptions[i].startDate;
					appendMetting(humanReadable, startDate);
				}
			}
		};
		/* 显示特定ID内容 */
		function display(ID) {
			$("#" + ID).css("display", "block");
		}
		/* 增加会议 */
		function appendMetting(humanReadable, startDate) {
			$("#addMettingPanel")
					.append(
							"<hr style='margin-top: 5; margin-bottom: 5; width: 868px'>"
									+ "<div class='modal-body' style='height: 53px; padding: 5px'>"
									+ "<div class='col-md-6' style='padding: 5px'>"
									+ "<div class='col-md-4' style='padding: 5px'>"
									+ "<label style='padding-top: 3px; font-size: 16px; font-weight: normal'>"
									+ "<spring:message code='group.start.date'/>"
									+ "</label></div><div style='padding-left: 0px'><span id='startDate'>"
									+ startDate
									+ "</span></div></div><div class='col-md-6' style='padding: 5px'>"
									+ "<div class='col-md-4' style='padding: 5px'>"
									+ "<label style='padding-top: 3px; font-size: 16px; font-weight: normal'>"
									+ "<spring:message code='group.repeat' />"
									+ "</label></div><div  style='padding-left: 0px'>"
									+ "<span id='repeatsOn'>" + humanReadable
									+ "</span></div></div></div>");
		}

		/* 增加收费按钮触发事件 -搜索数据*/
		function addCharge() {
			var selectedCharge = parseInt($("#chargeOptions").find(
					"option:selected").attr("value"));
			if (selectedCharge > 0) {
				$("#chageTable").css("display", "block");
				$("#optionButton").css("margin-top", "180px");
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"url" : "api.v1.charges." + selectedCharge
								+ "?template=true"
					},
					callback : "addChargeView"
				});
			}
		}

		/* 根据每笔还款时间判断要不要显示月中周，周中日选择框 */
		function checkMonth() {
			var selectedTimeUnit = parseInt($("#repaidEverList").find(
					"option:selected").attr("value"));
			if (selectedTimeUnit == 2) {
				$("#detailTime").css("display", "block");
			} else {
				$("#detailTime").css("display", "none");
			}
		}
		/* 增加收费按钮触发事件 -准备数据*/
		function addChargeView(param) {
			var name = param.name;
			var type = param.chargeCalculationType.value;
			var collection = param.chargeTimeType.value;
			var amount = param.amount;
			var id = param.id;
			apendChargesList(id, name, type, collection, amount);
			$("#chargeOptions").val(0);
			showTable("chargesTable");
			setSubmmitMargin("chargesTable");
		}

		/* 删除charges */
		function deleteCharge(id) {
			$("#chage" + id).remove();
			showTable("chargesTable");
			setSubmmitMargin("chargesTable");
			s
		}

		/* 添加附加的charge */
		function addPristinecharge(charges) {
			if (charges == null) {
				return 0;
			}
			for (var i = 0; i < charges.length; i++) {
				var name = charges[i].name;
				var amount = charges[i].amount;
				var id = charges[i].chargeId;
				var type = charges[i].chargeCalculationType.value;
				var collection = charges[i].chargeTimeType.value;
				apendChargesList(id, name, type, collection, amount);
			}
			showTable("chargesTable");
			setSubmmitMargin("chargesTable");
		}

		/* 逾期费用初始化 overdueCharges*/
		function initOverdueCharges(overdueCharges) {
			$("#overdueChargesList tbody").html("");
			if (typeof (overdueCharges) == "undefined")
				return 0;
			for (var i = 0; i < overdueCharges.length; i++) {
				var id = overdueCharges[i].id;
				var name = overdueCharges[i].name
						+ overdueCharges[i].currency.displaySymbol;
				var type = overdueCharges[i].chargeCalculationType.value;
				var amount = overdueCharges[i].amount;
				var collection = overdueCharges[i].chargeTimeType.value;
				appendOverdueCharges(id, name, type, amount, collection);
			}
			showTable("overdueCharges");
		}

		/* 添加逾期费用view */
		function appendOverdueCharges(id, name, type, amount, collection) {
			$("#overdueChargesList").append(
					"<tr id = 'overdueCharges"+id+"'>" + "<td><span>" + name
							+ "</span></td>" + "<td><span>" + type
							+ "</span></td>" + "<td><span>" + amount
							+ "</span></td>" + "<td><span>" + collection
							+ "</span></td>" + "</tr>");
		}

		/* 判断是否显示收费表头 */
		function showTable(id) {
			var length = $("#" + id).find("tr").length - 1;
			if (length > 0) {
				$("#" + id).css("display", "block");
			} else {
				$("#" + id).css("display", "none");
			}
		}

		/* 判断submmite的margin值 */
		function setSubmmitMargin(id) {
			var length = $("#" + id).find("tr").length - 1;
			if (length > 0) {
				$("#optionButton").css("margin-top", "180px");
			} else {
				$("#optionButton").css("margin-top", "20px");
			}
		}

		/* 增加收费按钮触发事件 -添加视图*/
		function apendChargesList(id, name, type, collection, amount) {
			/* 判断是否显示时间控件和还款输入框 */
			var collectionTime = "none";
			var collectionPrice = "none";
			if (collection == "Specified due date") {
				collectionTime = "block";
			}
			if (collection == "Monthly Fee") {
				collectionTime = "block";
				collectionPrice = "block";
			}
			if (collection == "Weekly Fee") {
				collectionTime = "block";
				collectionPrice = "block";
			}

			$("#chargesList")
					.append(
							"<tr id='chage"+id+"' name='chage'>"
									+ "<td style='width:50px'>"
									+ name
									+ "<input value='"+id+"' style='display:none'>"
									+ "</td>"
									+ "<td>"
									+ type
									+ "</td>"
									+ "<td><input id='chargesAmount"+id+"' placeholder='金额' style='width: 100px' value='"+amount+"'></td>"
									+ "<td class='ng-binding'>"
									+ collection
									+ "</td>"
									+ "<td><div><input id='date' name='date' type='text' datetype='date' local-date='true'></div></td>"
									/* + "<td><div  style='display:"+collectionTime+"' ><input id='date' name='date' local-date='true'></div></td>" */
									/* + "<td><input value='' style='display:"+collectionPrice+"'></td>" */
									+ "<td><input name='submit' style='margin-top:4px' onclick='deleteCharge("
									+ id
									+ ")'"
									+ "	type='image' src='${pageContext.request.contextPath}/images/t03.png' /></td>"
									+ "</tr>");
			$.datetimepicker();
			$(".datetimepicker-inline").remove(); 
		}

		/* 添加抵押品按钮触发事件 -显示表格添加View*/
		function addCollateral() {
			var selectedCollateralValue = parseInt($("#collateralOptions")
					.find("option:selected").attr("value"));
			var selectedCollateralText = $("#collateralOptions").find(
					"option:selected").html();
			var collateralValue = $("#collateralValue").val();
			var collateralDescription = $("#collateralDescription").val();
			if (selectedCollateralValue > 0 && collateralValue != "") {
				if ($("#collateralTable").attr("display") != "block")
					$("#collateralTable").css("display", "block");
				addCollateralView(selectedCollateralValue,
						selectedCollateralText, collateralValue,
						collateralDescription);
				$("#collateralOptions").val(0);
			}
		}

		/* 添加抵押品的View */
		function addCollateralView(id, selectedCollateralText, collateralValue,
				collateralDescription) {
			$("#collateralList")
					.append(
							"<tr id='collateral"+id+"' name='collateral'>"
									+ "<td><input type='text' class='form-control' readonly='readonly' value='"+ selectedCollateralText +"' style='margin:5px;width: 170px'></td>"
									+ "<td><input type='text' class='form-control' value='"+ collateralValue +"' style='margin:5px;width: 170px'></td>"
									+ "<td><input type='text' class='form-control' value='"+ collateralDescription +"' style='margin:5px;width: 200px'></td>"
									+ "<td><input type='text' class='form-control' value='"+ id +"' style='margin:5px;width: 200px;display:none'></td>"
									+ "<td><input name='submit' style='margin-top: 4px'onclick='deleteCollateral("
									+ id
									+ ")' type='image' src='${pageContext.request.contextPath}/images/t03.png'/></td>"
									+ "</tr>");
		}

		/* 删除抵押品View */
		function deleteCollateral(id) {
			$("#collateral" + id).remove();
			var collateralList = $("tr[name='collateral']");
			if (collateralList.length < 1) {
				$("#collateralTable").css("display", "none");
			}
		}

		/*  保存申请 -封装费用成json*/
		function IntergrationCharges() {
			var json = [];
			$("#chargesList").find("tr").each(function() {
				var tdArr = $(this).children();
				var id = tdArr.eq(0).find('input').val();//id
				var Amount = tdArr.eq(2).find('input').val();//金额
				var chargeName = tdArr.eq(3).text();//类型
				var date = tdArr.eq(4).find('input').val();//日期
				var quota = tdArr.eq(5).find('input').val();//额度

				var dd = {};
				dd.chargeId = id + "";
				dd.amount = Amount + "";
				if (chargeName == "Specified due date") {
					dd.dueDate = date;
				}
				if (chargeName == "Monthly Fee" || chargeName == "Weekly Fee") {
					dd.feeInterval = quota;
					dd.dueDate = date;
				}
				json.push(dd);
			});
			return json;
		}

		/* 保存申请-将抵押品信息封装成json */
		function IntergrationCollateral() {
			var json = [];
			$("#collateralList").find("tr").each(function() {
				var tdArr = $(this).children();
				var dd = {};
				dd.type = tdArr.eq(3).find('input').val();//类型id
				var value = tdArr.eq(1).find('input').val();//价值
				var description = tdArr.eq(2).find('input').val();//描述
				dd.value = value + "";
				if (description != "") {
					dd.description = description + "";
				}
				json.push(dd);
			});
			return json;
		}
		/* 获取全部参数的值 */
		function getAllValue(json) {
			/* 1-2 loanOfficerId*/
			addValue("loanOfficerId", $.getSelectedValue("loanOfficer"), json);
			/* 2-1 loanPurposeId*/
			addValue("loanPurposeId", $.getSelectedValue("loanPurpose"), json);
			/* 2-2 fundId*/
			addValue("fundId", $.getSelectedValue("fund"), json);
			/* 4-1 externalId*/
			addValue("externalId", $.getInputValue("externalId"), json);
			/* 5 syncDisbursementWithMeeting*/
			/* 5-1 */
			/* $.judgeCheckbox("syncRepayments"); */
			/* 5-2 */
			/* $.judgeCheckbox("syncDisbursement"); */
			addValue("syncDisbursementWithMeeting", $
					.judgeCheckbox("syncDisbursement"), json);
			/* 6-1 linkAccountId*/
			addValue("linkAccountId", $.getSelectedValue("linkSaving"), json);
			/* 6-2 createStandingInstructionAtDisbursement*/
			addValue("createStandingInstructionAtDisbursement", $
					.judgeCheckbox("makePaymentInstructions"), json);
			/* 8-2.3 repaymentFrequencyNthDayType*/
			addValue("repaymentFrequencyNthDayType", $
					.getSelectedValue("repaymentFrequencyNthDayType"), json);
			/* 8-2.4 repaymentFrequencyDayOfWeekType*/
			addValue("repaymentFrequencyDayOfWeekType", $
					.getSelectedValue("repaymentFrequencyDayOfWeekType"), json);
			/* 9-1 repaymentsStartingFromDate*/
			addValue("repaymentsStartingFromDate", $(
					'input[name="firstRepaymentOn"]').val(), json);
			/* 9-2 interestChargedFromDate*/
			addValue("interestChargedFromDate", $(
					'input[name="interestChargedFrom"]').val(), json);
			/* 13-1 inArrearsTolerance*/
			addValue("inArrearsTolerance", parseInt($
					.getInputValue("arrearsTolerance")), json);
			/* 13-2 graceOnInterestCharged*/
			addValue("graceOnInterestCharged", parseInt($
					.getInputValue("InterestFreePeriod")), json);
			/* 14-2.1 graceOnPrincipalPayment*/
			addValue("graceOnPrincipalPayment", parseInt($
					.getInputValue("OnPrincipalPayment")), json);
			/* 14-2.2 graceOnInterestPayment*/
			addValue("graceOnInterestPayment", parseInt($
					.getInputValue("OnInterestPayment")), json);
			/* 14-2.3 graceOnArrearsAgeing*/
			addValue("graceOnArrearsAgeing", parseInt($
					.getInputValue("OnArrearsAging")), json);
		}

		/* 保存申请 -整合填入的参数*/
		function IntegrationParameter() {
			var json = {
				"calendarId" : 18,
				/* 12-2 */
				"allowPartialPeriodInterestCalcualtion" : $
						.judgeCheckbox("calculateInterests"),
				/* 11-1 */
				"amortizationType" : $.getSelectedValue("amortization"),
				"dateFormat" :  $('input[name="interestChargedFrom"]').attr('date-format'),
				"disbursementData" : [],
				/* 3-2 */
				"expectedDisbursementDate" : $.value("disbursementOn"),
				"groupId" : groupId,
				/* 12-1 */
				"interestCalculationPeriodType" : $
						.getSelectedValue("interestCalculationPeriod"),
				/* 10-1 */
				"interestRatePerPeriod" : parseInt($
						.getInputValue("nominalInterestRate")),
				/* 10-2 */
				"interestType" : $.getSelectedValue("interestMethod"),
				/* 7-2.1 */
				"loanTermFrequency" : parseInt($.getInputValue("loanTerm")),
				/* 7-2.2 */
				"loanTermFrequencyType" : $
						.getSelectedValue("termFrequencyTypeOptions"),
				"loanType" : "group",
				"locale" : "zh_CN",
				/* 8-1 */
				"numberOfRepayments" : parseInt($
						.getInputValue("numberOfRepayments")),
				/* 7-1 */
				"principal" : parseInt($.getInputValue("principal")),
				/* 1-1 */
				"productId" : $.getSelectedValue("LoanproductList"),
				/* 8-2.1 */
				"repaymentEvery" : parseInt($.getInputValue("repaidEver")),
				/* 8-2.2 */
				"repaymentFrequencyType" : $.getSelectedValue("repaidEverList"),
				/* 3-1 */
				"submittedOnDate" : $.value("submittedOn"),
				/* 14-1 */
				"transactionProcessingStrategyId" : $
						.getSelectedValue("RepaymentStrategy")
			}
			var charges = IntergrationCharges();
			charges.shift();
			var collateral = IntergrationCollateral();
			collateral.shift();
			if (charges.length > 0)
				json.charges = charges;
			if (collateral.length > 0)
				json.collateral = collateral;
			getAllValue(json)
			return json;
		}

		/* 如果值不为空就将值放到json中 */
		function addValue(key, value, json) {
			if (value != "" && typeof (value) != "undefined") {
				json[key] = value;
			}
		}

		/* 保存申请-提交请求 */
		function savingsAccounts(json) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "POST",
				data : {
					"dataType" : "PUT",
					"mydata" : json,
					"url" : "api.v1.loans"
				},
				callback : "savingLoanSuccess"
			});
		}
		
		function savingLoanSuccess() {
			//$.bAlert('<spring:message code="group.submitted.successfully"/>');
			$.setReadOnly("loanClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param != ''){
				var loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId;
			}
		}

		/* 保存请求-单击保存按钮的触发事件 */
		$("#submite").click(function() {
			var json = IntegrationParameter();
			savingsAccounts(json);
		});
	</script>
</body>
</html>