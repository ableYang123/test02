<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<form class="form-inline" id="addReportForm">
		<legend><spring:message code="report.add.title"/></legend>
		<table>
			<tr>
				<td width="10%">
					<label class="control-label col-sm-2"><h4><spring:message code="report.add.details"/></h4></label>
				</td>
				<td>
					<table>
						<tr>
							<td width="30%">
								<label class="control-label"><spring:message code="report.add.name"/><span style="font-size: 14px; color: #d9534f">*</span></label><br> 
								<div class="form-group">
									<input id="reportName" name="reportName" class="form-control"/>
								</div>
							</td>
							<td width="20%">
								<label class="control-label"><spring:message code="report.add.type"/><span style="font-size: 14px; color: #d9534f">*</span></label> 
								<div class="form-group">
									<select id="allowedReportTypes" class="form-control">
									</select>
								</div>
							</td>
							<td width="20%">
								<div class="form-group">
									<label class="control-label"><spring:message code="report.add.subtype"/></label> 
									<select id="allowedReportSubTypes" class="form-control">
										<option value='' selected><spring:message code="report.add.selectone"/></option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label class="control-label"><spring:message code="report.add.category"/></label><br>
									<input id="reportCategory" class="form-control"/>
								</div>
							</td>
							<td>
								<div class="checkbox pull-right"  style="padding-right: 10px">
								   <label><input type="checkbox" id="checkbox"></label>
								</div>
							</td>
							<td>
								<label class="control-label"><spring:message code="report.add.userreport"/>（UI）</label> 
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label"><spring:message code="report.add.description"/></label><br>
								<textarea id="description" class="form-control" rows="2"></textarea>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="height:200px" id="sqlTr">
				<td>
					<label class="control-label col-sm-2"><h4>Sql</h4></label>
				</td>
				<td>
					<label class="control-label">Sql<span style="font-size: 14px; color: #d9534f">*</span></label><br> 
					<div class="form-group">
						<textarea id="reportSql" style="width:500px;" name="reportSql" class="form-control" rows="3"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label col-sm-2"><h4><spring:message code="report.add.parameters"/></h4></label>
				</td>
				<td>
					<select id="allowedParameters" class="form-control">
						<option value='' selected><spring:message code="report.add.allowparameter"/></option>
					</select>
					<button id="addParameters" type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-plus"><spring:message code="report.add.add"/></span>
					</button><br>
					<table class="table" id="tableParameters" style="display:none;">
					  <thead>
					    <tr>
					      <th><spring:message code="report.add.parameter"/></th>
					      <th><spring:message code="report.add.parametername"/></th>
					      <th><spring:message code="report.add.actions"/></th>
					    </tr>
					  </thead>
					  <tbody id="tableParameters-body">
					  </tbody>
					</table> 
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="text-center">
						<button type="reset" class="btn btn-default"><spring:message code="report.add.cancel"/></button>
						<button type="button" class="btn btn-primary" id="saveBtn"><spring:message code="report.add.submit"/></button>
					</div>
				<td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			validForm();
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.reports.template"
				},
				callback : "setSelect"
			});		
		});
		
		
		function validForm(){
			$.valid("addReportForm", [ {
				"name" : "reportName",
				"notEmpty" : "不能为空"
			}, {
				"name" : "allowedReportTypes",
				"notEmpty" : "不能为空" 
			}, {
				"name" : "reportSql",
				"notEmpty" : "不能为空"
			} ]);
		}		
		
		function setSelect(param){
			$.setSelectByList('allowedReportTypes',param.allowedReportTypes);
			$.setSelectByList('allowedReportSubTypes',param.allowedReportSubTypes);
			$.setSelect('allowedParameters',param.allowedParameters,'id','parameterName');
		}
		
		
		$.getWidget("addParameters").click(function(){
			$("#tableParameters").css('display','');
			var allowedParameters =$("#allowedParameters").find("option:selected").text();
			if($.value("allowedParameters") != ''){
				$("#tableParameters-body")[0].innerHTML+='<tr><td name="'+$.value("allowedParameters")+'">'+allowedParameters+'</td><td><input name="'+allowedParameters+'" class="form-control"/></td><td><button type="button" class="btn btn-link"><span class="glyphicon glyphicon-remove"></span></button></td></tr>';
			}
		});
		
		$('#tableParameters-body').on('click','a',function(param){
			this.parentNode.parentNode.remove();	 		
		});
		
		$.getWidget("saveBtn").click(function(){
			var data = {}
			if($.value('reportName') != '')
				data.reportName=$.value('reportName');
			if($.value('allowedReportTypes')!='')
				data.reportType=$.value('allowedReportTypes');
			if($.value('allowedReportSubTypes') != '')
				data.reportSubType=$.value('allowedReportSubTypes');
			if($.value('reportCategory') != '')
				data.reportCategory=$.value('reportCategory');
			if($.value('description') != '')
				data.description=$.value('description');
			if($.value('reportSql') != '')
				data.reportSql=$.value('reportSql');
			if($("#tableParameters-body")[0].innerHTML != ''){
				data.reportParameters=[];
				var len = $("#tableParameters-body tr").length;
				for(var i=0; i<len; i++) {
					var json = {}
					json.parameterId=$("#tableParameters-body tr").eq(i).find("td:first").attr('name');
					json.id="";
					json.reportParameterName=$("#tableParameters-body tr").eq(i).find("input").val();
					data.reportParameters.push(json);
				}
			}
			if(data!=''){
				data.useReport=$('#checkbox')[0].checked;
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : data,
						"url" : "api.v1.reports"
					},
					callback : "saveSuccess"
				});	
			}
		});
		
		function saveSuccess(param){
			$.setReadOnly('addReportForm');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		$('#allowedReportTypes').change(function(){
			if($(this).val()=='Pentaho'){
				$("#sqlTr").css('display','none');
			}else{
				$("#sqlTr").css('display','');
			}
		});
		
	</script> 
