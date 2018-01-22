<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<form class="form-horizontal" id="addroleform" name="addroleform" method="post">
				<fieldset>
					<legend><spring:message code="label.role.addRole"/></legend>
					
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

		$.valid("addroleform", [ {
		 
			"name" : "name",
			"notEmpty" : ""
		},{
			"name" : "description",
			"notEmpty" : ""
		}]);
		//提交
		$.getWidget("save").click(function(){
 			if($.validateForm("addroleform")){
 				var data = {
 						"name":$("#name").val(),
 						"description":$("#description").val(),
 				   	};
 			 $.nest({
 				url : "<c:url value='/fineract.do'/>",
 				type : "post",
 				data : {
 					'dataType' : "POST",
 					'mydata' : data,
 					'url' : 'api.v1.roles'
 				},
 				callback : "add_success"
 			}); 
 			}
 		});
 });
	   function add_success(param) { 
    		$.setReadOnly("addroleform");
    		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
    	}
		
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	