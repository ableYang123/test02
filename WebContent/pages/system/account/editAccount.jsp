<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="editAccountForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="account.edit.title"/></legend>
		<div class="form-group">
			<div class="pull-right" style="padding-right: 50px">
				<button type='button' id="editBtn" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span><spring:message code="jobs.edit.edit"/></button>
				<button type='button' id="deleteBtn" class="btn btn-warning"><spring:message code="account.edit.delete"/></button>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="account.add.accounttype"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<i id="accountType"></i>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="account.add.addprefixtoaccount"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="prefixCheck" type="checkbox" class="pull-left"/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="account.add.prefixfield"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<select id="prefixType" class="form-control">
				</select>
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
		var accountType;
		//初始化加载数据
		$(document).ready(function() { 
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.accountnumberformats."+accountId
				},
				callback : "editAccount"
			});
			
		});
		
		function editAccount(param){
			$("#accountType")[0].innerHTML = param.accountType.value;
			accountType = param.accountType.value.toLowerCase();
			$("#prefixCheck").attr('checked','true');
			$("#prefixType").append("<option value='"+param.prefixType.id+"'>"+param.prefixType.value+"</option>");
			$.setReadOnly('editAccountForm');
			$('#editBtn').attr("disabled", false);
			$('#deleteBtn').attr("disabled", false);
		};
		
		$.getWidget("save").click(function() {
			var data = {};
			data.prefixType = $.value("prefixType");
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "PUT",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : data,
					"url" : "api.v1.accountnumberformats."+accountId
				},
				callback : "saveAccount"
			}); 
		});
		
		function saveAccount(){
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			$.setReadOnly('editAccountForm');
			$('#editBtn').attr("disabled", false);
			$('#deleteBtn').attr("disabled", false);
		};
		
		$.getWidget("editBtn").click(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "GET",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.accountnumberformats."+accountId+"?template=true"
				},
				callback : "editBtn"
			});
		});
		
		function editBtn(param){
			$("input,select,button,a,textarea",$("#editAccountForm")).attr("disabled", false);
			$("#prefixType option").remove();
			$.setSelect('prefixType',param.prefixTypeOptions["accountType."+accountType],'id','value');
			$.assign({"prefixType":param.prefixType.id});
		};
		
		$.getWidget("deleteBtn").click(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.accountnumberformats."+accountId
				},
				callback : "deleteAccount"
			});
		});
		
		function deleteAccount(){
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
	</script>