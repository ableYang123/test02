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
					<spring:message code="menu.admin.cashierManagerment"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			<table id="tellerlist" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='179' style='display: none;'>id</th>
						<th name='officeName' width='215' >
							<spring:message code="label.teller.branch" />
						</th>
						<th name="name" width='215'>
							<spring:message code="label.teller.tellerName" />
						</th>
						<th name="status" width='215'>
							<spring:message code="label.teller.status" />
						</th>
						<th name="startDate" type="date" width='215'>
							<spring:message code="label.teller.startedOn" />
						</th>
						
					</tr>
				</thead>
				
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var grid;
		var tellerId;
		
		$(document).ready(function() {
			grid = $('#tellerlist').flexigrid({
				title : '<spring:message code="label.teller.title"  />',
				pcpager : true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass:'edit', onpress:EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnViewCashier,bclass : 'viewCashier', onpress:VIEWCASHIER}]
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
					"url" : "api.v1.tellers"
				},
				callback : "callback"
			}); 
		}
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.add_teller");
		}
		
		function EDIT(){
			tellerId = grid.colVal('id');
			console.log('view:' + tellerId);
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.edit_teller");
		}
		
		function VIEWCASHIER(){
			tellerId = grid.colVal('id');
			console.log('view:' + tellerId);
			$.openWindow("loadPage.do?nextPage=orgnization.cashier.cashierlist&tellerId="+tellerId,'iframe','80%','90%');
		}
		
		function DELETE(){
			var id = grid.colVal('id');
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.tellers." + id
				},
				callback : "deleteback"
			});
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			grid.addRows(param);
			$('#tellerlist tbody tr').each(function(){
				var td_node = $(this).children('td:eq(4)');
				var div_node = td_node.children('div:first');
				if(div_node.text().indexOf('NaN') > -1){
					div_node.text('');
				}
			});
		}
		
		function deleteback(param){
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
			init();
		}
		
	</script>

</body>
</html>
