<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.enter { 
		background-color: #bcd4ec; 
		cursor: pointer;
	}
</style>
</head>
<body style="background-color: #fff">
            
		<div style="margin: 30px 200px;  font-size: large">
			<ul class="breadcrumb">
				<li>
					<i class="glyphicon glyphicon-hand-right"></i>&nbsp;
					<spring:message code="menu.admin.system.entitymapping"/>
				</li>
			</ul>
		</div>
        
        <div class="div-cc">
        	<table id="menuTable" class="table">
        		<tbody></tbody>
        	</table>
        	
        	<div id="showSelected">
        		<form name="entityMappings">
        			<fieldset>
        				<div class="form-group">
	        				<div label="label:1" style="display: none;">
	        					<legend><spring:message code="label.mapping.type_1"/></legend>
	        					<label class="control-label col-md-1"><spring:message code="lable.office"/></label>
	        					<div class="col-md-3">
	        						<select id="office" name="office" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.user.selectOffice"/>--</option>
	        						</select>
	        					</div>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.loanProducts"/></label>
	        					<div class="col-md-3">
	        						<select id="loanproduct" name="loanproduct" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectLoanProduct"/>--</option>
	        						</select>
	        					</div>
	        				</div>
	        				<div label="label:2" style="display: none;">
	        					<legend><spring:message code="label.mapping.type_2"/></legend>
	        					<label class="control-label col-md-1"><spring:message code="lable.office"/></label>
	        					<div class="col-md-3">
	        						<select id="offices" name="office" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.user.selectOffice"/>--</option>
	        						</select>
	        					</div>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.savingsProducts"/></label>
	        					<div class="col-md-3">
	        						<select id="savingsproduct" name="savingsproduct" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectSavingProduct"/>--</option>
	        						</select>
	        					</div>
	        				</div>
	        				<div label="label:3" style="display: none;">
	        					<legend><spring:message code="label.mapping.type_3"/></legend>
	        					<label class="control-label col-md-1"><spring:message code="lable.office"/></label>
	        					<div class="col-md-3">
	        						<select id="offic" name="office" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.user.selectOffice"/>--</option>
	        						</select>
	        					</div>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.charges"/></label>
	        					<div class="col-md-3">
	        						<select id="charges" name="charges" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectCharge"/>--</option>
	        						</select>
	        					</div>
	        				</div>
	        				<div label="label:4" style="display: none;">
	        					<legend><spring:message code="label.mapping.type_4"/></legend>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.roles"/></label>
	        					<div class="col-md-3">
	        						<select id="role" name="role" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectRole"/>--</option>
	        						</select>
	        					</div>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.loanProducts"/></label>
	        					<div class="col-md-3">
	        						<select id="loanProductId" name="loanProductId" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectLoanProduct"/>--</option>
	        						</select>
	        					</div>
	        				</div>
	        				<div label="label:5" style="display: none;">
	        					<legend><spring:message code="label.mapping.type_5"/></legend>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.roles"/></label>
	        					<div class="col-md-3">
	        						<select id="roles" name="role" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectRole"/>--</option>
	        						</select>
	        					</div>
	        					<label class="control-label col-md-1"><spring:message code="label.mapping.savingsProducts"/></label>
	        					<div class="col-md-3">
	        						<select id="savingProductId" name="savingProductId" class="form-control">
	        							<option value="0" selected="selected">--<spring:message code="label.mapping.selectSavingProduct"/>--</option>
	        						</select>
	        					</div>
	        				</div>
	        				
	        				<a id="filter" type="button" class="btn btn-primary col-md-1" style="display:none;">
	        					<i class="glyphicon glyphicon-filter" style="color: #fff;"></i>
	        					<spring:message code="label.mapping.filter"/>
	        				</a>
	        				
	        				<%-- <label class="control-label col-md-1">&nbsp;</label>
	        				<a id="add" type="button" class="btn btn-primary col-md-1" style="display:none;">
	        					<i class="glyphicon glyphicon-plus" style="color: #fff;"></i>
	        					<spring:message code="btn.add"/>
	        				</a> --%>
	        				<br/>
	        				<br/>
        				</div>
        				<div class="form-group">
        				<div id="showTable" class="col-md-14">
        					<div label="1" style="display: none;">
        						<table id="table1">
        							<thead>
        								<tr>
        									<th name="mapId" width="215" style="display: none;">id</th>
        									<th name="fromEntity" width="215"><spring:message code="lable.office"/></th>
        									<th name="toEntity" width="215"><spring:message code="label.mapping.loanProducts"/></th>
        									<th name="startDate" type="date" width="215"><spring:message code="lable.startDate"/></th>
        									<th name="endDate" type="date" width="215"><spring:message code="lable.endDate"/></th>
        								</tr>
        							</thead>
        							<tbody></tbody>
        						</table>
        					</div>
        					<div label="2" style="display: none;">
        						<table id="table2">
        							<thead>
        								<tr>
        									<th name="mapId" width="215" style="display: none;">id</th>
        									<th name="fromEntity" width="215"><spring:message code="lable.office"/></th>
        									<th name="toEntity" width="215"><spring:message code="label.mapping.savingsProducts"/></th>
        									<th name="startDate" type="date" width="215"><spring:message code="lable.startDate"/></th>
        									<th name="endDate" type="date" width="215"><spring:message code="lable.endDate"/></th>
        								</tr>
        							</thead>
        							<tbody></tbody>
        						</table>
        					</div>
        					<div label="3" style="display: none;">
        						<table id="table3">
        							<thead>
        								<tr>
        									<th name="mapId" width="215" style="display: none;" >id</th>
        									<th name="fromEntity" width="215"><spring:message code="lable.office"/></th>
        									<th name="toEntity" width="215"><spring:message code="label.mapping.charges"/></th>
        									<th name="startDate" type="date" width="215"><spring:message code="lable.startDate"/></th>
        									<th name="endDate" type="date" width="215"><spring:message code="lable.endDate"/></th>
        								</tr>
        							</thead>
        							<tbody></tbody>
        						</table>
        					</div>
        					<div label="4" style="display: none;">
        						<table id="table4">
        							<thead>
        								<tr>
        									<th name="mapId" width="215" style="display: none;" >id</th>
        									<th name="fromEntity" width="215"><spring:message code="label.mapping.roles"/></th>
        									<th name="toEntity" width="215"><spring:message code="label.mapping.loanProducts"/></th>
        									<th name="startDate" type="date" width="215"><spring:message code="lable.startDate"/></th>
        									<th name="endDate" type="date" width="215"><spring:message code="lable.endDate"/></th>
        								</tr>
        							</thead>
        							<tbody></tbody>
        						</table>
        					</div>
        					<div label="5" style="display: none;">
        						<table id="table5">
        							<thead>
        								<tr>
        									<th name="mapId" width="215"  style="display: none;">id</th>
        									<th name="fromEntity" width="215"><spring:message code="label.mapping.roles"/></th>
        									<th name="toEntity" width="215"><spring:message code="label.mapping.savingsProducts"/></th>
        									<th name="startDate" type="date" width="215"><spring:message code="lable.startDate"/></th>
        									<th name="endDate" type="date" width="215"><spring:message code="lable.endDate"/></th>
        								</tr>
        							</thead>
        							<tbody></tbody>
        						</table>
        					</div>
        				</div>
        				</div>
        			</fieldset>
        		</form>
        	</div>
        	
        </div>
         
       <script type="text/javascript">
       		var selectedType;
       		
       		var gridArr;
       		
       		var mapId;
       		var officeOption;
       		var roleOption;
       		var loanOption;
       		var savingsOption;
       		var chargeOption;
       		
      		$(document).ready(function(){
      			
      			//初始化
      			init();
      			//表格初始化
      			tableInit();
      			
      			$(document).on({
      				mouseenter : function(e){
    					$(this).addClass('enter') ; 
    				},
    				mouseleave : function(e){
    					$(this).removeClass('enter') ; 
    				},
    				click : function(e){
    					var node = $(this).find('div:first');
    					var node_val = node.attr('label');
    					selectedType = node_val;
    					$.show('filter');
    					
   						for(var i=1;i<=5;i++){
   							$('#showTable').hide();
   							//$('#table' + i).hide();
   							var divNode = $('#showSelected').find('div[label="label:'+ i +'"]');
   							if(''+i != node_val){
   								divNode.hide();
   								//divNode.find('select option:not(":first")').remove();
   							}else{
   								divNode.show();
   							}
   						}
   						
   						if(node_val != '4' && node_val != '5'){
							//获取办公室
							getOfficeData();
							if(node_val == '1'){
								getLoanProducts();
							}else if(node_val == '2'){
								getSavingsProducts();
							}else{
								getCharges();
							}
						}else{
							//获取角色
							getRoleData();
							if(node_val == '4'){
								getLoanProducts();
							}else{
								getSavingsProducts();
							}
						}
    						
    				}
      			},'#menuTable tbody tr');
      			
      			$(document).on('click','#filter',function(){
      				$('#showTable').show();
      				
          			for(var i=1;i<=5;i++){
    					var divNode = $('#showTable').find('div[label="'+ i +'"]');
    					if(''+i != selectedType){
    						divNode.hide();
    					}else{
    						divNode.show();
    					}
    				}
          			
      				freashTable();
      			});
      			
      			$('#myModal').on('hidden.bs.modal', function (event) {
    				/* 实现局部刷新 */
      				freashTable();
    			});
      		});
      		
      		function init(){
      			$.nest({
      				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.entitytoentitymapping"
    				},
    				callback : "callback"
      			});
      		}
      		
      		function callback(param){
      			var str = '';
      			
      			$.each(param,function(index,item){
      				var types = item.mappingTypes.replace(/(\_)/g,' ').split('access to');
      				var one = $.trim(types[0]);
      				var two = $.trim(types[1]);
      				var entityOne = one.substring(0,1).toUpperCase() + one.substring(1);
      				var entityTwo = two.substring(0,1).toUpperCase() + two.substring(1);
      				var entityRow = entityOne + '&nbsp;--&gt;&nbsp;' +entityTwo;
      				
      				str += '<tr><td><div label='+ item.id +'>'+ entityRow +'</div></td></tr>';
      			});
      			$('tbody').append(str);
      		}
      		
      		
      		function freashTable(){
      			$.nest({
  					url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.entitytoentitymapping." + getSelectValue()
    				},
    				callback : "filterback"
  				});
      			
      		}
      		
      		function filterback(param){
      			var paramVal = param;
      			$.each(paramVal,function(index,item){
      				var sDate = paramVal[index].startDate;
      				var eDate = paramVal[index].endDate;
      				
      				if(typeof sDate != 'undefined' && typeof eDate != 'undefined'){
      					
      					if($.isEmpty($.toDigitMonth(sDate))){
      						paramVal[index].startDate = $.formatDate(sDate);
      					}else{
      						paramVal[index].startDate = $.toDigitMonth(sDate);
      					}
      					if($.isEmpty($.toDigitMonth(eDate))){
      						paramVal[index].endDate = $.formatDate(eDate);
      					}else{
      						paramVal[index].endDate = $.toDigitMonth(eDate);
      					}
      				}else{
      					var dateJson = {'startDate':'','endDate':''}; 
      					$.extend(true,paramVal[index],dateJson);
      				}
          		}); 
      			gridArr[selectedType-1].addRows(paramVal);
      			setTableDate();
      		}
      		
      		function getOfficeData(){
      			$.nest({
      				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.offices"
    				},
    				callback : "getOfficeBack"
      			});
      		}
      		
      		function getOfficeBack(param){
      			officeOption = param;
      			if(selectedType == '1'){
      				$.setSelect('office',param,'id','name');
      			}else if(selectedType == '2'){
      				$.setSelect('offices',param,'id','name');
      			}else{
      				$.setSelect('offic',param,'id','name');
      			}
      			
      		}
      		
      		function getRoleData(){
      			$.nest({
      				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.roles"
    				},
    				callback : "getRoleBack"
      			});
      		}
      		
      		function getRoleBack(param){
      			roleOption = param;
      			if(selectedType == '4'){
      				$.setSelect('role',param,'id','name');
      			}else{
      				$.setSelect('roles',param,'id','name');
      			}
      		}
      		
      		function getLoanProducts(){
      			$.nest({
      				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.loanproducts"
    				},
    				callback : "getLoanBack"
      			});
      		}
      		
      		function getLoanBack(param){
      			loanOption = param;
      			if(selectedType == '1'){
      				$.setSelect('loanproduct',param,'id','name');
      			}else{
      				$.setSelect('loanProductId',param,'id','name');
      			}
      		}
      		
      		function getSavingsProducts(){
      			
      			$.nest({
      				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.savingsaccounts.template"
    				},
    				callback : "getSavingBack"
      			});
      		}
      		
      		function getSavingBack(param){
      			savingsOption = param.productOptions;
      			if(selectedType == '2'){
      				$.setSelect('savingsproduct',param.productOptions,'id','name');
      			}else{
      				$.setSelect('savingProductId',param.productOptions,'id','name');
      			}
      		}
      		
      		function getCharges(){
      			$.nest({
      				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "GET",
    					"mydata" : "",
    					"url" : "api.v1.charges"
    				},
    				callback : "getChargeBack"
      			});
      		}
      		
      		function getChargeBack(param){
      			chargeOption = param;
      			$.setSelect('charges',param,'id','name');
      		}
      		
      		function getSelectValue(){
      			if(selectedType == '1'){
      				return "1." + $.value('office') + "." + $.value('loanproduct');
      			}else if(selectedType == '2'){
      				return "2." + $.value('offices') + "." + $.value('savingsproduct');
      			}else if(selectedType == '3'){
      				return "3." +$.value('offic') + "." + $.value('charges');
      			}else if(selectedType == '4'){
      				return "4." +$.value('role') + "." + $.value('loanProductId');
      			}else if(selectedType == '5'){
      				return "5." +$.value('roles') + "." + $.value('savingProductId');
      			}
      		}
      		
      		function tableInit(){
      			//debugger;
      			gridArr = new Array(5);
      			for(var i=0;i<5;i++){
      				gridArr[i] = $('#table'+ (i+1)).flexigrid({
	  					buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
	  						{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
	  						{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
	  				});
      			}
      		}
      		
      		function setTableDate(){
      			$('#showTable tbody tr').each(function(){
    				var td_node_3 = $(this).children('td:eq(3)');
    				var td_node_4 = $(this).children('td:eq(4)');
     				var div_node_3 = td_node_3.children('div:first');
     				var div_node_4 = td_node_4.children('div:first');
    				if($.trim(div_node_3.text()).indexOf('NaN')>-1){
    					div_node_3.text('');
    				}
    				if($.trim(div_node_4.text()).indexOf('NaN')>-1){
    					div_node_4.text('');
    				}
    			});
      		}
      		
      		function ADD(){
      			$.openWindow("loadPage.do?nextPage=system.mapping.add_entityMapping");
      		}
      		
      		function EDIT(){
      			mapId = gridArr[selectedType-1].colVal('mapId');
      			$.openWindow("loadPage.do?nextPage=system.mapping.edit_entityMapping");
      		}
      		
      		function DELETE(){
      			var id = gridArr[selectedType-1].colVal('mapId');
    			
    			$.nest({
    				url : "<c:url value='/fineract.do'/>",
    				type : "post",
    				async : true,
    				data : {
    					"dataType" : "DELETE",
    					"mydata" : "",
    					"url" : "api.v1.entitytoentitymapping." + id
    				},
    				callback : "deleteback"
    			});
      		}
      		
      		function deleteback(param){
    			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
    			freashTable();
    		}
       </script>
</body>
</html>