<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="addAccountForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="account.add.title"/></legend>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label"><spring:message code="account.add.accounttype"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<select id="accountTypeOption" class="form-control">
					<option>--<spring:message code="account.add.selectaccounttype"/>--</option>
				</select>
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
				<!-- <input id="prefixType" name="prefixType" class="form-control" /> -->
			<select id="prefixTypeOption" class="form-control">
			<option>--<spring:message code="account.add.selectprefixfield"/>--</option>
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
		var prefixTypeOptions;
	
		//初始化加载数据
		$(document).ready(function() { 
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.accountnumberformats.template"
				},
				callback : "addAccount"
			});
		});
		
		function addAccount(param){
			$("#prefixCheck").attr('checked','true');
			$.setSelect('accountTypeOption',param.accountTypeOptions,'id','value');
			prefixTypeOptions = param.prefixTypeOptions;
		};
		
		$.getWidget("accountTypeOption").change(function() {
			console.info(this.options[this.selectedIndex].text); 
			var accountType = this.options[this.selectedIndex].text.toLowerCase();
			$.setSelect('prefixTypeOption',prefixTypeOptions["accountType."+accountType],'id','value');
		});
		
		$.getWidget("save").click(function() {
			var data = {};
			data.accountType = $.value("accountTypeOption");
			data.prefixType = $.value("prefixTypeOption");
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "POST",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : data,
					"url" : "api.v1.accountnumberformats"
				},
				callback : "saveAccount"
			}); 
		});
		
		function saveAccount(){
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			$.setReadOnly('addAccountForm');
		};
		
	</script>