<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background: color:#fff">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="label.report.clientsReport"/></a></li>
			</ul>
		</div>
		<div class="div-cc">
			<table id="reportsList" style="display: none;">
				<thead>
					<tr>
						<th name='report_id' width='210' style='display: none;'>id</th>
						<th name='report_name' width='300' search="true"><spring:message code="label.report.name"/></th>
						<th name='report_type' width='300' search="true"><spring:message code="label.report.type"/></th>
						<th name='report_category' width='300' search="true"><spring:message code="label.report.category"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var grid1;
		var reportId;
		var reportName;
		var signName;
		var reportType;
		
		$(document).ready(function() {
			grid1 = $('#reportsList').flexigrid(
									{
										title : '<spring:message code="label.report.clientsReport"/>',
										pcpager:true,
										buttons : 
												[{
													name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnQuery,
													bclass : 'query',
													onpress : QUERY
												},{
													name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,
													bclass : 'delete',
													onpress : DELETE
												}]
									});
			init();

			$('#myModal').on('hidden.bs.modal',function(event) {
				init();
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
					"url" : "api.v1.runreports.reportCategoryList?R_reportCategory=Client&genericResultSet=false&parameterType=true"//只获取useReport为true的数据
				},
				callback : "callback"
			});
		}

		function QUERY() {
			reportId = grid1.colVal('report_id');
			reportName = grid1.colVal('report_name');
			reportType = grid1.colVal('report_type');
			var queryName=reportName.replace(/ /g,"+");//替换所有空格为+
			
			signName="\'"+queryName+"\'";
			
			$.openWindow("loadPage.do?nextPage=report.runReport");
		}

		function DELETE() {
			reportId = grid1.colVal('report_id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.reports." + reportId
				},
				callback : "deleteback"
			});
		}

		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			var reportAll=[];
			var newParam=[];
			$.each(param,function(n,obj){//obj为json对象, 去除ID重复数据
				if($.inArray(obj.report_id,reportAll)==-1&&obj.report_subtype!="Triggered"){
					
					newParam.push(obj);
					reportAll.push(obj.report_id);
				}
			});
			//对返回的数组数据进行排序
			var compare = function (obj1, obj2) {
							    var val1 = obj1.report_name.toLowerCase();
							    var val2 = obj2.report_name.toLowerCase();
							    if (val1 < val2) {
							        return -1;
							    } else if (val1 > val2) {
							        return 1;
							    } else {
							        return 0;
							    }            
							}
			newParam.sort(compare);
			grid1.addRows(newParam);
		}

		function deleteback(param) {
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
			init();
		}
	</script>
</body>
</html>