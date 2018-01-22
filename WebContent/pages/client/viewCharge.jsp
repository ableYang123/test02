<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

	<form class="form-horizontal" id="guarantorDetail" name="guarantorDetail" method="post">
		<div>
			<ul class="breadcrumb">
				<li style="font-size: small;"><a href="javascript:void(0);" onclick="loan()"><spring:message code="lable.view.loan.account"/></a></li>
				<li style="font-size: small;"><span id="chargeName"></span></li>
			</ul>
			<div class="card">
				<div>
					<div>
						<h4><spring:message code="lable.charge.view"/></h4>
						<div class="pull-right btn-group" id="button" style="display: none;">
							<button id="editCharges" class="btn btn-primary"><li class="glyphicon glyphicon-pencil"><spring:message code="lable.edit"/></li></button>
							<button id="deleteCharges" class="btn btn-primary"><li class="glyphicon glyphicon-trash"><spring:message code="lable.delete"/></li></button>
						</div>
					</div>
					<div class="content">
							<table width="100%">
								<tr>
									<td width="30%"><spring:message code="lable.name"/></td>
									<td width="70%"><span id="name"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.charge.type"/></td>
									<td width="70%"><span id="chargeType"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.currency"/></td>
									<td width="70%"><span id="curency"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.payment.due.at"/></td>
									<td><span id="payment"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.due.as.of"/></td>
									<td width="70%"><span id="payDue"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.calculation.type"/></td>
									<td width="70%"><span id="calcalation"></span></td>
								</tr>
								<tr>
									<td><spring:message code="lable.due"/></td>
									<td width="70%"><span id="due"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.paid"/></td>
									<td width="70%"><span id="paid"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.waived"/></td>
									<td width="70%"><span id="waived"></span></td>
								</tr>
								<tr>
									<td width="30%"><spring:message code="lable.outstanding"/></td>
									<td width="70%"><span id="out"></span></td>
								</tr>
							</table>
						</div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		var loanId = ${pd.loanId};
		var chargeId = ${pd.chargeId};
		var status = '${pd.status}';
		var requestType=${pd.requestType};
		if(status == 'Submitted and pending approval'){
			$.show('button');
		}else{
			$.hide('button');
		}
		function loan(){
			window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+${pd.requestType};
		}
		$(document).ready(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.loans."+loanId+".charges."+chargeId
				},
				callback : "chargeshow"
			});
		});
		function chargeshow(param) {
			if(param.penalty == true){
				$('#chargeType').append('penalty');
			}else if(param.waived == true){
				$('#chargeType').append('waived');
			}else{
				$('#chargeType').append('paid');
			}
			$('#chargeName').append(param.name);
			$('#name').append(param.name);
			$('#currency').append(param.currency.name);
			$('#payment').append(param.chargeTimeType.value);
			$('#payDue').append('');
			$('#calcalation').append(param.chargeCalculationType.value);
			$('#due').append(param.amount);
			$('#paid').append(param.amountPaid);
			$('#waived').append(param.amountWaived);
			$('#out').append(param.amountOutstanding);
		}
		$('#editCharges').click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.editCharge"/>');
		});
		$('#deleteCharges').click(function(){
			$.openWindow('<c:url value="/loadPage.do?nextPage=client.deleteLoanCharge"/>');
		});
</script>