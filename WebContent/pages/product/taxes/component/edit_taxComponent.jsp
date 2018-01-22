<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="editTaxComponentForm" name="editTaxComponentForm">
	<fieldset>
		<legend><spring:message code="title.edit.tax.component" /></legend>

		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" value='' />
			</div>
		</div>
		<div class="form-group">
			<label for="percentage" class="col-sm-3 control-label"><spring:message code="lable.percentage" /><span style="color: #d9534f;">*</span> </label>
			
			<div class="col-sm-3">
				<input type="text" class="form-control" id="percentage" name="percentage" value='' />
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="lable.account.type"/></label>
			<div class="col-sm-3">
			<span id="creditAccountType" name="creditAccountType"></span>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="lable.account"/></label>
			<div class="col-sm-3">
				<span id="creditAcountId" name="creditAcountId"></span>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="lable.startDate"/></label>

			<div class="col-sm-3">
				<input type="text" datetype="date" name="startDate"   beforeToday="false"/>
			</div>
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

			$.valid("addTaxComponentForm", [ {
				"name" : "name",
				"notEmpty" : ""
			}, {
				"name" : "percentage",
				"notEmpty" : ""
			} ]);
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.taxes.component."+taxComponentId
				},
				callback : "editback"
				});
			
			$.getWidget("save").click(function() {
							if ($.validateForm("editTaxComponentForm")) {
								
								var name = $.trim($.value("name"));
								var percentage = $.trim($.value("percentage"));
								var startDate = $('input[name="startDate"]').val();
								var dateFormat = $('input[name="startDate"]').attr('date-format');
								
								var json = {
									"name" : name,
									"percentage" : percentage,
									"startDate" : startDate,
									"dateFormat" : dateFormat
								};
								
								json["locale"] = "zh";

								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"dataType" : "PUT",
												"mydata" : json,
												"url" : "api.v1.taxes.component."+taxComponentId
											},
											callback : "edit_success"
										});
							}
			});
	});

	function editback(param){
		
		$.datetimepicker();
		
		$.assign({
			'name' : param.name,
			'percentage':param.percentage,
			
			
		});
		var dateFormat = $('input[name="startDate"]').attr('date-format');
		var date=$.formatDate(param.startDate,dateFormat);
		$('input[name="startDate"]').val(date);
		
		if(typeof(param.creditAccountType)!='undefined'){
			$('#creditAccountType').text(param.creditAccountType.value);
			$('#creditAcountId').text(param.creditAccount.name);
			}
		
	}
	function edit_success(param) {
		$.setReadOnly('editTaxComponentForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>




