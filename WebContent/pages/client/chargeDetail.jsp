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
	<br><br><br>
	<div class="card">
		<br>
		<div style="margin-top: 20px" class="form-group row col-md-12 col-sm-12"">
			<span style="font-size: small;">
				<small>
					<a href="javascript:void(0)" onclick="detail()" style="text-decoration: none;"><span>view client&nbsp;/</span></a>
					<span>view Charge</span>
				</small>
			</span>
		</div>
		<legend></legend>
		<div class="col-md-12 column">
			<span class="glyphicon glyphicon-stop" id="changeColor" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
			<span id="chargeName" style="font-size: large;"></span>
		</div>
		<div id="operate" class="form-group" style="position: relative;min-height: 1px;padding-left: 15px;padding-right: 15px;display: none;">
			<div style="float: right !important;position: relative;display: inline-block;vertical-align: middle;">
				<span id="p">
					<button id="pay" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-usd"></i>
						<spring:message code="lable.pay"/>
					</button>
				</span>
				<span id="w">
					<button id="waive" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-flag"></i>
						<spring:message code="lable.waive.charge"/>
					</button>
				</span>
				<span id="d">
					<a href="javascript:void(0)" onclick="Delete()" style="margin-top: 3px" class="btn btn-primary btn-offset">
						<i class="glyphicon glyphicon-trash"></i>
						<spring:message code="lable.delete"/>
					</a>
				</span>
			</div>
		</div>
		<br><br>
		<div id="chargeTable" class="form-group" style="margin-left: -1px;margin-right: 1px;position: relative;">
			<div class="col-sm-12 ng-bliding">
				<div>
					<table class="table table-striped table-bordered" >
						<tr>
							<th style="width: 30%"><spring:message code="lable.currency"/></th>
							<td><span id="currency"></span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.charge.time.type"/></th>
							<td><span id="timeType"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.charge.calculation.type"/></th>
							<td><span id="calculationType"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.due.as.of"/></th>
							<td><span id="dueAs"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.due"/></th>
							<td><span id="amount"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.paid"/></th>
							<td><span id="paid"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.waived"/></th>
							<td><span id="waived"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.out.standing"/></th>
							<td><span id="outstanding"> </span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="form-group">
			<span style="font-size: large;">Transaction</span>
		</div>
		<div id="transactions" style="display: none;">
			<table>
				<thead>
					<tr>
						<th name='id'>ID</th>
						<th name="officeName"><spring:message code="lable.office"/></th>
						<th name="type.value"><spring:message code="lable.type"/></th>
						<th name="date"><spring:message code="lable.transaction.date"/></th>
						<th name="amount"><spring:message code="lable.amount"/></th>
					</tr>
				</thead>
			</table>
		</div>
		<br>
		<div class="form-group">
			<button style="margin-right: 700px" id="back" class="btn btn-primary" >
				<i class=""></i>
				<spring:message code="btn.back"/>
			</button>
		</div>
</div>
</body>
	<script type="text/javascript">
	var chargeId = ${pd.chargeId};
	var clientId = ${pd.clientId};
	var resourceType;
	var transaction_grid;
	var json;
	
	function detail(){
		window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
	}
	
	$('#back').click(function(){
		window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
	});
	
	$(document).ready(function(){
		init();
		$('#myModal').on('hidden.bs.modal',
				function(event) {
					window.location.href="loadPage.do?nextPage=client.chargeDetail&clientId="+clientId+"&chargeId="+chargeId
				});
	});
	function init() {
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.clients."+clientId+".charges."+chargeId+"?associations=all"
				},
			callback : "chargeView"
		});	
	}
	function chargeView(param){
		if(param != null || param != ''){
			resourceType = param.id;
			$('#chargeName').append(param.name);
			$('#currency').append(param.currency.name);
			$('#timeType').append(param.chargeTimeType.value);
			$('#calculationType').append(param.chargeCalculationType.value);
			var dueOf = $.formatDate(param.dueDate);
			$('#dueAs').append(dueOf);
			$('#amount').append(param.amount);
			$('#paid').append(param.amountPaid);
			$('#waived').append(param.amountWaived);
			$('#outstanding').append(param.amountOutstanding);
			if(typeof param.clientTransactionDatas != 'undefined' && param.clientTransactionDatas != ''){
				$.show('transactions');
				transaction_grid = $('#transactions').flexigrid({
					buttons : [{
						height : 'auto',
						usepager: false,
						showToggleBtn: false,
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
						bclass : 'delete',
						onpress : Delete
					}]
				});
				var data = [];
				for(var i=0;i < param.clientTransactionDatas.length;i++){
					param.clientTransactionDatas[i].date = $.formatDate(param.clientTransactionDatas[i].date,'yyyy-MM-dd');
					data.push(param.clientTransactionDatas[i]);
				}
				transaction_grid.addRows(data);
			}
			if(param.isPaid == true || param.isWaived == true){
				x = document.getElementById("changeColor")
				x.style.color = "rgb(0, 0, 0)";
				$.hide('operate');
			}else{
				x = document.getElementById("changeColor")
				x.style.color = "rgb(64, 255, 106)";
				$.show('operate');
			}
		}
	}
	
	$('#pay').click(function(){
		$.openWindow("loadPage.do?nextPage=client.payCharge");
	});
	
	$('#waive').click(function(){
		json = {
				"clientId" : clientId,
				"resourceType" : chargeId
			};
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.clients."+clientId+".charges."+chargeId+"?command=waive"
			},
			callback : "callback"
		});
	});
	
	function Delete(){
		$.openWindow("loadPage.do?nextPage=client.deleteCharge");
	}
	
	function callback(param){
		if(param != null || param != ''){
			clientId = param.clientId;
			chargeId = param.resourceId;
			init();
		}
	}
	</script>
</html>
