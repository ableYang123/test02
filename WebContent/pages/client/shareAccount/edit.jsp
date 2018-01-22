<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3><spring:message code="title.shareAccount.application" /></h3>
			<form class="form-horizontal" role="form" id="editShareForm">
				<fieldset>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="productId" style="font-size: 16px; font-weight: normal">
							<spring:message code="label.shareAccount.product" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="productId" name="productId">
							<!-- <option selected="selected" value="0">select one</option>  -->
							</select>
						</div>
						<label class="col-sm-2 control-label hideTag" for="submittedOnDate" style="font-size: 16px; font-weight: normal">
							<spring:message code="label.shareAccount.submitOn" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4 hideTag">
							<input class="form-control" datetype="date" id="submittedOnDate" name="submittedDate" type="text" local-date="true" afterToday="true"/>
						</div>
					</div>
					<div class="form-group hideTag">
						<label class="col-sm-2 control-label" for="externalId" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.externalId" /></label>
						<div class="col-sm-4">
							<input class="form-control" id="externalId" name="externalId" type="text" />
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="currencyLabel" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.currency" /></label>
						<div class="col-sm-4">
							<p class="form-control-static" id="currencyLabel"></p>
						</div>
						<label class="col-sm-2 control-label" for="currencyDP" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.decimalPlaces" /></label>
						<div class="col-sm-4">
							<p class="form-control-static" id="currencyDP"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="requestedShares" style="font-size: 16px; font-weight: normal">
							<spring:message code="label.shareAccount.numberOfShares" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4">
							<input class="form-control" id="requestedShares" name="requestedShares" type="text" />
						</div>
						<label class="col-sm-2 control-label" for="nominalpricevalue" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.todayPrice" /></label>
						<div class="col-sm-4">
							<input class="form-control" id="nominalpricevalue" type="text" disabled />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="currencyMultiples" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.inMultiplesOf" /></label>
						<div class="col-sm-4">
							<input class="form-control" id="currencyMultiples" type="text" disabled />
						</div>
						<label class="col-sm-2 control-label" for="savingsAccountId" style="font-size: 16px; font-weight: normal">
							<spring:message code="label.shareAccount.defaultSavingsAccont" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4">
							<select class="form-control" id="savingsAccountId" name="savingsAccountId">
								<option selected="selected">select one</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="minimumActivePeriod" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.minActivePeriod" /></label>
						<div class="col-sm-2">
							<input class="form-control" id="minimumActivePeriod" name="minimumActivePeriod" type="text" />
						</div>
						<div class="col-sm-2">
							<select class="form-control" id="minimumActivePeriodFrequencyType" name="minimumActivePeriodFrequencyType">
								<option selected="selected">select one</option>
							</select>
						</div>
						<label class="col-sm-2 control-label" for="lockinPeriodFrequency" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.lockInPeriod" /></label>
						<div class="col-sm-2">
							<input class="form-control" id="lockinPeriodFrequency" name="lockinPeriodFrequency" type="text" />
						</div>
						<div class="col-sm-2">
							<select class="form-control" id="lockinPeriodFrequencyType" name="lockinPeriodFrequencyType">
								<option selected="selected">select one</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="applicationdate" style="font-size: 16px; font-weight: normal">
							<spring:message code="label.shareAccount.applicationDate" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4">
							<input class="form-control" datetype="date" id="applicationdate" name="applicationDate" type="text" local-date="true" afterToday="true"/>
						</div>
						<div class="col-sm-6">
							<div class="checkbox">
								<label>
									<input type="checkbox" name="allowDividendCalculationForInactiveClients" value="true">
									<spring:message code="label.shareAccount.allowDividends" />
								</label>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend></legend>
					<div class="form-group" id="chargeAreaMark">
						<label class="col-sm-2 control-label" for="chargeId" style="font-size: 16px; font-weight: normal"><spring:message code="label.shareAccount.charges" /></label>
						<div class="col-sm-3">
							<select class="form-control" id="chargeId">
								<option selected="selected" value="0">select charge</option>
							</select>
						</div>
						<button type="button" class="btn btn-link" id="addCharges">
							<span class="glyphicon glyphicon-plus"></span>
							<spring:message code="label.shareAccount.add" />
						</button>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-10">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="label.shareAccount.cancel" /></button>
								<button type="button" class="btn btn-primary" id="submit_share"><spring:message code="label.shareAccount.submit" /></button>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var clientId;
	var productId;
	$(document).ready(
			function() {
				$.datetimepicker();
				init();
				$('#productId').change(function() {
					productId = $.value('productId');
					$('form')[0].reset();
					var length = $('#chargeTable').find('tr').length;
					if (length > 1) {//删除table
						$('#chargeTable').parent().parent().remove();
					}
					$('input[name="allowDividendCalculationForInactiveClients"]').attr("checked", false);
					productChange(productId);
				});
				$('#submit_share').click(
						function() {
							var formData = $('form').serializeArray();//获取form所有数据
							var dateFormat = $('input[name=submittedDate]').attr("date-format");

							var json = {
								"clientId" : clientId,
								"locale" : "en",
								"dateFormat" : dateFormat,
							}
							$.each(formData, function() {
								if (this.value != ''
										&& this.value != "select one") {
									json[this.name] = this.value;
								}

							});
							var flag = $('#chargeTable');//如果添加了费用
							if (flag.length == 1) {
								var chargesArr = [];
								$('tr').filter(".amountData").each(
										function() {
											var chargeId = $(this).find('td').eq(0).text();
											var amount = $(this).find('input').val();
											var amountjson = {
												"chargeId" : chargeId,
												"amount" : amount
											}
											chargesArr.push(amountjson);
										});
								json["charges"] = chargesArr;
							}
							modifyShare(json);
						});
				$('#addCharges').click(function() {
					var chargeId = $.value("chargeId");
					if (typeof chargeId === 'undefined') {
						return;
					}
					addCharges(chargeId);
				});
			});
	function init() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.accounts.share." + shareAccountId
						+ "?template=true"
			},
			callback : "b_editShare"
		});
	}
	function b_editShare(param) {
		clientId = param.clientId;
		$.setSelect('productId', param.productOptions, 'id', 'name');
		$.setSelect('savingsAccountId', param.clientSavingsAccounts, 'id','accountNo');
		$.setSelect('minimumActivePeriodFrequencyType',param.minimumActivePeriodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('lockinPeriodFrequencyType',param.lockinPeriodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('chargeId', param.chargeOptions, 'id', 'name');
		var dateFormat = $('input[name="submittedDate"]').attr('date-format');
		var submittedDate = $.formatDate(param.timeline.submittedOnDate,dateFormat);
		var applicationDate = $.formatDate(param.purchasedShares[0].purchasedDate, dateFormat);
		$.assign({
					"productId" : param.productId,
					"submittedDate" : submittedDate,
					"requestedShares" : param.summary.totalPendingForApprovalShares,
					"nominalpricevalue" : param.currentMarketPrice,
					"currencyMultiples" : param.currency.inMultiplesOf,
					"savingsAccountId" : param.savingsAccountId,
					"minimumActivePeriodFrequencyType" : param.minimumActivePeriodTypeEnum.id,
					"lockinPeriodFrequencyType" : param.lockPeriodTypeEnum.id,
					"applicationDate" : applicationDate
				});
		$('#currencyLabel').text(param.currency.displayLabel);
		$('#currencyDP').text(param.currency.decimalPlaces);
		
		if (typeof (param.externalId) !== 'undefined') {
			$('#externalId').val(param.externalId);
		}
		if (typeof (param.lockinPeriod) !== 'undefined') {
			$('#lockinPeriodFrequency').val(param.lockinPeriod);
		}
		if (typeof (param.minimumActivePeriod) !== 'undefined') {
			$('#minimumActivePeriod').val(param.minimumActivePeriod);
		}
		if (param.allowDividendCalculationForInactiveClients) {
			$('input[name="allowDividendCalculationForInactiveClients"]').attr("checked", true);
		}
		if(!$.isEmptyObject(param.charges)){
			$.each(param.charges,function(i,obj){
				obj.id=obj.chargeId;
				drawChargeTable(obj);
			});
		}

	}
	function productChange(productId) {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.accounts.share.template?clientId=" + clientId
						+ "&productId=" + productId
			},
			callback : "b_productChange"
		});
	}
	function b_productChange(param) {
		
		$.setSelect('savingsAccountId', param.clientSavingsAccounts, 'id','accountNo');
		$.setSelect('minimumActivePeriodFrequencyType',param.minimumActivePeriodFrequencyTypeOptions, 'id', 'value');
		$.setSelect('lockinPeriodFrequencyType',param.lockinPeriodFrequencyTypeOptions, 'id', 'value');
		$('#currencyLabel').text(param.currency.displayLabel);
		$('#currencyDP').text(param.currency.decimalPlaces);
		$.assign({
			"requestedShares" : param.defaultShares,
			"nominalpricevalue" : param.currentMarketPrice,
			"currencyMultiples" : param.currency.inMultiplesOf,
		});
		$('#productId').val(productId);
		if(!$.isEmptyObject(param.charges)){
			
			$.each(param.charges,function(i,obj){
				obj.id=obj.chargeId;
				drawChargeTable(obj);
			});
		}
	}
	function modifyShare(json) {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "PUT",
				"mydata" : json,
				"url" : "api.v1.accounts.share."+shareAccountId
			},
			callback : "b_modifyShare"
		});
	}
	function b_modifyShare(param) {
		$.setReadOnly('editShareForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
	function addCharges(chargeId) {
		$("#chargeId").val(0);
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : '',
				"url" : "api.v1.charges." + chargeId + "?template=true"
			},
			callback : "b_addCharges"
		});
	}
	function b_addCharges(param) {
		drawChargeTable(param);
	}
	function drawChargeTable(chargeData) {
		var arr = [];
		var trArr = [];
		var flag = $('#chargeTable');
		trArr.push('<tr class="amountData">');
		trArr.push('<td style="display: none;">');
		trArr.push(chargeData.id);
		trArr.push('</td>');
		trArr.push('<td>');
		trArr.push(chargeData.name);
		trArr.push('</td>');
		trArr.push('<td>');
		trArr.push(chargeData.chargeCalculationType.value);
		trArr.push('</td>');
		trArr.push('<td>');
		trArr.push('<input type="text"/>');
		trArr.push('</td>');
		trArr.push('<td>');
		trArr.push(chargeData.chargeTimeType.value);
		trArr.push('</td>');
		trArr.push('<td>');
		trArr.push('<button type="button" class="btn btn-link " onclick="deleteTr(this)"><span class="glyphicon glyphicon-remove"></span></button>');
		trArr.push('</td>');
		trArr.push('</tr>');
		if (flag.length != 1) {
			arr.push('<div class="form-group">');
			arr.push('<div class="col-sm-offset-1 col-sm-10">');
			arr.push('<table class="table table-condensed" id="chargeTable">');
			arr.push('<thead>');
			arr.push('<tr>');
			arr.push('<th>');
			arr.push('<spring:message code="label.shareAccount.name" />');
			arr.push('</th>');
			arr.push('<th>');
			arr.push('<spring:message code="label.shareAccount.type" />');
			arr.push('</th>');
			arr.push('<th>');
			arr.push('<spring:message code="label.shareAccount.amount" />');
			arr.push('</th>');
			arr.push('<th>');
			arr.push('<spring:message code="label.shareAccount.collectedOn" />');
			arr.push('</th>');
			arr.push('<th>');
			arr.push('<spring:message code="label.shareAccount.action" />');
			arr.push('</th>');
			arr.push('</tr>');
			arr.push('</thead>');
			arr.push('<tbody>');
			arr.push(trArr.join(''));
			arr.push('</tbody>');
			arr.push('</table>');
			arr.push('</div>');
			arr.push('</div>');

		} else {
			flag.find('tr').last().after(trArr.join(''));
		}

		$('#chargeAreaMark').after(arr.join(''));
		$('#chargeTable').find('input').last().val(chargeData.amount);
	}
	function deleteTr(obj) {
		$(obj).parent().parent().remove();
		var length = $('#chargeTable').find('tr').length;
		if (length == 1) {//删除table
			$('#chargeTable').parent().parent().remove();
		}

	}
</script>
