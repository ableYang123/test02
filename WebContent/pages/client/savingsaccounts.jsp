<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="background-color: f8f8f8;font-size: small;color: #666F73;">
	<br><br>

	<ol class="breadcrumb" style="font-size: medium;">
		<li style="display: none"></li>
	   <!--  <a href="#" id="clientName"></a></li> -->
	    <li><a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><span id="clientName"></span></a></li>
	    <li class="active" id="savingsProductName2"></li>
	</ol>

	<div class="card" >
		<br>
		<div style="margin-left: 0%">
			<span style="margin-left: 10px;font-size: 24px">
				<i class="fa fa-stop" id="statusIcon"></i>
				<strong id="savingsProductName">
				</strong>
			</span>
		</div>
			<br>
		<div id="pending">
			<div style="position: relative;min-height: 1px;padding-left: 15px;padding-right: 15px;">
				<div style="float: right !important;position: relative;display: inline-block;vertical-align: middle;">
					<a class="btn btn-primary" style="background-color:#4f99ed" id="modifyApplication"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><spring:message code="client.savingaccount.modifyApplication"/></a>
					<a class="btn btn-primary" style="background-color:#4f99ed" id="approve"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span><spring:message code="client.savingaccount.approve"/></a>
					<a class="btn btn-primary assignStaffSA" style="background-color:#4f99ed" id="assignStaffPend"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.assignStaff"/></a>
					<a class="btn btn-primary unassignStaffSA" style="background-color:#4f99ed" id="unassignStaffPend"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.unassignStaff"/></a>
					<span class="dropdown" >
						<a style="background-color:#4f99ed" class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						  <spring:message code="lable.more"/>
						  <span class="caret"></span>
						</a>
						<ul class="dropdown dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
							<li><a style='cursor:pointer;' id="rejectAccount"><spring:message code="client.savingaccount.reject"/></a></li>
							<li><a style='cursor:pointer;' id="withdrawnByApplicant"><spring:message code="client.savingaccount.withdrawnByClient"/></a></li>
							<li><a style='cursor:pointer;' id="addChargesPed"><spring:message code="client.savingaccount.addCharges"/></a></li>
							<li><a style='cursor:pointer;' id="deleteAccount"><spring:message code="client.savingaccount.delete"/></a></li>
						</ul>
					</span>
					
				</div>	
			</div>
			<br>
			<div style="margin-left: -1px;margin-right: 1px;position: relative ;">
				<div class="col-sm-7 col-md-7 ng-bliding">
					<table class="table table-striped table-bordered" >
						<tr>
							<th style="width: 30%"><spring:message code="client.savingaccount.activatedOn"/></th>
							<td><span id="activatedIn"><spring:message code="client.savingaccount.notActivated"/> </span></td>
						</tr>
						<tr>
							<th><spring:message code="client.savingaccount.currency"/></th>
							<td><span id="currency"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="client.savingaccount.externalId"/></th>
							<td><span id="outsideId"> </span></td>
						</tr>
					</table>
				</div>
				
				<div class="col-sm-5 col-md-5">
					<table class="table table-striped table-bordered" >
						<tr>
							<th style="width: 30%"><spring:message code="client.savingaccount.fieldOffice"/></th>
							<td><span id="fieldOffice"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="client.savingaccount.balance"/></th>
							<td><span id="accountBalance"> </span></td>
						</tr>
					
					</table>
					<br>
				</div>
			</div>
		</div>
		
		
		
		<div id="active">
		
			<div class="col-sm-12 col-md-12 primarydiv">
				<div class="pull-right btn-group" id="activeBtnGroup">
					<a class="btn btn-primary" style="background-color:#4f99ed" id="postInterestAsOn"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span><spring:message code="client.savingaccount.postInterestAsOn"/></a>
					<a class="btn btn-primary" style="background-color:#4f99ed" id="deposit"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span><spring:message code="client.savingaccount.deposit"/></a>
					<a class="btn btn-primary" style="background-color:#4f99ed" id="withdrawal"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span><spring:message code="client.savingaccount.actWithdrawl"/></a>
					<a class="btn btn-primary" style="background-color:#4f99ed" id="calculateInterest"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><spring:message code="client.savingaccount.calculateInterest"/></a>
					<a class="btn btn-primary assignStaffSA" style="background-color:#4f99ed" id="assignStaffAct"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.assignStaff"/></a>
					<a class="btn btn-primary unassignStaffSA" style="background-color:#4f99ed" id="unassignStaffAct"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.unassignStaff"/></a>
					<span class="btn-group dropdown" >
						<a style="margin-bottom: 4px;background-color:#4f99ed" class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						  <spring:message code="lable.more"/>
						  <span class="caret"></span>
						</a>
						<ul class="dropdown dropdown-menu dropdown-menu-right">
							<li><a style='cursor:pointer;' id="postInterest"><spring:message code="client.savingaccount.postInterest"/></a></li>
							<li><a style='cursor:pointer;' id="addChargesAct"><spring:message code="client.savingaccount.addCharges"/></a></li>
							<li><a style='cursor:pointer;' id="close"><spring:message code="client.savingaccount.close"/></a></li>
							<li><a style='cursor:pointer;' id="transferFunds"><spring:message code="client.savingaccount.transferFunds"/></a></li>
							<li><a style='cursor:pointer;display: none' id="disableWithholdTax"><spring:message code="client.savingaccount.disableWithholdTax"/></a></li>
							<li><a style='cursor:pointer;display: none' id="enableWithholdTax"><spring:message code="client.savingaccount.enableWithholdTax"/></a></li>
						</ul>
					</span>
				</div>
				<div class="pull-right btn-group" id="approvedBtnGroup">
					<a class="btn btn-primary" style="background-color:#4f99ed" id="undoapproval"><span class="glyphicon glyphicon-ban-circle" 	="true"></span><spring:message code="client.savingaccount.undoapproval"/></a>
					<a class="btn btn-primary" style="background-color:#4f99ed" id="activeAccount"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span><spring:message code="client.savingaccount.activeAccount"/></a>
					<a class="btn btn-primary" style="background-color:#4f99ed" id="addChargesApp"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><spring:message code="client.savingaccount.addCharges"/></a>
					<a class="btn btn-primary assignStaffSA" style="background-color:#4f99ed" id="assignStaffApp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.assignStaff"/></a>
					<a class="btn btn-primary unassignStaffSA" style="background-color:#4f99ed" id="unassignStaffApp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.unassignStaff"/></a>
				</div>
				<div class="pull-right btn-group" id="transfBtnGroup">
					<a class="btn btn-primary assignStaffSA" style="background-color:#4f99ed" id="assignStaffTBG"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.assignStaff"/></a>
					<a class="btn btn-primary unassignStaffSA" style="background-color:#4f99ed" id="unassignStaffTBG"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><spring:message code="client.savingaccount.unassignStaff"/></a>
				</div> 
				
				
				
				<div class="col-md-12">
	                <h3 id="totalDeposits"><spring:message code="client.savingaccount.currentBalance"/></h3>
	                <h3 id="accountBalance2"><spring:message code="client.savingaccount.availableBalance"/></h3>
            	</div>
            	<div class="row" style="margin-left:-1px;margin-right: 1px;">
            		<div class="col-sm-7 col-md-7 ng-binding">
            			<table class="table table-bordered view-table">
		            			<tr id="totalWithdrawals" class="ng-hide">
									 <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalWithdrawals"/>
                                    </th>
                                    <td><span class="totalWithdrawals"></span>
                                    </td>
                                </tr>
                                <tr id="totalWithdrawalFees" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalWithdrawalFees"/>
                                    </th>
                                    <td><span class="totalWithdrawalFees"></span>
                                    </td>
                                </tr>
                                <tr id="totalAnnualFees" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalAnnualFees"/>
                                    </th>
                                    <td><span class="totalAnnualFees"></span>
                                    </td>
                                </tr>
                                <tr id="totalInterestEarned" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalInterestEarned"/>
                                    </th>
                                    <td><span class="totalInterestEarned"></span>
                                    </td>
                                </tr>
                                <tr id="totalInterestPosted" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalInterestPosted"/>
                                    </th>
                                    <td><span class="totalInterestPosted"></span>
                                    </td>
                                </tr>
                                <tr id="interestNotPosted" class="ng-hide">
                                	<th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.interestNotPosted"/>
                                    </th>
                                    <td><span class="interestNotPosted"></span>
                                    </td>
                                </tr>
                                <tr id="totalOverdraftInterestDerived" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalOverdraftInterestDerived"/>
                                    </th>
                                    <td><span class="totalOverdraftInterestDerived"></span>
                                    </td>
                                </tr>

                                <tr id="interestNotPosted2" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.notPostedOverdraftInterest"/>
                                    </th>
                                    <td><span class="interestNotPosted2"></span>
                                    </td>
                                </tr>

                                <tr id="nominalAnnualInterestRate" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.nominalAnnualInterestRate"/></th>
                                    <td><span class="nominalAnnualInterestRate"></span>
                                    </td>
                                </tr>
                                <tr id="interestCompoundingPeriodType" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.interestCompoundingPeriodType"/>
                                    </th>
                                    <td><span class="interestCompoundingPeriodType"></span>
                                    </td>
                                </tr>
                                <tr id="interestPostingPeriodType" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.interestPostingPeriodType"/>
                                    </th>
                                    <td><span class="interestPostingPeriodType"></span>
                                    </td>
                                </tr>
                                <tr id="interestCalculationType" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.interestCalculationType"/>
                                    </th>
                                    <td><span class="interestCalculationType"></span>
                                    </td>
                                </tr>
                                <tr id="interestCalculationDaysInYearType" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.interestCalculationDaysInYearType"/>
                                    </th>
                                    <td><span class="interestCalculationDaysInYearType"></span>
                                    </td>
                                </tr>
                                
                                <tr id="withdrawalFee" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.withdrawalFee"/>
                                    </th>
                                    <td><span class="withdrawalFee"></span>
                                    </td>
                                </tr>
                                <tr id="lastActiveTransactionDate" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.lastActiveTransactionDate"/>
                                    </th>
                                    <td><span class="lastActiveTransactionDate"></span>
                                    </td>
                                </tr>
                                
                                <tr id="subStatus"class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.subStatus"/>
                                    </th>
                                    <td><span class="subStatus"></span>
                                    </td>
                                </tr>
                                
                                <tr id="daysToInactive" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.daysToInactive"/>
                                    </th>
                                    <td><span class="daysToInactive"></span>
                                    </td>
                                </tr>
                                
                                <tr id="daysToDormancy" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.daysToDormancy"/>
                                    </th>
                                    <td><span class="daysToDormancy"></span>
                                    </td>
                                </tr>
                                <tr id="daysToEscheat" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.daysToEscheat"/>
                                    </th>
                                    <td><span class="daysToEscheat"></span>
                                    </td>
                                </tr>
                                
                                
                                <tr id="annualFee" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.annualFee"/></th>
                                    <td><span class="annualFee"></span>
                                    </td>
                                </tr>
                                
                                
                                
                                <tr id="overdraftLimit" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.overdraftLimit"/>
                                    </th>
                                    <td><span class="overdraftLimit"></span>
                                    </td>
                                </tr>
                                <tr id="minRequiredOpeningBalance" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding">
                                        <spring:message code="client.savingaccount.minRequiredOpeningBalance"/>
                                    </th>
                                    <td><span class="minRequiredOpeningBalance"></span>
                                    </td>
                                </tr>
                                <tr id="minRequiredInterestCalculation" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding">
                                       <spring:message code="client.savingaccount.minRequiredInterestCalculation"/>
                                    </th>
                                    <td><span class="minRequiredInterestCalculation"></span>
                                    </td>
                                </tr>
                                <tr id="enforceMinRequiredBalance" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding">
                             <spring:message code="client.savingaccount.enforceMinRequiredBalance"/>
                                    </th>
                                    <td><span class="enforceMinRequiredBalance"></span>
                                    </td>
                                </tr>
                                <tr id="enforceMinRequiredBalance2" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"> <spring:message code="client.savingaccount.MinRequiredBalance"/>
                                    </th>
                                    <td><span class="enforceMinRequiredBalance2"></span>
                                    </td>
                                </tr>
                                <tr id="lastInterestCalculationDate" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding">
                                    <spring:message code="client.savingaccount.lastInterestCalculationDate"/>
                                    </th>
                                    <td><span class="lastInterestCalculationDate"></span>
                                    </td>
                                </tr>
                                
