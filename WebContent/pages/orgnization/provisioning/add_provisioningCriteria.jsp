<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="addCriteriaform" name="addCriteriaform" method="post">
				<fieldset>
					<legend><spring:message code="criteria.create.createCriteria"/></legend>
					
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label"> 
							<spring:message code="criteria.title.name"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-3 col-md-3 col-md-offset-1">
							<label class="control-label col-sm-9">
								<spring:message code="criteria.create.allProducts" />
							</label> 
							<select id="available" class="form-control multiselectmin" name="available" multiple="multiple">
							</select>

						</div>
						<div class="col-sm-5 col-md-1 padddetop25px"
							style="margin-top: 45px; margin-left: 45px;">
							<button id='add' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
							</button>
							<button id='delete' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-left" style="color: #fff;"></i>
							</button>
						</div>
						<div class="col-sm-3 col-md-3 col-md-offset-1">
							<label class="control-label col-sm-9">
								<spring:message code="criteria.create.selProducts" />
								<span style="color: #d9534f;">*</span>
							</label>
							 <select
								id="selected" class="form-control multiselectmin" name="selected" multiple="multiple">
							</select>
						</div>
					</div>
					
					<table class="table" style="border-top: 1px solid #ddd;">
						<thead>
							<tr class="graybg">
								<th align="center"><spring:message code="criteria.create.category"/></th>
								<th align="center" ><spring:message code="criteria.create.minAge"/></th>
								<th align="center"><spring:message code="criteria.create.maxAge"/></th>
								<th align="center"><spring:message code="criteria.create.percentage"/></th>
								<th align="center"><spring:message code="criteria.create.liabilityAmount"/></th>
								<th align="center"><spring:message code="criteria.create.expenseAcount"/></th>
							</tr>
						</thead>
						<tbody label="add">
							
						</tbody>
					</table>
					
					<div class="form-group">
						<div class="col-sm-offset-5">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	


	<script type="text/javascript">
		var flag = true;
		$(document).ready(function() {
			
			$.valid("addCriteriaform",[{
				name : "name",
				notEmpty : ""
		}]);
			
			//初始化
			load();

			/* 添加按钮 */
			$(document).on('click','#add',function() {
				var option_arr = $('#available option:selected');
				if (option_arr != null && typeof(option_arr) != 'undefined') {
					$.each(option_arr,function(index,item) {
						var txt = $(this).text();
						var value = $(this).val();
						var IBC = $(this).attr('includeInBorrowerCycle');
						
						$("#selected").append("<option value='" + value + "' includeInBorrowerCycle="+ IBC +">"
											+ txt + "</option>");
						$('#available option[value='+ value +']').remove();
					});
				}
			});

			/* 删除按钮 */
			$(document).on('click','#delete',function() {
				var option_arr = $('#selected option:selected');
				
				if (null != option_arr && typeof(option_arr) != 'undefined') {
					$.each(option_arr,function(index) {
						var value = $(this).val();
						var txt = $(this).text();
						var IBC = $(this).attr('includeInBorrowerCycle');
						
						$("#selected option[value="+ value + "]").remove();
						$('#available').append("<option value='" + value + "' includeInBorrowerCycle="+ IBC +">"
								+ txt + "</option>");
					});
				}
			});
				
			var timer;
			var reg = /^\d+$/;
			var reg2 = /^\d+(\.\d+)?$/;
			$('tbody[label="add"]').on('keyup',' input',function(event){
				$this = $(this);
				if(timer){
					clearTimeout(timer);
					timer = null;
				}
				timer = setTimeout(function(){
					if($this.attr('name') == 'percentage'){
						if(reg2.test($this.val())){
							$this.next().remove();
							flag = true;
						}else{
							fillErrorTip($this);
							flag = false;
						}
					}else{
						if(reg.test($this.val())){
							$this.next().remove();
							flag = true;
						}else{
							fillErrorTip($this);
							flag = false;
						}
					}
				},500);
			});
			
			$('tbody[label="add"]').on('change','select',function(){
				var val = $(this).find('option:selected').val();
				if(!$.isEmpty(val) && !isNaN(val)){
					$(this).next().remove();
				}
			});
				
				$.getWidget("save").click(function() {
	
					if ($.validateForm("addCriteriaform")) {
						var criteriaName = $.value('name');
						
						/* 获取已选择的产品，循环遍历选择框 */
						var selected = [];
						$('#selected option').each(function() {
							var productJson = {
									"id" : $(this).attr('value'),
									"includeInBorrowerCycle" : $(this).attr('includeInBorrowerCycle'),
									'name' : $(this).text()
							};
							selected.push(productJson);
						});
						var errorStr_1 = '&nbsp;&nbsp;'+ $.fn.bootstrapValidator.i18n.common.checkNeedOption;
						var errorStr_2 = '&nbsp;&nbsp;'+ $.fn.bootstrapValidator.i18n.provisioning.checkAge;
						var definitions = [];
						$('tbody[label="add"] tr').each(function(){
							var td_node = $(this).children('td:eq(0)');
							var categoryId = td_node.attr('name');
							var categoryName = td_node.text();
							var minAgeNode = $(this).children('td:eq(1)').find('input');
							var minAge = $.trim(minAgeNode.val());
							var maxAgeNode = $(this).children('td:eq(2)').find('input');
							var maxAge = $.trim(maxAgeNode.val());
							var percentageNode = $(this).children('td:eq(3)').find('input');
							var provisioningPercentage = $.trim(percentageNode.val());
							var liabilityNode = $(this).children('td:eq(4)').find('select[name=liabilitaccount] option:selected');
							var liabilityAccount = parseInt($.trim(liabilityNode.val()));
							var expenseNode = $(this).children('td:eq(5)').find('select[name=expenseaccount] option:selected');
							var expenseAccount = parseInt($.trim(expenseNode.val()));
							
							
							if($.isEmpty(minAge) || isNaN(minAge)){
								fillErrorTip(minAgeNode,errorStr_1);
								flag = false;
							}
							
							if($.isEmpty(maxAge) || isNaN(maxAge)){
								fillErrorTip(maxAgeNode,errorStr_1);
								flag = false;
							}
							
							if($.isEmpty(provisioningPercentage) || isNaN(provisioningPercentage)){
								fillErrorTip(percentageNode,errorStr_1);
								flag = false;
							}
							
							if($.isEmpty(liabilityAccount) || isNaN(liabilityAccount)){
								fillErrorTip(liabilityNode.closest('select'),errorStr_1);
								flag = false;
							}
							
							if($.isEmpty(liabilityAccount) || isNaN(expenseAccount)){
								fillErrorTip(expenseNode.closest('select'),errorStr_1);
								flag = false;
							}
							
							if(!$.isEmpty(maxAge)  && maxAge <= minAge){
								fillErrorTip(maxAgeNode,errorStr_2);
								flag = false;
							}
							var definitionJson = {
									"categoryId" : categoryId,
									"categoryName" : categoryName,
									"minAge" : minAge,
									"maxAge" : maxAge,
									"provisioningPercentage" : provisioningPercentage,
									"liabilityAccount" : liabilityAccount,
									"expenseAccount" : expenseAccount
							};
							if(typeof definitionJson.categoryId != 'undefined'){
								definitions.push(definitionJson);
							}
						});
						
						var request_json = {
							"criteriaName" : criteriaName,
							"definitions" : definitions,
							"locale" : "zh_CN"
						};
						
						if(selected.length > 0){
							request_json['loanProducts'] = selected;
						}else{
							$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkLoan);
							flag = false;
						}
						
						if(flag){
							$.nest({
								url : '<c:url value="/fineract.do"/>',
								data : {
									'dataType' : 'POST',
									'mydata' : request_json,
									'url' : 'api.v1.provisioningcriteria',
									"contentType" : "application/json"
								},
								callback : 'add_success'
							});
						}
						
					}
				});
		});

		function getTemplate(param) {
			/* $.setSelect('available',param.loanProducts,'id','name'); */
			var productOption = param.loanProducts;
			$.each(productOption,function(index,item){
				var id = item.id;
				var name = item.name;
				var IBC = item.includeInBorrowerCycle;
				$('#available').append('<option value="'+ id +'" includeInBorrowerCycle='+ IBC +'>'+ name +'</option>');
			});
			var criteriaOption = param.definitions;
			var str;
			$.each(criteriaOption,function(index,item){
				var id = item.categoryId;
				var name = item.categoryName;
				str = "<tr>";
				for(var i=0; i< 6; i++){
					var td_str;				
					if(i == 0){
						str += "<td name="+ id +">"+ name +"</td>";
					}else if(i == 1){
						str +="<td><input type='text' id='minAge' name='minAge' class='form-control' value=''/></td>"; 
					}else if(i == 2){
						str +="<td><input type='text' id='maxAge' name='maxAge' class='form-control' value=''/></td>";
					}else if(i == 3){
						str +="<td><input type='text' id='percentage' name='percentage' class='form-control' value=''/></td>";
					}else if(i == 4){
						str +="<td><select label='liabilitaccount' name='liabilitaccount' class='form-control' >"
							+ "<option value='' selected><spring:message code='criteria.create.selectLiability'/></option>"
							+"</select></td>";
					}else if(i == 5){
						str +="<td><select label='expenseaccount' name='expenseaccount' class='form-control' >"
							+ "<option value='' selected><spring:message code='criteria.create.selectExpense'/></option>"
							+"</select></td>";
					}		
				}
				str += '</tr>';
				$('tbody[label="add"]').append(str);
			});
			
			var accountOption = param.glAccounts;
			$.each(accountOption,function(index,item){
				var id = item.id;
				var name = item.name;
				var typeValue = item.type.value;
				
				if(typeValue == 'LIABILITY'){
					$('select[name=liabilitaccount]').append('<option value="' + id +'"> ' + name + '</option>');
				}else if(typeValue == 'EXPENSE'){
					$('select[name=expenseaccount]').append('<option value="' + id +'"> ' + name + '</option>');
				}else{
				}
			});
		}


		function add_success(param) {
			$.setReadOnly('addCriteriaform');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
	</script>

