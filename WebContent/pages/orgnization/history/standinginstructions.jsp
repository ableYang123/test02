<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
			<ul class="breadcrumb">
				<li>
					<i class="glyphicon glyphicon-hand-right"></i>&nbsp;
					<spring:message code="menu.admin.standingInstruction"/>
				</li>
			</ul>
		</div>
		<div class="div-cc">
		<div class="form-inline">
			<div class="form-group">
				<input id="clientName" class="form-control" width="155px" type="text" value="" placeholder="<spring:message code='label.history.clientName'/>"/>
			</div>
			<div class="form-group">
				<input id="clientId" class="form-control" width="155px" type="text" value="" placeholder="<spring:message code='label.history.clientId'/>"/>
			</div>
			<div class="form-group">
				<select id="transferType" class="form-control">
					<option selected><spring:message code="label.history.transferType"/></option>
				</select>
			</div>
			<div class="form-group">
				<select id="fromAccountType" class="form-control">
					<option value='' selected><spring:message code="label.history.accountType"/></option>
				</select>
			</div>
			<div class="form-group" >
				<input id="fromAccountId" style="display: none;" class="form-control" width="155px" type="text" value="" placeholder="<spring:message code="label.history.fromAccountId"/>"/>
			</div>
			<div class="form-group">
				<input type="text" datetype="date" name="fromDate" local-date="" afterToday="false" beforeToday="false" placeholder="<spring:message code="label.history.fromDate"/>"/>
			</div>
			<div class="form-group">
				<input type="text" datetype="date" name="toDate"  local-date="" afterToday="false" beforeToday="false" placeholder="<spring:message code="label.history.toDate"/>"/>
			</div>
			<div class="form-group clear">
				<a type="button" id="btn" class="btn btn-primary control">
				<i class="glyphicon glyphicon-search"></i>
				<spring:message code="btn.search"/>
				</a>
			</div>
		</div>
		
		<div id="standing" style="margin-top: 50px; display: none;">
			<table id="s_history" >
				<thead>
					<tr class="grabg">
						<th name="fromClient.displayName"><spring:message code="label.history.fromClient" /></th>
						<th name="fromClient.id"><spring:message code="label.history.fromClientId" /></th>
						<th name="fromAccount.productName"><spring:message code="label.history.fromAccount" /></th>
						<th name="fromAccount.id"><spring:message code="label.history.fromAccountId" /></th>
						<th name="toClient.displayName"><spring:message code="label.history.toClient" /></th>
						<th name="toClient.id"><spring:message code="label.history.toClientId" /></th>
						<th name="toAccount.productName"><spring:message code="label.history.toAccountProduct" /></th>
						<th name="toAccount.id"><spring:message code="label.history.toAccountId" /></th>
						<th name="executionTime"><spring:message code="label.history.executionTime" /></th>
						<th name="amount"><spring:message code="label.history.amount" /></th>
						<th name="status"><spring:message code="label.history.status" /></th>
						<th name="errorLog"><spring:message code="label.history.errorLog" /></th>
					</tr>
				</thead>
			</table>
		</div>
		</div>
	</div>
	<script type="text/javascript">
		var grid;
		$(document).ready(function(){
			
			/*页面加载初始化*/
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.standinginstructions.template"
				},
				callback : "callback"
			});
			
			
			
			$.getWidget('fromAccountType').change(function(){
				var fat = $.value('fromAccountType');
				
				if(!isNaN(parseInt(fat))){
					$('#fromAccountId').show();
				}else{
					$('#fromAccountId').hide();
					$('#fromAccountId').val('');
				}
			});
			
			
			$.datetimepicker();
			
			/* 点击搜索事件 */
			$.getWidget('btn').click(function(){
				var clientName = $.trim($.value('clientName'));
				var clientId = $.trim($.value('clientId'));
				var transferType = $.trim($.value('transferType'));
				var accountType = $.value('fromAccountType');
				var accountId = $.value('fromAccountId');
				//var fromDate = $('input[name="fromDate"]').val();
				//var toDate = $('input[name="toDate"]').val();
				
				var fromDate = $.value('fromDate');
				var toDate = $.value('toDate');
				
				var dateFormat = 'yyyy/MM/dd';
				if(isContains(dateFormat,'/')){
					dateFormat = encodeURIComponent(dateFormat);
				
					if(!$.isEmpty(fromDate)){
						fromDate = $.formatDate(fromDate,'yyyy/MM/dd');
						fromDate = encodeURIComponent(fromDate);
					}
					if(!$.isEmpty(toDate)){
						toDate = $.formatDate(toDate,'yyyy/MM/dd');
						toDate = encodeURIComponent(toDate);
					}
				}
			
				var parameter = 'clientId=' + clientId + "&clientName=" + clientName + "&dateFormat=" + dateFormat 
					+ "&fromAccountId=" + accountId + "&fromAccountType=" + accountType + "&fromDate=" + fromDate 
					+ "&locale=" + $.getLocale() + "&toDate=" + toDate + "&transferType=" + transferType;
				
				if($.isEmpty(clientId)){ 
					parameter = parameter.replace("clientId=" + clientId + "&",'');
				}
				if($.isEmpty(clientName)){
					parameter = parameter.replace("clientName=" + clientName + "&",'');
				}
				if($.isEmpty(accountId)){
					parameter = parameter.replace("fromAccountId=" + accountId + "&",'');
				}
				if($.isEmpty(accountType)){
					parameter = parameter.replace('fromAccountType=' + accountType + "&",'');
				}
				if($.isEmpty(fromDate)){
					parameter = parameter.replace('fromDate=' + fromDate + "&",'');
				}
				if($.isEmpty(toDate)){
					parameter = parameter.replace('toDate=' + toDate + "&",'');
				}
				if($.isEmpty(transferType)){
					parameter = parameter.replace("&transferType=" + transferType,'');
				}
				nestjson = {
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : '',
							"url" : "api.v1.standinginstructionrunhistory?" + parameter,
							"paging" : "Y"
						},
						callback : "fillTable"
					};
				grid = $('#s_history').flexigrid({
					title : '<spring:message code="menu.admin.standingInstruction"/>'
				});
				$.nest(nestjson);
			});
			
		});
		
		function callback(param){
			$.setSelect('fromAccountType',param.fromAccountTypeOptions,'id','value');
			$.setSelect('transferType',param.transferTypeOptions,'id','value');
			
			
		}
		
		function isContains(str, substr) {
		    return str.indexOf(substr) >= 0;
		}
		
		function fillTable(param){
			console.log(param);
			grid.addRows(param.pageItems);
			$('#standing').show();
		}
	</script>
</body>
</html>
