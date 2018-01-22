<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<form id="viewClosureForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="closure.view.title"/></legend>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.office"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="officeName" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.clodate"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="closingDate" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.closedby"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="createdByUsername" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.updateby"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="lastUpdatedByUsername" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.updatedon"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="lastUpdatedDate" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.credate"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="createdDate" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.view.comments"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="comments" class="form-control"/>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	//初始化加载数据
	$(document).ready(function() { 
		viewinit();
		$.setReadOnly('viewClosureForm');
	});
	
	function viewinit(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.glclosures."+closureId
			},
			callback : "viewClosure"
		});
	};
	function viewClosure(param){
		$.assign({
			"officeName":param.officeName,
			"createdDate":$.formatDate(param.createdDate),
			"createdByUsername":param.createdByUsername,
			"lastUpdatedByUsername":param.lastUpdatedByUsername,
			"lastUpdatedDate":$.formatDate(param.lastUpdatedDate),
			"closingDate":$.formatDate(param.closingDate),
			"comments":param.comments,
		});
	}
</script>