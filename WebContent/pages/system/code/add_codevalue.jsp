<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
		<form class="form-horizontal" id="addcodevalueform" name="addcodevalueform" method="post">
				<fieldset>
					<legend><spring:message code="label.code.addCodeValues"/></legend>     
				<div> 
					<!--添加codevalue -->
					<div class="col-sm-3">
					    <div class="form-group">
                         <input id="codevalue" name="codevalue" type="text" class="form-control" placeholder="<spring:message code='label.code.codeValue'/>"/>
                        </div>
                    </div>
                    <!-- 添加Descroption -->
                     <div class="col-sm-3">
                        <textarea id="description" name="description" class="form-control" placeholder="<spring:message code='label.code.description'/>"></textarea>
                    </div>
                    <!--添加position  -->
                     <div class="col-sm-3">
                        <input id="position" name="position" type="text" class="form-control" placeholder="<spring:message code='label.code.position'/>"/>
                    </div>
                    <div class="col-sm-3">
                        <label class="col-sm-2"><font><spring:message code='label.code.active'/></font></label>
                        <div class="col-sm-3">
                            <input id="activeCheckbox"  type="checkbox" checked="checked"/>
                        </div>
                    </div>
                    <div class="col-sm-offset-4">
							<button type='button' id="addvalue" name="addvalue"
								class="btn btn-primary"><spring:message code='btn.add'/></button>
				</div>
				</div> 		
				</fieldset>
		</form>
			<hr>   
				<div>
					<table class="table">
                        <thead>
                        <tr>
                            <th><spring:message code="label.code.name"/></font>
                            <th><spring:message code='label.code.description'/></font>
                            <th><spring:message code='label.code.position'/></font>
                            <th><spring:message code='label.code.active'/></font>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="tbody2"> 

                        </tbody>
                    </table>
                </div>                  
	<script type="text/javascript">

	 var codeValueId;
	 $.valid("addcodevalueform", [ {
			"name" : "codevalue",
			"notEmpty" : "",
		}]);
	init2();
	//创建代码值   提交
	$.getWidget("addvalue").click(function(){ 
		var position_val=$("#position").val();
		  if(position_val==""){
			  position_val=0; 
		  }else if(position_val!=""){
			  if(Number.isInteger(parseInt(position_val))){ 	
				  position_val=$("#position").val(); 
			  } else{
				  $.bAlert('<spring:message code="error.msg.not.datatype"/>');
			  } 
		  }
		  
			if($.validateForm("addcodevalueform")){
				var data = {
						"name":$("#codevalue").val(),
						"description":$("#description").val(),
						"position": position_val,
						"isActive":$("#activeCheckbox").is(':checked'),
				   	};
				//创建代码值
			 $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					'dataType' : "POST",
					'mydata' : data,
					'url' : 'api.v1.codes.'+codeId+'.codevalues'
				},
				callback : "addcodevalue_success"
			}); 
			}			
		});
	//列出代码值
	function init2(){
	 $.nest({ 
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				'dataType' : "GET",
				'mydata' :"",
				'url' : 'api.v1.codes.'+codeId+'.codevalues'
			},
			callback : "codevalue_list"
		});	
	}
	//删除代码值
	$('tbody[id="tbody2"]').on('click','button[name=delvalue]',function(){
		codeValueId = this.parentNode.id;
		//alert(codeValueId)
	   $.nest({ 
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				'dataType' : "DELETE",
				'mydata' :"",
				'url' : 'api.v1.codes.'+codeId+'.codevalues.'+codeValueId
			},
			callback : "deletecodevalue"
		});	  

	});
	//编辑代码值
	$('tbody[id="tbody2"]').on('click','button[name=editvalue]',function(){
		codeValueId = this.parentNode.id;
		var td_one = $(this).closest('tr').children('td:eq(0)');
		var txtone = td_one.text();
		var strone = "<input  name='edit_name' type='text' value='"+txtone+"'/>" ;
		td_one.html(strone);
		
		var td_two=$(this).closest('tr').children('td:eq(1)');
		var txttwo = td_two.text();
		var strtwo="<textarea  name='edit_description'  type='text'>"+txttwo+"</textarea>" ;
		td_two.html(strtwo);
		
		var td_three = $(this).closest('tr').children('td:eq(2)');
		var txtthree = td_three.text();
		var strthree = "<input  name='edit_position' type='text' value='"+txtthree+"'/>" ;
		td_three.html(strthree);
		 
		var td_four = $(this).closest('tr').children('td:eq(3)');
		var txtfour = td_four.text();
		var strfour = "<input name='edit_activeCheckbox' type='checkbox' checked='checked'/>" ; 
		td_four.html(strfour); 
		
		 var td_five = $(this).closest('tr').children('td:eq(4)');
		var txtfive = td_three.text();
		var strfive = "<button type='button' name='save' class='btn btn-primary'><spring:message code='btn.submit'/></button>" ;
		td_five.html(strfive);	
	});	
	//编辑代码值后  提交
	$('tbody[id="tbody2"]').on('click','button[name=save]',function(){ 
		if($('input[name=edit_position]').val()==""){
			 $.bAlert('<spring:message code="lable.code.prompt"/>'); 
		}
		if($('input[name=edit_name]').val()==""){
			init2();
		}else{
		var data2 = {
				"name":$('input[name=edit_name]').val(),
				"description":$('textarea[name=edit_description]').val(),  
			    "position":$('input[name=edit_position]').val(),
			    "isActive":$('input[name=edit_activeCheckbox]').is(':checked'),
			    
		   	};
		
	   $.nest({ 
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				'dataType' : "PUT",
				'mydata' :data2,
				'url' : 'api.v1.codes.'+codeId+'.codevalues.'+codeValueId
			},
			callback : "editcodevalue_success"
		});	
		}
	});
	function addcodevalue_success(param){
		//清空数据
		$('input').val('');
		$('textarea').val('');
		init2();
	}
	function codevalue_list(param) {  
		$('tbody[id="tbody2"]')[0].innerHTML='';
		/* 遍历填充表格数据 */
		 for(var o in param){ 
				if(param.length>0){ 
				 if(typeof(param[o].description)=='undefined'){
					 $('tbody[id="tbody2"]').append('<tr><td>'
								+param[o].name+'</td><td></td><td>'
								+param[o].position+'</td><td>'
								+param[o].active+
					'</td><td id="'+param[o].id+'"><button type="button" name="editvalue" class="btn btn-primary"><spring:message code="btn.edit"/></button>&nbsp&nbsp<button type="button"  name="delvalue" class="btn btn-primary"><spring:message code="btn.delete"/></button></td></tr>');	
				 } else{
					 $('tbody[id="tbody2"]').append('<tr><td>'
								+param[o].name+'</td><td>'
								+param[o].description+'</td><td>'
								+param[o].position+'</td><td>'
								+param[o].active+
					'</td><td id="'+param[o].id+'"><button type="button" name="editvalue" class="btn btn-primary"><spring:message code="btn.edit"/></button>&nbsp&nbsp<button type="button"  name="delvalue" class="btn btn-primary"><spring:message code="btn.delete"/></button></td></tr>');	 
				 } 
			 }else{ 
				 $('tbody[id="tbody2"]').html(""); 
			 }
			} 
	}
	function deletecodevalue(param){
		init2();
	}
	function editcodevalue_success(param){
		
		init2();
	}	
	</script>