<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="addFloatingRatesForm" name="addFloatingRatesForm">
	<fieldset>
		<legend><spring:message code="title.floatingRates.list" /></legend>

		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="lable.floatingRates.name" /><span style="color: #d9534f;">*</span> </label>
			
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" value='' />
			</div>
		</div>

		<div class="form-group">
			<label for="isBaseLendingRate" class="col-sm-3 control-label"><spring:message code="lable.isBaseLenging" /></label>

			<div class="col-sm-3">
				<label class="checkbox"> <input id="isBaseLendingRate" type="checkbox"></label>
			</div>
		</div>

		<div class="form-group">
			<label for="isActive" class="col-sm-3 control-label"><spring:message code="lable.active" /></label>

			<div class="col-sm-3">
				<label class="checkbox"> <input id="isActive" type="checkbox"></label>
			</div>
		</div>

		<div class="form-group">
			<label for="ratePeriods" class="col-sm-3 control-label"><spring:message code="lable.floatingRates.period" />:</label>
		</div>

		<div class="form-group">
			<label for="ratePeriods" class="col-sm-1 control-label"></label>
			<div class="col-sm-8">
				<table class="table" id="periodTable">
					<tr>
						<td><spring:message code="lable.fromDate"/></td>
						<td><spring:message code="lable.rate"/></td>
						<td><spring:message code="lable.isDifferential"/></td>
						<td><spring:message code="lable.action"/></td>
					</tr>
					<tr style="display: none">
						<td><input type="text" class="form-control datetime" datetype="none" name="fromDate"  beforeToday="true" /></td>
						<td><input class="form-control" type="text" name="interestRate" /></td>
						<td><input type="checkbox" name="isDifferentialToBaseLendingRate" /></td>
						<!-- <td><button type="button" class="btn delete " onclick="deletePeriod(this)"></button></td> -->
						<td><button type="button" class="btn btn-link " onclick="deletePeriod(this)">
							<span class="glyphicon glyphicon-remove"></span>
						</button></td>
					</tr>
				</table>
			</div>
			<%-- <button type="button" class="btn btn-primary" name="addFloatingRate" onclick="addPeriod();" id="addFloatingRate">
				<spring:message code="lable.add"/>
			</button> --%>
			<button type="button" class="btn btn-link" onclick="addPeriod();">
				<span class="glyphicon glyphicon-plus"></span>
				<spring:message code="taxes.add" />
			</button>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-5">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit" /></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	$(document).ready(function() {

			$.datetimepicker();

			$.valid("addFloatingRatesForm", [ {
				"name" : "name",
				"notEmpty" : ""
			} ]);

			$.getWidget("save").click(function() {
							if ($.validateForm("addFloatingRatesForm")) {
								
								var name = $.trim($.value("name"));

								var json = {
									"name" : name
								};

								var isBaseLendingRate = $('#isBaseLendingRate').is(':checked');
								var isActive = $('#isActive').is(':checked');
								var dateFormat = $('input[name="fromDate"]').attr('date-format');
								
								json["isBaseLendingRate"] = isBaseLendingRate;
								json["isActive"] = isActive;

								var periodJson = new Array();

								$('#periodTable').find('tr').eq(1).nextAll().each(function() {

													var fromDate = $(this).find('input[name="fromDate"]').val();
													var interestRate = $(this).find('input[name="interestRate"]').val();
													var rowJson = {
														"fromDate" : fromDate,
														"interestRate" : interestRate,
														"locale" : "en",
														"dateFormat" : "dateFormat"
													};
													periodJson.push(rowJson);
												}

										);
								if (periodJson.length > 0) {

									json["ratePeriods"] = periodJson;

								}

								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"contentType" : "application/json",
												"dataType" : "POST",
												"mydata" : json,
												"url" : "api.v1.floatingrates"
											},
											callback : "add_success"
										});
							}
			});
	});

	function addPeriod() {
		$.tableclone("periodTable");
	}

	function deletePeriod(obj) {
		$(obj).parent().parent().remove();
	}

	function add_success(param) {
		$.setReadOnly('addFloatingRatesForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>




