<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="addCharge" name="addCharge">
				<fieldset>
					<legend><spring:message code="client.charges"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.charges"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select id="chargeId" name="chargeId" class="form-control">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.Charge.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" name="amount" type="text" id="amount">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.Charge.Calculation"/>
						</label>
						<div class="col-sm-3">
							<select id="chargeCalculationType" name="chargeCalculationType" class="form-control"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.Charge.time.type"/>
						</label>
						<div class="col-sm-3">
							<select id="chargeTimeType" name="chargeTimeType" class="form-control"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="client.Due.for.collection.on"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input class="form-control" datetype="date" name="specificduedate">
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
				$.valid("addCharge", [ {
					"name" : "chargeId",
					"notEmpty" : "不能为空"
				},
				{
					"name" : "amount",
					"notEmpty" : "不能为空"
				},
				{
					"name" : "specificduedate",
					"notEmpty" : "不能为空"
				}]);
				
				$.datetimepicker();
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId+".charges.template"
					},
					callback : "charges"
				});
				$.getWidget("chargeId").change(function(){
					var chargeId = parseInt($.value("chargeId"));
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.charges."+chargeId+"?template=true"
						},
						callback : "chargeParam"
					});
				});
				$.getWidget("save").click(function() {
					var chargeId = parseInt($.value("chargeId"));
					var json = {
							"amount":$.value('amount'),
							"chargeId":chargeId,
							"dateFormat":$('input[name="specificduedate"]').attr('date-format'),
							"dueDate":$.value('specificduedate'),
							"locale":"en"
								}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.clients."+clientId+".charges"
						},
						callback : "callback"
					});
				});
		});
		function charges(param){
			$.setSelect('chargeId', param.chargeOptions, 'id', 'name');
		}
		function chargeParam(param){
			$.setSelect('chargeCalculationType',param.chargeCalculationTypeOptions,'id','value');
			$.setSelect('chargeTimeType',param.chargeTimeTypeOptions,'id','value');
			$('#addCharge select[id="chargeCalculationType"]').attr('disabled', true);
			$('#addCharge select[id="chargeTimeType"]').attr('disabled', true);
			$.assign({
				"amount" : param.amount,
				"chargeTimeType" : param.chargeTimeType.id,
				"chargeCalculationType" : param.chargeCalculationType.id
			});
		}
		function callback(param) {
			$.setReadOnly("addCharge");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
</script>