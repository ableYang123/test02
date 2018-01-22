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
					<spring:message code="menu.admin.system.surveys"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			<div class="row" style="margin: 5px 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="surveylist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='198' style='display: none;'>id</th>
						<th name='key' width='198' ><spring:message code="label.surveys.key"/></th>
						<th name='name' width='198'><spring:message code="label.surveys.name"/></th>
						<th name='description' width='198'><spring:message code="label.surveys.description"/></th>
						<th name="countryCode" width="198"><spring:message code="label.surveys.countryCode"/></th>
						<th name='active' width='198'><spring:message code="lable.status"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var grid;
		var staffId;
		
		$(document).ready(function() {
			grid = $('#surveylist').flexigrid({
				title : '<spring:message code="label.surveys.title"/>',
				/*buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD}]*/
			});
			
			/* 初始化 */
			init();
			
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				init();
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
					"url" : "api.v1.surveys"
				},
				callback : "callback"
			}); 
		}
		
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=system.surveys.add_survey");
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			/* 填充表格数据 */
			grid.addRows(param);	
		}
	</script>

</body>
</html>
