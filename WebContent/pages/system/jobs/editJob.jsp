<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form id="editJobForm" class="form-horizontal">
	<fieldset>
		<div class="form-group">
			<div class="pull-right" style="padding-right: 50px">
				<button type='button' id="edit" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span><spring:message code="jobs.edit.edit"/></button>
				<button type='button' id="searchJob" class="btn btn-primary"><spring:message code="jobs.edit.viewhistory"/></button>
			</div>
		</div>
		<hr>
		<!-- 添加名称 -->
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="jobs.edit.jobname"/></label>
			<div class="col-sm-3">
				<input id="displayName" type="text" class="form-control" />
			</div>
		</div>
		<!-- 添加说明-->
		<div class="form-group">
			<label for="description" class="col-sm-3 control-label"><spring:message code="jobs.edit.expression"/></label>
			<div class="col-sm-3">
				<input id="cronExpression" type="text" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="jobs.edit.isactive"/>?</label>
			<div class="col-sm-3">
				<input id="active" type="checkbox" class="pull-left" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type='button' class="btn btn-default"><spring:message code="jobs.edit.cancel"/></button>
				<button type='button' id="save" class="btn btn-primary"><spring:message code="jobs.edit.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>

<table id="searchJobTable" class="table" id="searchJobList" style="display:none;">
	<thead>
		<tr>
			<th name="version" width='80'><spring:message code="jobs.edit.version"/></th>
			<th name="jobRunStartTime" width='280'><spring:message code="jobs.edit.runtime"/></th>
			<th name="status" width='180'><spring:message code="jobs.edit.status"/></th>
			<th name="triggerType" width='180'><spring:message code="jobs.edit.runtype"/></th>
			<th name="error" width='180'><spring:message code="jobs.list.errorlog"/></th>
		</tr>
	</thead>
	<tbody></tbody>
</table>

<script type="text/javascript">
	var grid2;
	
	//初始化加载数据
	$(document).ready(function() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.jobs." + jobId
			},
			callback : "getJob"
		});
		//设置只读
		$.setReadOnly('editJobForm');
		$('#edit').attr("disabled", false);
		$('#searchJob').attr("disabled", false);
	});
	//加载数据回调
	function getJob(param) {
		$.assign({
			"displayName" : param.displayName,
			"cronExpression" : param.cronExpression,
		})
		$('#active').attr('checked', param.active);
	};
	//查看历史按钮点击事件
	$.getWidget("searchJob").click(function() {
		nestjson2={
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.jobs." + jobId + ".runhistory",
					"paging" : "Y"
				},
				callback : "searchJobList"
			}
		grid2 = $('#searchJobTable').flexigrid({
			nestjson : nestjson2,
		});
		$.nest(nestjson2);
	});
	//查看历史按钮回调事件
    function searchJobList(param){
    	$.each(param.pageItems,function(index,item){
			if($.type(item.error) === 'undefined'){
				item.error = '';
			}
		});
    	grid2.addRows(param.pageItems);
		grid2.setPage(param.page, param.pages);
		$('#editJobForm').css('display','none');
		grid2.css('display','');
    };
    //编辑按钮点击事件
	$.getWidget("edit").click(
			function() {
				$("input,select,button,a,textarea", $("#editJobForm")).attr(
						"disabled", false);
			});
	//保存按钮点击事件
	$.getWidget("save").click(function() {
		var data = {
			"displayName" : $.value('displayName'),
			"cronExpression" : $.value('cronExpression'),
			"active" : $('#active')[0].checked
		};
		console.info(data);
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "PUT",
			async : true,
			data : {
				"dataType" : "PUT",
				"mydata" : data,
				"url" : "api.v1.jobs." + jobId
			},
			callback : "saveJob"
		});
	});
	//保存按钮回调事件
	function saveJob() {
		$.setReadOnly('editJobForm');
		$('#edit').attr("disabled", false);
		$('#searchJob').attr("disabled", false);
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>