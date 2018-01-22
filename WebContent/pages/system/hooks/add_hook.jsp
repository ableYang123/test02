<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
  <form class="form-horizontal" id="addhookform" name="addhookform">
				<fieldset>
					<legend><spring:message code="label.hook.addhook"/></legend>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.templateName"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							 <select name="templateName"  id="templateName" style="width:170px">
							          <!-- <option style="display:none" value="">选择模板</option> -->
							          <option value="SMS Bridge">SMS Bridge</option>
					                  <option value="Web" selected="selected">Web</option>
    				         </select>
						</div>
					</div>
					<div class="form-group">
						<label for="displayname" class="col-sm-3 control-label"><spring:message code="label.hook.hookName"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="displayname"
								name="displayname"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.active"/></label>
						<div class="col-sm-3">
							<input type="checkbox" id="active" name="active"/>
						</div>
					</div>
				<!--用于切换div层  -->
				 <div id="Web">
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.contenttype"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="ContentType"  name="ContentType" placeholder="json / form"/>
						</div>
						<small id="type" style="color: #d9534f; display:none;"><spring:message code="label.hook.correctcontent"/></small>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.payloadURL"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="PayloadURL" name="PayloadURL" />
						</div>
						<small id="net1" style="color: #d9534f; display:none;"><spring:message code="label.hook.correctURL"/></small>
					</div>
				</div>  
				
				<div id="SMSbridge">
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.payloadURL"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="PayloadURL2" name="PayloadURL2" />
						</div>
						<small id="net2" style="color: #d9534f; display:none;"><spring:message code="label.hook.correctURL"/></small>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.phonenumber"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="PhoneNumber" name="PhoneNumber"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.SMSprovider"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="SMSProvider" name="SMSProvider"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.SMSprovideraccountId"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="SMSProviderAccountId" name="SMSProviderAccountId"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.SMSprovidertoken"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="SMSProviderToken" name="SMSProviderToken"/>
						</div>
					</div>
				</div>
					
					
					
					<div id="UGDtemplate" class="form-group" style="display: none;">
						<label class="col-sm-3 control-label"><spring:message code="label.hook.UGDtemplate"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<select  value="" class="form-control">
								<option style="display:none" value="" selected="selected"><spring:message code="label.hook.selectUGDtemplate"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="events" class="col-sm-3 control-label"><spring:message code="label.hook.activity"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-2">
							<select  value="" class="form-control" name="group" id="group">
								<option style="display:none" value="" selected="selected"><spring:message code="label.hook.selectgroup"/></option>
							</select>
						</div>
						<div class="col-sm-2">
							<select  value="" class="form-control" name="entity" id="entity">
								<option style="display:none" value="" selected="selected"><spring:message code="label.hook.selectentity"/></option>
							</select>
						</div>
						<div class="col-sm-2">
							<select  value="" class="form-control" name="action" id="action">
								<option style="display:none" value="" selected="selected"><spring:message code="label.hook.selectaction"/></option>
							</select>
						</div>
						<div class="col-sm-2">
    						     <button type="button" class="btn btn-link" id="show">
    						   	 	<span class="glyphicon glyphicon-plus"></span>
    						    </button> 
    		                </div>	
					</div>
					</div>
					<table class="table" style="display:none" id="table" width="100%">
                          <tr>
                            <th><spring:message code="label.hook.entityname"/></th>
                            <th><spring:message code="label.hook.actionname"/></th>
                            <th></th>
                          </tr>
                          <tr style="display: none;">
                            <th name="entityName"><input name="entityName" type="text" readonly="readonly"/></th>
                          	<th name="actionName"><input name="actionName" type="text" readonly="readonly"/></th>
                          	<th date-worthless="true">
    		                        <button type="button" class="btn btn-link" >
								        <span name="delete" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							       </button>
    		                </th>
                          </tr>
                   </table>
					 <div class="col-md-offset-3">
    		            <button id="save" type="button" class="btn btn-primary "><spring:message code="btn.submit"/></button>
    		        </div>
				</fieldset>
			</form>
			
				
				
		<script type="text/javascript">
		var entityoptions;
		var entitylist;
		var row=1;
		var templatename;	
		 //初始化
		init();
		$(document).ready(function() {
			$.valid("addhookform", [ {
				"name" : "displayname",
				"notEmpty" : ""
			},{
				"name" : "PhoneNumber",
				"notEmpty" : ""
			}, {
				"name" : "SMSProvider",
				"notEmpty" : ""
			}, {
				"name" : "SMSProviderAccountId",
				"notEmpty" : ""
			}, {
				"name" : "SMSProviderToken",
				"notEmpty" : ""
			}]);
			 
		$("#templateName").change(function(){
			init();
		});
		
       //按一下+号，显示列数的表格	
	 	$("#show").click(function(){
	 		if($('select[name=entity]').val()!=''){
	 			 $.tableclone("table");
	 		 	 $("#table").show();
	 		 	 row=row+1;
	 		 	 var groupname=$('select[name=group]').val();
	 		 	 var actionvalue=$('select[name=action]').val();
	 		 	 if($('select[name=action]').val()==''){
	 		 		$('#table tr:eq('+ row +') th:first input').attr("value",groupname);
	 	 		 	$('#table tr:eq('+ row +') th:eq(1) input').attr("value","{}");
	 		 	 }else{
	 		 		$('#table tr:eq('+ row +') th:first input').attr("value",groupname);
	 	 		 	$('#table tr:eq('+ row +') th:eq(1) input').attr("value",actionvalue);
	 		 	 }
	 		} 	 
	 		});
	 	 
	 	//按一下叉叉，删除当前行
		$('table[id="table"]').on('click','tr th  span[name=delete]',function(){
			this.closest('tr').remove();
			row = row -1;

		});
		//获取活动的相关数据
		 $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					'dataType' : "GET",
					'mydata' : "",
					'url' : 'api.v1.hooks.template'
				},
				callback : "getvalue"
			});  
		
		//提交表单
		$.getWidget("save").click(function(){
			var json = $.tableDateArray("table"); 
			//console.info(json);			
 			if($.validateForm("addcodeform")){
 				if(templatename == "Web"){ 
 					if($.trim($("#ContentType").val())== 'json' ||$.trim($("#ContentType").val())== 'form'){   					
 						var str=$.trim($("#PayloadURL").val());
 						var Expression=/https?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
 						var objExp=new RegExp(Expression);
 					   if(objExp.test(str) === true){
 						  var data = {
 			                    	"isActive":$("#active").is(":checked"),
 			                    	"name":$.trim($('select[name=templateName]').find('option:selected').text()),
 			                    	"displayName":$.trim($("#displayname").val()),
 			                    	"config":{
 			                    		"Content Type":$.trim($("#ContentType").val()),
 			                    		"Payload URL" :$.trim($("#PayloadURL").val()),
 			                    	},
 			                        "events":json		
 			 				   	};  
 					   }else{
 						  //$("#PayloadURL").after('<small style="color: #d9534f;">请填写正确的网址</small>');
 						  $("#net1").show();
 						  $("#type").hide();
 					   }	
 					}else{
 						//$("#ContentType").after('<small style="color: #d9534f;">请填写json或者form</small>');
 						$("#type").show(); 
 					}
 				}else if(templatename=="SMS Bridge"){
 					var flag = false;
 					$.each(listData,function(index,item){
 						var name = item.name;
 						if(name == templatename){
 							flag = true;
 						}
 					});
 					if(flag){
 						$.bAlert('<spring:message code="error.msg.multiplehooks"/>');
 					}else{
 						var str=$.trim($("#PayloadURL2").val());
 						var Expression=/https?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
 					    var objExp=new RegExp(Expression);
 					   	if(objExp.test(str) === true){
 						 var data = { 
 		 	                    	"isActive":$("#active").is(":checked"),
 		 	                    	"name":$.trim($('select[name=templateName]').find('option:selected').text()),
 		 	                    	"displayName":$.trim($("#displayname").val()),
 		 	                    	"config":{
 		 	                    		"Payload URL" :$.trim($("#PayloadURL2").val()),
 		 	                    		"Phone Number":$.trim($("#PhoneNumber").val()),
 		 	                    		"SMS Provider":$.trim($("#SMSProvider").val()),
 		 	                    		"SMS Provider Account Id":$.trim($("#SMSProviderAccountId").val()),
 		 	                    		"SMS Provider Token":$.trim($("#SMSProviderToken").val()),
 		 	                    	},
 		 	                        "events":json			
 		 	 				   	};	 
 					   }else{ 
 						 // $("#PayloadURL2").after('<small style="color: #d9534f;">请填写正确的网址</small>');
 						  $("#net2").show();
 					   }		
 					}									
 				}
 				//创建钩子
				 $.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						data : {
							'dataType' : "POST",
							'mydata' : data,
							'url' : 'api.v1.hooks'
						},
						callback : "add_success"
					}); 
 			}
		});	
		});
		//获取group，entity，action
		$.getWidget("group").change(function() {
			//console.info(this.options[this.selectedIndex].text); 
			var groupName = this.options[this.selectedIndex].text;
			for( var o in entityoptions){
				if(entityoptions[o].name == groupName){
					entitylist = entityoptions[o].entities;
				}
			}			
			var list = [];
			for(o in entitylist){
				list.push(entitylist[o].name);
			}
			$.setSelectByList('entity',list);
		});
		$.getWidget("entity").change(function() {
			$("#UGDtemplate").show();
			//console.info(this.options[this.selectedIndex].text); 
			var entityName = this.options[this.selectedIndex].text;			
			var actionlist;			
			for( var o in entitylist){
				if(entitylist[o].name == entityName){
					actionlist = entitylist[o].actions;
				}
			}			
			$.setSelectByList('action',actionlist);
		});
		
		function init(){
			 templatename=$('select[name=templateName]').find('option:selected').val();
			 
			 if(templatename=="Web"){
				 $("#Web").show();
				 $("#SMSbridge").hide(); 
				
			 }else if(templatename=="SMS Bridge"){
				 $("#Web").hide();
				 $("#SMSbridge").show(); 
			 }
		}
		function add_success(param){
			
				$("#type").hide();
				$("#net1").hide();
				$("#net2").hide();
				$.setReadOnly("addhookform");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			
			
		}
		function getvalue(param){
			entityoptions=param.groupings;
			var list = [];
			for(o in param.groupings){
				list.push(param.groupings[o].name);
			}			
			$.setSelectByList('group',list);
		}	
		</script>