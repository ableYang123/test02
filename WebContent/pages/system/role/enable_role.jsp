<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #fff">
				<fieldset>
					<legend><spring:message code="label.role.enabledRole"/></legend>
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.ok"/></button>
						</div>
					</div>
				</fieldset>
				
		<script type="text/javascript">
	      $(document).ready(function() { 
	      });
		$.getWidget("save").click(function(){
			 roleid = grid1.colVal('id');
		      $.nest({
	    			url : "<c:url value='/fineract.do'/>",
	    			type : "post",
	    			data : {
	    				"dataType" : "POST",
	    				"mydata" : "roleid",
	    				"url" : "api.v1.roles." + roleid+"?command=enable"
	    			},
	    			callback : "editenable_success" 
	    		});	
		      
		});
		 function editenable_success(param) {
	     		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	     	}
		</script>
</body>
</html>