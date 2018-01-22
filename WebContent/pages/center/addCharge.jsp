<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="addChagreForm" name="addChagreForm" method="post">
	<fieldset>
		<legend><spring:message code="lable.center.addSavingCharges"/></legend>

		<div class="form-group">
			<label for="charge" class="col-sm-2 control-label"><spring:message code="label.center.charges"/><span
				class="required" style="color: red">*</span> </label>
			<div class="col-sm-3" >
				<select style="width: 198" class="form-control" id="charge" name="charge">
					<option value="?"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>
		
		<div class="form-group" id="d2" style="display: none">
			<label for="amount" class="col-sm-2 control-label"><spring:message code="label.center.amount"/><span
				class="required" style="color: red">*</span> </label>
			<div class="col-sm-3" >
				<input type="text" id="amount" name="amount" style="width: 198" class="form-control">
			</div>
		</div>

        <div class="form-group" id="d3" style="display: none">
			<label for="chargeCalculation" class="col-sm-2 control-label"><spring:message code="lable.center.chargecalculation"/></label>
			<div class="col-sm-3" >
				<select style="width: 198" class="form-control" id="chargeCalculation" name="chargeCalculation" disabled>
				</select>
			</div>
		</div>
		
		<div class="form-group" id="d4" style="display: none">
			<label for="chargeTimeType" class="col-sm-2 control-label"><spring:message code="lable.center.chargetimetype"/> </label>
			<div class="col-sm-3" >
				<select style="width: 198" class="form-control" id="chargeTimeType"  name="chargeTimeType" disabled>
				</select>
			</div>
		</div>
		
		<div class="form-group" id="d5" style="display: none">
			<label for=""specifiedDate"" class="col-sm-2 control-label"><spring:message code="lable.center.specifiedDate"/></label>
			<div class="col-sm-3" >
				<input datetype="date" type="text" style="width: 198" class="form-control" id="specifiedDate" afterToday="" beforeToday="" name="specifiedDate" />
				
			</div>
		</div>


		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="label.center.submit"/></button>
			</div>
		</div>

	</fieldset>
</form>


<script type="text/javascript">
		 
		$(document).ready(function(){
			$.datetimepicker();
			
			$.valid("addChagreForm", [ {
				"name" : "chargeId",
				"notEmpty" : "不为空"
			  },{
				 "name" : "amount",
				 "notEmpty" : "不为空"
			  }]
			); 
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'get',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.savingsaccounts.'+savingsId+'.charges.template'
				},
				callback : 'loadback'
			});
	
			$.getWidget("charge").change(function(){
				var chargeId = parseInt($.value("charge"));
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'get',
					data : {
						'dataType' : 'GET',
						'mydata' : '',
						'url' : 'api.v1.charges.'+chargeId+'?template=true'
					},
					callback : 'searchCharge'
				});
				
				$.show('d2','d3','d4');
				$.hide('d5');	
			});
			
		 	$.getWidget("save").click(function() {
				var chargeId = parseInt($.value("charge"));
				var json = {
						"amount":$.value('amount'),
						"chargeId":chargeId,
						"locale":"zh_CN"
							};
				var dateFormat = $('input[name="specifiedDate"]').attr('date-format');
				var dueDate = $.value('specifiedDate');
				if(!$.isEmpty(dueDate)){
					json['dueDate'] = dueDate;
					json['dateFormat'] = dateFormat;
				}
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.savingsaccounts."+savingsId+".charges"
					},
					callback : "addSuccess"
				});
			});
		});
		
		
		
		function loadback(param){
			$.setSelect('charge',param.chargeOptions,'id','name');
		}
		function searchCharge(param){
	 	    $.setSelect('chargeCalculation',param.chargeCalculationTypeOptions,'id','value');
			$.setSelect('chargeTimeType',param.chargeTimeTypeOptions,'id','value'); 

			$.assign({
				"amount" : param.amount,
				"chargeCalculation" : param.chargeCalculationType.id,
				"chargeTimeType" : param.chargeTimeType.id
			});	
			
			if(param.chargeTimeType.value.indexOf('Specified') > -1){
				$.show('d5');
			}
		}
		function addSuccess(param){
			$.setReadOnly("addChagreForm");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
</script>

