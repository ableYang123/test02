<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<style type="text/css">
		h4 {
		    float: left;
    		margin: 0;
    		padding: 10px 10px;
    		font-size: 18px;
   		 	ont-weight: bold;
		}
		
		.toolbar {
				height: 40px;
   				border-bottom: 1px solid #e5e5e5;
		}
	</style>
</head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
			<ul class="breadcrumb">
				<li>
					<i class="glyphicon glyphicon-hand-right"></i>&nbsp;
					<spring:message code="menu.admin.fundMapping"/>
				</li>
			</ul>
		</div>
		<div class=" div-cc">
			<div class="toolbar">
				<h4><font><spring:message code="fund.search.title"/></font></h4>
				<div class="pull-right">
				<a name="back" type="button" class="btn btn-primary" style="display:none;" class="btn btn-primary">
					<i class="glyphicon glyphicon-arrow-left" style="color: #fff;"></i>
				</a>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="fund.search.loanStatus"/>
						</label>
						<div class="col-sm-4">
							<input id="allloans" type="checkbox" value='all' />
							&nbsp;<spring:message code="fund.search.all"/> 
							<br />
							<input id="activeloans" type="checkbox" value='active' />
							&nbsp;<spring:message code="fund.search.active"/> 
							<br />
							<input id="overpaidloans" type="checkbox" value='overpaid' />
							&nbsp;<spring:message code="fund.search.overpaid"/> 
						</div>
						<div class="col-sm-4">
							<input id="closedloans" type="checkbox" value='closed' />
							&nbsp;<spring:message code="fund.search.closed"/> 
							<br />
							<input id="writeoffloans" type="checkbox" value='writeoff' />
							&nbsp;<spring:message code="fund.search.writeoff"/> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="fund.search.product"/>
						</label>
						<div class="col-sm-3">
							<select id="loanProducts" class="form-control" multiple="multiple">
							</select>
						</div>
						<label class="col-sm-1 control-label">
							<spring:message code="fund.search.office"/>
						</label>
						<div class="col-sm-3">
							<select id="offices" class="form-control" multiple="multiple">
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="fund.search.selectDateType"/>
						</label>
						<div class="col-sm-3">
							<select id="loandatetype" class="form-control">
								<option value='' >--<spring:message code="fund.search.selectOne"/>--</option>
								<option value='approvalDate' selected><spring:message code="fund.search.approvalDate"/></option>
								<option value='createdDate'><spring:message code="fund.search.creationDate"/></option>
								<option value='disbursalDate'><spring:message code="fund.search.disbursementDate"/></option>
							</select>
						</div>
						<!-- <label class="col-sm-1 control-label"></label> -->
						<div class="col-sm-7">
							<div class="row">
								<div class="col-sm-4">
									<input type="text" datetype="date" name="fromDate" local-date="true" afterToday="false" beforeToday="false"/>
								</div>
								<label class="col-sm-2 control-label">--</label>
								<div class="col-sm-4">
									<input type="text" datetype="date" name="toDate"  local-date="true" afterToday="false" beforeToday="false"/>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-2">
							<label class="col-sm-10 control-label">							
								<spring:message code="fund.search.loanOutstandingPercentage"/>
							</label>
							<input id="percentage" type="checkbox" class="pull-right" checked/>
						</div>
						<div class="col-sm-3">
							<select id="percentagetype" class="form-control">
								<option value='between' selected><spring:message code="fund.search.between"/></option>
								<option value='<='>&lt;=</option>
								<option value='>='>&gt;=</option>
								<option value='<'>&lt;</option>
								<option value='>'>&gt;</option>
								<option value='='>=</option>
							</select>
						</div>
						
						<div class="col-sm-6">
							<span style="display: none;" class="col-sm-4">
								<input id="percentageVal" type="text" class="input-small form-control" />
							</span>
							<div class="row">
								<div class="col-sm-5">
									<input id="fromPercentage" type="text" class="input-small form-control" value='' placeholder="Min OutStanding Percentage"/>
								</div>
								<label class="col-sm-1 control-label">-</label>
								<div class="col-sm-5">
									<input id="toPercentage" type="text" class="input-small form-control" value='' placeholder="Max OutStanding Percentage"/>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label class="col-sm-10 control-label">							
								<spring:message code="fund.search.loanOutstandingAmount"/>
							</label>
							<input id="amount" type="checkbox" class="pull-right" checked/>
						</div>
						<div class="col-sm-3">
							<select id="loanAmount" class="form-control">
								<option value='between' selected><spring:message code="fund.search.between" /></option>
								<option value='<='>&lt;=</option>
								<option value='>='>&gt;=</option>
								<option value='<'>&lt;</option>
								<option value='>'>&gt;</option>
								<option value='='>=</option>
							</select>
						</div>
						
						<div class="col-sm-6">
							<span style="display: none;" class="col-sm-4">
								<input id="amountVal" type="text" class="input-small form-control"/>
							</span>
							<div class="row">
								<div class="col-sm-5">
									<input id="fromAmount" type="text" class="input-small form-control" value='' placeholder="Min OutStanding Amount"/>
								</div>
								<label class="col-sm-1 control-label">-</label>
								<div class="col-sm-5">
									<input id="toAmount" type="text" class="input-small form-control" value='' placeholder="Max OutStanding Amount"/>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-offset-5">
						<button id="save" class="btn btn-primary"><spring:message code="fund.search.summary"/></button>
					</div>
				</div>
				
				<div class="showResults" style="magin-top:50px; display:none;">
					<!-- <input type="text" class="form-controle" style="margin-top: 0;"/> -->
					<table id="resultlist">
						<thead>
							<tr>
								<th name="officeName" width="179"><spring:message code="fund.result.officeName"/></th>
								<th name="loanProductName" width="179"><spring:message code="fund.result.productName"/></th>
								<th name="count" width="179"><spring:message code="fund.result.count"/></th>
								<th name="loanOutStanding" width="179"><spring:message code="fund.result.outStanding"/></th>
								<th name="percentage" width="179"><spring:message code="fund.result.percentage"/></th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</div>
				<div class="showClientResults" style="display:none;">
					<input type="text" style="margin-top: 0;" class="form-control"/>
					<table id="clientResultlist">
						<thead>
							<tr class="graybg">
								<th name="clientName" width="135"><spring:message code="fund.result.client"/></th>
								<th name="loanProductName" width="135"><spring:message code="fund.result.product"/></th>
								<th name="disbursementDate" type="date" width="135"><spring:message code="fund.search.disbursementDate"/></th>
								<th name="disburseAmount" width="135"><spring:message code="fund.result.disbursementAmount"/></th>
								<th name="maturesOn" width="135"><spring:message code="fund.result.maturesOn"/></th>
								<th name="principalOutstanding" width="135"><spring:message code="fund.result.principalOutstanding"/></th>
								<th name="principalPaid" width="135"><spring:message code="fund.result.principalPaid"/></th>
								<th name="arrears" width="135"><spring:message code="fund.result.arrears"/></th>
								<th name="interestOutstanding" width="135"><spring:message code="fund.result.interestOutstanding"/></th>
								<th name="interestPaid" width="135"><spring:message code="fund.result.interestPaid"/></th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
	 	var grid1;
	 	var grid2;
	 	var request_json;
	 	
		$(document).ready(function(){
			/* 初始化日期 */
			$.datetimepicker();
			
			/* 页面加载初始化 */
			init();
			
			/* 初始化表格 */
			grid1 = $('#resultlist').flexigrid({
				title : '<spring:message code="label.fund.searchResult"/>'
			});
			
			$('a[name="back"]').click(function(){
				$('.form-horizontal').show();
				$('.showResults').hide();
				$(this).hide();
			});
			
			
			/* 复选框change事件 */
			$.getWidget('percentage').change(function(){
				var div_node = $(this).closest('div');
				div_node.next().toggle();
				div_node.next().next().toggle();
			});
			$.getWidget('amount').change(function(){
				var div_node = $(this).closest('div');
				div_node.next().toggle();
				div_node.next().next().toggle();
				
			});
			
			/* 下拉框change事件 */
			$.getWidget('loandatetype').change(function(){
				var node = $(this).closest('div').next();
				if($(this).val() == ''){
					node.hide();
				}else{
					node.show();
				}
			});
			$.getWidget('percentagetype').change(function(){
				var node = $(this).closest('div').next().children(':first');
				if($(this).val() == 'between'){
					node.hide();
					node.next().show();
				}else{
					node.show();
					node.next().hide();
				}
			});
			$.getWidget('loanAmount').change(function(){
				var node = $(this).closest('div').next().children(':first');
				if($(this).val() == 'between'){
					node.hide();
					node.next().show();
				}else{
					node.show();
					node.next().hide();
				}
			});
			
			
			/* 预览事件 */
			$.getWidget('save').click(function(){
				
				/* 必填项 */
				var entities = ['loans'];
				var locale = "en";
				var dateFormat = $('input[name="fromDate"]').attr('date-format');
				
				/* 构造json请求参数 */
				request_json = {
						"entities" : entities,
						"locale" : $.getLocale(),
						"dateFormat" : $.getDateFormat()
				};
				
				/* 可选项 */
				var loanStatus = [];
				if($('#allloans').is(':checked')){
					loanStatus.push($.value('allloans'));
				}
				if($('#activeloans').is(':checked')){
					loanStatus.push($.value('activeloans'));
				}
				if($('#overpaidloans').is(':checked')){
					loanStatus.push($.value('overpaidloans'));
				}
				if($('#closedloans').is(':checked')){
					loanStatus.push($.value('closedloans'));
				}
				if($('#writeoffloans').is(':checked')){
					loanStatus.push($.value('writeoffloans'));
				}
				
				if(loanStatus.length > 0){
					request_json['loanStatus'] = loanStatus;
				}
				
				/* 百分比被选择 */
				if($('#percentage').is(':checked')){
					request_json['includeOutStandingAmountPercentage'] = true;
					var percentageCondition = $.value('percentagetype');
					
					if(!$.isEmpty(percentageCondition)){
						request_json['outStandingAmountPercentageCondition'] = percentageCondition;
						
						if(percentageCondition != 'between'){
							var percentageVal = $.value('percentageVal');
							if($.isEmpty(percentageVal)){
								$.bAlert($.fn.bootstrapValidator.i18n.fundMapping.percentageNotBank);
								return false;
							}else{
								request_json['outStandingAmountPercentage'] = percentageVal;
							}
						}else{
							var fromPercentage = $.value('fromPercentage');
							if(!$.isEmpty(fromPercentage)){
								request_json['minOutStandingAmountPercentage'] = $.value('fromPercentage');
							}else{
								$.bAlert($.fn.bootstrapValidator.i18n.fundMapping.minPercentageNotBank);
								return false;
							}
							var toPercentage = $.value('toPercentage');
							if(!$.isEmpty(toPercentage)){
								request_json['maxOutStandingAmountPercentage'] = $.value('toPercentage');
							}else{
								$.bAlert($.fn.bootstrapValidator.i18n.fundMapping.maxPercentageNotBank);
								return false;
							}
						}
					}
				}
				
				if($('#amount').is(':checked')){
					request_json['includeOutstandingAmount'] = true;
					var amountCondition = $.value('loanAmount');
					if(!$.isEmpty(amountCondition)){
						request_json['outstandingAmountCondition'] = amountCondition;
						
						if(amountCondition != 'between'){
							var amountVal = $.value('amountVal');
							if($.isEmpty(amountVal)){
								$.bAlert($.fn.bootstrapValidator.i18n.fundMapping.amountNotBank);
								return false;
							}else{
								request_json['outstandingAmount'] = amountVal;
							}
						}else{
							var fromAmount = $.value('fromAmount');
							if(!$.isEmpty(fromAmount)){
								request_json['minOutstandingAmount'] = $.value('fromAmount');
							}else{
								$.bAlert($.fn.bootstrapValidator.i18n.fundMapping.minAmountNotBank);
								return false;
							}
							var toAmount = $.value('toAmount');
							if(!$.isEmpty(toAmount)){
								request_json['maxOutstandingAmount'] = $.value('toAmount');
							}else{
								$.bAlert($.fn.bootstrapValidator.i18n.fundMapping.maxAmountNotBank);
								return false;
							}
						}
					}
				}
				
				/* 选择日期类型 */
				var loanDateOption = $.value('loandatetype');
				if(!$.isEmpty(loanDateOption)){
					request_json['loanDateOption'] = loanDateOption;
					
					//var loanFromDate = $('input[name="fromDate"]').val();
					//var loanToDate = $('input[name="toDate"]').val();
					
					var loanFromDate = $.value('fromDate');
					var loanToDate = $.value('toDate');
					
					if(!$.isEmpty(loanFromDate) && !$.isEmpty(loanToDate)){
						if(loanToDate < loanFromDate){
							$.bAlert($.fn.bootstrapValidator.i18n.common.checkDate);
							return false;
						}
						request_json['loanFromDate'] = loanFromDate;
						request_json['loanToDate'] = loanToDate;
					}
				}
				
				/* 产品 */
				var loanProducts = [];
				$('#loanProducts option:selected').each(function(){
					loanProducts.push($(this).val());
				});
				if(loanProducts.length > 0){
					request_json['loanProducts'] = loanProducts;
				}
				
				/* 办公室 */
				var offices = [];
				$('#offices option:selected').each(function(){
					offices.push($(this).val());
				});
				if(offices.length > 0){
					request_json['offices'] = offices;
				}
			
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : request_json,
						"url" : "api.v1.search.advance",
						"contentType" : "application/json"
					},
					callback : "getSummary"
				});
			});
		});
		
		function init(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.search.template"
				},
				callback : "loadback"
			});
		}
		
		function loadback(param){
			$.setSelect('loanProducts',param.loanProducts,'id','name');
			$.setSelect('offices',param.offices,'id','name');
		}
		
		function getSummary(param){
			grid1.addRows(param);
			$('.form-horizontal').hide();
			$('.showResults').show();
			if( $('a[name="back"]').css('display') == 'none'){
				$('a[name="back"]').show();
			}
		}
		
		/* function VIEW(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : request_json,
					"url" : "api.v1.search.advance?clientInfo=true"
				},
				callback : "getClientInfo"
			});
		} */
		
		/* function getClientInfo(param){
			console.log(param);
			grid2.addRows(param);
			$('.form-horizontal').hide();
			$('.showResults').hide();
			
			
			$.each(param,function(){
				
			});
			
			$('.showClientResults').show();
		} */ 
	</script>
</body>
</html>
