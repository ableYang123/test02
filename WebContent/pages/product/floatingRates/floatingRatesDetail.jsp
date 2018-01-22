<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="FloatingRatesDetailForm"
	name="FloatingRatesDetailForm">
	<fieldset>
		<legend>
			<spring:message code="title.floatingRates.list" />
		</legend>

		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="lable.floatingRates.name" /><span style="color: #d9534f;">*</span> </label>
			
			<div class="col-sm-3">
				<!-- <input type="text" class="form-control" id="name" name="name" value='' /> -->
				<span id="name"></span>
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
					</tr>
					<tr style="display: none">
<!-- 						<td><input type="text" class="form-control datetime" datetype="none" name="fromDate"  beforeToday="true" /></td>
 -->			
 						<!-- <td><input class="form-control" type="text" name="interestRate" /></td> -->
 						<td><span id=fromDate></span> </td>	
 						<td><span id=interestRate></span> </td>				
						<td><input type="checkbox" name="isDifferentialToBaseLendingRate" /></td>
					</tr>
				</table>
			</div>
		</div>

	</fieldset>
</form>
<div class="form-group">
	<div class="col-sm-offset-5">
		<button type='button' onclick="modifyData();" id="modify" name="modify" class="btn btn-primary">
			<spring:message code="lable.midify" />
		</button>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {

		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : '',
				"url" : "api.v1.floatingrates." + floatingRatesId
			},
			callback : "detailback"
		});
	});

	function detailback(param) {

		$('#name').text(param.name);
		if (param.isBaseLendingRate) {
			$('#isBaseLendingRate').attr("checked", true);
		}
		if (param.isActive) {
			$('#isActive').attr("checked", true);
		}

		var periodsArray = param.ratePeriods;

		if (periodsArray.length > 0) {
			for (var i = 0; i < periodsArray.length; i++) {

				$.tableclone("periodTable");
				var fromDate = $.formatDate(periodsArray[i].fromDate);
				$('#periodTable').find('tr').eq(i + 2).find('#fromDate').text(fromDate);
				$('#periodTable').find('tr').eq(i + 2).find('#interestRate').text(periodsArray[i].interestRate);

			}
		}
/* 		$.assign({
			'name' : param.name,
		}); */

		$.setReadOnly('FloatingRatesDetailForm');
	}

	function modifyData() {
		$.openWindow("loadPage.do?nextPage=product.floatingRates.edit_floatingRates");
	}
</script>




