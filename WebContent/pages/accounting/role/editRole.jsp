<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form id="addRoleForm" class="form-horizontal">
	<fieldset>
		<legend><spring:message code="rule.edit.title"/></legend>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="rule.add.rulename"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
				<input id="name" name="name" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="rule.add.office"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-3">
			<select id="office" name="office" class="form-control">
			</select>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="rule.add.desc"/></label>
			<div class="col-sm-3">
				<textarea id="desc" name="desc"  class="form-control" rows="3" cols="30"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-1 control-label"><spring:message code="rule.add.glentry"/><span style="font-size: 14px; color: #d9534f">*</span></label>
			<div class="col-sm-11">
				<div class="col-sm-6">
					<p><spring:message code="rule.add.debit"/></p>
					<label class="control-label"><spring:message code="rule.add.debtype"/> </label><input name="aa" value="a1" type="radio" checked="checked"/><spring:message code="rule.add.fixaccount"/>   <input name="aa" value="a2" type="radio"/><spring:message code="rule.add.acclist"/>
					<div id="a1">
						<select id="accountsA" name="accountsA" class="form-control">
						</select>
					</div>
					<div id="a2" style="display: none;">
						<div>
							<label class="control-label col-sm-5"><spring:message code="rule.add.debtags"/> </label>
							<label class="control-label col-sm-7"><spring:message code="rule.add.seldebtags"/> </label>
						</div>
						<div class="col-sm-5">
							<select id="debitTag" class="form-control multiselectmin"
								name="debitTag" multiple="multiple">
							</select>
						</div>
						<div class="col-sm-2">
							<button id='add' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
							</button>
							<button id='del' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-left" style="color: #fff;"></i>
							</button>
						</div>
						<div class="col-sm-5">
							<select id="debitTagRole" class="form-control multiselectmin"
								name="debitTagRole" multiple="multiple">
							</select>
						</div>
						<div>
							<label class="control-label col-sm-6"><spring:message code="rule.add.allow"/> </label>
							<div class="col-sm-1">
								<input id="allowMultipleCreditEntries" class="form-control" type="checkbox"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<p><spring:message code="rule.add.credit"/></p>
					<label class="control-label"><spring:message code="rule.add.cretype"/> </label><input name="bb" value="b1" type="radio" checked="checked"/><spring:message code="rule.add.fixaccount"/>   <input name="bb" value="b2" type="radio"/><spring:message code="rule.add.acclist"/>
					<div id="b1">
						<select id="accountsB" name="accountsB" class="form-control">
						</select>
					</div>
					
					<div id="b2" style="display: none;">
						<div>
							<label class="control-label col-sm-5"><spring:message code="rule.add.debtags"/></label>
							<label class="control-label col-sm-7"><spring:message code="rule.add.seldebtags"/></label>
						</div>
						<div class="col-sm-5">
							<select id="creditTag" class="form-control multiselectmin"
								name="creditTag" multiple="multiple">
							</select>
						</div>
						<div class="col-sm-2">
							<button id='addrole' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
							</button>
							<button id='delrole' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-left" style="color: #fff;"></i>
							</button>
						</div>
						<div class="col-sm-5">
							<select id="creditTagRole" class="form-control multiselectmin"
								name="creditTagRole" multiple="multiple">
							</select>
						</div>
						<div>
							<label class="control-label col-sm-6"><spring:message code="rule.add.allow"/></label>
							<div class="col-sm-1">
								<input id="allowMultipleDebitEntries" class="form-control" type="checkbox"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5">
				<button type='button' class="btn btn-default"><spring:message code="config.edit.cancel"/></button>
				<button type='button' id="save" class="btn btn-primary"><spring:message code="config.edit.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">

	//初始化加载数据
	$(document).ready(function() { 
		$.valid("addRoleForm", [ {
			"name" : "name",
			"notEmpty" : "不能为空"
		},{
			"name" : "office",
			"notEmpty" : "不能为空"
		} ]);
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.accountingrules."+roleId+"?template=true"
			},
			callback : "editRole"
		});
	});
	
	function editRole(param){
		$.setSelect('office',param.allowedOffices,'id','name');
		$.setSelect('accountsA',param.allowedAccounts,'id','name');
		$.setSelect('accountsB',param.allowedAccounts,'id','name');
		$.setSelect('debitTag',param.allowedDebitTagOptions,'id','name');
		$.setSelect('creditTag',param.allowedCreditTagOptions,'id','name');
		$.assign({
			"name":param.name,
			"office":param.officeId,
			"desc":param.description,
			"accountsB":param.debitAccounts[0].id,
		});
		if(param.creditAccounts[0]){
			$('input:radio[name="aa"][value="a1"]').attr("checked","checked");
			$.assign({
				"accountsA":param.creditAccounts[0].id,
			});
		}else{
			$('input:radio[name="aa"][value="a2"]').attr("checked","checked");
			if(param.allowMultipleDebitEntries)
				$("allowMultipleDebitEntries").attr("checked",param.allowMultipleDebitEntries);		
			if(param.allowMultipleCreditEntries)
				$("allowMultipleCreditEntries").attr("checked",param.allowMultipleCreditEntries);
		}
		if(param.debitAccounts[0]){
			$('input:radio[name="bb"][value="b1"]').attr("checked","checked");
			$.assign({
				"accountsB":param.debitAccounts[0].id,
			});
		}else{
			$('input:radio[name="bb"][value="b2"]').attr("checked","checked");
			if(param.creditTags)
				$.setSelect('creditTagRole',param.creditTags,'id','tag.name');
			if(param.debitTags)
				$.setSelect('creditTagRole',param.debitTags,'id','tag.name');
		}
	};
	
    $('input:radio[name="aa"]').change( function(){
    	if(this.value=="a1"){
    		$.show("a1");
    		$.hide("a2");
    	}else{
    		$.show("a2");
    		$.hide("a1");
    	}
    });  
    		
    $('input:radio[name="bb"]').change( function(){
    	if(this.value=="b1"){
    		$.show("b1");
    		$.hide("b2");
    	}else{
    		$.show("b2");
    		$.hide("b1");
    	}
    }); 
    
	$.getWidget("addrole").click(function() {
		var option_arr = $('#creditTag option:selected');
		var roles = $("#creditTagRole");
		rep(option_arr,roles);
	});
	$.getWidget("delrole").click(function() {
		var option_arr = $('#creditTagRole option:selected');
		var roles = $("#creditTag");
		rep(option_arr,roles);
	});
	$.getWidget("add").click(function() {
		var option_arr = $('#debitTag option:selected');
		var roles = $("#debitTagRole");
		rep(option_arr,roles);
	});
	$.getWidget("del").click(function() {
		var option_arr = $('#debitTagRole option:selected');
		var roles = $("#debitTag");
		rep(option_arr,roles);
	});
    
	function rep(option_arr,roles){
		if (option_arr != null && typeof(option_arr) != 'undefined') {
			var txt = $(option_arr).text();
			var value = $(option_arr).val();
			if(txt){
				roles.append("<option value='" + value + "'>" + txt + "</option>");
				option_arr.remove();
			}
		}
	};
	
	$.getWidget("save").click(function() {
		var data = {};
		data.name=$.value("name");
		data.officeId=$.value("office");
		data.description=$.value("desc");
		if($('input:radio[name="aa"]:checked').val() == "a1"){
			data.accountToCredit=$.value("accountsA");
		}else{
			data.creditTags=[];
			$('#debitTagRole option').each(function() {
				data.ff.push(parseInt($(this).attr('value')));
			});
			if(data.creditTags.length<=0){
				$.bAlert($.fn.bootstrapValidator.i18n.user.selectRole);
				return false;
			}
			if($("#allowMultipleCreditEntries").is(":checked")){
				data.allowMultipleCreditEntries=true;
			}
		}
		if($('input:radio[name="bb"]:checked').val() == "b1"){
			data.accountToDebit=$.value("accountsB");
		}else{
			data.debitTags=[];
			$('#creditTagRole option').each(function() {
				data.gg.push(parseInt($(this).attr('value')));
			});
			if(data.debitTags.length<=0){
				$.bAlert($.fn.bootstrapValidator.i18n.user.selectRole);
				return false;
			}
			if($("#allowMultipleDebitEntries").is(":checked")){
				data.allowMultipleDebitEntries=true;
			}
		}
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "POST",
				"mydata" : data,
				"url" : "api.v1.accountingrules"
			},
			callback : "saveRole"
		});
	});
	
	function saveRole(){
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		$.setReadOnly('addRoleForm');
	}
</script>