<!--                                 <tr ng-show="showonhold" class="ng-hide"> -->
<!--                                     <th class="table-bold-acc fontnormal ng-binding"> On Hold Funds -->
<!--                                     </th> -->
<!--                                     <td><span class="padded-td"> -->
<!--                                      <a class="btn-link ng-binding" has-permission="READ_SAVINGSACCOUNT" href="#/viewonholdtransactions/128/viewsavingaccount/128"> -->
                                         
<!--                                      </a> -->
<!--                                     </span></td> -->
<!--                                 </tr> -->
                                
                                <tr id="withHoldTax" class="ng-hide">
                                    <th class="table-bold-acc fontnormal ng-binding"> <spring:message code="client.savingaccount.withHoldTax"/>
                                    </th>
                                    <td><span class="withHoldTax"></span></td>
                                </tr>
                            </tbody></table>
            			</table>
            		</div>
            		
            		
            		<div class="col-sm-5 col-md-5">
            			<table class="table table-bordered table-striped">
            				<tr>
                            	<th colspan="2"><center class="ng-binding"><spring:message code="client.savingaccount.savingsDetil"/></center></th>
                       		</tr>
            				 <tr>
                           		<th class="ng-binding"><spring:message code="client.savingaccount.activatedOnDate"/></th>
	                            <td class="ng-binding" id="activatedOnDate"></td>
	                        </tr>
	                        <tr>
	                            <th class="ng-binding"><spring:message code="client.savingaccount.fieldOffice"/></th>
	                            <td class="ng-binding" id="fieldOfficerName">
                           	 	</td>
	                        </tr>
	                        <tr>
	                            <th class="ng-binding"><spring:message code="client.savingaccount.externalId"/></th>
	                            <td><span class="ng-binding"></span></td>
	                        </tr>
	                        <tr>
	                            <th class="table-bold-loan ng-binding"><spring:message code="client.savingaccount.currency"/></th>
	                            <td><span class="padded-td ng-binding" id="currencyName"></span></td>
	                        </tr>
	                        <tr>
	                            <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.nominalInterestRate"/></th>
	                            <td><span class="padded-td ng-binding" id="nominalAnnualInterestRate2"></span>
	                            </td>
	                        </tr>
            			
            			</table>
	
						<table class="table table-bordered table-striped" ng-show="!savingaccountdetails.status.rejected &amp;&amp; !savingaccountdetails.status.submittedAndPendingApproval">
	                        <tr>
	                            <th colspan="2"><center class="ng-binding"><spring:message code="client.savingaccount.performanceHistory"/></center></th>
	                        </tr>
	                        <tr id="totalDeposits2"  class="ng-hide">
	                            <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalDeposits"/>
	                            </th>
	                            <td><span class="totalDeposits2" ></span>
	                            </td>
	                        </tr>
	                        <tr id="totalInterestEarned2" class="ng-hide">
	                            <th class="table-bold-acc fontnormal ng-binding"><spring:message code="client.savingaccount.totalInterestEarned"/>
	                            </th>
	                            <td class="totalInterestEarned2">
	                            </td>
	                        </tr>
                    	</table>
            		
            		</div>
            		
            			
				</div>
		
			</div>
		
		
		</div>
		
		<ul class="nav nav-tabs" id="myTab" style="margin-top: 200px">
			<li class="active"><a href="#trade"><spring:message code="client.savingaccount.trade"/></a></li>
			<li><a href="#chargesT"><spring:message code="client.savingaccount.charge"/></a></li>
		</ul>
		<legend></legend>
		<div class="tab-content" id="myTabContent">
			<div id="trade" class="tab-pane active">
					<div style="box-sizing: border-box;">
						<div style="padding: 5px;display: block;box-sizing: border-box;">
							<button class="btn btn-primary pull-right" id="export" style="background-color:#4f99ed">
                     			       <spring:message code="client.savingaccount.export"/>
                     	   </button>
                      	  <button class="btn btn-primary pull-right" style="margin-right: 8px;background-color:#4f99ed" id="diary">
		                            	<spring:message code="client.savingaccount.viewJournalEntries"/>
		                  </button>
							
							
							<table class="table table-bordered table-hover" id="transactions">
								<colgroup span="4"></colgroup>
								<tr>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.id"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.transactionDate"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.transactionType"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.debit"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.credit"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.balance"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.viewReceipt"/></th>
								</tr>
							</table>
						
						
						</div>
					</div>
			</div>
			<div class="tab-pane" id="chargesT">  
				<div style="box-sizing: border-box;">
						<div style="padding: 5px;display: block;box-sizing: border-box;">

                      	  <input type="button" lable="inactive" class="btn btn-primary pull-right" style="margin-right: 8px;background-color:#4f99ed" id="activeCharges"  value="<spring:message code='client.savingaccount.inactiveCharges'/>">
		                            	
		                  
							
							
							<table class="table table-bordered  table-hover" id="chargesTable" style="font-size: small;">
								<colgroup span="4"></colgroup>
								<tr>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.name"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.feeOrPenalty"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.paymentDueAt"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.dueAsOf"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.repeatsOn"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.calculationType"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.due"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.paid"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.waived"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.outstanding"/></th>
									<th style="border-bottom-width: 2px;border: 1px solid #ddd; vertical-align: bottom;padding: 8px;line-height: 1.42587;background: #f5f5f5;text-align: left;box-sizing: border-box;"><spring:message code="client.savingaccount.actions"/></th>
								</tr>
							</table>
						
						
						</div>
			
			</div>
			
			
		</div>
		
		
	
