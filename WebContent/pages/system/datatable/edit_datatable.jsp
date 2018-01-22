<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
           <form class="form-horizontal" id="editdatatableform" name="editdatatableform">
				<fieldset>
					<legend><spring:message code="label.datatable.edittablename"/></legend>
					 <div class="form-group">
    		            <label class="control-label col-sm-2 " for="datatableName"><spring:message code="label.datatable.tablename"/>
    		            	<span style="color: #d9534f;">*</span>
    		            </label>
    		            <div class="col-sm-3">
    		                <input id="datatableName" readonly="true" type="text" name="datatableName"  class="form-control" >
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
    				                <option value="STRING"><spring:message code="label.datatable.string"/></option>
    				                <option value="INTEGER"><spring:message code="label.datatable.number"/></option>
    				                <option value="DECIMAL"><spring:message code="label.datatable.decimal"/></option>
    				                <option value="BOOLEAN"><spring:message code="label.datatable.boolean"/></option>
    				                <option value="DATE"><spring:message code="label.datatable.date"/></option>
    				                <option value="DATETIME"><spring:message code="label.datatable.datetime"/></option>
    				                <option value="TEXT"><spring:message code="label.datatable.text"/></option>
    				                <option value="CODELOOKUP"><spring:message code="label.datatable.dropdown"/></option>
    				            </select> 
    						</div>	
    						<div class="col-sm-2">
    						     <button type="button" class="btn btn-link" id="show">
    						   	 	<span class="glyphicon glyphicon-plus"></span>
    						    </button> 
    		                </div>					
    		            </div>
    		        </div>
    		         <table id="liebiao">
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
    		                            <td><spring:message code="label.datatable.newname"/></td>
    		                            <td><spring:message code="label.datatable.type"/></td>
    		                            <td><spring:message code="label.datatable.mandatory"/></td>
    		                            <td><spring:message code="label.datatable.length"/></td>
    		                            <td><spring:message code="label.datatable.code"/></td>
    		                            <td><spring:message code="label.datatable.newcode"/></td>
    		                            <td><spring:message code="label.datatable.actions"/></td>
    		                        </tr>
    		                        	 <tr style="display: none;">
    		                        		<th name="name"><input name="name"  readonly="readonly" type="text" style="width: 80"/></th>
    		                        		<th name="newname"><input name="newname" placeholder="Column name" type="text" style="width: 80"/></th>
    		                        		<th name="type">
    		                        		   <select name="type" disabled="disabled" style="width: 90"><option value=""><spring:message code="label.datatable.selectcolumntype"/></option>
					                                <option value="STRING"><spring:message code="label.datatable.string"/></option>
				    				                <option value="INTEGER"><spring:message code="label.datatable.number"/></option>
				    				                <option value="DECIMAL"><spring:message code="label.datatable.decimal"/></option>
				    				                <option value="BOOLEAN"><spring:message code="label.datatable.boolean"/></option>
				    				                <option value="DATE"><spring:message code="label.datatable.date"/></option>
				    				                <option value="DATETIME"><spring:message code="label.datatable.datetime"/></option>
				    				                <option value="TEXT"><spring:message code="label.datatable.text"/></option>
				    				                <option value="CODELOOKUP"><spring:message code="label.datatable.dropdown"/></option>
					                            </select>
					                        </th>
					                        <th name="mandatory">
					                        	<input name="mandatory" type="checkbox" />
					                        </th>
    		                        		<th name="length">
    		                        			<input name="length" type="text" style="width: 160" value="" />
    		                        		</th>
    		                        		<th name="code">
    		                        			<select name="code" disabled="disabled" style="width: 120">
    		                        				<option></option>
    		                        			</select>
    		                        		</th>
    		                        		<th name="newcode">
    		                        			<select name="newcode" style="width: 120">
    		                        				<option></option>
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
      var row=1;
      var addArr = [];
      var detArr = [];
      var editArr = []; 
     
      
      $(document).ready(function(){    
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
				 //添加行的状态
				 editStatus(row,'add');			 
				 var text_val=$('input[name=columnname]').val();
				 $('#table tr:eq('+ row +') th:first input').attr("value",text_val);
				 var selected_val = $('select[name=columnType]').val();
				  $('#table tr:eq('+ row +') select:first').find('option[value="'+ selected_val +'"]').attr('selected',true);
				  $('#table tr:eq('+ row +') select:first').attr('disabled',false);
				 if(selected_val=="STRING"){
					$("#table").find("tr:eq("+ row +")").find("th").eq(1).attr("style","visibility:hidden");
					$("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
					$("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden");
				 }else if(selected_val=="CODELOOKUP"){
					$.setSelect('table tr:eq('+ row +') select[name="code"]', select_option, 'id', 'name');
					$("#table").find("tr:eq("+ row +")").find("th").eq(6).children().attr('disabled',true);
					$("#table").find("tr:eq("+ row +")").find("th").eq(5).children().attr('disabled',false);
					$("#table").find("tr:eq("+ row +")").find("th").eq(1).attr("style","visibility:hidden");
					$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
				 }else if(selected_val=="INTEGER"){
					 $("#table").find("tr:eq("+ row +")").find("th").eq(1).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden");
				 }else{
					    $("#table").find("tr:eq("+ row +")").find("th").eq(1).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden");
				   
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
			 var type_value=$(this).closest('tr').find("th").eq(2).find('select').find('option:selected').val();	
			 var inputNodeVal = $(this).closest('tr').children("th:first").find('input').val();
			 var code_value=$(this).closest('tr').find("th").eq(5).find('select').find('option:selected').text();
			 var detjson={};
			 this.closest('tr').remove();
			 console.info(type_value);
			 if(type_value=="CODELOOKUP"){
				 var name_value=code_value+"_cd_"+inputNodeVal; 
				 detjson["name"]=name_value;
			 }else{
			     detjson["name"] = inputNodeVal;
			 }	 
			 detArr.push(detjson);
			 row=row-1;
			 if(row==1){
				 $("#liebiao").hide();
				}
		});
		
		//当类型改变时，相对应的框框也会变 
		 $('select[name=type]').change(function(){
			 var trNode = $(this).closest('tr');
			 if($(this).val() == 'STRING'){
				 trNode.find("th").eq(4).attr("style","visibility:visible");
				 trNode.find("th").eq(5).attr("style","visibility:hidden");
				 trNode.find("th").eq(6).attr("style","visibility:hidden");
			 }else if($(this).val() == 'CODELOOKUP'){
				 $.setSelect('table tr:eq('+ row +') select[name="code"]', select_option, 'id', 'name');
				 trNode.find("th").eq(5).attr("style","visibility:visible");
				 trNode.find("th").eq(5).children().attr("disabled",false);
				 trNode.find("th").eq(6).attr("style","visibility:visible");
				 trNode.find("th").eq(6).children().attr("disabled",true);
				 trNode.find("th").eq(4).attr("style","visibility:hidden");
			 }else{
				 trNode.find("th").eq(6).attr("style","visibility:hidden");
				 trNode.find("th").eq(5).attr("style","visibility:hidden");
				 trNode.find("th").eq(4).attr("style","visibility:hidden");
			 }
		 });
		//提交表单
			$.getWidget("save").click(function(){
				for(var o=2;o< $("#table").find('tr').length;o++){		
					var editjson={};
					var addjson={};
					var statue_val=($($("#table").find('tr')[o]).attr("label"));
					var aa=$($("#table").find('tr')[o]);
					if(statue_val=="add"){				
				     var tyep_val =aa.find("th").eq(2).find('select').find('option:selected').val();				
					  addjson.name=aa.find("th").eq(0).find('input').val();					
					  addjson.mandatory=aa.find("th").eq(3).find('input').is(':checked');		
					  if(tyep_val=="STRING"){
						  delete addjson['code'];
						  addjson.type=tyep_val.toLowerCase();							
					      addjson.length=aa.find("th").eq(4).find('input').val();				      					   	
					  }else if(tyep_val=="CODELOOKUP"){
						  delete addjson['length'];
						  addjson.type="dropdown";	
						  addjson.code=aa.find("th").eq(5).find('select').find('option:selected').text();						  
					  }else if(tyep_val=="INTEGER"){
						  delete addjson['code'];
						  delete addjson['length'];
						  addjson.type="decimal";						  
					  }else {
						  delete addjson['code'];
						  delete addjson['length'];
						  addjson.type=tyep_val.toLowerCase();	
					  }
					  if(!jQuery.isEmptyObject(addjson)){  
						  addArr.push(addjson); 
					  }
					} else if(statue_val=="edit"){				
						editjson.name=aa.find("th").eq(0).find('input').val();
						editjson.newName=aa.find("th").eq(1).find('input').val();
						if(editjson.newName==""){
						   editjson.newName=editjson.name;
						}else{
						   editjson.newName=aa.find("th").eq(1).find('input').val();
						}
						editjson.mandatory=aa.find("th").eq(3).find('input').is(':checked');
						var tyep_val =aa.find("th").eq(2).find('select').find('option:selected').val();									
						if(tyep_val=="STRING"){
							 delete editjson['code'];
							 delete editjson['newCode'];
							editjson.length=aa.find("th").eq(4).find('input').val();
						  }else if(tyep_val=="CODELOOKUP"){
							  delete editjson['length']; 
							  editjson.code=aa.find("th").eq(5).find('select').find('option:selected').text();					
							  editjson.newCode=aa.find("th").eq(6).find('select').find('option:selected').text();
							  if(editjson.newCode==""){
								  editjson.newCode=editjson.code;
							  }else{		
								  editjson.newCode=aa.find("th").eq(6).find('select').find('option:selected').text();
							  }
						  }else{
							  delete editjson['length'];
							  delete editjson['code'];
							  delete editjson['newCode'];
						  }						
						editArr.push(editjson);
					}   
				} 
				 	var data = { 
	 						"apptableName":$("#apptableName").val(),
	 						"changeColumns": editArr
	 				   	};  
				
	 				if(addArr.length > 0){
	 					data['addColumns'] = addArr;
	 				}
	 				if(detArr.length > 0){
	 					data['dropColumns'] = detArr;
	 				}
	 					 				
	 			  $.nest({
	 				url : "<c:url value='/fineract.do'/>",
	 				type : "post",
	 				data : {
	 					'dataType' : "PUT",
	 					'mydata' : data,
	 					'url' : 'api.v1.datatables.'+tablename
	 				},
	 				callback : "addtablename_success"
	 			});  
	 			
	 			
	 		});
    	//列出表格列的详细数据
  	 	
			$.nest({		
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.datatables.'+tablename
				},
				callback : 'getcolumnvalue'
			});
  
      });
      function getcode(param){
  		select_option = param;
  	}
      function addtablename_success(param){
  		$.setReadOnly('editdatatableform');
  		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
  	}
      //获取选中的数据表名和申请表名
      function getcolumnvalue(param) {  
   		$.assign({ 
   			'datatableName': param.registeredTableName,	
   			'apptableName' :param.applicationTableName,
   		});
		/* 遍历填充表格数据 */
		
		for(var o=0;o<param.columnHeaderData.length;o++){
			 if(param.columnHeaderData[o].columnType=="bigint"){
				delete param.columnHeaderData[o];
			} else{
			//复制一行 
			 $.tableclone("table"); 
			 row = row + 1;  
			     //获取名称,给input赋值
				 $('#table tr:eq('+ row +') th:first input').attr("value",param.columnHeaderData[o].columnName);			  
				 editStatus(row,'edit');
			     //获取类型 
				$('#table tr:eq('+ row +') select:first').find('option[value="'+param.columnHeaderData[o].columnDisplayType+'"]').attr('selected',true);						
				 if(param.columnHeaderData[o].columnDisplayType=="STRING"){
					 if(param.columnHeaderData[o].isColumnNullable==false){
					    $("#table").find("tr:eq("+ row +")").find("th").eq(4).find("input").attr("value",param.columnHeaderData[o].columnLength);
						$("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden");	
						$("#table").find("tr:eq("+ row +")").find("th").eq(3).find("input").prop('checked','checked');
					 } else{
						 $("#table").find("tr:eq("+ row +")").find("th").eq(4).find("input").attr("value",param.columnHeaderData[o].columnLength);
							$("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
							$("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden");
					 }
						
					 }else if(param.columnHeaderData[o].columnDisplayType=="CODELOOKUP"){
						 getcodename(row,param.columnHeaderData[o].columnName);
						 if(param.columnHeaderData[o].isColumnNullable==false){ 
						$.setSelect('table tr:eq('+ row +') select[name="newcode"]', select_option, 'id', 'name');
                        $('table select[name="code"]').find('option[text="'+ param.columnHeaderData[o].columnCode +'"]').attr('selected',true);
						$("#table").find("tr:eq("+ row +")").find("th").eq(6).children('select').find('option:first').attr('selected',true);
						$("#table").find("tr:eq("+ row +")").find("th").eq(5).children().prepend('<option index="'+ o +'">'+ param.columnHeaderData[o].columnCode +'</option>').find('option[index="'+ o +'"]').attr('selected',true);
						$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(3).find("input").prop('checked','checked');	
					 }else{
							$.setSelect('table tr:eq('+ row +') select[name="newcode"]', select_option, 'id', 'name');
							$('table select[name="code"]').find('option[text="'+ param.columnHeaderData[o].columnCode +'"]').attr('selected',true);
							$("#table").find("tr:eq("+ row +")").find("th").eq(6).children('select').find('option:first').attr('selected',true);
							$("#table").find("tr:eq("+ row +")").find("th").eq(5).children().prepend('<option index="'+o +'">'+ param.columnHeaderData[o].columnCode +'</option>').find('option[index="'+ o +'"]').attr('selected',true);
							$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden"); 
					 }
					 }else{
						 if(param.columnHeaderData[o].isColumnNullable==false){
						$("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
						$("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden"); 
						$("#table").find("tr:eq("+ row +")").find("th").eq(3).find("input").prop('checked','checked');
						 }else{
							 $("#table").find("tr:eq("+ row +")").find("th").eq(4).attr("style","visibility:hidden");
							 $("#table").find("tr:eq("+ row +")").find("th").eq(5).attr("style","visibility:hidden");
							 $("#table").find("tr:eq("+ row +")").find("th").eq(6).attr("style","visibility:hidden");  
						 }
					 }
			 }
		 }
		 }
      function editStatus(row,status){
    	  $('#table').find("tr:eq("+ row +")").attr('label',status);
      }
       function getcodename(row,name){
    	 var arr=name.split("\_");
    	 $('#table tr:eq('+ row +') th:first input').attr("value",arr[arr.length-1]);
      } 
   	
</script>
