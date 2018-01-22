<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="addChartForm" class="form-inline">
	<fieldset>
		<legend><spring:message code="chart.edit.title"/></legend>
		<table width="100%">
			<tr>
				<th class="text-right table-right"><spring:message code="chart.edit.type"/></th>
				<th>
					<select id="type" class="form-control" style="width: 177">
					</select>
				</th>
				<th class="text-right table-right"><spring:message code="chart.edit.parent"/></th>
				<th>
					<select id="parent" class="form-control" style="width: 177">
						<option value=""><spring:message code="chart.edit.sparent"/></option>
					</select>
				</th>
			</tr>
			<tr>
				<th><br></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="chart.edit.glcode"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th>
					<div class="form-group">
						<input id="glCode" name="glCode" type="text" class="form-control" style="width: 177">
					</div>
				</th>
				<th class="text-right table-right"><spring:message code="chart.edit.name"/><span style="font-size: 14px; color: #d9534f">*</span></th>
				<th>
					<div class="form-group">
						<input id="name" name="name" type="text" class="form-control" style="width: 177">
					</div>
				</th>
			</tr>
			<tr>
				<th><br></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="chart.edit.usage"/></th>
				<th>
					<select id="usage" class="form-control" style="width: 177">
						<option value=""></option>
					</select>
				</th>
				<th class="text-right table-right"><spring:message code="chart.edit.tag"/></th>
				<th>
					<select id="tag" class="form-control" style="width: 177">
						<option value=""><spring:message code="chart.edit.stag"/></option>
					</select>
				</th>
			</tr>
			<tr>
				<th><br></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="chart.edit.manual"/></th>
				<th>
					<input id="manualEntriesAllowed" type="checkbox" class="pull-left"/>
				</th>
			</tr>
			<tr>
				<th><br></th>
			</tr>
			<tr>
				<th class="text-right table-right"><spring:message code="chart.edit.des"/></th>
				<th>
					<textarea id="description" name="description"  class="form-control" rows="5" cols="30"></textarea>
				</th>
			</tr>
		</table>
		<div class="text-right" style="padding-right: 80px">
			<button type="button" id="saveBtn" class="btn btn-primary"><spring:message code="btn.submit"/></button>
		</div>
	</fieldset>
	
</form>
<script type="text/javascript">
	var json;

	//初始化加载数据
	$(document).ready(function() { 
		editinit();
		$.valid("addChartForm", [ {
			"name" : "glCode",
			"notEmpty" : "不能为空"
		},{
			"name" : "name",
			"notEmpty" : "不能为空"
		} ]);
	});
	
	function editinit(){
		//加载列表数据
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.glaccounts."+chartId+"?template=true"
			},
			callback : "editChart"
		});
	};
	
	function editChart(param){
		json = param;
		$.setSelect('type',param.accountTypeOptions,'id','value');
		$.setSelect('usage',param.usageOptions,'id','value');
		$.setSelect('tag',param.allowedLiabilitiesTagOptions,'id','value');
		$("#type").trigger("change");
		$.assign({
			"name":param.name,
			"parent":param.parentId,
			"glCode":param.glCode,
			"type":param.type.id,
			"usage":param.usage.id,
			"description":param.description,
			"tag":param.tagId.id
		});
		$("#manualEntriesAllowed")[0].checked = param.manualEntriesAllowed;
	}
	
	$.getWidget("type").change(function() {
		var txt = $(this).find("option:selected").text();
		var val = txt.toLowerCase()+"HeaderAccountOptions";
		if(json[val]){
			$.setSelect('parent',json[val],'id','name');
		}else{
			$.setSelect('parent',{},'id','name');
		}
		var val2 = "";
		if(txt=="ASSET"){
			val2 = "allowedAssetsTagOptions";
		}else if(txt=="LIABILITY"){
			val2 = "allowedLiabilitiesTagOptions";
		}else if(txt=="EQUITY"){
			val2 = "allowedEquityTagOptions";
		}else if(txt=="INCOME"){
			val2 = "allowedIncomeTagOptions";
		}else if(txt=="EXPENSE"){
			val2 = "allowedExpensesTagOptions";
		}else{
			val2={}
		}
		if(json[val2]){
			$.setSelect('tag',json[val2],'id','name');
		}else{
			$.setSelect('tag',{},'id','name');
		}
	});
	
	$.getWidget("saveBtn").click(function() {
		var data = {};
		data.manualEntriesAllowed=$("#manualEntriesAllowed")[0].checked;
		data.type=$.value("type");
		data.usage=$.value("usage");
		data.glCode=$.value("glCode");
		data.name=$.value("name");
		data.tagId=$.value("tag");
		data.description=$.value("description");
		data.parentId=$.value("parent");
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "PUT",
			async : true,
			data : {
				"dataType" : "PUT",
				"mydata" : data,
				"url" : "api.v1.glaccounts."+chartId
			},
			callback : "saveChart"
		});
	});

	function saveChart(){
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		$.setReadOnly('addChartForm');
	}
</script>