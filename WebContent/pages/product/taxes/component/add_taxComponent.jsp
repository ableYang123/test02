<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="addTaxComponentForm" name="addTaxComponentForm">
	<fieldset>
		<legend><spring:message code="title.create.tax.component" /></legend>

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
				<select id="creditAccountType" name="creditAccountType" class="form-control"
					style="width: 198">
					<option></option>
				</select>
				
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="lable.account"/></label>
			<div class="col-sm-3">
				<select id="creditAcountId" name="creditAcountId" class="form-control"
					style="width: 198">
					
				</select>
				
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="lable.startDate"/></label>

			<div class="col-sm-3">
				<input type="text" datetype="date" name="startDate"   local-date="true"  beforeToday="false"/>
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
	var options;//保存信用账户数据
	$(document).ready(function() {
		
			
			$.datetimepicker();

			$.valid("addTaxComponentForm", [ {
				"name" : "name",
				"notEmpty" : ""
			}, {
				"name" : "percentage",
				"notEmpty" : ""
			} ]);
			/*获取信用账户数据*/
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.taxes.component.template"
				},
				callback : "addBack"
			});
			
			$.getWidget("save").click(function() {
							if ($.validateForm("addTaxComponentForm")) {
								
								var name = $.trim($.value("name"));
								var percentage = $.trim($.value("percentage"));
								var startDate = $('input[name="startDate"]').val();
								var dateFormat = $('input[name="startDate"]').attr('date-format');
								var creditAccountType = parseInt($.value("creditAccountType"));
								var creditAcountId = parseInt($.value("creditAcountId"));
								
								var json = {
									"name" : name,
									"percentage" : percentage,
									"startDate" : startDate,
									"dateFormat" : dateFormat
								};
								
								json["locale"] = "zh";
								//账户可选
								if(!isNaN(creditAccountType)&&!isNaN(creditAcountId)){
									json['creditAccountType']=creditAccountType;
									json['creditAcountId']=creditAcountId;
									}
								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"contentType" : "application/json",
												"dataType" : "POST",
												"mydata" : json,
												"url" : "api.v1.taxes.component"
											},
											callback : "add_success"
										});
							}
			});
	});
	/*根据账户类型选择账户*/
	$('#creditAccountType').change(function(){
		
		var creditAccountType = parseInt($.value("creditAccountType"));
		
		for(var key in options){
			$('#creditAcountId').empty();
			var optionType=options[key][0].type.id;
			if(creditAccountType==optionType){
				$.setSelect('creditAcountId',options[key],'id','name');
				break;
				}
		}
	});
	
	function addBack(param){
		$.setSelect('creditAccountType',param.glAccountTypeOptions,'id','value');
		options=param.glAccountOptions;
	}
	
	function add_success(param) {
		$.setReadOnly('addTaxComponentForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>




