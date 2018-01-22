<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="label.datatable.title"/></a></li>
				</ul>
		</div>
		<div class="div-cc" >
			
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=system.datatable.add_datatable'/>" >
				<span id='test'></span>
			</a>
			
			<table id="datatablelist" style="display:none;">
				<thead>
					<tr>
						<th name='registeredTableName' width='500' search="true"><spring:message code="label.datatable.Datatablename"/></th>
						<th name='applicationTableName' width='500'><spring:message code="label.datatable.associatedwith"/></th>
					</tr>
				</thead> 	
			</table>
		</div>	  
	</div> 
	<script type="text/javascript">
	 var grid1;
	 var tablename;
	$(document).ready(function() {
	grid1 = $('#datatablelist').flexigrid({
		title : '<spring:message code="label.datatable.title"/>',
		pcpager : true,
		buttons :  [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},]
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
		var td_tablename=grid1.colVal('registeredTableName');
		
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'DELETE',
					'mydata' : '',
					'url' : 'api.v1.datatables.'+td_tablename
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
				"url" : "api.v1.datatables"
			},
			callback : "callback"
		}); 
	}
	function ADD(){

		$.openWindow("loadPage.do?nextPage=system.datatable.add_datatable");
	}
	
	function EDIT(){
		tablename=grid1.colVal('registeredTableName');
		$.openWindow("loadPage.do?nextPage=system.datatable.edit_datatable");
	}
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