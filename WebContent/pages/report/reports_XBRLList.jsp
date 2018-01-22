<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background: color:#fff">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="tabbable" id="tabs-615144">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#portfolio_data" data-toggle="tab"><spring:message code="label.report.portfolio" /></a></li>
						<li><a href="#balance_data" data-toggle="tab"><spring:message code="label.report.balanceSheet" /></a></li>
						<li><a href="#incomes_data" data-toggle="tab"><spring:message code="label.report.incomes" /></a></li>
						<li><a href="#expenses_data" data-toggle="tab"><spring:message code="label.report.expenses" /></a></li>
					</ul>
					<div class="tab-content" id="allData">
						<div class="tab-pane active" id="portfolio_data"></div>
						<div class="tab-pane" id="balance_data"></div>
						<div class="tab-pane" id="incomes_data"></div>
						<div class="tab-pane" id="expenses_data"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-11 column">
				<button type="button" class="btn btn-primary" id="save" name="save" style="float: right;"><spring:message code="label.report.submit"/></button>
			</div>
		</div>
		<br/>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form class="form-horizontal" role="form">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-1 control-label " for="startDate"> <spring:message code="label.report.startDate" />
							</label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control" datetype="date" name="startDate" local-date="true" afterToday="true" />
							</div>
							<label class="col-sm-1 control-label" for="endDate"> <spring:message code="label.report.endDate" />
							</label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control" datetype="date" name="endDate" local-date="true" afterToday="true" />
							</div>
							<div class="col-sm-2 ">
								<button type="button" class="btn btn-primary" id="run" name="run">
									<spring:message code="label.report.runReport" />
								</button>
							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>	
		
	</div>

	<script type="text/javascript">
		var startDate;
		var endDate;
		$(document).ready(function() {
			init();

			$('#myModal').on('hidden.bs.modal', function(event) {
				window.location.reload();
			});
			$.getWidget("save").click(function() {

				var configJson = {};
				$('#allData').find('tr').each(function() {
					var trId = $(this).attr('id').substr(3);
					var value = $(this).find('input').val();
					if (value != '') {
						configJson[trId] = value;
					}

				});

				configStr = JSON.stringify(configJson);
				var json = {
					identifier : "default",
					config : configStr
				}

				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "PUT",
						"mydata" : json,
						"url" : "api.v1.mixmapping"
					},
					callback : function() {
						$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
						init();
					}
				});
			});
			$.getWidget("run").click(function() {

				startDate = $('input[name="startDate"]').val();
				endDate = $('input[name="endDate"]').val();

				if (endDate < startDate) {
					$.bAlert($.fn.bootstrapValidator.i18n.teller.checkDate);
					return false;
				}
				$.openWindow("loadPage.do?nextPage=report.xbrlreport");

			});
		});

		function init() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.mixtaxonomy"
				},
				callback : "mixtaxonomy_back"
			});
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.glaccounts"
				},
				callback : "glaccounts_back"
			});

		} 

		/* 成功获取数据后 的回调方法*/
		function mixtaxonomy_back(param) {//name dimension

			if (param == null) {
				return;
			}
			var portfolio_arr = [];
			var balance_arr = [];
			var incomes_arr = [];
			var expenses_arr = [];

			portfolio_arr.push('<table class="table table-striped">');
			portfolio_arr.push('<tbody>');
			balance_arr.push('<table class="table table-striped">');
			balance_arr.push('<tbody>');
			incomes_arr.push('<table class="table table-striped">');
			incomes_arr.push('<tbody>');
			expenses_arr.push('<table class="table table-striped">');
			expenses_arr.push('<tbody>');

			$.each(param, function(n, obj) {
				switch (obj.type) {
				case 0:
					portfolio_arr.push('<tr id=tr_'+obj.id+'>');
					portfolio_arr.push('<td>');
					portfolio_arr.push(obj.name);
					portfolio_arr.push('</td>');
					portfolio_arr.push('<td>');
					if ($.type(obj.dimension) != 'undefined') {
						portfolio_arr.push(obj.dimension);
					}
					portfolio_arr.push('</td>');
					portfolio_arr.push('<td>');
					portfolio_arr.push('<input type="text" />');
					portfolio_arr.push('</td>');
					portfolio_arr.push('</tr>');
					break;
				case 1:
					balance_arr.push('<tr id=tr_'+obj.id+'>');
					balance_arr.push('<td>');
					balance_arr.push(obj.name);
					balance_arr.push('</td>');
					balance_arr.push('<td>');
					if ($.type(obj.dimension) != 'undefined') {
						balance_arr.push(obj.dimension);
					}
					balance_arr.push('</td>');
					balance_arr.push('<td>');
					balance_arr.push('<input type="text" />');
					balance_arr.push('</td>');
					balance_arr.push('</tr>');
					break;
				case 2:
					incomes_arr.push('<tr id=tr_'+obj.id+'>');
					incomes_arr.push('<td>');
					incomes_arr.push(obj.name);
					incomes_arr.push('</td>');
					incomes_arr.push('<td>');
					if ($.type(obj.dimension) != 'undefined') {
						incomes_arr.push(obj.dimension);
					}
					incomes_arr.push('</td>');
					incomes_arr.push('<td>');
					incomes_arr.push('<input type="text" />');
					incomes_arr.push('</td>');
					incomes_arr.push('</tr>');
					break;
				case 3:
					expenses_arr.push('<tr id=tr_'+obj.id+'>');
					expenses_arr.push('<td>');
					expenses_arr.push(obj.name);
					expenses_arr.push('</td>');
					expenses_arr.push('<td>');
					if ($.type(obj.dimension) != 'undefined') {
						expenses_arr.push(obj.dimension);
					}
					expenses_arr.push('</td>');
					expenses_arr.push('<td>');
					expenses_arr.push('<input type="text" />');
					expenses_arr.push('</td>');
					expenses_arr.push('</tr>');
					break;
				}
			});

			portfolio_arr.push('<table class="table table-striped">');
			portfolio_arr.push('<tbody>');
			balance_arr.push('<table class="table table-striped">');
			balance_arr.push('<tbody>');
			incomes_arr.push('<table class="table table-striped">');
			incomes_arr.push('<tbody>');
			expenses_arr.push('<table class="table table-striped">');
			expenses_arr.push('<tbody>');

			$("#portfolio_data").append(portfolio_arr.join(''));
			$("#balance_data").append(balance_arr.join(''));
			$("#incomes_data").append(incomes_arr.join(''));
			$("#expenses_data").append(expenses_arr.join(''));

			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.mixmapping"
				},
				callback : "mixmapping_back"
			});
		}

		function mixmapping_back(param) {// { identifier: "default" }config	{"1":"123456"}

			if ($.type(param.config) != 'undefined') {
				json = JSON.parse(param.config);
				for ( var key in json) {
					$('#tr_' + key).find('input').val(json[key]);
				}
			}
		}

		function glaccounts_back(param) {
			return;
		}
	</script>
</body>
</html>