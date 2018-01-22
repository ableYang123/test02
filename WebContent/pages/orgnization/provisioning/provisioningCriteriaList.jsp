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
					<spring:message code="menu.admin.loanProvisioningCriteria"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			<table id="criterialist" style="display:none;">
				<thead>
					<tr>
						<th name='criteriaId' width='210' style='display: none;'>id</th>
						<th name='criteriaName' search="true" width='210' ><spring:message code="criteria.list.name" /></th>
						<th name='createdBy' width='210'><spring:message code="criteria.list.createdBy" /></th>
					</tr>
				</thead>
				
			</table>
		</div>
		
		  
	</div>
	
	<script type="text/javascript">
		var grid;
		var criteriaId;
		
		$(document).ready(function() {
		
			grid = $('#criterialist').flexigrid({
				title : '<spring:message code="criteria.title.name"  />',
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
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
					"url" : "api.v1.provisioningcriteria"
				},
				callback : "callback"
			}); 
		}
		
		
		function ADD(){
			
			/* 加载创建办公室模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.provisioning.add_provisioningCriteria");
		}
		
		function EDIT(){
			
			criteriaId = grid.colVal('criteriaId');
			/* 加载创建办公室模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.provisioning.edit_provisioningCriteria");
		}
		
		function DELETE(){
			var criteriaId = grid.colVal('criteriaId');
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.provisioningcriteria." + criteriaId
				},
				callback : "deleteback"
			});
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			grid.addRows(param);	
		}
		function deleteback(param){
			init();
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
		}
		
		
		function load(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.provisioningcriteria.template"
				},
				callback : "getTemplate"
			});
		}
		
		function fillErrorTip(node,tips){
			var correctStr = '<small style="color: #d9534f;"></small>';
			node.next().empty();
			node.focus();
			$(correctStr).insertAfter(node);
			//node.after();
			node.next().append(tips);
		}
	</script>

</body>
</html>
