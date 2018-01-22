<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="addTaxGroupForm" name="addTaxGroupForm">
	<fieldset>
		<legend><spring:message code="title.create.tax.group" /></legend>

		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="lable.name" /><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" value='' />
			</div>
		</div>
		
		<div class="form-group">
			<label for="taxComponent" class="col-sm-3 control-label"><spring:message code="lable.taxComponent" /></label>
			<div class="col-sm-8">
				<table class="table" id="taxComponentTable">
					<tr>
						<td><spring:message code="lable.tax.group"/></td>
						<td><spring:message code="lable.startDate"/></td>
						<td><button type="button" class="btn btn-link" onclick="addTaxComponent();">
							<span class="glyphicon glyphicon-plus"></span>
							<spring:message code="taxes.add" />
						</button></td>
					</tr>
					<tr style="display: none">
						<td><select id="taxComponentId" name="taxComponentId" class="form-control" style="width: 198">
							<option></option>
						</select></td>
						<td><input type="text" class="form-control datetime"  datetype="none" name="startDate"  beforeToday="true" /></td>
						<td><button type="button" class="btn btn-link " onclick="deleteTr(this)">
							<span class="glyphicon glyphicon-remove"></span>
						</button></td>
					</tr>
				</table>
			</div>
		</div>
					
		<div class="form-group">
			<div class="col-sm-offset-10">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit" /></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	$(document).ready(function() {

			$.datetimepicker();

			$.valid("addTaxGroupForm", [ {
				"name" : "name",
				"notEmpty" : ""
			}]);

			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.taxes.component"
				},
				callback : "addback"
			});
			
			$.getWidget("save").click(function() {
							if ($.validateForm("addTaxGroupForm")) {
								
								var name = $('input[name="name"]').val();
								var dateFormat = $('input[name="startDate"]').attr('date-format');
								
								var json = {
									"name" : name,
									"dateFormat" : dateFormat
								};
								
								json["locale"] = "zh";

								var taxComponentsJson= new Array();
								$('#taxComponentTable').find('tr').eq(1).nextAll().each(function() {

									var startDate = $(this).find('input[name="startDate"]').val();
									var taxComponentId = parseInt($(this).find('select[name="taxComponentId"]').val());
									var rowJson = {
										"taxComponentId" : taxComponentId,
										"startDate" : startDate,
									};
									taxComponentsJson.push(rowJson);
								});
								
								json['taxComponents']=taxComponentsJson;
								 
								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"contentType" : "application/json",
												"dataType" : "POST",
												"mydata" : json,
												"url" : "api.v1.taxes.group"
											},
											callback : "add_success"
										});
							}
			});
	});

	function addback(param){
		$.setSelect('taxComponentId',param,'id','name');
	}
	
	function addTaxComponent(){
		$.tableclone("taxComponentTable");
	}
	
	function deleteTr(obj) {
		$(obj).parent().parent().remove();
	}
	
	function add_success(param) {
		$.setReadOnly('addTaxGroupForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>




