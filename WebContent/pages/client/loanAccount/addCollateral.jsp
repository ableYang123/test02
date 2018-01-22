<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="withdrawByClient" name=""rejectLoan"">
				<fieldset>
					<legend><spring:message code="lable.add.loan.collateral"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.collateral.type"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="collateralTypeId" name="collateralTypeId">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.value"/>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="value" name="value">
						</div>
					</div>
					<div>
						<label class="col-sm-2 control-label"><spring:message code="lable.description"/>
						</label>
						<div class="col-sm-3">
							<textarea id="description" name="description" rows="3" cols="12"></textarea>
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
				$.datetimepicker();
				$.valid("withdrawByClient", 
						[ {"name" : "withdrawnOnDate","notEmpty" : "不能为空"}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.loans."+loanId+".collaterals.template"
					},
					callback : "collateral"
				});
				
				$.getWidget("save").click(function() {
					var collateralTypeId = parseInt($.value('collateralTypeId'));
					var json = {
								  "collateralTypeId" : collateralTypeId,
								  "value" : $.value('value'),
								  locale : "en",
								  "description" : $.value('description')
								}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.loans."+loanId+".collaterals"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("withdrawByClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var resourceId;
			var loanId;
			if(param != null || param.length > 0 || param != ''){
				loanId = param.loanId;
				resourceId = param.resourceId;
				window.location.href="loadPage.do?nextPage=client.viewCollateral&resourceId="+resourceId+"&loanId="+loanId;
			}
		}
		
		function collateral(param){
			$.setSelect('collateralTypeId',param.allowedCollateralTypes,'id','name');
		}
</script>