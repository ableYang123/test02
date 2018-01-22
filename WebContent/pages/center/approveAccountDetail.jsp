<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="div-cc">
		<div>
			<p id="head"></p>
		</div>
		<div style="float: right; margin-right: 40px;">
			<span id="interest"> <a href="javascript:void(0)"
				onclick="PostInterest()" style="margin-top: 3px" id="edit"
				name="edit" class="btn btn-primary btn-offset"> <i
					class="glyphicon glyphicon-edit"></i>利息如
			</a>
			</span> <span id="deposit"> <a href="javascript:void(0)"
				onclick="editCenterApplication()" style="margin-top: 3px" id="edit"
				name="edit" class="btn btn-primary btn-offset"> <i
					class="glyphicon glyphicon-edit"></i>存款
			</a>
			</span> <span id="withdraw"> <a href="javascript:void(0)"
				onclick="editCenterApplication()" style="margin-top: 3px" id="edit"
				name="edit" class="btn btn-primary btn-offset"> <i
					class="glyphicon glyphicon-edit"></i>收回
			</a>
			</span> <span id="cacluInterest"> <a href="javascript:void(0)"
				onclick="cacluInterest()" style="margin-top: 3px" id="edit"
				name="edit" class="btn btn-primary btn-offset"> <i
					class="glyphicon glyphicon-edit"></i>计算利息
			</a>
			</span> <span id="unApprove"> <a href="javascript:void(0)"
				onclick="unApprove()" style="margin-top: 3px" id="edit" name="edit"
				class="btn btn-primary btn-offset"> <i
					class="glyphicon glyphicon-edit"></i> 取消批准
			</a>
			</span> <span id="active1"> <a href="javascript:void(0)"
				onclick="activeSavingAccount()" style="margin-top: 3px"
				id="addgroup" name="addgroup" class="btn btn-primary btn-offset">
					<i class="glyphicon glyphicon-plus"></i> 启用
			</a>
			</span> <span id="addCharge1"> <a href="javascript:void(0)"
				onclick="addCharge()" style="margin-top: 3px" id="newSaving"
				name="manageGroup" newSaving"" class="btn btn-primary btn-offset" />
				<i class="glyphicon glyphicon-plus"></i> 添加费用 </a>
			</span> <span id="assign"> <a href="javascript:void(0)"
				onclick="assignSavingStaff()" style="margin-top: 3px" id="newSaving"
				name="manageGroup" newSaving"" class="btn btn-primary btn-offset" />
				<i class="glyphicon glyphicon-plus"></i> 分配员工 </a>
			</span> <span class="dropdown">
				<button style="margin-top: 3px"
					class="btn btn-primary dropdown-toggle" type="button" id="more"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					更多 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					<li id="inter"><a href="javascript:void(0)"
						onclick="postInterest2">职位兴趣</a></li>
					<li id="addCharge2"><a href="javascript:void(0)"
						onclick="addCharge()">添加费用</a></li>
					<li id="clo"><a href="javascript:void(0)" onclick="close1()">关</a></li>
				</ul>
			</span>
		</div>
		
		<div style="clear: both;"></div>

		<div style="margin: 0px 60px;">
			<div style="font-size: 25px; margin: 20px 0px;">当前余额:</div>
			<div>
				<div style="font-size: 25px; margin: 20px 0px;">可用余额:</div>
				<div>
					<div style="float: left; margin-right: 40px;">
						<table class="table table-bordered" style="width: 470px;">

							<tr >
								<td style="background-color: #F5F5F5">总提款</td>
								<td id="t1"></td>
							</tr>
							<tr >
								<td style="background-color: #F5F5F5">赚取利息</td>
								<td id="t1"></td>
							</tr>

							<tr>
								<td style="background-color: #F5F5F5">获得的利益未发布</td>
								<td id="t1"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">名义利率</td>
								<td id="t2"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">利息期限</td>
								<td id="t3"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">利息发布期</td>
								<td id="t4"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">利息计算</td>
								<td id="t5"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">＃几年</td>
								<td id="t6"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">上一个活动交易日期</td>
								<td id="t7"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">利息重新计算日期</td>
								<td id="t1"></td>
							</tr>
						</table>
					</div>
					<div style="float: right;">
						<table class="table table-bordered" style="width: 320px;">
							<tr>
								<td colspan=2
									style="text-align: center; background-color: #F5F5F5">储蓄详情</td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5; width: 160px;">激活日期</td>
								<td id="t8"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">实地干事</td>
								<td id="t9"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">外部ID</td>
								<td id="t10"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">货币</td>
								<td id="t11"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5">名义利率</td>
								<td id="t12"></td>
							</tr>
						</table>
					</div>

					<div style="float: right;">
						<table class="table table-bordered" style="width: 320px;">
							<tr>
								<td colspan=2
									style="text-align: center; background-color: #F5F5F5;">表演历</td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5; width: 160px;">总存款</td>
								<td id="t8"></td>
							</tr>
							<tr>
								<td style="background-color: #F5F5F5; width: 160px;">赚取利息</td>
								<td id="t9"></td>
							</tr>
						</table>
					</div>
				</div>
				<div style="clear:both;"></div>
				<legend></legend>
		        <legend><button id="btn1">交易</button></legend>
		        <div style="float:right;"><button>查看日记账分录</button><button>出口</button></div>
		        <legend></legend>
		        
		         <div id="s3">
						<table id="savingList" class="table">
							<thead>
								<tr>
									<th name='id' width='200'>id</th>
									<th name="accountNo" width='200'>交易日期</th>
									<th name="productName" width='200'>交易类型</th>
									<th name="balance" width='200'>借方</th>
									<th name="balance" width='200'>信用</th>
									<th name="balance" width='200'>平衡</th>
									<th name="balance" width='200'>查收数据</th>
								</tr>
							</thead>
						</table>
					  </div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var savingsId = "${pd.savingsId}";
	var centerId = "${pd.centerId}";
	var status1 = "${pd.status1}";

	if (status1 == "Active") {
		$("#unApprove").hide();
		$("#active1").hide();
		$("#addCharge1").hide();
	} else if (status1 == "Approved") {
		$("#interest").hide();
		$("#deposit").hide();
		$("#withdraw").hide();
		$("#cacluInterest").hide();
		$("#more").hide();
	} else {
		$("#unApprove").hide();
		$("#active1").hide();
		$("#addCharge1").hide();
		$("#interest").hide();
		$("#deposit").hide();
		$("#withdraw").hide();
		$("#cacluInterest").hide();
		$("#more").hide();
	}

	$(document).ready(
			function() {
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'get',
					data : {
						'dataType' : 'GET',
						'mydata' : '',
						'url' : "api.v1.savingsaccounts." + savingsId
								+ "?associations=all"
					},
					callback : 'callback1'
				});
			});

	function callback1(param) {
		$("#t1").text();
		$("#t2").text(param.nominalAnnualInterestRate + "%");

		$("#t3").text(param.interestCompoundingPeriodType.value);
		$("#t4").text(param.interestPostingPeriodType.value);
		$("#t5").text(param.interestCalculationType.value);
		$("#t6").text(param.interestCalculationDaysInYearType.value);
		$("#t7").text(param.lastActiveTransactionDate);

		$("#t8").text(param.timeline.activatedOnDate);

		if (typeof (param.fieldOfficerName) == "undefined") {
			$("#t9").text("未分配");
		} else {
			$("#t9").text(param.fieldOfficerName);
		}
		if (typeof (param.externalId) == "undefined") {
			$("#t10").text("不提供");
		} else {
			$("#t10").text(param.externalId);
		}
		$("#t11").text(param.currency.displayLabel);
		$("#t12").text(param.nominalAnnualInterestRate + "%");
	}

	function PostInterest() {
		$.openWindow("loadPage.do?nextPage=center.postInterest&savingsId="
				+ savingsId);
	}

	function unApprove() {
		$
				.openWindow("loadPage.do?nextPage=center.undoapproveSavingAccount&centerId="
						+ centerId);
	}
	function activeSavingAccount() {
		$
				.openWindow("loadPage.do?nextPage=center.ActiveSavingAccount&savingsId="
						+ savingsId);
	}
	function addCharge() {
		$.openWindow("loadPage.do?nextPage=center.addCharge&savingsId="
				+ savingsId + "&status1" + status1);
	}
	function assignSavingStaff() {
		$.openWindow("loadPage.do?nextPage=center.assignSavingStaff&savingsId="
				+ savingsId + "&status1" + status1);
	}
</script>
</html>