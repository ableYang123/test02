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
<body style="background-color: f8f8f8">
	<div class="card">
		<div style="margin-top: 20px；;" class="row col-md-12 col-sm-12"">
			<span style="font-size: small;">
				<small><a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><spring:message code="view.loan.account"/></a></small>
			</span>
			<span style="font-size: small;">
				<small>/&nbsp;<spring:message code="Guarantor.detail"/></small>
			</span>
		</div>
		<div class="col-sm-12">
			<span style="margin-left: 10px;font-size: 24px">
				<h3 style="font-size: x-large;">
					<strong><span id="account"></span></strong>
				</h3>
			</span>
		</div>
		<div style="margin-left: -1px;margin-right: 1px;position: relative ;">
			<div class="col-sm-7 col-md-7 ng-bliding">
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
			<div class="col-sm-5 col-md-5">
				<table class="table table-striped table-bordered" >
					<tr>
						<th style="width: 30%"><spring:message code="lable.loan.purpose"/></th>
						<td><span id="purpose"> </span></td>
					</tr>
					<tr>
						<th><spring:message code="lable.approved.amount"/></th>
						<td><span id="approvedAmpount"> </span></td>
					</tr>
					<tr>
						<th><spring:message code="lable.disburse.amount"/></th>
						<td><span id="disburseAmount"> </span></td>
					</tr>
					<tr>
						<th><spring:message code="lable.arreasby"/></th>
						<td><span id="arreasby"> </span></td>
					</tr>
				</table>
			</div>
	</div>
	<div id="guarantorDetails">
		<div class="pull-right" style="margin-right: 20px;">
			<input type="checkbox" id="hideGuarantor">
			<label><spring:message code="lable.hide.deleted.guarantors"/></label>
		</div>
		<table class="table" id="activeGuarantor">
			<thead>
				<tr>
					<td><spring:message code="lable.name"/></td>
					<td><spring:message code="lable.relationship"/></td>
					<td><spring:message code="lable.guarantor.type"/></td>
					<td><spring:message code="lable.deposit.account"/></td>
					<td><spring:message code="lable.amount"/></td>
					<td><spring:message code="lable.remaining.amount"/></td>
					<td><spring:message code="lable.status"/></td>
					<td></td>
				</tr>
			</thead>
			<tbody label="tran"></tbody>
		</table>
	</div>
</div>
</body>
	<script type="text/javascript">
	var loanId = ${pd.loanId};
	var requestType = ${pd.requestType};
	function detail(){
		window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
	}
	$(document).ready(function(){
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.loans."+loanId+"?associations=guarantors"
				},
			callback : "guarantors"
		});
		
		$.getWidget('hideGuarantor').click(function(){
			if($(this).is(':checked')){
				$('#activeGuarantor tbody[label="tran"] tr').each(function(){
					var tdVal = $(this).children().eq(7).text();
					if(tdVal === 'Deleted'){
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
		
		$(document).on('click','tbody[label="tran"] a[label="view"]',function(){
			guarantorDetail($(this));
		});
		$(document).on('click','tbody[label="tran"] a[label="del"]',function(){
			guarantorDelete($(this));
		});
	});
	function guarantors(param){
		$('#account').append(param.loanProductName + '(#'+param.accountNo+')');
		if(typeof param.timeline.disbursementDate != 'undefined'){
			$('#activatedIn').append(param.timeline.disbursementDate);
		}else{
			$('#activatedIn').append('<spring:message code="lable.not.available"/>');
		}
		if(typeof param.loanOfficerName != 'undefined'){
			$.show('changeloff');
			$('#officer').append(param.loanOfficerName);
		}else{
			$.show('assignloff');
			$('#officer').append('<spring:message code="lable.Unassigned"/>');
		}
		if(typeof param.externalId != 'undefined'){
			$('#externalId').append(param.externalId);
		}else{
			$('#externalId').append('<spring:message code="lable.not.provided"/>');
		}
		$('#currency').append(param.currency.name);
		if(typeof param.loanPurposeName != 'undefined'){
			$('#purpose').append(param.loanPurposeName);
		}else{
			$('#purpose').append('<spring:message code="lable.not.provided"/>');
		}
		$('#approvedAmpount').append(param.approvedPrincipal);
		$('#disburseAmount').append(param.proposedPrincipal);
		$('#arreasby').append('<spring:message code="lable.not.provided"/>');
		
		if(typeof param.guarantors != 'undefined'){
			for(var i=0;i<param.guarantors.length;i++){
				if(typeof param.guarantors[i].firstname == 'undefined'){
					param.guarantors[i].firstname = '';
				}
				if(typeof param.guarantors[i].lastname == 'undefined'){
					param.guarantors[i].lastname = '';
				}
				if(typeof param.guarantors[i].clientRelationshipType != 'undefined'){
					param.guarantors[i].clientRelationshipType = param.guarantors[i].clientRelationshipType.name;
				}else{
					param.guarantors[i].clientRelationshipType = '';
				}
				if(typeof param.guarantors[i].action == 'undefined'){
					if(param.guarantors[i].status == true){
						param.guarantors[i].status = 'Active';
						param.guarantors[i].action = '<span><a type="button" label="view"><li class="glyphicon glyphicon-eye-open"></li></a></span>'
							+' <span><a type="button" label="del"><li class="glyphicon glyphicon-trash"></li></a></span>';
					}else{
						param.guarantors[i].status = 'Deleted';
						param.guarantors[i].action = '<span><a type="button" label="view"><li class="glyphicon glyphicon-eye-open"></li></a></span>';
					}
				}
				
					//添加表数据
				var table = '<tr><td style="display:none;" id="'+param.guarantors[i].id+'">'+param.guarantors[i].id+'</td>'
							+'<td>'+param.guarantors[i].firstname+' '+param.guarantors[i].lastname+'</td>'
							+'<td>'+param.guarantors[i].clientRelationshipType+'</td>'
							+'<td>'+param.guarantors[i].guarantorType.value+'</td>'
							+'<td></td>'
							+'<td></td>'
							+'<td></td>'
							+'<td>'+param.guarantors[i].status+'</td>'
							+'<td>'+param.guarantors[i].action+'</td>'
							+'</tr>';
				$('#activeGuarantor tbody[label="tran"]').append(table);
			}
			$('#hideGuarantor').trigger('click');
		}
	}
	function guarantorDetail(obj){
		var trNode = obj.closest('tr');
		guarantorId = $(trNode).find('td:first').prop('id');
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.guarantorDetail"/>');
	}
	function guarantorDelete(obj){
		var trNode = obj.closest('tr');
		guarantorId = $(trNode).find('td:first').prop('id');
		$.openWindow('<c:url value="/loadPage.do?nextPage=client.deleteGuarantor"/>');
	}
	</script>
</html>
