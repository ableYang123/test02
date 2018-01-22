<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>

			<form class="form-horizontal" id="accountAddCharges" name="accountAddCharges" style="font-size: small;">
				<fieldset>
					<legend><spring:message code="client.savingaccount.addSavingCharges"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.charge"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select id="chargelist" class="form-control">
								<option selected="selected" id="selectOne"><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					
					<div id="addChargesDetil" style="display: none">
						<div class="form-group">
							<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.amount"/>
								<span style="font-size: 14px; color: #d9534f">*</span>
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="amount" >
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.chargeCalculation"/></label>
							<div class="col-sm-3">
								<select id="chargeCalculation" class="form-control" disabled="disabled"> 
									<option selected="selected">Select one</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.chargeTimeType"/></label>
							<div class="col-sm-3">
								<select id="chargeTimeType" class="form-control" disabled="disabled">
									<option selected="selected"><spring:message code="lable.please.choose"/></option>
								</select>
							</div>
						</div>
						
						<div class="form-group" id="d5" style="display: none">
							<label for=""specifiedDate"" class="col-sm-2 control-label">
								<spring:message code="lable.center.specifiedDate"/>
								<span style="font-size: 14px; color: #d9534f">*</span>
							</label>
							<div class="col-sm-3" >
								<input datetype="date" type="text" style="width: 198" class="form-control" id="specifiedDate" afterToday="" beforeToday="" name="specifiedDate" />
							</div>
						</div>
					</div>			
					
					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		$(document).ready(function() {

			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+savingsId+".charges.template"
				},
				callback : "loadback"
			});
			
			$.getWidget("chargelist").change(function() {
				var chargesId=parseInt($.value("chargelist"));
				if(chargesId!="undefined"){
					$.nest({
						url:'<c:url value="/fineract.do"/>',
						type:"post",
						data:{
							"dataType":"GET",
							"mydate":"",
							"url":"api.v1.charges."+chargesId+"?template=true"
							},
						callback :"chargeCall"
					});
				}
			});
			
			
			$.getWidget("save").click(function() {
				var chargeId = parseInt($.value("chargelist"));
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
					callback : "addCharge_success"
				});
			});

		});
			
		function loadback(param){
			$.setSelect("chargelist",param.chargeOptions,'id','name');
		}
			
		
		
		function chargeCall(param){
			$("#addChargesDetil").css("display","");
			$.hide('d5');	
			$("#selectOne").css("display","none");
			
			$.assign({
				"amount":param.amount
			});
			
			$.setSelect("chargeCalculation",param.chargeCalculationTypeOptions,"id","value");
			$.setSelect("chargeTimeType",param.chargeTimeTypeOptions,"id","value");
			
			$('#chargeCalculation option[value="' + param.chargeCalculationType.id + '"]').attr('selected', true);
			$('#chargeTimeType option[value="' + param.chargeTimeType.id + '"]').attr('selected', true);
	
			if(param.chargeTimeType.value.indexOf('Specified') > -1){
				$.show('d5');
			}
		}
		
		function addCharge_success(param) {
			$.setReadOnly("accountAddCharges");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
</script>