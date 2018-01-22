<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div>
		<label><spring:message code="group.bulk.JLG.loan.application" /></label>
	</div>
	<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

	<!-- 选择页 -->
	<div id="productSelectPage" class="modal-body"
		style="height: auto; padding-top: 0px; display: block">
		<div class="col-md-2 ">
			<label style="padding-top: 3px; font-size: 16px; font-weight: normal">
				<spring:message code="group.product" /> <span
				style="font-size: 14px; color: #d9534f">*</span>
			</label>
		</div>
		<div class="col-md-10" style="padding-left: 0px">
			<select id="selectProductList" onchange="selectProduct()"
				class="form-control" style="width: 200">
				<option value="0" id="defulteProduct"><spring:message code="group.please.select.product"/></option>
			</select>
		</div>
		<div class="text-center">
			<button class="btn btn-default" data-dismiss="modal"
				style="margin-top: 40px">
				<spring:message code="btn.cancle"/>
			</button>
		</div>
	</div>
	<!-- 选择页 -->
	<div id="informationPage" class="modal-body"
		style="height: auto; padding: 0px; display: none">
		<!-- 1 产品 -->
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
					<select id="productList" onchange="initSelectedProductPage()"
						class="form-control" style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px"></div>
		</div>
		<!-- 2 会议详情 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div id="mettingDetail" class="modal-body"
			style="height: auto; padding: 5px"></div>
		<!--3 贷款专员 基金 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="font-size: 16px; font-weight: normal; margin-button: 0px">
						<spring:message code="group.loan.officer" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="loanOfficer" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 2px">
					<label style="font-weight: normal; margin-button: 0px"><spring:message
							code="group.fund" /> <span
						style="font-size: 14px; color: #d9534f">*</span> </label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="fund" class="form-control" style="width: 200">
					</select>
				</div>
			</div>
		</div>
		<!-- 4 提交日期 还款日期 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.submit.on" />
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="SubmittedOn" name="SubmittedOn" type="text"
						class="form-control" datetype="date"
					    local-date="true">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.disbursement.on" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="disbursementOn" name="disbursementOn" type="text"
						class="form-control" datetype="date">
				</div>
			</div>
		</div>
		<!-- 5收费 -->
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div id="clientTable" class="modal-body"
			style="padding: 5px; display: none">
			<table id="clientList" style="width: 868px">
				<thead style="background-color: #EAEAEA; width: 100%">
					<th name="check" style="width: 30px; padding: 10px"><input
						type="checkbox" id="selectall" name="clientCheck"
						onchange="changeCheckbox(this)"></th>
					<th name="clientId" style="width: 90px; padding: 10px"><spring:message
							code="group.client.id" /></th>
					<th name="clientName" style="width: 60px; padding: 10px"><spring:message
							code="group.client.name" /></th>
					<th name="loanPurpose" style="width: 60px; padding: 10px"><spring:message
							code="group.loan.purpose" /></th>
					<th name="orignalLoan" style="width: 60px; padding: 10px"><spring:message
							code="group.original.loan" /></th>
					<th name="charges" style="width: 300px; padding: 10px"><spring:message
							code="group.charges" /></th>
				</thead>
				<tbody></tbody>
			</table>
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		</div>
		<!-- 6按钮 -->
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
		var productInitParam;
		var calendarId;
		$(document).ready(function() {
			$.datetimepicker("", 2, 'true');
			getproductOptionList();
		});

		/* 获得产品列表 */
		function getproductOptionList() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"url" : "api.v1.loans.template?activeOnly=true&groupId=" + groupId
							+ "&lendingStrategy=300&templateType=jlg"
				},
				callback : "initproductOptionList"
			});
		}
		/* 初始化产品列表 */
		function initproductOptionList(param) {
			var productOptions = param.productOptions;
			if(typeof(productOptions)=="undefined")
				return 0;
			var LJGProductList =[];
			for(var i=0;i<productOptions.length;i++){
				if(!productOptions[i].multiDisburseLoan)
					LJGProductList.push(productOptions[i]);
			}
			$.setSelect('selectProductList', LJGProductList, 'id','name');
			$.setSelect('productList', LJGProductList, 'id', 'name');
		}

		/* 选择产品时的触发事件-保存选择项信息 */
		function selectProduct() {
			var selectedValue = parseInt($("#selectProductList").find(
					"option:selected").attr("value"));
			$("#productList").val(selectedValue);
			getInformationPageContent(selectedValue);
			changePage();
		}

		/* 设置隐藏产品选择页打开信息填写页 */
		function changePage() {
			$("#productSelectPage").remove();
			$("#informationPage").css("display", "block");
		}

		/* 选择产品时触发事件-重新初始化页面 */
		function initSelectedProductPage() {
			var selectedProductId = parseInt($("#productList").find(
					"option:selected").attr("value"));
			getInformationPageContent(selectedProductId);
		}

		/* 初始化信息填写页面 -每次选择产品都会进行一次初始化*/
		function getInformationPageContent(productId) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"url" : "api.v1.loans.template?groupId=" + groupId
							+ "&lendingStrategy=300&productId=" + productId
							+ "&templateType=jlgbulk"
				},
				callback : "initInformationPage"
			});
		}

		/* 初始化页面的select及其他 */
		function initInformationPage(param) {
			productInitParam = param;
			$("#fund").empty();
			$.setSelect('fund', param.fundOptions, 'id', 'name');
			$("#loanOfficer").empty();
			$.setSelect('loanOfficer', param.loanOfficerOptions, 'id',
					'displayName');
			$('#mettingDetail').html('');
			eachMettingDetail(param.calendarOptions);
			$("#clientList tbody").html("");
			clientData(param.group.clientMembers, param.approvedPrincipal,
					param.loanPurposeOptions, param.charges);
			showTable("clientTable");
			calendarId = param.calendarOptions[0].id;
		}

		/* 初始化会议详情 -遍历会议详情列表 */
		function eachMettingDetail(metting) {
			if (typeof (metting) == "undefined")
				return 0;
			for (var i = 0; i < metting.length; i++)
				apendMettingDetail(metting[i].humanReadable, i);
		}

		/* 初始化会议详情 -添加视图*/
		function apendMettingDetail(repeatsOn, i) {
			var name = "syncDisbursementWithMeeting";
			$("#mettingDetail")
					.append(
							"<div style='height:50px; padding: 5px'>"
									+ "<div class='col-md-2' style='padding: 5px'><label"
							+ " style='padding-top: 3px; font-size: 16px; font-weight: normal'><spring:message code='group.meeting.details' /></label>"
									+ "</div><div class='col-md-5' style='padding: 5px'>"
									+ "<label style='padding-top: 3px; font-size: 16px; font-weight: normal'>"
									+ "<spring:message code='group.repeat' />:<span id='repeatsOn'>"
									+ repeatsOn
									+ "</span></label> </div><div class='col-md-5' style='padding: 5px'>"
									+ "<input type='checkbox' checked='true'name='syncDisbursementWithMeeting' onchange='changeCheckbox(this)' id='checkbox"
									+ i
									+ "'>"
									+ "<label style='padding-top: 3px; font-size: 16px; font-weight: normal'>同步付款日期与会议</label>"
									+ "</div></div>");
		}

		/* checkbox统一值 */
		function changeCheckbox(box) {
			var name = $(box).attr("name");
			if ($(box).is(':checked')) {
				$("[name=" + name + "]").prop("checked", true);
			} else {
				$("[name=" + name + "]").prop("checked", false);
			}
		}

		/* 判断是否显示客户表头 */
		function showTable(id) {
			var length = $("#" + id).find("tr").length - 1;
			if (length > 0) {
				$("#" + id).css("display", "block");
			} else {
				$("#" + id).css("display", "none");
			}
		}

		/* 添加贷款客户-准备数据 */
		function clientData(groupClient, money, loanPurposeOptions, charges) {
			if (typeof (groupClient) == "undefined")
				return 0;
			if (typeof (money) == "undefined")
				money = "";
			for (var i = 0; i < groupClient.length; i++) {
				var clientId = groupClient[i].id;
				var clientName = groupClient[i].displayName;
				appendClientView(clientId, clientName, money);
				$("#loanPurpos" + clientId).empty();
				$.setSelect('loanPurpos' + clientId, loanPurposeOptions, 'id',
						'name');
				productInitParam.overdueCharges
				addCharge(charges, clientId,productInitParam.overdueCharges);
			}
		}

		/* 添加贷款客户-添加View */
		function appendClientView(clientId, clientName, money) {
			$("#clientList")
					.append(
							"<tr><td style='padding: 10px'><input type='checkbox' id='selectall"+clientId+"' name='clientCheck'></td>"
									+ "<td style='padding: 10px'><label style='padding-top: 3px; font-size: 16px; font-weight: normal'>"
									+ "<span style='font-size: 14px'>"
									+ clientId
									+ "</span>"
									+ "</label></td><td style='padding: 10px'>"
									+ "<label style='padding-top: 3px; font-size: 16px; font-weight: normal'>"
									+ "<span style='font-size: 14px'>"
									+ clientName
									+ "</span></label></td>"
									+ "<td style='padding: 10px'><select id='loanPurpos"+clientId+"' class='form-control' style='width: 150'>"
									+ "</select></td><td style='padding: 10px'>"
									+ "<div style='padding-left: 0px'><div class='col-md-11' style='padding: 0px'>"
									+ "<input class='form-control' id='originalLoan' value='"+money+"' style='width: 130px'>"
									+ "</div><div class='col-md-1' style='padding: 0px'>"
									+ "<label style='font-size: 14px; font-weight: normal; margin-top: 5px'>"
									+ "$ </label></div></div></td><td id='chageList"+clientId+"' style='width:300px'></td></tr>");
		}

		/* 添加贷款费用-数据准备 */
		function addCharge(charges, clientId,overdueCharges) {
			var acount = Eache(charges,clientId,1,false);
			Eache(overdueCharges,clientId,acount,true);
		}
		
		/* 添加贷款费用-循环添加 */
		function Eache(charges,clientId,acount,type){
			if (typeof (charges) == "undefined")
				return 1;
			for (var i = 0; i < charges.length; i++) {
				/* 如果是非超期费用flag = 0，是 flag=-1 */
				var flag = 1;
				if(type)
					var flag = 0
				addChargeView(charges[i].name, clientId, charges[i].chargeId,
						charges[i].amount,flag);
				if ((acount + i) % 3 == 0)
					$("#chageList" + clientId).append("<br>");
			}
			return i+1;
		}
		
		/* 添加收费 */
		function addChargeView(chargeName, clientId, chargeId,amount,flag) {
			$("#chageList" + clientId)
					.append(
							"<a onclick='toggleCharge(this)' style='padding:5px'>"
									+ "<input name='chargeId' style='display:none' value='"+chargeId+"'>"
									+ "<input name='amount' style='display:none' value='"+amount+"'>"
									+ "<input name='acount' style='display:none' value='"+flag+"'>"
									+ "<span ng-class='{'label':true,'label-primary':charge.isDeleted==false, 'label-default':charge.isDeleted}'"
									+"ng-repeat='charge in client.charges' ng-init='innerIndex = $index'"
									+"class='ng-binding ng-scope label label-primary'> "
									+ chargeName + "</span></a>");
		}

		/* 取消收费操作 */
		function toggleCharge(chargeNode) {
			var chargeClass = $(chargeNode).children().attr("class");
			if (judgeCharge(chargeNode)) {
				$(chargeNode).children().prop("class",
						"ng-binding ng-scope label label-default");
			} else {
				$(chargeNode).children().prop("class",
						"ng-binding ng-scope label label-primary");
			}

		}

		/* 判断是否为活跃的收费项 */
		function judgeCharge(chargeNode) {
			var chargeClass = $(chargeNode).find('span').attr("class");
			var chargeClassList = chargeClass.split(" ");
			var nodeStatu = chargeClassList[chargeClassList.length - 1];
			if (nodeStatu == "label-primary")
				return true;
			return false;
		}
		
		/*  保存申请 -封装客户数据成*/
		function IntergrationClient() {
			var json = new Array();
			var trIndex = 0;
			var commonValue = IntegrationParameter();
			var requestSequence = 0;
			/* 遍历客户表单 */
			$("#clientList").find("tr").each(
					function() {
						var tdArr = $(this).children();
						var check = tdArr.eq(0).find('input').is(':checked');//id
						/* 选中的客户进行数据整合 */
						if (check && trIndex > 0) {
							client = {};
							client.clientId = parseInt(tdArr.eq(1).find('label').find(
									'span').html());
							client.loanPurposeId = tdArr.eq(3).find('select').find(
									'option:selected').val();
							client.principal = parseInt(tdArr.eq(4).find('input').val());
							var charges = [];
							/* 对活跃的收费进行整合 */
							tdArr.eq(5).find('a').each(
									function() {
										var chargeJson = {};
										var flag = parseInt($(this).find('input').eq(2).val());
										if (judgeCharge($(this)) && flag > 0) {
											chargeJson.chargeId = $(this).find(
													'input').eq(0).val();
											chargeJson.amount = $(this).find(
													'input').eq(1).val();
											charges.push(chargeJson);
										}
									});
							client.charges=charges;
							var body = $.extend( commonValue,client);
							var request = constructionBaseParam(requestSequence);
							requestSequence+=1;
							request.body=JSON.stringify(body);
							json.push(request);
						}
						trIndex += 1;
					});
			return json;
		}
		
		/* 构造基础参数 */
		function constructionBaseParam(requestSequence){
			requestSequence = requestSequence+"";
			return json ={
			        "method": "POST",
			        "relativeUrl": "loans",
			        "requestId": requestSequence
			}
		}
		/* 获取所有参数 */
		function getAllValue(commonParamjson) {
			/* 1-1产品 */
			commonParamjson.productId = $.getSelectedValue("productList");
			/* 2-1会议详情 */
			commonParamjson.syncDisbursementWithMeeting = $.judgeCheckbox("checkbox0");
			/* 3-1贷款职员 */
			commonParamjson.loanOfficerId = $.getSelectedValue("loanOfficer");
			/* 3-2 基金 */
			commonParamjson.fundId = $.getSelectedValue("fund");
			/* 4-1 提交时间 */
			commonParamjson.submittedOnDate = $('input[name="SubmittedOn"]').val();
			/* 4-2生效时间 */
			commonParamjson.expectedDisbursementDate = $('input[name="disbursementOn"]').val();
		}

		/* 保存申请 -整合填入的公共参数*/
		function IntegrationParameter() {
			var product = productInitParam.product;
			var commonParamjson = {
				"amortizationType": productInitParam.product.amortizationType.id,
				"calendarId": calendarId,
				"dateFormat" : $('input[name="disbursementOn"]').attr('date-format'),
				"graceOnInterestPayment" : product.graceOnInterestPayment,
				"graceOnPrincipalPayment" : product.graceOnPrincipalPayment,
				"groupId" : groupId,
				"inArrearsTolerance" : product.inArrearsTolerance,
				"interestCalculationPeriodType" : product.interestCalculationPeriodType.id,
				"interestRatePerPeriod" : product.interestRatePerPeriod,
				"interestType" : product.interestType.id,
				"loanTermFrequency" : productInitParam.termFrequency,
				"loanTermFrequencyType" : productInitParam.termPeriodFrequencyType.id,
				"loanType" : "jlg",
				"locale" : $.getLocale(),
				"numberOfRepayments" : product.numberOfRepayments,
				"repaymentEvery" : product.repaymentEvery,
				"repaymentFrequencyType" : product.repaymentFrequencyType.id,
				"transactionProcessingStrategyId" : product.transactionProcessingStrategyId
			}
			getAllValue(commonParamjson);
			return commonParamjson;
		}
		/* bug-记录：根据产品还款频率来判断能不能进行还款频率与会议频率的同步，如果能就显示，不能就不显示同步框 */
		
		/* 保存申请-提交请求 */
		function savingsAccounts(json) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "POST",
				data : {
					"dataType" : "POST",
					"mydata" : json,
					"url" : "api.v1.batches"
				},
				callback : "savingLoanSuccess"
			});
		}

		function savingLoanSuccess(param) {
				if(typeof(param[0].body)!=="undefined"){
					body = eval("(" + param[0].body + ")");
					if(typeof(body.defaultUserMessage)!=="undefined")
						$.bAlert(body.defaultUserMessage);
				}
		}

		/* 保存请求-单击保存按钮的触发事件 */
		$("#submite").click(function() {
			var json = IntergrationClient();
			if(json.length<1){
				$.bAlert("请选择贷款客户");
				return 0;
			}
			savingsAccounts(json);
		});
	</script>
</body>
</html>