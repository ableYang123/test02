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
					<spring:message code="menu.admin.system.codes"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=system.code.add_code'/>" >
				<span id='test'></span>
			</a>
			
			<table id="codelist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='500' style='display: none;'>id</th>
						<th name='name' width='500' search="true"><spring:message code="label.code.codeName"/></th>
						<th name='systemDefined' width='500'><spring:message code="label.code.systemDefined"/></th>
					</tr>
				</thead>		
			</table>
		</div>
		
		  
	</div>
	<script type="text/javascript">
		var grid1;
		var codeId;
		
		
		$(document).ready(function() {
		
			grid1 = $('#codelist').flexigrid({
				title : '<spring:message code="label.code.title"/>',
				pcpager : true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAddCodeValue,bclass : 'addcodevalue', onpress: ADDCODEVALUE},]
			});
			/* 初始化 */
			init();
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				init();
			});
		});
		//删除
		function DELETE(){
			var codeId = grid1.colVal('id');
			
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'DELETE',
						'mydata' : '',
						'url' : 'api.v1.codes.'+codeId
					},
					callback : 'deleteback'
				});
		}
		function init(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.codes"
				},
				callback : "callback"
			}); 
		}
		function ADD(){
			
			$.openWindow("loadPage.do?nextPage=system.code.add_code");
		}
		
		function EDIT(){
			
			codeId = grid1.colVal('id');

			$.openWindow("loadPage.do?nextPage=system.code.edit_code");
		}
		function ADDCODEVALUE(){
			
			codeId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=system.code.add_codevalue");
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			/* 填充表格数据 */
			grid1.addRows(param);	
		}
		function deleteback(param){
			init();
		}	
		
	</script>
</body>
</html>