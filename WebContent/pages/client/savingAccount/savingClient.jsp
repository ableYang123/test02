<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div>
		<label><spring:message code="group.deposit.title" /></label>
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
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4 " style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.submit.on" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<input id="SubmittedOn" name="SubmittedOn" type="text"
						class="form-control" datetype="date"
						local-date="true">
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 53px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.field.officer" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<select id="fieldOfficerOptions" class="form-control"
						style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.external.id" />
					</label>
				</div>
				<div class="" style="padding-left: 0px">
					<input id="ExternalId">
				</div>
			</div>
		</div>

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div style="height: 15px">
			<div class="modal-body col-md-12" style="padding: 5px">
				<label
					style="padding-top: 3px; font-size: 16px; font-weight: normal">
					<spring:message code="group.terms" />
				</label>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 50px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.currency" />
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px; padding-top: 5px">
					<label style="font-size: 16px; font-weight: normal"> <span
						id="Currency" style="font-size: 16px"></span>
					</label>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.decimal.places" />
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px; padding-top: 5px">
					<label style="font-size: 16px; font-weight: normal"> <span
						id="DecimalPlaces"></span>
					</label>
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="font-size: 16px; font-weight: normal; margin-button: 0px">
						<spring:message code="group.nominal.annual.interest" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="NominalAnnualInterest">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 2px">
					<label
						style="font-size: 14px; font-weight: normal; margin-button: 0px"><spring:message
							code="group.interest.compounding.period" /> <span
						style="font-size: 14px; color: #d9534f">*</span> </label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="interestCompoundingPeriodTypeOptions"
						class="form-control" style="width: 200">
					</select>
				</div>
			</div>
		</div>

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.currency.multiples" />
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="inMultiplesOf" value="" disabled="true" readOnly="true">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label
						style="padding-top: 3px; font-size: 16px; font-weight: normal">
						<spring:message code="group.interest.posting.period" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="interestPostingPeriodTypeOptions" class="form-control"
						style="width: 200">
					</select>
				</div>
			</div>
		</div>

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 70px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.interest.calculated.using" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="interestCalculationTypeOptions" class="form-control"
						style="width: 200">
					</select>
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.days.in.year" /> <span
						style="font-size: 14px; color: #d9534f">*</span>
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<select id="interestCalculationDaysInYearTypeOptions"
						class="form-control" style="width: 200">
					</select>
				</div>
			</div>
		</div>

		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">

		<div class="modal-body" style="height: 60px; padding: 5px">
			<div class="col-md-6" style="padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.minimum.opening.balance" />
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="MinimumOpeningBalance">
				</div>
			</div>
			<div class="col-md-6" style="padding: 5px;">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="group.lock.period" />
					</label>
				</div>
				<div class="col-md-8" style="padding: 0px">
					<div class="col-md-7" style="padding: 0px">
						<input id="inPeriod" style="width: 150px">
					</div>
					<div class="col-md-5" style="padding: 0px">
						<select id="TimeUnitList" class="form-control" style="width: 100">
							<option value=0><spring:message code="group.select" /></option>
							<option value=1>Days</option>
							<option value=2>Weeks</option>
							<option value=3>Months</option>
							<option value=4>Years</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div class="modal-body" style="height: 30px; padding: 5px">
			<div class="col-md-4 text-left"
				style="padding-left: 10px; padding-right: 0px">
				<div class="col-md-1 text-right" style="padding-left: 0px">
					<input type="checkbox" id="ApplyWithdrawalFeeForTransfers">
				</div>
				<div class="col-md-11" style="padding: 0px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.withdrawal.fee.for.transfers" />
					</label>
				</div>
			</div>
		</div>
		<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
		<div id="OverdraftAllowed" class="modal-body"
			style="height: 30px; padding: 5px">
			<div class="col-md-4 text-left"
				style="padding-left: 10px; padding-right: 0px">
				<div class="col-md-1 text-right" style="padding-left: 0px">
					<input type="checkbox" id="IsOverdraftAllowed">
				</div>
				<div class="col-md-11" style="padding: 0px">
					<label style="font-size: 16px; font-weight: normal"> <spring:message
							code="group.is.overdraft.allowed" />
					</label>
				</div>
			</div>
			<!-- zheli -->
			<div id="paddingDiv" class="col-md-2" style="display: none"></div>
			<div id="AmountLimit" class="col-md-6"
				style="height: 40px; display: none; padding: 5px">
				<div class="col-md-4" style="padding: 5px">
					<label style="font-size: 14px; font-weight: normal"> <spring:message
							code="lable.maximum.overdraft.amount.limit" />
					</label>
				</div>
				<div class="col-md-8" style="padding-left: 0px">
					<input id="MaximumOverdraftAmountLimit">
				</div>
			</div>
			<!-- zheli -->
		</div>
		<!-- zheli -->
		<div id="overdraft" style="display: none">
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<div class="modal-body" style="height: 70px; padding: 5px">
				<div class="col-md-6" style="padding: 5px">
					<div class="col-md-4" style="padding: 5px">
						<label style="font-size: 14px; font-weight: normal"> <spring:message
								code="lable.Nominal.annual.interest.for.overdraft" />
						</label>
					</div>
					<div class="col-md-8" style="padding-left: 0px">
						<input id="NominalAnnualInterestForOverdraft">
					</div>
				</div>
				<div class="col-md-6" style="padding: 5px">
					<div class="col-md-4" style="padding: 5px">
						<label style="font-size: 14px; font-weight: normal"> <spring:message
								code="lable.min.Overdraft.Required.For.Interest.Calculation" />
						</label>
					</div>
					<div class="col-md-8" style="padding-left: 0px">
						<input id="MinOverdraftRequiredForInterestCalculation">
					</div>
				</div>
			</div>
		</div>
		<!-- zheli -->
		<div id="lastOneLian" style="display: block">
			<hr style="margin-top: 5; margin-bottom: 5; width: 868px">
			<div class="modal-body" style="height: 30px; padding: 5px">
				<div class="col-md-4 text-left"
					style="padding-left: 10px; padding-right: 0px">
					<div class="col-md-1 text-right" style="padding-left: 0px">
						<input type="checkbox" id="EnforceMinimumBalance">
					</div>
					<div class="col-md-11" style="padding: 0px">
						<label style="font-size: 16px; font-weight: normal"> <spring:message
								code="group.enforce.minimum.balance" />
						</label>
					</div>
				</div>

				<div class="col-md-2"></div>
				<div class="col-md-6" style="height: 40px; padding: 5px">
					<div class="col-md-4" style="padding: 5px">
						<label style="font-size: 14px; font-weight: normal"> <spring:message
								code="lable.minimum.balance" />
						</label>
					</div>
					<div class="col-md-8" style="padding-left: 0px">
						<input id="MinimumBalance" name="minimumBalance">
					</div>
				</div>
			</div>
		</div>
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
		<div id="chageTable" class="modal-body"
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
					<th name="chargesRepaymentsEvery"><spring:message
							code="group.repayments.every" /></th>
					<th name="chargesOption"><spring:message
							code="group.action" /></th>
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
	var productListUrl;
	var productDetailUrl;
		$(document).ready(function() {
			$.datetimepicker();
			if(groupId){
				productListUrl= "api.v1.savingsaccounts.template?groupId="
					+ groupId + "&staffInSelectedOfficeOnly=true";
			}
			if(clientId){
				productListUrl= "api.v1.savingsaccounts.template?clientId="
						+clientId+"&staffInSelectedOfficeOnly=true";
			}
			getproductOptionList();
			/* 获得产品列表 */
			function getproductOptionList() {
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"url" : productListUrl
					},
					callback : "initproductOptionList"
				});
			}
		});
		
		/* 初始化产品列表 */
		function initproductOptionList(param) {
			$
					.setSelect('selectProductList', param.productOptions, 'id',
							'name');
			$.setSelect('productList', param.productOptions, 'id', 'name');
		}

		/* 选择产品时的触发事件-保存选择项信息 */
		function selectProduct() {
			var selectedValue = parseInt($("#selectProductList").find(
					"option:selected").attr("value"));
			$("#productList").val(selectedValue);
			initProductDetailUrl(selectedValue);
			getInformationPageContent(selectedValue);
			changePage();
		}

		/* 选择产品时触发事件-重新初始化页面 */
		function initSelectedProductPage() {
			var selectedProductId = parseInt($("#productList").find(
					"option:selected").attr("value"));
			selectEmpty();
			getInformationPageContent(selectedProductId);
		}

		/* 设置隐藏产品选择页打开信息填写页 */
		function changePage() {
			$("#productSelectPage").remove();
			$("#informationPage").css("display", "block");
		}

		/* 初始化initProductDetailUrl */
		function initProductDetailUrl(productId){
			if(typeof clientId != 'undefined')
				productDetailUrl = "api.v1.savingsaccounts.template?clientId="+clientId+"&productId="+productId+"&staffInSelectedOfficeOnly=true";
			+ "&staffInSelectedOfficeOnly=true&templateType=group";
			if(typeof groupId != 'undefined')
				productDetailUrl = "api.v1.savingsaccounts.template?groupId="
					+ groupId + "&productId=" + productId+ "&staffInSelectedOfficeOnly=true";
		}
		
		/* 初始化信息填写页面 -每次选择产品都会进行一次初始化*/
		function getInformationPageContent(productId) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"url" : productDetailUrl
				},
				callback : "initInformationPage"
			});
		}

		/* 初始化页面的select及其他 */
		function initInformationPage(param) {
			$.setSelect('fieldOfficerOptions', param.fieldOfficerOptions, 'id',
					'displayName');
			$.setSelect('interestCompoundingPeriodTypeOptions',
					param.interestCompoundingPeriodTypeOptions, 'id', 'value');
			$.setSelect('interestPostingPeriodTypeOptions',
					param.interestPostingPeriodTypeOptions, 'id', 'value');
			$.setSelect('interestCalculationTypeOptions',
					param.interestCalculationTypeOptions, 'id', 'value');
			$.setSelect('interestCalculationDaysInYearTypeOptions',
					param.interestCalculationDaysInYearTypeOptions, 'id',
					'value');
			/* linkd 自己做 */
			$.setSelect('chargeOptions', filtrationCharge(param), 'id', 'name');
			/* 添加附带的charge */
			addPristinecharge(param.charges);
			/* 设置 Currency和DecimalPlacesValue的值*/
			$("#Currency").text(
					param.currency.name + "(" + param.currency.code + ")");
			$("#DecimalPlaces").text(param.currency.decimalPlaces);
			$("#inMultiplesOf").val(param.currency.inMultiplesOf)
			$("#NominalAnnualInterest").val(param.nominalAnnualInterestRate);
		}

		/* 筛选出当前存款适用的收费-规则：货币类型和产品一致 */
		function filtrationCharge(param){
		var LoanProductCurrencyCode = param.currency.code;
		var chargeOptions = param.chargeOptions;
		var ThisProductChargesOption = []
			for(var i=0;i<chargeOptions.length;i++)
				if(LoanProductCurrencyCode == chargeOptions[i].currency.code)
					ThisProductChargesOption.push(chargeOptions[i]);
			return ThisProductChargesOption;
	}
		/* 添加附加的charge */
		function addPristinecharge(charges){
			if(charges.length<1){
				return 0;
			}
			for(var i=0;i<charges.length;i++){
				var name = charges[i].name;
				var amount = charges[i].amount;
				var id = charges[i].chargeId;
				var type = charges[i].chargeCalculationType.value;
				var collection = charges[i].chargeTimeType.value;
				apendChargesList(id, name, type, collection,amount);
			}
			showTable();
		}
		/* 清空所有select */
		function selectEmpty() {
			$("#fieldOfficerOptions").empty();
			$("#interestCompoundingPeriodTypeOptions").empty();
			$("#interestPostingPeriodTypeOptions").empty();
			$("#interestCalculationTypeOptions").empty();
			$("#interestCalculationDaysInYearTypeOptions").empty();
			$("#chargeOptions").empty();
		}

		/* 增加收费按钮触发事件 -搜索数据*/
		function addCharge() {
			var selectedCharge = parseInt($("#chargeOptions").find(
					"option:selected").attr("value"));
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

		/* 增加收费按钮触发事件 -准备数据*/
		function addChargeView(param) {
			var name = param.name;
			var type = param.chargeCalculationType.value;
			var collection = param.chargeTimeType.value;
			var amount = param.amount;
			var id = param.id;
			apendChargesList(id, name, type, collection,amount);
			$("#chargeOptions").val(0);
			showTable();
		}
		
		/* 删除charges */
		function deleteCharge(id) {
			$("#chage" + id).remove();
			hideTable();
		}
		
		/* 判断是否显示收费表头 */
		function showTable() {
			var chargesNumber = $("tr[name='chage']");
			if (chargesNumber.length > 0) {
				$("#chageTable").css("display", "block");
				$("#optionButton").css("margin-top", "180px");
			}
		}
		
		/* 判断是否隐藏收费表头 */
		function hideTable() {
			var chargesNumber = $("tr[name='chage']");
			if (chargesNumber.length < 1) {
				$("#chageTable").css("display", "none");
				$("#optionButton").css("margin-top", "20px");
			}
		}

		/* 增加收费按钮触发事件 -添加视图*/
		function apendChargesList(id, name, type, collection,amount) {
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
									+ "<td><div style='display:"+collectionTime+"'><input type='text' datetype='date' name='date' local-date='true' class='datetime'></div></td>"
									+ "<td><input value='' style='display:"+collectionPrice+"'></td>"
									+ "<td><input name='submit' style='margin-top:4px' onclick='deleteCharge("
									+ id
									+ ")'"
									+ "	type='image' src='${pageContext.request.contextPath}/images/t03.png' /></td>"
									+ "</tr>");
			$.datetimepicker();
			$(".datetimepicker-inline").remove();
		}

		/* 是否允许透支选择事件-view */
		$("#IsOverdraftAllowed").change(function() {
			if ($('#IsOverdraftAllowed').is(':checked')) {
				$("#OverdraftAllowed").css("height", "50px");
				$("#lastOneLian").css("display", "none");
				$("#paddingDiv").css("display", "block");
				$("#AmountLimit").css("display", "block");
				$("#overdraft").css("display", "block");
			} else {
				$("#OverdraftAllowed").css("height", "30px");
				$("#lastOneLian").css("display", "block");
				$("#paddingDiv").css("display", "none");
				$("#AmountLimit").css("display", "none");
				$("#overdraft").css("display", "none");
			}
		});
		/*  保存申请 -封装费用成json*/
		/*  {chargeId: 10, amount: 100, feeOnMonthDay: "25 October", feeInterval: "10"}*/
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
				dd.chargeId = id+"";
				dd.amount = Amount+"";
				if (chargeName == "Specified due date") {
					dd.dueDate = date;
				}
				if (chargeName == "Monthly Fee"||chargeName == "Weekly Fee") {
					dd.feeInterval = quota;
					dd.dueDate = date;
				}
				json.push(dd);
			});
			return json;
		}

		/* 保存申请 -整合填入的参数*/
		function IntegrationParameter() {
			var charges = IntergrationCharges();
			charges.shift();
			var json;
			if(clientId){
				json = {
						"allowOverdraft" : $.judgeCheckbox("IsOverdraftAllowed"),
						"charges" : charges,
						"dateFormat" : $('input[name="SubmittedOn"]').attr('date-format'),
						"enforceMinRequiredBalance" : $
								.judgeCheckbox("EnforceMinimumBalance"),
						"clientId" : clientId,
						"minRequiredBalance" : $.value('minimumBalance'),
						"interestCalculationDaysInYearType" : $
								.getSelectedValue("interestCalculationDaysInYearTypeOptions"),
						"interestCalculationType" : $
								.getSelectedValue("interestCalculationTypeOptions"),
						"interestCompoundingPeriodType" : $
								.getSelectedValue("interestCompoundingPeriodTypeOptions"),
						"interestPostingPeriodType" : $
								.getSelectedValue("interestPostingPeriodTypeOptions"),
						"locale" : "zh_CN",
						"monthDayFormat" : "dd MMM",
						"nominalAnnualInterestRate" : $
								.getInputValue("NominalAnnualInterest"),
						"productId" : $.getSelectedValue("productList"),
						"submittedOnDate" : $('input[name="SubmittedOn"]').val(),
						"withHoldTax" : false,
						"withdrawalFeeForTransfers" : $
								.judgeCheckbox("ApplyWithdrawalFeeForTransfers")
					}
			}
			if(groupId){
				json = {
					"allowOverdraft" : $.judgeCheckbox("IsOverdraftAllowed"),
					"charges" : charges,
					"dateFormat" : $('input[name="SubmittedOn"]').attr('date-format'),
					"enforceMinRequiredBalance" : $
							.judgeCheckbox("EnforceMinimumBalance"),
					"groupId" : groupId,
					"minRequiredBalance" : $.value('minimumBalance'),
					"interestCalculationDaysInYearType" : $
							.getSelectedValue("interestCalculationDaysInYearTypeOptions"),
					"interestCalculationType" : $
							.getSelectedValue("interestCalculationTypeOptions"),
					"interestCompoundingPeriodType" : $
							.getSelectedValue("interestCompoundingPeriodTypeOptions"),
					"interestPostingPeriodType" : $
							.getSelectedValue("interestPostingPeriodTypeOptions"),
					"locale" : "zh_CN",
					"monthDayFormat" : "dd MMM",
					"nominalAnnualInterestRate" : $
							.getInputValue("NominalAnnualInterest"),
					"productId" : $.getSelectedValue("productList"),
					"submittedOnDate" : $('input[name="SubmittedOn"]').val(),
					"withHoldTax" : false,
					"withdrawalFeeForTransfers" : $
							.judgeCheckbox("ApplyWithdrawalFeeForTransfers")
				}
			}

			addValue("externalId", $.getInputValue("ExternalId"), json);
			addValue(
					"minOverdraftForInterestCalculation",
					$.getInputValue("MinOverdraftRequiredForInterestCalculation"),
					json);
			addValue("minRequiredOpeningBalance", $
					.getInputValue("MinimumOpeningBalance"), json);
			addValue("nominalAnnualInterestRateOverdraft", $
					.getInputValue("NominalAnnualInterestForOverdraft"), json);
			addValue("overdraftLimit", $
					.getInputValue("MaximumOverdraftAmountLimit"), json);
			var lockinPeriodFrequencyType = parseInt($("#inPeriod").val());
			if(lockinPeriodFrequencyType){
				json["lockinPeriodFrequencyType"] = $.getSelectedValue("TimeUnitList");
				json["lockinPeriodFrequency"] = lockinPeriodFrequencyType;
			}
			
			
			return json;
		}

		/* 如果值不为空就将值放到json中 */
		function addValue(key, value, json) {
			if (value != "" && typeof (selectList) == "undefined") {
				json[key] = value;
			}
		}
		/* 保存申请-提交请求 */
		function savingsAccounts(json) {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "POST",
				data : {
					"dataType" : "POST",
					"mydata" : json,
					"url" : "api.v1.savingsaccounts"
				},
				callback : "savingSuccess"
			});
		}

		function savingSuccess(param) {
			$.setReadOnly("savingClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
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