<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form class="form-horizontal" id="runReportForm" name="runReportForm">
				<fieldset>
					<legend>
						<spring:message code="label.report.runReport" />
					</legend>
					<div class="form-group" id="tagMark">

						<label for="decimalsChoice" class="col-sm-3 control-label"> <spring:message code="Decimals Choice" />
						</label>
						<div class="col-sm-4">
							<select style="width: 180" class="form-control" id="decimalsChoice" name="decimalsChoice">
								<option></option>
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5">
							<button type='button' id="run" name="run" class="btn btn-primary">
								<spring:message code="label.report.runReport" />
							</button>
						</div>
					</div>
				</fieldset>
			</form>
			<button type='button' id="parameters" name="parameters" class="btn btn-primary" style="float: right;">
					<span class="glyphicon glyphicon-chevron-down"></span>
					<spring:message code="parameters" />
			</button>
		</div>
		<div class="col-md-12 column" id="dataArea">
			<iframe width="100%" height="600px" frameborder="0" id="dataIframe"></iframe>
		</div>
	</div>
</div>
<script type="text/javascript">
	var tagName;
	var labelName;

	var reportParam = {};
	var reportParam_pentaho = {};
	var outputType;
	var validJsonArr=[];
	
	$(document).ready(
					function() {
						
						$("#parameters").hide();
						$('#dataArea').hide();
						runInit();
						
						$.getWidget("run").click(
										function() {
											if ($.validateForm("runReportForm")) {
												
												var startDate=$.value("R_startDateSelect");
												var endDate=$.value("R_endDateSelect");
												
												if(typeof startDate!='undefined'&& typeof endDate!='undefined'){
													if(endDate < startDate){
														$.bAlert($.fn.bootstrapValidator.i18n.teller.checkDate);
														return false;
													}
												}

												var json = {};
												var paramJson = reportParam;
												if (reportType == 'Pentaho') {
													paramJson = reportParam_pentaho;
												}

												var t = $('form').serializeArray();//获取form所有数据
												$.each(t,function() {
															if (this.name == "output-type") {
																json[this.name] = this.value;
																outputType = this.value;
															}
															json[paramJson[this.name]] = this.value;
														});

												var dateFormat = $('input[name="R_startDate"]').attr('date-format');
												if (typeof (dateFormat) != 'undefined') {
													json['dateFormat'] = dateFormat;
													json['locale'] = 'zh';
												}

												var reUrl;
												for ( var key in json) {//拼接参数

													if (json[key] != '') {
														if (typeof (reUrl) != 'undefined') {
															reUrl = reUrl + "&"
																	+ key + "="
																	+ json[key];
														} else {
															reUrl = key + "="
																	+ json[key];
														}
													}

												}

												if (reportType == 'Pentaho') {
														var requestParam = "?docPath=api.v1.runreports."
																+ reportName
																+ "&" + reUrl;
														var url = "<c:url value='/document.do'/>";
														var xhr = new XMLHttpRequest();
														xhr.open('POST', url+ requestParam,true); 
														xhr.responseType = "blob"; 
														xhr.onload = function() {
															if (this.status === 200) {
																var blob = this.response;
																var reader = new FileReader();
																reader.readAsDataURL(blob); 
																reader.onload = function(e) {
																	if(outputType == "XLS"|| outputType == "XLSX"||outputType == "CSV"){
																		var a = document.createElement('a');
																		a.download = 'report.xls';
																		a.href = e.target.result;
																		$("body").append(a);
																		a.click();
																		$(a).remove();
																	}else{
																		$('#dataIframe').attr('src',e.target.result);
																		$('#dataArea').show();
																	}
																}
															}
														};
														xhr.send();
												} else {
													$.nest({
															url : "<c:url value='/fineract.do'/>",
															type : "post",
															async : true,
															data : {
	
																"dataType" : "GET",
																"mydata" : "",
																"url" : "api.v1.runreports."
																		+ reportName
																		+ "?"
																		+ reUrl
															},
															callback : "b_runReport"
														});
												}
												$("#parameters").show();
												$("#runReportForm").hide();
											}

										
										});
						$("#parameters").click(function(){
							$(this).hide();
							$("#runReportForm").show();
						});
						
					});
	/*init runReport.jsp*/
	function runInit() {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.runreports.FullParameterList?R_reportListing="
						+ signName + "&parameterType=true"
			},
			callback : "b_runInit"
		});
		/*resolve the pentaho type*/
		if (reportType == 'Pentaho') {

			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {

					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.reports." + reportId
							+ "?fields=reportParameters"
				},
				callback : "b_runInit_pentaho"
			});
		}
	}

	/*init success*/
	function b_runInit(param) {

		if (param.data.length > 0) {//read allowedParamters
			$.each(param.data, function(n, obj) {

				reportParam["R_" + obj.row[0]] = "R_" + obj.row[1];
				tagName = obj.row[0];
				labelName = obj.row[2];

				switch (obj.row[3]) {

				case 'select':

					var drawTag = drawSelectTag();
					if (obj.row[0] != 'loanOfficerIdSelectAll'
							&& obj.row[0] != 'loanProductIdSelectAll'
							&& obj.row[0] != 'tellerIdSelectOne'
							&& obj.row[0] != 'cashierIdSelectOne') {
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.runreports." + obj.row[0]
										+ "?parameterType=true"
							},
							callback : function(param) {//回调赋值select
								var rows = param.data;
								$.each(rows, function(n, subObj) {
									subObj['rowId'] = subObj.row[0];
									subObj['rowName'] = subObj.row[1];
								});
								$.setSelect("R_" + drawTag, rows, 'rowId','rowName');
							}
						});
					}
					break;
				case 'date':
					drawDateTag();
					break;
				case 'text':
					drawTextTag();
					break;
				}
			});

		}
		$('#R_loanOfficerId').parent().parent().hide();
		$('#R_loanProductId').parent().parent().hide();
		$('#R_tellerId').parent().parent().hide();
		$('#R_cashierId').parent().parent().hide();

		$('#R_currencyId').change(
						function() {

							var R_currencyId = $.value("R_currencyId");
							if ($('#R_loanProductId').length == 1) {
								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"dataType" : "GET",
												"mydata" : "",
												"url" : "api.v1.runreports.loanProductIdSelectAll?R_currencyId="
														+ R_currencyId
														+ "&parameterType=true"
											},
											callback : function(param) {
												var rows = param.data;
												$.each(rows,function(n,subObj) {
																	subObj['rowId'] = subObj.row[0];
																	subObj['rowName'] = subObj.row[1];
																});
												$.setSelect("R_loanProductId",rows, 'rowId','rowName');
												$('#R_loanProductId').parent().parent().show();
											}
										});
							}

						});
		$('#R_tellerId').change(
						function() {

							var R_tellerId = $.value("R_tellerId");
							if ($('#R_cashierId').length == 1) {
								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"dataType" : "GET",
												"mydata" : "",
												"url" : "api.v1.runreports.cashierIdSelectOne?R_tellerId="
														+ R_tellerId
														+ "&parameterType=true"
											},
											callback : function(param) {
												var rows = param.data;
												$.each(rows,function(n,subObj) {
																	subObj['rowId'] = subObj.row[0];
																	subObj['rowName'] = subObj.row[1];
																});
												$.setSelect("R_cashierId",rows, 'rowId','rowName');
												$('#R_cashierId').parent().parent().show();
											}
										});
							}

						});
		$('#R_officeId').change(
						function() {

							var R_officeId = $.value("R_officeId");

							if ($('#R_loanOfficerId').length == 1) {
								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"dataType" : "GET",
												"mydata" : "",
												"url" : "api.v1.runreports.loanOfficerIdSelectAll?R_officeId="
														+ R_officeId
														+ "&parameterType=true"
											},
											callback : function(param) {
												var rows = param.data;
												$.each(rows,function(n,subObj) {
																	subObj['rowId'] = subObj.row[0];
																	subObj['rowName'] = subObj.row[1];
																});
												$.setSelect("R_loanOfficerId",rows, 'rowId','rowName');
												$('#R_loanOfficerId').parent().parent().show();
											}
										});
							}
							if ($('#R_tellerId').length == 1) {
								$.nest({
											url : "<c:url value='/fineract.do'/>",
											type : "post",
											async : true,
											data : {
												"dataType" : "GET",
												"mydata" : "",
												"url" : "api.v1.runreports.tellerIdSelectOne?R_officeId="
														+ R_officeId
														+ "&parameterType=true"
											},
											callback : function(param) {
												var rows = param.data;
												$.each(rows,function(n,subObj) {
																	subObj['rowId'] = subObj.row[0];
																	subObj['rowName'] = subObj.row[1];
																});
												$.setSelect("R_tellerId", rows,'rowId', 'rowName');
												$('#R_tellerId').parent().parent().show();
											}
										});
							}

						});
		$.valid("runReportForm", validJsonArr);
		
	}
	function b_runInit_pentaho(param) {
		var pentahoParam = param.reportParameters;
		if (typeof pentahoParam != 'undefined') {
			$.each(pentahoParam, function() {
				reportParam_pentaho["R_" + this.parameterName] = "R_"+ this.reportParameterName;

			});
		}

		var arr = [];
		arr.push('<div class="form-group">');
		arr.push('<label for="output-type" class="col-sm-3 control-label">');
		arr.push('<spring:message code="label.report.format.outputType" />');
		arr.push('</label>');
		arr.push('<div class="col-sm-4">');
		arr.push('<select style="width: 180" class="form-control" id="outputType" name="output-type">');
		arr.push('<option value="HTML"><spring:message code="label.report.format.html"/></option>');
		arr.push('<option value="XLS"><spring:message code="label.report.format.excel"/></option>');
		arr.push('<option value="XLSX"><spring:message code="label.report.format.excel2007"/></option>');
		arr.push('<option value="CSV"><spring:message code="label.report.format.csv"/></option>');
		arr.push('<option value="PDF"><spring:message code="label.report.format.pdf"/></option>');
		arr.push('</select>');
		arr.push('</div>');
		arr.push('</div>');
		$("#tagMark").before(arr.join(''));
	}
	function b_runReport(param) {//columnHeaders columnName data row 
		var thead = param.columnHeaders;
		var tbody = param.data;

		if ($.type(thead) != 'undefined') {
			var arr = [];
			/*导出CSV按钮部分*/
			arr.push('<div class="row">');
			arr.push('<div class="col-md-12 column">');
			arr.push('<button id="csvBtn" type="button" class="btn btn-primary pull-right">');
			arr.push('<span class="glyphicon glyphicon-file"></span><spring:message code="audit.list.csv"/>');
			arr.push('</button>');
			arr.push('</div><br>');

			arr.push('<div style="width:880px; height:400px; overflow:scroll;">');
			arr.push('<table class="table table-bordered"  width="732px" id="csvTable" align="center">');
			arr.push('<thead>');//表头
			arr.push('<tr>');
			$.each(thead, function(n, obj) {
				arr.push('<th>');
				arr.push(obj.columnName);
				arr.push('</th>');
			});
			arr.push('</tr>');
			arr.push('</thead>');

			arr.push('<tbody>');//表体
			if (tbody.length != 0) {//数据转换处理
				var rowsData = [];
				$.each(tbody, function(n, obj) {
					rowsData.push(obj.row);
				});

				$.each(rowsData, function(n, obj) {
					arr.push('<tr>');
					for (var i = 0; i < obj.length; i++) {

						arr.push('<td>');
						arr.push(obj[i]);
						arr.push('</td>');

					}
					arr.push('</tr>');
				});
			}

			arr.push('</tbody>');
			arr.push('</table>');
			arr.push('</div>');
			arr.push('</div>');
			$('#dataArea').show();
			$("#dataArea").html(arr.join(''));
		}
		$.getWidget("csvBtn").click(function() {
			$.tableToExcel('csvTable');
		});
	}
	
	/*添加日期输入框*/
	function drawDateTag() {
		var arr = [];
		arr.push('<div class="form-group">');
		arr.push('<label for="R_'+tagName+'" class="col-sm-3 control-label">');
		arr.push('<spring:message code="'+labelName+'" />');
		arr.push('</label>');
		arr.push('<div class="col-sm-4">');
		arr.push('<input type="text" datetype="date" name="R_'+tagName+'" local-date="true" afterToday="true"/>');
		arr.push('</div>');
		arr.push('</div>');
		$("#tagMark").before(arr.join(''));
		$.datetimepicker();
		
		/* var validJson={
				"name" : "R_"+tagName,
				"notEmpty" : "not null"
			  };
		validJsonArr.push(validJson); */
	}
	/*添加文本输入框*/
	function drawTextTag() {
		var arr = [];
		arr.push('<div class="form-group">');
		arr.push('<label for="R_'+tagName+'" class="col-sm-3 control-label">');
		arr.push('<spring:message code="'+labelName+'" />');
		arr.push('</label>');
		arr.push('<div class="col-sm-4">');
		arr.push('<input type="text"  name="R_'+tagName+'"  />');
		arr.push('</div>');
		arr.push('</div>');
		$("#tagMark").before(arr.join(''));
		
		var validJson={
				"name" : "R_"+tagName,
				"notEmpty" : "not null"
			  };
		validJsonArr.push(validJson);

	}

	/*添加选择框*/
	function drawSelectTag() {
		var arr = [];
		arr.push('<div class="form-group">');
		arr.push('<label for="R_'+tagName+'" class="col-sm-3 control-label">');
		arr.push('<spring:message code="'+labelName+'" />');
		arr.push('</label>');
		arr.push('<div class="col-sm-4">');
		arr.push('<select style="width: 180" class="form-control" id="R_'+tagName+'" name="R_'+tagName+'">');
		arr.push('<option></option>');
		arr.push('</select>');
		arr.push('</div>');
		arr.push('</div>');
		$("#tagMark").before(arr.join(''));
		
		var validJson={
						"name" : "R_"+tagName,
						"notEmpty" : "not null"
					  };
		validJsonArr.push(validJson);
		return tagName;
	}
</script>
