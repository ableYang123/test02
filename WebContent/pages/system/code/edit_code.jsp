<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
            <form class="form-horizontal" id="editcodeform" name="editcodeform" method="post">
				<fieldset>
					<legend><spring:message code="label.code.editCode"/></legend>
					<div class="form-group">
						<label class="col-sm-3 control-label"> <spring:message code="label.code.codeName"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
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
	$(document).ready(function(){
		$.valid("addcodeform", [ {
			"name" : "name",
			"notEmpty" : ""
		}]);
		
		$.nest({
			//检索代码
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.codes." + codeId
			},
			callback : "editback"
		});
		//提交表单
		$.getWidget("save").click(function(){
 			if($.validateForm("editcodeform")){
 				var data = {
 						"name":$.trim($("#name").val()),
 				   	};
 			 $.nest({
 				url : "<c:url value='/fineract.do'/>",
 				type : "post",
 				data : {
 					'dataType' : "PUT",
 					'mydata' : data,
 					'url' : 'api.v1.codes.'+codeId
 				},
 				callback : "edit_success"
 			}); 
 			}
 		});
	});
	function editback(param) {
 		$.assign({ 
 			'name': param.name,
 		});
 	}
	 function edit_success(param) {
  		$.setReadOnly("editcodeform");
  		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
  	}
	
	</script>