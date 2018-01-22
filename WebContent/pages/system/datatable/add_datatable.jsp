<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<form class="form-horizontal" id="adddatatableform" name="adddatatableform">
				<fieldset>
					<legend><spring:message code="label.datatable.createdatatable"/></legend> 
					 <div class="form-group">
    		            <label class="control-label col-sm-2 " for="datatableName"><spring:message code="label.datatable.tablename"/>
    		            	<span style="color: #d9534f;">*</span>
    		            </label>
    		            <div class="col-sm-3">
    		                <input id="datatableName" type="text" name="datatableName"  class="form-control" value=''>
    		            </div>   
    		        </div>
    		        <div class="form-group">
    		            <label class="control-label col-sm-2 " for="apptableName"><spring:message code="label.datatable.applicationtablename"/>
    		           		<span style="color: #d9534f;">*</span>
    		            </label>

    		            <div class="col-sm-3">
    		                <select id="apptableName"  name="apptable" class="form-control">
    		                    <option class="displaynone " value=""><spring:message code="label.datatable.selectone"/></option>
    		                    <option value="m_client" class=""><spring:message code="label.datatable.client"/></option>
    		                    <option value="m_group" class=""><spring:message code="label.datatable.group"/></option>
    		                    <option value="m_center" class=""><spring:message code="label.datatable.center"/></option>
    		                    <option value="m_loan" class=""><spring:message code="label.datatable.loan"/></option>
    		                    <option value="m_office" class=""><spring:message code="label.datatable.office"/></option>
    		                    <option value="m_savings_account" class=""><spring:message code="label.datatable.savingaccount"/></option>
    		                </select>
    		            </div>
    		        </div>
    		        <div class="form-group">
    		            <label class="control-label col-sm-2 "><spring:message code="label.datatable.multirow"/></label>
    		            <div class="form-inline col-sm-3"><input id="columns2" type="checkbox">
    		            
    		            </div>
    		        </div>
    		        <div class="form-group">
    		            <label class="control-label col-sm-2 "><spring:message code="label.datatable.addcolumns"/>
    		            	<span style="color: #d9534f;">*</span>
    		            </label>
    		            <div class="row">
    						<div class="col-sm-3">
    				            <input name="columnname" type="text" placeholder="Column name" class="form-control">
    						</div>
    						  
    						<div class="col-sm-3">
    				             <select name="columnType" class="form-control">
    				                <option class="displaynone" value=""><spring:message code="label.datatable.selectcolumntype"/></option>
    				                <option value="String"><spring:message code="label.datatable.string"/></option>
    				                <option value="Number"><spring:message code="label.datatable.number"/></option>
    				                <option value="Decimal"><spring:message code="label.datatable.decimal"/></option>
    				                <option value="Boolean"><spring:message code="label.datatable.boolean"/></option>
    				                <option value="Date"><spring:message code="label.datatable.date"/></option>
    				                <option value="DateTime"><spring:message code="label.datatable.datetime"/></option>
    				                <option value="Text"><spring:message code="label.datatable.text"/></option>
    				                <option value="Dropdown"><spring:message code="label.datatable.dropdown"/></option>
    				            </select> 
    						</div>	
    						<div class="col-sm-2">
    						      <button type="button" class="btn btn-link" id="show">
    						   	 	<span class="glyphicon glyphicon-plus"></span>
    						    </button>
    		                </div>					
    		            </div>
    		        </div>

    		        <table id="liebiao" style="display:none">
    		            <tbody>
    		            <tr class="form-group">
    		                <td>
    		                    <label class="control-label col-sm-2">
    		                    	<h4><spring:message code="label.datatable.columns"/></h4>
    		                    </label>
    		                </td>
    		                <td>
    		                    <table class="table table-hover " id="table" style="width: 80%">
    		                        <tr>
    		                            <td><spring:message code="label.datatable.name"/></td> 
    		                            <td><spring:message code="label.datatable.type"/></td>
    		                            <td><spring:message code="label.datatable.mandatory"/></td>
    		                            <td><spring:message code="label.datatable.length"/></td>
    		                            <td><spring:message code="label.datatable.code"/></td>
    		                            <td><spring:message code="label.datatable.actions"/></td>
    		                        </tr>
    		                        	<tr style="display: none;"> 
    		                        		<th name="name"><input name="name" type="text"/></th>
    		                        		<th name="type">
    		                        		   <select name="type" style="width: 120"><option value=""><spring:message code="label.datatable.selectcolumntype"/></option>
					                              <option value="String"><spring:message code="label.datatable.string"/></option>
				    				              <option value="Number"><spring:message code="label.datatable.number"/></option>
				    				              <option value="Decimal"><spring:message code="label.datatable.decimal"/></option>
				    				              <option value="Boolean"><spring:message code="label.datatable.boolean"/></option>
				    				              <option value="Date"><spring:message code="label.datatable.date"/></option>
				    				              <option value="DateTime"><spring:message code="label.datatable.datetime"/></option>
				    				              <option value="Text"><spring:message code="label.datatable.text"/></option>
				    				              <option value="Dropdown"><spring:message code="label.datatable.dropdown"/></option>
					                            </select>
					                        </th>
					                        <th name="mandatory">
					                        	<input name="mandatory" type="checkbox" />
					                        </th>
    		                        		<th name="length">
    		                        			<input name="length" type="text" value="" />
    		                        		</th>
    		                        		<th name="code">
    		                        			<select name="code" style="width: 120">
    		                        				<option value=""></option>
    		                        			</select>
    		                        		</th>
    		                        		<th date-worthless="true">
    		                        			 <button type="button" class="btn btn-link" >
								        			<span name="delete" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							       				</button>
    		                        		</th>
    		                        	</tr>
    		                    </table>
    		                </td>
    		            </tr>
    		        </tbody>
    		       </table>
    		        <div class="col-md-offset-3">
    		            <button id="save" type="button" class="btn btn-primary "><spring:message code="btn.submit"/></button>
    		        </div>
				</fieldset>
	</form>
	<script type="text/javascript">	
	  var select_option;
	  var row = 1;
	$(document).ready(function() {

		$.valid("adddatatableform", [ {
			"name" : "datatableName",
			"notEmpty" : ""
		}, {
			"name" : "apptable",
			"notEmpty" : ""
			}]);
		//按一下+号，显示列数的表格
	 	$("#show").click(function(){ 
			 if($('input[name=columnname]').val()=='' || $('select[name=columnType]').val()==''){
				 $('[id="show"]').empty();
				 $('[id="show"]').append('<span class="glyphicon glyphicon-plus"></span>');
				 $('[id="show"]').append('<small style="color: #d9534f;"><spring:message code="label.datatable.require"/></small>');
			}else if($('input[name=columnname]').val()!='' && $('select[name=columnType]').val()!=''){
				
				 $("#liebiao").show();
				 $('[id="show"]').empty();
				 $('[id="show"]').append('<span class="glyphicon glyphicon-plus"></span>');
				//复制一行
				 $.tableclone("table"); 
				 row = row + 1;
				 
				 var text_val=$('input[name=columnname]').val();
				// alert(text_val);
				 $('#table tr:eq('+ row +') th:first input').attr("value",text_val);
				
				 var selected_val = $('select[name=columnType]').val();
				 //alert(selected_val);
				  $('#table tr:eq('+ row +') select:first').find('option[value="'+ selected_val +'"]').attr('selected',true);
				 
				 if(selected_val=="String"){
					$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
					
				 }else if(selected_val=="Dropdown"){
					$.setSelect('table tr:eq('+ row +') select[name="code"]', select_option, 'id', 'name');
					$("#table").find("tr:eq("+ row +")").find("th").eq(4).children('select').find('option:first').attr('selected',true);
					$("#table").find("tr:eq("+ row +")").find("th").eq(3).attr("style","visibility:hidden");
				 }else{
					$("#table").find("tr:eq("+ row +")").find("th").eq(3).attr("style","visibility:hidden");
					$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
				   
				 }
				  $('input[name=columnname]').val("");
				  $('select[name=columnType]').val("");
			}
			 
		}); 
			
		//获取codes值,添加到<select>标签中
		$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.codes"
				},
				callback : "getcode"
			}); 
		   
		//按一下叉叉，删除当前行
		$('table[id="table"]').on('click','tr th  span[name=delete]',function(){
			this.closest('tr').remove();
			row = row -1;
			if(row==1){
			 $("#liebiao").hide();
			}

		});
		
		 $('select[name=type]').change(function(){
			 var trNode = $(this).closest('tr');
			 if($(this).val() == 'String'){ 
				 trNode.find("th").eq(3).attr("style","visibility:visible");
				 trNode.find("th").eq(4).attr("style","visibility:hidden");
			 }else if($(this).val() == 'Dropdown'){
				 $.setSelect('table tr:eq('+ row +') select[name="code"]', select_option, 'id', 'name');
				 trNode.find("th").eq(4).attr("style","visibility:visible");
				 trNode.find("th").eq(3).attr("style","visibility:hidden");
			 }else{
				 trNode.find("th").eq(4).attr("style","visibility:hidden");
				 trNode.find("th").eq(3).attr("style","visibility:hidden");
			 }
		 });
		
		
		//提交表单
			$.getWidget("save").click(function(){
				var json = $.tableDateArray("table");
				var newData=new Array();
				
				for(var i=0;i<json.length;i++){
					var rowjson = json[i];	
					//获取复选框是否选中
					var checked_val = $('tr:eq('+(i+3)+') input[name=mandatory]').is(":checked");
					//获取code落下列表值
					var code_val = $('tr:eq('+(i+3)+') select[name=code]').find('option:selected').text();
					//获取类型值
					var selected_val2 = $('tr:eq('+(i+3)+') select[name=type]').find('option:selected').val();		
					//alert(selected_val2);
					if(selected_val2 == "String"){	
						
						delete rowjson['code'];
					}else if(selected_val2=="Dropdown"){
						
							rowjson['code']=code_val;
							delete rowjson['length'];
						
							
					}else{
						
						delete rowjson['code'];
						delete rowjson['length'];
					}	
                  
					rowjson['mandatory']=checked_val;
					newData.push(rowjson);
				}
	 			
	 				  var data = {
	 						"datatableName":$.trim($("#datatableName").val()),
	 						"apptableName":$("#apptableName").val(),
	 						"columns":newData,
	 						"multiRow":$("#columns2").is(":checked"),
	 				   	};  	 				
	 			 $.nest({
	 				url : "<c:url value='/fineract.do'/>",
	 				type : "post",
	 				data : {
	 					'dataType' : "POST",
	 					'mydata' : data,
	 					'url' : 'api.v1.datatables'
	 				},
	 				callback : "add_success"
	 			}); 
	 			
	 			
	 		});
	});
	function add_success(param){
		
		$.setReadOnly('adddatatableform');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
	function getcode(param){
		select_option = param;
	}
	</script>
