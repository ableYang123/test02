<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div class="div-cc" >
			<form id="editpasswordform" class="form-horizontal" method="post">
				<fieldset>
					<legend>
						<spring:message code="menu.admin.passwordPreferences"/>
					</legend>
					
					<div id="passwordOptions">
					
					</div>
					<div class="col-md-offset-3">
						<button id="save" type='button' class="btn btn-primary">提交</button>
					</div>
				</fieldset>
			</form>
			
		</div>
		
		  
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",				
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.passwordpreferences.template"
				},
				callback : "callback"
			});
			
			$.getWidget('save').click(function(){
				if ($.validateForm("editpasswordform")) {
					var optionId = $('input:radio:checked').val()
					var json = {
						"validationPolicyId" : optionId
					};
					
					$.nest({
						url : "<c:url value='/fineract.do'/>",				
						type : "post",
						async : false,
						data : {
							"dataType" : "PUT",
							"mydata" : json,
							"url" : "api.v1.passwordpreferences"
						},
						callback : "changeback"
					});
				}
			});
			
		});		
		
		function callback(param){
			$.each(param,function(index,item){
				var val = param[index].id;
				var txt = param[index].description;
				var key = param[index].key;
				var active = param[index].active;
				
				if(val == 1){
					$('#passwordOptions').append("<div class='col-md-offset-1'><input type='radio' name='password' key='" + key + "' value='" + val + "'/>" + "<spring:message code='msg.password.optionOne' />" + "</div>");
				}else if(val == 2){
					$('#passwordOptions').append("<div class='col-md-offset-1'><input type='radio' name='password' key='" + key + "' value='" + val + "'/>" + "<spring:message code='msg.password.optionTwo' />" + "</div>");
				}else{
					$('#passwordOptions').append("<div class='col-md-offset-1'><input type='radio' name='password' key='" + key + "' value='" + val + "'/>" + txt + "</div>");
				}
				/* 动态添加 */
				if(active){
					$('#passwordOptions input[value="'+val+'"]').attr('checked','checked');
				}
			});
		}
		
		function changeback(param){
			$.setReadOnly('editpasswordform');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			history.go(0);
		}
	</script>

</body>
</html>
