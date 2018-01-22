<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="addDatatableform" name="addDatatableform" method="post">
				<fieldset>
					<legend><spring:message code="menu.admin.entityDateTable"/></legend>
					
					<div class="form-group">
						<label class="col-sm-3 control-label"> 
							<spring:message code="label.list.entity"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<select  id="checkEntity" name="checkEntity" class="form-control">
							<option></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label"> 
							<spring:message code="label.list.status"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<select  id="checkStatus" name="checkStatus" class="form-control">
								<option></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label"> 
							<spring:message code="label.list.datatable"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<select  id="checkDatatable" name="checkDatatable" class="form-control">
							<option></option>
							</select>
						</div>
					</div>
					
					<div id="product" class="form-group" style="display: none;">
						<label class="col-sm-3 control-label"> 
							<spring:message code="label.list.product"/>
						</label>
						<div class="col-sm-3">
							<select  id="checkProduct" name="checkProduct" class="form-control">
							<option></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-4">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	


	<script type="text/javascript">
		var loanProductDatas;
		var savingsProductDatas;
		var datatableClient = [];
		var datatableGroup = [];
		var datatableLoans = [];
		var datatableSaving = [];
		var statusClient;
		var statusGroup;
		var statusLoans;
		var statusSaving;
		
		$(document).ready(function() {

			$.valid("addDatatableform",[{
				"name" : "checkEntity",
				"notEmpty" : ""
			},{
				"name" : "checkStatus",
				"notEmpty" : ""
			},{
				"name" : "checkDatatable",
				"notEmpty" : ""
			}]);
			
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.entityDatatableChecks.template"
					},
					callback : "getTemplate"
				});

				
				$.getWidget('checkEntity').change(function(){
					var entity = $.trim($(this).val());
					
					if(entity == "0"){//Client
						$('#product').hide();
						$.setSelect('checkStatus',statusClient,'code','name');
						$.setSelectByList('checkDatatable',datatableClient);
					}else if(entity == '1'){//Loan
						$('#product').show();
						$.setSelect('checkStatus',statusLoans,'code','name');
						$.setSelectByList('checkDatatable',datatableLoans);
						$.setSelect('checkProduct',loanProductDatas,'id','name');
					}else if(entity == '2'){//Group
						$('#product').hide();
						$.setSelect('checkStatus',statusGroup,'code','name');
						$.setSelectByList('checkDatatable',datatableGroup);
					}else if(entity == '3'){//Savings Account
						$('#product').show();
						$.setSelect('checkStatus',statusSavings,'code','name');
						$.setSelectByList('checkDatatable',datatableSaving);
						$.setSelect('checkProduct',savingsProductDatas,'id','name');
					}else{
						$('#checkStatus').empty();
						$('#checkDatatable').empty();
						$('#checkProduct').empty();
					}
				});
				
				$.getWidget("save").click(function() {
	
					if ($.validateForm("addDatatableform")) {
						
						var entity = $('#checkEntity option:selected').attr('name');
						var status = $.value('checkStatus');
						var datatableName = $.value('checkDatatable');
						var productId = $.value('checkProduct');
						
						var request_json = {
							"entity" : entity,
							"status" : status,
							"datatableName" : datatableName,
						};
						
						if(!$.isEmpty(productId)){
							request_json["productId"] = productId;
						}
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "POST",
								"mydata" : request_json,
								"url" : "api.v1.entityDatatableChecks",
								"contentType" : "application/json"
							},
							callback : "add_success"
						});
						
					}
				});
		});

		function getTemplate(param) {
			datatables = param.datatables;
			
			loanProductDatas = param.loanProductDatas;
			savingsProductDatas = param.savingsProductDatas;
			statusClient = param.statusClient;
			statusGroup = param.statusGroup;
			statusLoans = param.statusLoans;
			statusSavings = param.statusSavings;
			
			var entityOption = param.entities;
			
			$.each(entityOption,function(index){
				if(isContains(entityOption[index],'loan')){
					$('#checkEntity').append('<option value="'+ index +'" name="'+ entityOption[index] +'">Loan</option>');
				}else if(isContains(entityOption[index],'client')){
					$('#checkEntity').append('<option value="'+ index +'" name="'+ entityOption[index] +'">Client</option>');
				}else if(isContains(entityOption[index],'group')){
					$('#checkEntity').append('<option value="'+ index +'" name="'+ entityOption[index] +'">Group</option>');
				}else if(isContains(entityOption[index],'saving')){
					$('#checkEntity').append('<option value="'+ index +'" name="'+ entityOption[index] +'">Savings Account</option>');
				}
			});
			
			$.each(datatables,function(index){
				var name = datatables[index].dataTableName;
				var entityName = datatables[index].entity;
				
				if(isContains(entityName,'loan')){
					datatableLoans.push(name);
				}else if(isContains(entityName,'client')){
					datatableClient.push(name);
				}else if(isContains(entityName,'group')){
					datatableGroup.push(name);
				}else if(isContains(entityName,'saving')){
					datatableSaving.push(name);
				}
			});
		}


		function add_success(param) {
			$.setReadOnly('addDatatableform');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		function isContains(str, substr) {
		    return new RegExp(substr).test(str);
		}
	</script>

