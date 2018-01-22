<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<form id="addClosureForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="closure.add.title"/></legend>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.add.office"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
			<select id="addOffice" name="addOffice" class="form-control">
				<option value=""><spring:message code="closure.add.seloff"/></option>
			</select>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.add.clodate"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input datetype="date" name="dateTime" class="datetime" afterToday="true">
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="closure.add.comments"/></label>
			<div class="col-sm-3">
				<textarea id="addcomments" name="addcomments"  class="form-control" rows="3" cols="30"></textarea>
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
    var lastUpdatedDate = 0;
	//初始化加载数据
	$(document).ready(function() { 
		$.datetimepicker();
		$.valid("addClosureForm", [ {
			"name" : "addOffice",
			"notEmpty" : "不能为空"
		},{
			"name" : "dateTime",
			"notEmpty" : "不能为空"
		} ]);
		addinit();
	});
	
	function addinit(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.offices"
			},
			callback : "addOffices"
		});
	};
	
	function addOffices(param){
		$.setSelect('addOffice',param,'id','name');
	}
	
	$.getWidget("save").click(function() {
		var date = {};
		if($.value("addcomments"))
			date.comments=$.value("addcomments");
		//alert($("input[name='dateTime']").val()>lastUpdatedDate);
		if($.value("addOffice") && $("input[name='dateTime']").val()){
			date.officeId=$.value("addOffice");
			date.closingDate=$("input[name='dateTime']").val();
			date.locale="en";
			date.dateFormat=$("input[name='dateTime']").attr('date-format');
			//console.info(date);
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : date,
					"url" : "api.v1.glclosures"
				},
				callback : "addClosure"
			});
		}
	});
	
	function addClosure(){
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		$.setReadOnly('addClosureForm');
	};
	
	$.getWidget("addOffice").change(function() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.glclosures?officeId="+this.value
			},
			callback : "listGlclosure"
		});
	});
	
	function listGlclosure(param){
		if(param.result){
		}else{
			lastUpdatedDate=$.formatDate(param[0].lastUpdatedDate);
		}
	}
</script>