<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="editroleform" name="editroleform" method="post">
				<fieldset>
					<legend><spring:message code="label.role.editRole"/></legend>
					<!-- 添加名称 -->
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label"><spring:message code="label.role.name"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
						</div>
					</div>
					<!-- 添加说明-->
					<div class="form-group">
						<label for="description" class="col-sm-2 control-label"><spring:message code="label.role.description"/><span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<textarea id="description" rows="2"  name="description"></textarea>
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
         $(document).ready(function() {

     		$.valid("editroleform", [ {
     			"name" : "name",
     			"notEmpty" : ""
     		}, {
     			"name" : "description",
     			"notEmpty" : ""
     		} ]);
     		
     		$.nest({
    			url : "<c:url value='/fineract.do'/>",
    			type : "post",
    			data : {
    				"dataType" : "GET",
    				"mydata" : "",
    				"url" : "api.v1.roles." + roleid
    			},
    			callback : "editback"
    		});
     		//提交
     		$.getWidget("save").click(function(){
     			if($.validateForm("editroleform")){
     				var data = {
     						"name":$("#name").val(),
     						"description":$("#description").val(),
     				   	};
     			 $.nest({
     				url : "<c:url value='/fineract.do'/>",
     				type : "post",
     				data : {
     					'dataType' : "PUT",
     					'mydata' : data,
     					'url' : 'api.v1.roles.' + roleid
     				},
     				callback : "edit_success"
     			}); 
     			}
     		});
     });
         function editback(param) {
     		$.assign({
     			'name': param.name,
     			'description' : param.description,
     		});
     	}
         function edit_success(param) {
     		$.setReadOnly("editroleform");
     		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
     	}
     </script> 
		    
		    
		    
		    
		    
		    