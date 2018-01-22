<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<form class="form-horizontal" id="addcodeform" name="addcodeform" method="post">
				<fieldset>
					<legend><spring:message code="label.code.addCode"/></legend>
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
		//提交表单
		$.getWidget("save").click(function(){
 			if($.validateForm("addcodeform")){
 				var data = {
 						"name":$.trim($("#name").val()),
 				   	};
 				//创建代码
 			 $.nest({
 				url : "<c:url value='/fineract.do'/>",
 				type : "post",
 				data : {
 					'dataType' : "POST",
 					'mydata' : data,
 					'url' : 'api.v1.codes'
 				},
 				callback : "add_success"
 			}); 
 			}
 		});
	});
	
	function add_success(param){
		$.setReadOnly('addcodeform');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
	</script>