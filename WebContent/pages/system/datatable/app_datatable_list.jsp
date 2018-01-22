<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
	<div>
		<fieldset>
			<legend>${pd.datatablename}</legend>
			<div class="form-group">
			    	 <label class="control-label col-sm-2 " for="datatableName">
  		            	<span style="color: #d9534f;"></span>
  		            </label>
  		        <div class="col-md-offset-3">
  		            </button><button id="add" type="button" class="btn btn-primary "><spring:message code="btn.add"/></button>&nbsp;&nbsp;<button id="delete" type="button" class="btn btn-primary "><spring:message code="btn.delete.all"/>
  		        </div>
  		   </div>
  		   <div id="datatablefrom" name="datatablefrom">
			<table id="datatablelist" style="display:none;">
				<thead>
					<tr id="tableth" name="tableth">
					</tr>
				</thead> 	
			</table>  		   
  		   </div>
		</fieldset>	
		  
	</div>
	<script type="text/javascript">
	var grid1;
	$(document).ready(function() {
		/* 初始化 */
		init();
		/* 模态框关闭事件 */
		$('#myModal').on('hidden.bs.modal', function (event) {
			/* 实现局部刷新 */
			init();
			//location.reload();
		});			
		$.getWidget("add").click(function() {
			window.location.href="<c:url value='loadPage.do?nextPage=system.datatable.app_datatable_add'/>&datatablename=${pd.datatablename}&notesid=${pd.notesid}&listadd=Y";
		});
		$.getWidget("delete").click(function() {
			var api = "api.v1.datatables.${pd.datatablename}.${pd.notesid}?genericResultSet=true";
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "delete",
						"mydata" : "",
						"url" : api,
						"contentType" : "application/json"
					},
					callback : "delete_success"
				});			
		});
	});

	function init(){
		var api = "api.v1.datatables.${pd.datatablename}.${pd.notesid}?genericResultSet=true";
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : api
			},
			callback : "callback"
		}); 
	}
	function callback(param) { 
		var columnHeaders = param.columnHeaders;
		var data = param.data;
		var newdataList = new Array();

		for(var i=0;i<columnHeaders.length;i++){
			var fieldjson = columnHeaders[i];
			var addfield = '<th name="'+fieldjson.columnName +'" width="150" >'+fieldjson.columnName+'</th>';
			if(fieldjson.columnType == "date"){
				addfield = '<th name="'+fieldjson.columnName +'" width="150" type="date" >'+fieldjson.columnName+'</th>';
			}
			$("#tableth").append(addfield);
		}
		
		for(var i=0;i<data.length;i++){
			var rowdata =  data[i].row;
			if(rowdata.length==columnHeaders.length){
				var newrowjson = {};
				for(var x=0;x<rowdata.length;x++){
					var fieldjson = columnHeaders[x];
					newrowjson[fieldjson.columnName] = rowdata[x];
				}
				newdataList.push(newrowjson);
			}
		}
			grid1 = $('#datatablelist').flexigrid({
				title : '数据表列表',
				buttons :  [
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}				
				]
			});
	
		/* 填充表格数据 */
		grid1.addRows(newdataList);	
	}
	
	function EDIT(){
		var selectedId = grid1.colVal('id');
		window.location.href="<c:url value='loadPage.do?nextPage=system.datatable.app_datatable_add'/>&datatablename=${pd.datatablename}&notesid=${pd.notesid}&selectedId="+selectedId;
	}
	
	function DELETE(){
		var selectedId = grid1.colVal('id');
		var api = "api.v1.datatables.${pd.datatablename}.${pd.notesid}."+selectedId+"?genericResultSet=true";
		 $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "delete",
					"mydata" : "",
					"url" : api,
					"contentType" : "application/json"
				},
				callback : "delete_success"
			});	
	}
	function delete_success(param){
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			window.location.href = "loadPage.do?nextPage=system.datatable.app_datatable_list&datatablename=${pd.datatablename}&notesid=${pd.notesid}";
	}
	</script>
</body>
</html>