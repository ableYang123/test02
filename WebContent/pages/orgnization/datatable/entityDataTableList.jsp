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
					<spring:message code="menu.admin.entityDateTable"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			<div class="row" style="margin: 5px 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="datatablelist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='179' style='display: none;'>id</th>
						<th name='entity' width='179' search="true"><spring:message code="label.list.entity" /></th>
						<th name="productName" width='179'>
							<spring:message code="label.list.product" />
						</th>
						<th name='datatableName' width='179'>
							<spring:message code="label.list.datatable" />
						</th>
						<th name='status.value' width='179'>
							<spring:message code="label.list.status" />
						</th>
						<th name='systemDefined' width='179'>
							<spring:message code="label.list.systemDefined" />
						</th>
						<%-- <th name='action' width='179'>
							<spring:message code="label.list.Action" />
						</th> --%>
					</tr>
				</thead>
			</table>
		</div>
		
		  
	</div>
	
	<script type="text/javascript">
		var grid;
		
		$(document).ready(function() {
		
			nestjson = {
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.entityDatatableChecks",
						"paging" : "Y"
					},
					callback : "callback"
				};
			
			grid = $('#datatablelist').flexigrid({
				title : '<spring:message code="menu.admin.entityDateTable"  />',
				nestjson : nestjson,
				/*buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]*/
			});

			/* 初始化 */
			init();
			
			
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				init();
			});
		});
		
		function init(){
			$.nest(nestjson); 
		}

		$.getWidget("datatablelist").click(function(){
			DELETE();
		});
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=orgnization.datatable.add_entityDataTable");
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
					"url" : "api.v1.entityDatatableChecks." + id
				},
				callback : "deleteback"
			});
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			var valueItem = param.pageItems;
			$.each(param.pageItems,function(index,item){
				var entityName = item.entity.replace(/[m\_]/g,' ');
				 var value = entityName.toString()[0].toUpperCase() + entityName.toString().slice(1);;
				item.entity = value;
				
				if($.type(item.productName) === 'undefined' || $.type(item.productId) === 'undefined'){
					item.productName = '';
				}
			});
			grid.addRows(valueItem);	
		}
		function deleteback(param){
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
			init();
		}
		
	</script>

</body>
</html>
