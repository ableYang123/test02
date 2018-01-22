<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form class="form-horizontal" id="editPassword" name="editPassword">
				<fieldset>
					<legend><spring:message code="lable.edit.password"/></legend>
										
					<div class="form-group">
			<label for="password" class="col-sm-3 control-label"><spring:message code="lable.password"/><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="password" name="password" />
			</div>
			
		</div> 
					 
			<div class="form-group">		
			<label for="repeatPassword" class="col-sm-3 control-label"><spring:message code="lable.repeat.password"/><span style="color: #d9534f;">*</span> </label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="repeatPassword" name="repeatPassword" />
			</div>
			</div>
			<div style="text-align: center;">
	<a class="btn btn-warning" href=""><spring:message code="btn.cancle"/></a>
		<button class="btn btn-info" id="save" type="button"><spring:message code="btn.submit" /></button>
	</div>
					</fieldset>
					</form>
					<script type="text/javascript">
					$(document).ready(function(){
						var id=<%=request.getSession().getValue("userId")%>;
						
						 $.valid("editPassword", [ {
								"name" : "password",
								"notEmpty" : ""
							}, {
								"name" : "repeatPassword",
								"identicalTo" : "password",
								"notEmpty" : ""
							}
							]);
						
						 $.getWidget("save").click(function() {
								
								var date;
								date={
									"password":	 $.value('password'),
									"repeatPassword": $.value('repeatPassword')
										
								}
								$.nest({
									url : "<c:url value='/fineract.do'/>",
									type : "post",
									data : {
										'dataType' : "PUT",
										'mydata' : date,
										'url' : 'api.v1.users.'+id
									},
									callback : "callbackadd"
									
								});
							
						 }); 
						 
						
					})
					function callbackadd(param) {
	$.setReadOnly("editPassword");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
					</script>