<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form id="editConfigForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="config.edit.title"/></legend>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="config.list.value"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="configValue" name="configValue" type="text" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4">
				<button type='button' class="btn btn-default"><spring:message code="config.edit.cancel"/></button>
				<button type='button' id="save" class="btn btn-primary"><spring:message code="config.edit.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
	<script type="text/javascript">
		//初始化加载数据
		$(document).ready(function() { 
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.configurations."+configId
				},
				callback : "editConfig"
			});
			
			$.valid("editConfigForm", [ {
				"name" : "configValue",
				"notEmpty" : "不能为空"
			} ]);
		});
		
		function editConfig(param){
			$.assign({"configValue":param.value})
		};
		
		$.getWidget("save").click(function() {
			var data = {};
			data.value = $.value("configValue");
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "PUT",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : data,
					"url" : "api.v1.configurations."+configId+"?resourceType=configurations"
				},
				callback : "saveConfig"
			}); 
		});
		
		function saveConfig(){
			$.setReadOnly('editConfigForm');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		};
		
	</script>