<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="addEntryForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="entry.add.title"/></legend>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="entry.add.provision"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input datetype="date" name="dateTime" class="datetime">
			</div>
			<div class="col-sm-4">
				<div class="col-sm-1">
					<input id="createjournalentries" class="form-control" type="checkbox"/>
				</div>
				<label class="control-label"><spring:message code="entry.add.createjour"/></label>
			</div>
			<div class="col-sm-2">
				<button type='button' id="save" class="btn btn-primary"><spring:message code="config.edit.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">

	//初始化加载数据
	$(document).ready(function() { 
		$.datetimepicker();
		$('input[name="dateTime"]').val($.formatDate(new Date()));
	});
	
	$.getWidget("save").click(function() {
		var data = {
				"createjournalentries":$("#createjournalentries").is(":checked"),
				"locale":"en",
				"dateFormat":$("input[name='dateTime']").attr('date-format'),
				"date":$("input[name='dateTime']").val(),
		};
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "POST",
				"mydata" : data,
				"url" : "api.v1.provisioningentries"
			},
			callback : "addEntry"
		});
	});
	
	function addEntry(){
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		$.setReadOnly('addEntryForm');
	};
</script>