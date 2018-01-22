<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

			<form class="form-horizontal" id="addmappingform" name="addmappingform" method="post">
				<fieldset>
					<legend><spring:message code="label.mapping.createMapping"/></legend>
					
					<div class="form-group" label="123" style="display: none;">
						
							<label for="officess" class="col-sm-2 control-label">
								<spring:message code="lable.office"/>
								<span style="color: #d9534f;">*</span>
							</label>
	
							<div class="col-sm-3">
        						<select id="officess" name="office" class="form-control">
        							<option value="0" selected="selected">--<spring:message code="label.user.selectOffice"/>--</option>
        						</select>
							</div>
					</div>
					<div class="form-group" label="45" style="display: none;">	
							<label for="roless" class="col-sm-2 control-label">
								<spring:message code="label.mapping.roles"/>
								<span style="color: #d9534f;">*</span>
							</label>
	
							<div class="col-sm-3">
								<select id="roless" name="role" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectRole"/>--</option>
	        					</select>
							</div>
					</div>
					
					<div class="form-group" label="14" style="display: none;">
						<label class="col-sm-2 control-label">
							<spring:message code="label.mapping.loanProducts"/>
							<span style="color: #d9534f;">*</span>
						</label>

       					<div class="col-md-3">
       						<select id="loanProducts" name="loanProductId" class="form-control">
       							<option value="0" selected="selected">--<spring:message code="label.mapping.selectLoanProduct"/>--</option>
       						</select>
       					</div>
        			</div>
					<div class="form-group" label="3" style="display: none;">
						<label class="col-sm-2 control-label">
							<spring:message code="label.mapping.charges"/>
							<span style="color: #d9534f;">*</span>
						</label>
						
        					
       					<div class="col-md-3">
       						<select id="charge" name="charge" class="form-control">
       							<option value="0" selected="selected">--<spring:message code="label.mapping.selectCharge"/>--</option>
       						</select>
       					</div>
					</div>
					<div class="form-group" label="25" style="display: none;">
						<label class="col-sm-2 control-label">
							<spring:message code="label.mapping.savingsProducts"/>
							<span style="color: #d9534f;">*</span>
						</label>
						
						<div class="col-md-3">
       						<select id="savingProducts" name="savingProductId" class="form-control">
       							<option value="0" selected="selected">--<spring:message code="label.mapping.selectSavingProduct"/>--</option>
       						</select>
        				</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="lable.startDate"/>
						</label>
						
						<div class="col-sm-3">
							<input type="text" datetype="date" name="startDate" local-date="" afterToday="false" beforeToday="false" placeholder="<spring:message code="lable.startDate"/>"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="lable.endDate"/>
						</label>
						
						<div class="col-sm-3">
							<input type="text" datetype="date" name="endDate" local-date="" afterToday="false" beforeToday="false" placeholder="<spring:message code="lable.endDate"/>"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
		<script type="text/javascript">
			$(document).ready(function(){
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				
				/* 加载页面初始化 */
				load();
				
				/* 表单提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("addmappingform")) {
						var startDate = $.value('startDate');
						var endDate = $.value('endDate');
						
						var dateFormat = $('input[name="startDate"]').attr('date-format');
						
						var officeId = parseInt($.value('officess'));
						var roleId = parseInt($.value('roless'));
						var loanId = parseInt($.value('loanProducts'));
						var savingId = parseInt($.value('savingProducts'));
						var chargeId = parseInt($.value('charge'));
						
						
						var request_json = {
							"dateFormat" : dateFormat,
							"locale" : "en",
							"startDate" : startDate,
							"endDate" : endDate
						};
						
						if(!$.isEmpty(startDate) && !$.isEmpty(endDate)){
							if(startDate > endDate){
								$.bAlert($.fn.bootstrapValidator.i18n.common.checkDate);
							}
						}
						
						
						if(selectedType != '4' && selectedType != '5'){
							if($.isEmpty(officeId)){
								$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkOffice);
								return false;
							}
							request_json['fromId'] = officeId;
							if(selectedType == '1'){
								if($.isEmpty(loanId)){
									$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkLoan);
									return false;
								}
								request_json['toId'] = loanId;
							}else if(selectedType == '2'){
								if($.isEmpty(savingId)){
									$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkSaving);
									return false;
								}
								request_json['toId'] = savingId;
							}else if(selectedType == '3'){
								if($.isEmpty(chargeId)){
									$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkCharge);
									return false;
								}
								request_json['toId'] = chargeId;
							}
						}else{
							if($.isEmpty(roleId)){
								$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkRole);
								return false;
							}
							request_json['fromId'] = roleId;
							if(selectedType == '4'){
								if($.isEmpty(loanId)){
									$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkLoan);
									return false;
								}
								request_json['toId'] = loanId;
							}else if(selectedType == '5'){
								if($.isEmpty(savingId)){
									$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkSaving);
									return false;
								}
								request_json['toId'] = savingId;
							}
						}
						
						
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
		    				type : "post",
		    				async : true,
		    				data : {
		    					"dataType" : "POST",
		    					"mydata" : request_json,
		    					"url" : "api.v1.entitytoentitymapping." + selectedType,
		    					"contentType" : "application/json"
		    				},
		    				callback : "add_success"
						});
						
					}
				});
			});	
			
			function load(){
				if(selectedType != '4' && selectedType != '5'){
					$('div[label=123]').show();
					$.setSelect('officess',officeOption,'id','name');
					if(selectedType == '1'){
						$('div[label=14]').show();
						$.setSelect('loanProducts',loanOption,'id','name');
					}else if(selectedType == '2'){
						$('div[label=25]').show();
						$.setSelect('savingProducts',savingsOption,'id','name');
					}else{
						$('div[label=3]').show();
						$.setSelect('charge',chargeOption,'id','name');
					}
				}else{
					$('div[label=45]').show();
					$.setSelect('roless',roleOption,'id','name');
					if(selectedType == '4'){
						$('div[label=14]').show();
						$.setSelect('loanProducts',loanOption,'id','name');
					}else{
						$('div[label=25]').show();
						$.setSelect('savingProducts',savingsOption,'id','name');
					}
				}
				
			}
			
			function add_success(param){
				$.setReadOnly('addmappingform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
		</script>


	

