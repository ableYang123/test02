<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<style type="text/css">
	.dpdown{
		position: absolute;
		float: left;
		z-index: 1000;
   		min-width: 160px;
    	padding: 5px 0;
    	margin: 2px 0 0;
    	list-style: none;
    	font-size: 14px;
    	text-align: left;
    	background-color: #fff; 
    	border: 1px solid rgba(0, 0, 0, 0.15);
    	border-radius: 4px;
    	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
    	background-clip: padding-box;
    	display: none;
	}
</style>
			<form class="form-horizontal" id="accountTransferFunds" name="accountTransferFunds" style="font-size: small;"> 
				<fieldset>
					<legend><spring:message code="client.savingaccount.accountTransfers"/></legend>
					<label><strong><spring:message code="client.savingaccount.transferringFromDetails"/></strong></label>
					
					<div>
						<table class="table table-striped">
							<tr>
								<td style="width: 20%;font-weight: 600;" ><spring:message code="lable.applicant"/></td>
								<td style="width: 30%" id="applicant"></td>
								<td style="width: 20%;font-weight: 600;"><spring:message code="lable.office"/></td>
								<td style="width: 30%" id="office"></td>
							</tr>
							
							<tr>
								<td style="width: 20%;font-weight: 600;"><spring:message code="lable.from.account"/></td>
								<td style="width: 30%" id="fromAccount"></td>
								<td style="width: 20%;font-weight: 600;"><spring:message code="lable.from.account.type"/></td>
								<td style="width: 30%" id="fromAccountType"></td>
							</tr>
							
							<tr>
								<td style="width: 20%;font-weight: 600;"><spring:message code="lable.currency"/></td>
								<td style="width: 30%" id="currency"></td>
							</tr>
						
						</table>
					</div>
					<hr>
					
						
					<label><strong><spring:message code="client.savingaccount.transferringTo"/></strong></label>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.office"/><span style="font-size: 14px; color: #d9534f">*</span></label>
						<div class="col-sm-3">
							<select id="selectOffice" name="selectOffice" class="form-control" style="width: 198;">
								<option value="?"><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.client"/><span style="font-size: 14px; color: #d9534f">*</span></label>
						<div class="col-sm-3">
							<input class="form-control" id="inpClient" name="inpClient" dataType="match" for="search" source="displayName" value='' autocomplete="off" style="width: 198;">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.accountType"/><span style="font-size: 14px; color: #d9534f">*</span></label>
						<div class="col-sm-3">
							<select id="selectAccountType" name="selectAccountType" class="form-control" style="width: 198;">
								<option value="?"><spring:message code="label.center.chose"/></option>
							</select>
						</div>
					</div>			
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.account"/><span style="font-size: 14px; color: #d9534f">*</span></label>
						<div class="col-sm-3">
							<select id="selectAccount" name="selectAccount"  class="form-control" style="width: 198;">
								<option value="?"><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.amount"/><span style="font-size: 14px; color: #d9534f">*</span></label>
						<div class="col-sm-3">
							<input class="form-control" name="inpAmount" id="inpAmount" style="width: 198;">
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="client.savingaccount.transactionDate"/><span style="font-size: 14px; color: #d9534f">*</span></label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="transactionDate">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.description"/><span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3" >
							<textarea name="note" id="note" rows="3" cols="28"></textarea>
						</div>
					</div>
					

					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="transfer" name="transfer" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		var api_uri = 'api.v1.accounttransfers.template?fromAccountId=' + savingsId + '&fromAccountType=' + fromAccountType;
		var clientArr = [];
		var fromAccountId;
		var fromOfficeId;
		var fromoClientId;
		
		$(document).ready(function() {
			$.valid("accountTransferFunds", [ {
				"name" : "inpAmount",
				"notEmpty" : "不能为空"
			},{
				"name" : "note",
				"notEmpty" : "不能为空"
			}]);
			
			//初始化
			baseNest(api_uri,'loadtransfer');
			
			$.getWidget('selectOffice').change(function(){
				var  officeId =	$.value('selectOffice');
				$('#inpClient').val('');
				$('#selectAccountType').find('option:first').selected = true;
				$('#selectAccount').find('option:first').selected = true;
				if(!isNaN(parseInt(officeId))){
					var api_uri_other = api_uri + '&toOfficeId=' + officeId;
					
					//除toOfficeId之外的路径信息
					var toAccountType = $.value('selectAccountType');
					var toAccountId = $.value('selectAccount');
					if(!isNaN(parseInt(toAccountType))){
						api_uri_other = api_uri_other + '&toAccountType=' + toAccountType; 
					}
					if(!isNaN(parseInt(toAccountId))){
						api_uri_other = api_uri_other + '&toAccountId=' + toAccountId;
					}
					
					baseNest(api_uri_other,'getClient');
				}
			});
			
			$.getWidget('selectAccountType').change(function(){
				var toAccountType = parseInt($.value('selectAccountType'));
				
				if(!isNaN(toAccountType)){
					var api_uri_other = api_uri + '&toAccountType=' + toAccountType;
					//获取除toAccountType之外的路径信息
					var toOfficeId = parseInt($.value('selectOffice'));
					var toClientId = parseInt($('#inpClient').attr('code'));
					
					if(!isNaN(toOfficeId)){
						api_uri_other = api_uri_other + '&toOfficeId='  +  toOfficeId;
					}
					if(!isNaN(toClientId)){
						api_uri_other = api_uri_other + '&toClientId='  +  toClientId;
					}
					baseNest(api_uri_other,'getAccount');
				}
			});
			
			$.getWidget('selectAccount').change(function(){
				var toAccountId = parseInt($.value('selectAccount'));
				
				if(!isNaN(toAccountId)){
					var api_uri_other = api_uri + '&toAccountId=' + toAccountId;
					
					var toOfficeId = parseInt($.value('selectOffice'));
					var toClientId = parseInt($('#inpClient').attr('code'));
					var toAccountType = $.value('selectAccountType');
					if(!isNaN(toOfficeId)){
						api_uri_other = api_uri_other + '&toOfficeId='  +  toOfficeId;
					}
					if(!isNaN(toClientId)){
						api_uri_other = api_uri_other + '&toClientId='  +  toClientId;
					}
					if(!isNaN(parseInt(toAccountType))){
						api_uri_other = api_uri_other + '&toAccountType=' + toAccountType; 
					}
					baseNest(api_uri_other,'getAmount');
				}
			});
			
			$.getWidget('transfer').click(function(){
				if($.validateForm("accountTransferFunds")){
					var json = {
							'dateFormat' : $.getDateFormat(),
							'fromAccountId' : fromAccountId,
							'fromAccountType' : 2,
							'fromClientId' : fromClientId,
							'fromOfficeId' : fromOfficeId,
							'locale' : $.getLocale(),
							'toAccountId' : $.value('selectAccount'),
							'toAccountType' : $.value('selectAccountType'),
							'toClientId' : $('#inpClient').attr('code'),
							'toOfficeId' : $.value('selectOffice'),
							'transferAmount' : $.value('inpAmount'),
							'transferDate' : $.value('transactionDate'),
							'transferDescription' : $.value('note')
					};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.accounttransfers"
						},
						callback : function(param){
							$.setReadOnly("accountTransferFunds");
							$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
							window.location.href = '<c:url value="loadPage.do?nextPage=client.savingsaccounts"/>&officeId='+fromOfficeId+'&savingsId='+savingsId;;
						}
					});
					
				}
			});
			
		});
		
		
		
		function loadtransfer(param){
			fromAccountId = param.fromAccount.id;
			fromClientId = param.fromClient.id;
			fromOfficeId = param.fromOffice.id;
			$("#applicant").append(param.fromClient.displayName);
			$("#office").append(param.fromOffice.name);
			$("#fromAccount").append(param.fromAccount.productName+"-#"+param.fromAccount.accountNo);
			$("#fromAccountType").append(param.fromAccountType.value);
			$("#currency").append(param.currency.name);
			
			$.setSelect("selectOffice",param.fromOfficeOptions,"id","name");
			$.setSelect("selectAccountType",param.fromAccountTypeOptions,"id","value");
			//$.setSelect("selectAccount",param.fromAccountOptions,"id","accountNo");
			$.assign({
				"inpAmount" : 0
			});
		}
		
		function getClient(param){
			clientArr = param.toClientOptions;
			//初始化搜索框
			var keyArr = ['id'];
			$.inputSearchInit(clientArr,keyArr,'searchClient','false','false');
			$.assign({
				"inpAmount" : param.transferAmount
			});
		}
		
		function searchClient(obj){
			$('#inpClient')[0].focus();
			var val_id = $(obj).attr('_id');
			if(typeof val_id != 'undefined'){
				val_id = val_id + ' ' + $.trim($(obj).text());
			}else{
				
			}
			$('#inpClient').val(val_id);
			$('#inpClient').attr('code',$(obj).attr('_id'));
			$('#search').empty();
			$('#search').hide();
			
			if(!$.isEmpty($('#inpClient').val())){
				var api_uri_other = api_uri + '&toClientId=' + $(obj).attr('_id');
				//获取除toClientId之外的路径信息
				var toOfficeId = parseInt($.value('selectOffice'));
				var toAccountType = parseInt($.value('selectAccountType'));
				if(!isNaN(toOfficeId)){
					api_uri_other = api_uri_other + '&toOfficeId='  +  toOfficeId;
				}
				if(!isNaN(parseInt(toAccountType))){
					api_uri_other = api_uri_other + '&toAccountType=' + toAccountType; 
				}
				baseNest(api_uri_other,'getAmount');
				baseNest(api_uri_other,'getAccount');
			}
		}
		
		function getAmount(param){
			$.assign({
				"inpAmount" : param.transferAmount
			});
		}
		
		function getAccount(param){
			$.setSelect('selectAccount',param.toAccountOptions,'id','accountNo');
		}
		
		function baseNest(api_uri,callfunc){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url":api_uri
				},
				callback : callfunc
			});
		}
</script>