</body>
	<script type="text/javascript">
	var savingsId = ${pd.savingsId};
	var clientId=0;
	var fromAccountType=2;
	var chargesViewId;
	var transactionId;
 	var trId;
 	var accountId;
 	var transferId;
 	var savingsAccountId;
 	var typeId;
 	var officeId='${pd.officeId}';
 	var accountStatus;
 	
 	
	$(document).ready(function(){
		
		$.datetimepicker();
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.savingsaccounts."+savingsId+"?associations=all"
				},
			callback : "callback"
		});
		
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url":"api.v1.datatables?apptable=m_savings_account"
			},
			callback : "dataTable"
		}); 
	
	
	});
	
		
	
	
	
	
	
	function callback(param){
		clientId=param.clientId;
		savingsAccountId=param.accountNo;
		$("#savingsProductName").append(param.savingsProductName+"("+param.accountNo+")");
		$("#currency").append(param.currency.name);
		
		
		//未激活表格
		if(param.fieldOfficerId==0){
			$("#fieldOffice").append("Unassigned");
		}else{
			$("#fieldOffice").append(param.fieldOfficerName);
		}
		$("#accountBalance").append(param.summary.accountBalance);
		
		
		 //外部ID
		 if(typeof(param.externalId)!="undefined"){
			  $("#outsideId").text(param.externalId);
		  }else{
			  $("#outsideId").text(" ");
		  }
		
		
		
		//激活表格
		
		//提款总额
		if(param.summary.totalWithdrawals!=undefined){
			$("#totalWithdrawals").attr("class","");
			$(".totalWithdrawals").append("$"+param.summary.totalWithdrawals);
		}
		
		//Total withdrawals fees
		if(param.summary.totalWithdrawalFees!=undefined){
			$("#totalWithdrawalFees").attr("class","");
			$(".totalWithdrawalFees").append("$"+param.summary.totalWithdrawalFees);
		}
		
		//Total annual fees
		if(param.summary.totalAnnualFees!=undefined){
			$("#totalAnnualFees").attr("class","");
			$(".totalAnnualFees").append("$"+param.summary.totalAnnualFees);
		}
		
		//Interest earned
		if(param.summary.totalInterestEarned!=undefined&&param.summary.totalInterestEarned>0){
			$("#totalInterestEarned").attr("class","");
			$(".totalInterestEarned").append("$"+param.summary.totalInterestEarned);
		}
		
		//Interest posted
		if(param.summary.totalInterestPosted!=undefined){
// 			$("#totalInterestPosted").attr("class","");
			$(".totalInterestPosted").append("$"+param.summary.totalInterestPosted);
		}
		
		//挣取未过帐的利息
		if(param.summary.interestNotPosted!=undefined&&param.summary.interestNotPosted>=0){
			$("#interestNotPosted").attr("class","");
			$(".interestNotPosted").append("$"+param.summary.interestNotPosted);
		}
		
		//Interest on overdraft
		if(param.summary.totalOverdraftInterestDerived!=undefined){
// 			$("#totalOverdraftInterestDerived").attr("class","");
			$(".totalOverdraftInterestDerived").append("$"+param.summary.totalOverdraftInterestDerived);
		}
		
		//未过帐的透支利息
		if(param.summary.interestNotPosted!=undefined&&param.summary.interestNotPosted<0){
			$("#interestNotPosted2").attr("class","");
			$(".interestNotPosted2").append("$"+param.summary.interestNotPosted);
		}
		
		//Nominal interest rate
		if(param.nominalAnnualInterestRate!=undefined){
			$("#nominalAnnualInterestRate").attr("class","");
			$(".nominalAnnualInterestRate").append(param.nominalAnnualInterestRate+"%");
		}
		
		//Interest compounding period
		if(param.interestCompoundingPeriodType.value!=undefined){
			$("#interestCompoundingPeriodType").attr("class","");
			$(".interestCompoundingPeriodType").append(param.interestCompoundingPeriodType.value);
		}
		
		//Interest posting period
		if(param.interestPostingPeriodType.value!=undefined){
			$("#interestPostingPeriodType").attr("class","");
			$(".interestPostingPeriodType").append(param.interestPostingPeriodType.value);
		}
		
		//Interest calculated using
		if(param.interestCalculationType.value!=undefined){
			$("#interestCalculationType").attr("class","");
			$(".interestCalculationType").append(param.interestCalculationType.value);
		}
		
		//年中一天#
		if(param.interestCalculationDaysInYearType.value!=undefined){
			$("#interestCalculationDaysInYearType").attr("class","");
			$(".interestCalculationDaysInYearType").append(param.interestCalculationDaysInYearType.value);
		}
		
		//Withdrawal fee 
		if(param.withdrawalFee!=undefined){
			$("#withdrawalFee").attr("class","");
			$(".withdrawalFee").append("$"+param.withdrawalFee.amount);
			
		}
		
		//Last Active Transaction Date 
		if(param.lastActiveTransactionDate!=undefined){
			$("#lastActiveTransactionDate").attr("class","");
			$(".lastActiveTransactionDate").append($.formatDate(param.lastActiveTransactionDate));
		}
		
		//子状态
		if(param.subStatus!=undefined&&param.subStatus.id==0){
			$(".subStatus").append("$"+param.subStatus.value);
		}
		
		//不活跃之前剩余日
		if(param.daysToInactive!=undefined){
			$("#daysToInactive").attr("class","");
			$(".daysToInactive").append(param.daysToInactive);
		}
		
		//days To Dormancy
		if(param.daysToDormancy!=undefined){
			$("#daysToDormancy").attr("class","");
			$(".daysToDormancy").append(param.daysToDormancy);
		}
		
		
		
		//Max Overdraft limit 
		if(param.allowOverdraft==true){
			$("#overdraftLimit").attr("class","");
			$(".overdraftLimit").append(param.overdraftLimit);
		}
		
		//Min Overdraft Required For Interest Calculation 
// 		if(param.allowOverdraft==true){
// 			$("#minRequiredOpeningBalance").attr("class","");
// 			$(".minRequiredOpeningBalance").append(param.minRequiredOpeningBalance);
// 		}
		
		//强制最低余额 、最低余额	
		if(param.enforceMinRequiredBalance==true){
			$("#enforceMinRequiredBalance").attr("class","");
			$(".enforceMinRequiredBalance").append("");
			$("#enforceMinRequiredBalance2").attr("class","");
			$(".enforceMinRequiredBalance2").append(param.minRequiredBalance);
		}
		
		//利息重新计算日期 
		if(param.summary.lastInterestCalculationDate!=undefined){
			$("#lastInterestCalculationDate").attr("class","");
			$(".lastInterestCalculationDate").append($.formatDate(param.summary.lastInterestCalculationDate));
		}
		
		//预扣税组 
		if(param.withHoldTax==true){
			$("#withHoldTax").attr("class","");
			$(".withHoldTax").append(param.taxGroup.name);
		}
		
		//Balance Required For Interest Calculation 
		if(param.minBalanceForInterestCalculation!=undefined){
			$("#minRequiredOpeningBalance").attr("class","");
			$(".minRequiredOpeningBalance").append(param.minBalanceForInterestCalculation);
		}
		
		//归还财产日期
		if(param.daysToEscheat!=undefined){
			$("#daysToEscheat").attr("class","");
			$(".daysToEscheat").append(param.daysToEscheat);
		}
		
		//年费
		if(param.annualFee!=undefined){
			$("#annualFee").attr("class","");
			$(".annualFee").append(param.annualFee);
		}
		
		
		//题头
		if(param.summary.accountBalance==undefined){
			$("#totalDeposits").append("$0");
		}else{
			$("#totalDeposits").append("$"+param.summary.accountBalance);
		}
		
		if(param.summary.availableBalance==undefined){
			$("#accountBalance2").append("$0");
		}else{
			$("#accountBalance2").append("$"+param.summary.availableBalance);
		}
		
		if(param.timeline.activatedOnDate!=undefined){
			$("#activatedOnDate").append($.formatDate(param.timeline.activatedOnDate));
		}
		
		
		if(param.summary.totalDeposits!=undefined){
			$("#totalDeposits2").attr("class","");
			$(".totalDeposits2").append("$"+param.summary.totalDeposits);
		}
		
		if(param.summary.totalInterestEarned!=undefined&&param.summary.totalInterestEarned>0){
			$("#totalInterestEarned2").attr("class","");
			$(".totalInterestEarned2").append("$"+param.summary.totalInterestEarned);
		}
		
		
		if(param.fieldOfficerName!=undefined){
			$("#fieldOfficerName").append(param.fieldOfficerName);
			$(".assignStaffSA").css("display","none");
			$(".unassignStaffSA").css("display","");
		}else{
			$("#fieldOfficerName").append("Unassigned");
			$(".assignStaffSA").css("display","");
			$(".unassignStaffSA").css("display","none");
		}
		
		$("#currencyName").append(param.currency.displayLabel);
		
		$("#nominalAnnualInterestRate2").append(param.nominalAnnualInterestRate+"%");
		
		if('${pd.pageType}' === 'center'){
			$('#clientName').empty();
			$('#clientName').append(param.groupName);
			$('#clientName').attr('code',param.groupId);
			$('#clientName').attr('tax',param.withHoldTax);
		}else if('${pd.pageType}' == 'group'){
			$('#clientName').empty();
			$('#clientName').append(param.groupName);
			$('#clientName').attr('code',param.groupId);
			$('#clientName').attr('tax',param.withHoldTax);
		}else{
			$("#clientName").append(param.clientName);
		}
		
		
		
		if(param.taxGroup!=undefined){
			if(param.withHoldTax==true){
				$("#disableWithholdTax").css("display","");
			}else{
				$("#enableWithholdTax").css("display","");
			}
			
		}
		
		
		
		$("#savingsProductName2").append(param.savingsProductName+"("+param.accountNo+")");
		
		
		if(param.status.value=="Submitted and pending approval"){
			$("#statusIcon").addClass("statuspending");
			$("#pending").css("display","");
			$("#active").css("display","none");
			$("#diary").addClass("ng-hide");
			$("#export").addClass("ng-hide");
			$("#approvedBtnGroup").addClass("ng-hide");
			$("#transfBtnGroup").addClass("ng-hide");
			accountStatus="pending"
		}else if(param.status.value=="Active"){
			if('${pd.pageType}' === 'center'){
				$('#transferFunds').hide();
			}else if('${pd.pageType}' === 'group'){
				$('#transferFunds').hide();
			}else{
				$('#transferFunds').show();
			}
			$("#statusIcon").addClass("statusactive");
			$("#pending").css("display","none");
			$("#active").css("display","");
			$("#approvedBtnGroup").addClass("ng-hide");
			$("#transfBtnGroup").addClass("ng-hide");
			accountStatus="active"
		}else if(param.status.value=="Approved"){
			$("#statusIcon").addClass("statusApproved");
			$("#pending").css("display","none");
			$("#active").css("display","");
			$("#diary").addClass("ng-hide");
			$("#export").addClass("ng-hide");
			$("#activeBtnGroup").addClass("ng-hide");
			$("#transfBtnGroup").addClass("ng-hide");
			accountStatus="approve"
		}else if(param.status.value=="Transfer in progress"){
			$("#pending").css("display","none");
			$("#active").css("display","");
			$("#approvedBtnGroup").addClass("ng-hide");
			$("#activeBtnGroup").addClass("ng-hide");
			
		}else if(param.status.value=="Rejected" || param.status.value.indexOf('Withdrawn') > -1 || param.status.value.indexOf('C') > -1){
			
			$("#pending").css("display","none");
			$("#active").css("display","");
			$("#diary").addClass("ng-hide");
			$("#export").addClass("ng-hide");
			$("#activeBtnGroup").addClass("ng-hide");
			$("#approvedBtnGroup").addClass("ng-hide");
		}
		
	
		if(param.transactions!=undefined){
			//$("#trade").css("display","block");
			for(var i=0;i<param.transactions.length;i++){
				if(param.transactions[i].transfer!=undefined){
					transferId=param.transactions[i].transfer.id;
				};
				trId =param.transactions[i].id;
 				accountId=param.transactions[i].accountId;
 				var tId=param.transactions[i].transactionType.id;
 				console.log(typeId)
				if(param.transactions[i].transactionType.value!="Pay Charge"){
					$("#transactions").append("<tr style='cursor: pointer;'><td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].id+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+$.formatDate(param.transactions[i].date)+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].transactionType.value+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'></td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].amount+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].runningBalance+"</td>"+
							"<td><a style='color:black' onclick='runreportSavings("+param.transactions[i].id+")'><span class='glyphicon glyphicon-list-alt' aria-hidden='true'></span></a></td>"+
							"</tr>");
				}else{
					$("#transactions").append("<tr style='cursor: pointer;'><td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].id+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+$.formatDate(param.transactions[i].date)+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].transactionType.value+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].amount+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'></td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'>"+param.transactions[i].runningBalance+"</td>"+
							"<td onclick='showtranDetil("+trId+","+accountId+","+transferId+","+tId+")'><a style='color:black' onclick='runreportSavings("+param.transactions[i].id+")'><span class='glyphicon glyphicon-list-alt' aria-hidden='true'></span></a></td>"+
							"</tr>");
				}
				
				
						
			}
		}
		

		if(param.charges!=undefined){
			
			for(var i=0;i<param.charges.length;i++){
				console.log(param.charges[i].chargeTimeType.dueDate==undefined?"":$.formatDate(param.charges[i].chargeTimeType.dueDate));
				
				var feeOrPen=param.charges[i].penalty==true?"fee":"penalty";
				var dusAsOf=param.charges[i].dueDate==undefined?"":$.formatDate(param.charges[i].dueDate);
				
				if(param.charges[i].isActive==true){
					
					if(param.status.value=="Submitted and pending approval"){
						
						$("#chargesTable").append("<tr><td class='chargesIsActive' onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].name+"</td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+feeOrPen+"</td>"+		
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeTimeType.value+"</td>"+		
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+dusAsOf+"</td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'></td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeCalculationType.value+"</td>"+		
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amount+"</td>"+	
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountPaid+"</td>"+				
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountWaived+"</td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountOutstanding+"</td>"+
								"<td><a onclick='editCharge("+param.charges[i].id+")' style='cursor: pointer;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>"+
								"</a>&nbsp;&nbsp;&nbsp;<a onclick='deleteCharge("+param.charges[i].id+")' style='cursor: pointer;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></a></td>"+
								"</tr>");
						
					}else if(param.status.value=="Active"){
						
						var tnod="<tr style='cursor: pointer;' class='chargesIsActive' ><td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].name+"</td>"+
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+feeOrPen+"</td>"+		
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeTimeType.value+"</td>"+		
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+dusAsOf+"</td>"+
						"<td onclick='chargeDetil("+param.charges[i].id+")'></td>"+
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeCalculationType.value+"</td>"+		
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amount+"</td>"+	
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountPaid+"</td>"+				
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountWaived+"</td>"+
						"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountOutstanding+"</td>";
						if(param.charges[i].amountOutstanding==0){
							tnod +="<td></td></tr>"
						}else{
							tnod +="<td><a onclick='payCharge("+param.charges[i].id+")' style='cursor: pointer;'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span>"+
							"</a>&nbsp;&nbsp;&nbsp;<a onclick='waiveCharge("+param.charges[i].id+")' style='cursor: pointer;'><span class='glyphicon glyphicon-flag' aria-hidden='true'></span></a></td></tr>"
							
						}
						
						$("#chargesTable").append(tnod);
						
					}else{
						
						$("#chargesTable").append("<tr><td class='chargesIsActive' onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].name+"</td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+feeOrPen+"</td>"+		
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeTimeType.value+"</td>"+		
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+dusAsOf+"</td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'></td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeCalculationType.value+"</td>"+		
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amount+"</td>"+	
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountPaid+"</td>"+				
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountWaived+"</td>"+
								"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountOutstanding+"</td>"+
								"<td></td>"+	
								"</tr>");
						
						
						
					}
					
					
				}else{
					
					$("#chargesTable").append("<tr><td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].name+"</td>"+
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+feeOrPen+"</td>"+		
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeTimeType.value+"</td>"+		
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+dusAsOf+"</td>"+
							"<td onclick='chargeDetil("+param.charges[i].id+")'></td>"+
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].chargeCalculationType.value+"</td>"+		
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amount+"</td>"+	
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountPaid+"</td>"+				
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountWaived+"</td>"+
							"<td onclick='chargeDetil("+param.charges[i].id+")'>"+param.charges[i].amountOutstanding+"</td>"+
							"<td></td>"+	
							"</tr>");
				}
				
				
				
			}
			function detail(){
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
			
			$("#activeCharges").click(function(){
				
				if($("#activeCharges").attr("lable")=="inactive"){
					console.log(2222);
					$("#activeCharges").attr("lable","active");
					$("#activeCharges").prop("value","<spring:message code='client.savingaccount.activeCharges'/>");
					$(".chargesIsActive").css("display","none");
					
				}else{
					$("#activeCharges").attr("lable","inactive");
					$("#activeCharges").prop("value","<spring:message code='client.savingaccount.inactiveCharges'/>");
					$(".chargesIsActive").css("display","");
				}
				
				
				
			})
		}
		
		
	};
		
		$("#clientName").click(function(){
			if('${pd.pageType}' === 'center'){
				window.location.href="loadPage.do?nextPage=center.detail&centerId=" + $('#clientName').attr('code');
			}else if('${pd.pageType}' === 'group'){
				window.location.href="loadPage.do?nextPage=group.detail&groupId=" + $('#clientName').attr('code');
			}else{
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		});
	
	
		$("#trade").click(function(){
			$("#transactions").css("display","");
		});
		
		function showregisteredTableName(id){
			$("#"+id).css("border-top","solid 3px #428bca !important");
			$("#transactions").css("display","none");
		}
		
		$("#modifyApplication").click(function(){
			if('${pd.pageType}' === 'center'){
				$.openWindow('<c:url value="/loadPage.do?nextPage=center.editCenterApplication"/>&savingsId=${pd.savingsId}&groupId=' + $('#clientName').attr('code') + '&withHoldTax=' + $('#clientName').attr('tax'),'iframe','90%','90%');
			}else if('${pd.pageType}' === 'group'){
				$.openWindow('<c:url value="/loadPage.do?nextPage=center.editCenterApplication"/>&savingsId=${pd.savingsId}&groupId=' + $('#clientName').attr('code') + '&withHoldTax=' + $('#clientName').attr('tax'),'iframe','90%','90%');
			}else{
				$.openWindow('<c:url value="/loadPage.do?nextPage=client.editSavingsAccounts"/>');
			}
			
		})
		
		$("#approve").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.approveSaving"/>&pageType=${pd.pageType}');
		})
		
		$("#undoapproval").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.undoapproval"/>&pageType=${pd.pageType}');
		})
		
		$("#assignStaffPend").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.assignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#assignStaffAct").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.assignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#assignStaffApp").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.assignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#assignStaffTBG").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.assignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#rejectAccount").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.rejectAccount"/>&pageType=${pd.pageType}');
		})
		
		
		$("#unassignStaffPend").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.unassignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
				
		$("#unassignStaffAct").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.unassignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#unassignStaffApp").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.unassignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#unassignStaffTBG").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.unassignsavingsofficer"/>&pageType=${pd.pageType}');
		})
		
		$("#withdrawnByApplicant").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.withdrawnByApplicant"/>&pageType=${pd.pageType}');
		})
		
		
		$("#deleteAccount").click(function(){
			if('${pd.pageType}' === 'center'){
				//中心储蓄账户删除，跳转到中心详情页面
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "DELETE",
						"mydata" : "",
						"url":"api.v1.savingsaccounts."+savingsId
					},
					callback : function(param){
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url":"api.v1.centers."+$('#clientName').attr('code')+'?associations=groupMembers,collectionMeetingCalendar'
							},
							callback :function(param2){
								var staffId;
								if($.isEmpty(param2.staffId)){
									staffId = 0;
								}else{
									staffId = param2.staffId;
								}
								window.location.href="loadPage.do?nextPage=group.detail&officeId="+param2.officeId+"&staffId="+staffId+"&userId="+${userId}+"&officeName="+param2.officeName+"&groupId="+param2.id;
							}
						});
					}
				}); 
			}else{
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "DELETE",
						"mydata" : "",
						"url":"api.v1.savingsaccounts."+savingsId
					},
					callback : function(param){
						window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
					}
				}); 
			}
		});
		
		
		$("#activeAccount").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.activeAccount"/>&pageType=${pd.pageType}');
		});
		
		$("#postInterestAsOn").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.postInterestAsOn"/>&pageType=${pd.pageType}');
		});
		
		$("#deposit").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountDeposit"/>&pageType=${pd.pageType}');
		});
		
		$("#withdrawal").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountWithdrawal"/>&pageType=${pd.pageType}');
		});
		
		$("#calculateInterest").click(function(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : "",
					"url":"api.v1.savingsaccounts."+savingsId+"?command=calculateInterest"
				},
				callback : "moreCall"
			}); 
		})
		
		$("#postInterest").click(function(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : "",
					"url":"api.v1.savingsaccounts."+savingsId+"?command=postInterest"
				},
				callback : "moreCall"
			}); 
		})
		
		$("#disableWithholdTax").click(function(){
			var json={
					"withHoldTax":false
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : json,
					"url":"api.v1.savingsaccounts."+savingsId+"?command=updateWithHoldTax"
				},
				callback :function(param){
					var savingsId;
					if(param != null || param.length > 0 || typeof param != 'undefined'){
						savingsId = param.savingsId;
						window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
					}
				}
			}); 
			
			
		})
		
		
		
		$("#enableWithholdTax").click(function(){
			var json={
					"withHoldTax":true
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : json,
					"url":"api.v1.savingsaccounts."+savingsId+"?command=updateWithHoldTax"
				},
				callback :function(param){
					var savingsId;
					if(param != null || param.length > 0 || typeof param != 'undefined'){
						savingsId = param.savingsId;
						window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
					}
				}
			}); 
			
		})
		
		
		
		
		
		$("#close").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.closeSavingAccount"/>&pageType=${pd.pageType}');
		});
		
		
		$("#transferFunds").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountTransferFunds"/>');
		});
		
		
		$("#addChargesPed").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountAddCharges"/>&pageType=${pd.pageType}');
		})
		
		$("#addChargesAct").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountAddCharges"/>&pageType=${pd.pageType}');
		})
		
		$("#addChargesApp").click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.accountAddCharges"/>&pageType=${pd.pageType}');
		})
		
		
		
		
		
		
		function moreCall(param){
			var savingsId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		};
		
		
		function chargeDetil(ccccid){
			chargesViewId=ccccid;
			$.openWindow('loadPage.do?nextPage=client.accountViewCharge');
			
		}

		
		function payCharge(chargesId){
			chargesViewId=chargesId;
			$.openWindow('loadPage.do?nextPage=client.accountPayCharge')
		}
		
		function waiveCharge(chargesId){
			chargesViewId=chargesId;
			$.openWindow('loadPage.do?nextPage=client.accountWaiveCharge')
		}
		
		
		function editCharge(chargesId){
			chargesViewId=chargesId;
			$.openWindow('loadPage.do?nextPage=client.accountEditCharge')
		}
		
		
		function deleteCharge(chargesId){
			chargesViewId=chargesId;
			$.openWindow('loadPage.do?nextPage=client.accountDeleteCharge')
		}
		
		
		
		function runreportSavings(trid){
			transactionId=trid;
			$.openWindow('loadPage.do?nextPage=client.accountRunreport');
		}
		
		function showtranDetil(trId,accountId,transferId,tId){
			typeId=tId
			if(transferId==undefined){
				$.openWindow("loadPage.do?nextPage=client.resultdetails");
			}else{
				$.openWindow("loadPage.do?nextPage=client.accountTransferDetil");
			}
			
			
		}
		
		
		
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
					url += "&datatablename="+btnjson.registeredTableName+"&notesid="+savingsId;
					$("#myTab").append("<li><a href='#"+name+"'>"+btnjson.registeredTableName+"</a></li> ");
					$("#myTabContent").append("<div class='tab-pane' id='"+name+"' action='"+url+"'><div class='iframe-div'><iframe id='"+name+"Frm' class='iframe-style' src='''></iframe></div></div> ");
				}
	        $('#myTab a:first').tab('show');//初始化显示哪个tab 
	        $($('#myTab a:first').attr("href")+"Frm").attr("src",$($('#myTab a:first').attr("href")).attr("	action"));
	        $('#myTab a').click(function (e) { 
	          e.preventDefault();//阻止a链接的跳转行为 
	          $(this).tab('show');//显示当前选中的链接及关联的content 
	          $($(this).attr("href")+"Frm").attr("src",$($(this).attr("href")).attr("action"));
	        }) 			
			}
		}
		$(function () { 
	        $('#myTab a:first').tab('show');//初始化显示哪个tab 
	      
	        $('#myTab a').click(function (e) { 
	          e.preventDefault();//阻止a链接的跳转行为 
	          $(this).tab('show');//显示当前选中的链接及关联的content 
	        }) 
	      }) 
		$("#diary").click(function (){
			window.location.href="loadPage.do?nextPage=accounting.searchJournalEntries.serach&pageType=${pd.pageType}&savingsId="+savingsId;
		})
		
		
		$("#export").click(function(){
			$.openWindow("loadPage.do?nextPage=client.accountClietSavingTransaction");
		})
		
		
	</script>
		
</html>
