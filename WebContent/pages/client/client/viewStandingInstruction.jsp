<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="assignLoanOfficer" name="assignLoanOfficer">
				<fieldset>
					<legend><spring:message code="lable.assign.loan.officer"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.transferType"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id=transferType name="transferType">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class=" col-sm-2 control-label"><spring:message code="label.history.clientName"/>
						</label>
						<div class="col-sm-3">
							<input style="border: none;font-size: small;" readonly="readonly" id=clientName
								name="clientName">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.from.accountId"/>
						</label>
						<div class="col-sm-3">
							<input class="form-control" id=fromAccountId
								name="fromAccountId">
						</div>
					</div>
					<div class="form-group">
						<a href="javascript:void(0)" onclick="searchTransaction()" style="margin-top: 3px;margin-left: 200px;" class="btn btn-primary btn-offset">
							<i class=""></i>
							<spring:message code="lable.filter"/>
						</a>
					</div>
					<div class="form-group">
						<table id="list">
							<thead>
								<tr>
									<th name='id' style='display: none;'>id</th>
									<th name="toClient.displayName" width="120"><spring:message code="lable.name"/></th>
									<th name="fromAccount.accountNo" width="320"><spring:message code="lable.from.accountId"/></th>
									<th name="beneficiary" width="120"><spring:message code="lable.beneficiary"/></th>
									<th name="toAccount.accountNo" width="250"><spring:message code="lable.to.account"/></th>
									<th name="instructionType.value" width="50"><spring:message code="lable.type"/></th>
									<th name="validFrom" width="120"><spring:message code="lable.valid.date.from"/></th>
									<th name="action" width="120"></th>
								</tr>
							</thead>
						</table>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		var clientName;
		var grid;
		var standingId;
		$(document).ready(function() {
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.standinginstructions.template?fromAccountType=2&fromClientId="+clientId+"&fromOfficeId="+fromOfficeId
					},
					callback : "transfer"
				});
				var dateFormat = "yyyy-MM-dd";
				dateFormat = encodeURIComponent(dateFormat);
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.standinginstructions?clientId="+clientId+"&clientName="+clientName+"&dateFormat="+dateFormat+"&limit=14&locale=en&offset=0"
					},
					callback : "standing"
				});
				grid = $('#list').flexigrid({
					height : 'auto',
					usepager: false,
					showToggleBtn: false,
					buttons : [{
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnEdit,
						bclass : 'edit',
						onpress : editStanding
					},
					{
						name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetail,
						bclass : 'Detail',
						onpress : viewStanding
					}]
				});
		});
		function editStanding(){
			standingId = grid.colVal('id');
			$.openWindow("loadPage.do?nextPage=client.editStandingInstruction");
		}
		
		function Delete(obj){
			//standingId = grid.colVal('id');
			var trNode = obj.closest('tr');
			standingId = $(trNode).find('div:first').text();
			$.openWindow("loadPage.do?nextPage=client.deleteStandingInstruction&clientId="+clientId);
		}
		
		function viewStanding(){
			standingId = grid.colVal('id');
			//window.location.href="loadPage.do?nextPage=client.viewStanding&standingId="+standingId;
			$.openWindow("loadPage.do?nextPage=client.viewStanding&standingId="+standingId);
		}
		
		function transfer(param){
			clientName = param.fromClient.displayName
			$.setSelect('transferType', param.transferTypeOptions, 'id', 'value');
			$.assign({
				'clientName' : param.fromClient.displayName
			});
		}
		function standing(param){
			var data = [];
			if(param.pageItems != null){
				for(var i=0;i<param.pageItems.length;i++){
					param.pageItems[i].validFrom = $.formatDate(param.pageItems[i].validFrom,'yyyy-MM-dd')+'至';
					param.pageItems[i].fromAccount.accountNo = param.pageItems[i].fromAccount.accountNo + '('+param.pageItems[i].fromAccountType.value+')';
					param.pageItems[i].toAccount.accountNo = param.pageItems[i].toAccount.accountNo + '('+param.pageItems[i].toAccountType.value+')';
					if(typeof param.pageItems[i].beneficiary == 'undefined'){
						param.pageItems[i].beneficiary = 'Own Account';
					}
					if(typeof param.pageItems[i].action == 'undefined'){
						if(param.pageItems[i].status.value != 'Deleted'){
							param.pageItems[i].action = '<a href="javascript:void(0)" onclick="javascript:Delete(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
								+'<i class="glyphicon glyphicon-remove"></i>'
								+'</a>';
						}
					}
					data.push(param.pageItems[i]);
				}
				grid.addRows(data);
			}
		}
		function searchTransaction(){
			var dateFormat = "yyyy-MM-dd";
			var transferId = parseInt($.value('transferType'));
			dateFormat = encodeURIComponent(dateFormat);
			var fromAccountId = $.value('fromAccountId');
			var url = "";
			if(fromAccountId == null || fromAccountId == ''){
				if(!isNaN(transferId)){
					url = "api.v1.standinginstructions?clientId="+clientId+"&clientName="+clientName+"&dateFormat="+dateFormat+"&limit=14&locale=en&offset=0&transferType="+transferId;
				}else{
					url = "api.v1.standinginstructions?clientId="+clientId+"&clientName="+clientName+"&dateFormat="+dateFormat+"&limit=14&locale=en&offset=0";
				}
			}else{
				if(!isNaN(transferId)){
					url= "api.v1.standinginstructions?clientId="+clientId+"&clientName="+clientName+"&dateFormat="+dateFormat+"&fromAccountId="+fromAccountId+"&fromAccountType=2&limit=14&locale=en&offset=0&transferType="+transferId;
				}else{
					url= "api.v1.standinginstructions?clientId="+clientId+"&clientName="+clientName+"&dateFormat="+dateFormat+"&fromAccountId="+fromAccountId+"&fromAccountType=2&limit=14&locale=en&offset=0";
				}
			}
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : url
				},
				callback : "search"
			});
		}
		function search(param){
			var data = [];
			if(param.pageItems != null){
				for(var i=0;i<param.pageItems.length;i++){
					param.pageItems[i].validFrom = $.formatDate(param.pageItems[i].validFrom,'yyyy-MM-dd')+'至';
					param.pageItems[i].fromAccount.accountNo = param.pageItems[i].fromAccount.accountNo + '('+param.pageItems[i].fromAccountType.value+')';
					param.pageItems[i].toAccount.accountNo = param.pageItems[i].toAccount.accountNo + '('+param.pageItems[i].toAccountType.value+')';
					if(typeof param.pageItems[i].beneficiary == 'undefined'){
						param.pageItems[i].beneficiary = 'Own Account';
					}
					if(typeof param.pageItems[i].action == 'undefined'){
						if(param.pageItems[i].status.value != 'Deleted'){
							param.pageItems[i].action = '<a href="javascript:void(0)" onclick="javascript:Delete(this)" style="margin-top: 3px" class="btn btn-primary btn-offset">'
								+'<i class="glyphicon glyphicon-remove"></i>'
								+'</a>';
						}
					}
					data.push(param.pageItems[i]);
				}
				grid.addRows(data);
			}
		}
</script>