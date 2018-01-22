<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/pages/common/header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<form class="form-horizontal" id="adddatatableform" name="adddatatableform">
				<fieldset>
					<legend>${pd.datatablename}</legend>
					<div id="datatablefrom" name="datatablefrom">
    		        </div>
 				<div class="form-group">
 				    	 <label class="control-label col-sm-2 " for="datatableName">
    		            	<span style="color: #d9534f;"></span>
    		            </label>
    		        <div class="col-md-offset-3">
    		            <button id="save" type="button" class="btn btn-primary "><spring:message code="btn.submit"/></button>&nbsp;&nbsp;<button id="delete" type="button" class="btn btn-primary "><spring:message code="btn.delete"/></button><button id="add" type="button" class="btn btn-primary "><spring:message code="btn.add"/></button>
    		        </div>
    		   </div>
				</fieldset>
	</form>
	<script type="text/javascript">
	var x = 1;
		$.hide("datatablefrom","save","add","delete");
		var api = "api.v1.datatables.${pd.datatablename}.${pd.notesid}";
		if(!$.isEmpty("${pd.selectedId}")){
			api += ".${pd.selectedId}";
			x=2;
		}
		api += "?genericResultSet=true";
		var validfield = new Array();
		var columnHeaders;
		var data = [];
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
		function callback(param){
			columnHeaders = param.columnHeaders;
			data = param.data;
			if(!$.isEmpty("${pd.listadd}")){
				data = [];
				x=2;
			}
			var rowdata = [];
			var assignjson = {};
			if(data.length>0){
			 	rowdata = data[0].row;
			}
			for(var i=x;i<columnHeaders.length;i++){
				var fieldjson = columnHeaders[i];
				var validjson = {};
					var addfield = '<div class="form-group">'+
								'<label class="control-label col-sm-2 " for="datatableName">'+fieldjson.columnName;
							if(!fieldjson.isColumnNullable){
								addfield += '<span style="color: #d9534f;">&nbsp;*</span>';
								$.extend(true,validjson,{"name" : fieldjson.columnName.replace(" ", "nbsp;"),"notEmpty" : ""});
							}
							addfield +=	'</label>'+
								'<div class="col-sm-3">';
							if(fieldjson.columnDisplayType!="CODELOOKUP"){	
								addfield +=	'<input id="'+fieldjson.columnName+'" type="text" name="'+fieldjson.columnName+'" class="form-control" value=""';
								if(fieldjson.columnDisplayType=="DATE"){
									addfield +=	' datetype="date"';
								}
							}else{
								addfield +=	'<select id="'+fieldjson.columnName+'" name="'+fieldjson.columnName+'" class="form-control" style="width: 198">'+
								'<option value="" selected="selected">'+
								'<spring:message code="fund.search.selectOne"/>'+
								'</option>'+
								'</select';
							}	
							addfield +='></div>'+
								'</div>';
				$("#datatablefrom").append(addfield);
				if(rowdata.length>0){
					if(fieldjson.columnDisplayType=="DATE"){
						assignjson[fieldjson.columnName] = $.formatDate(rowdata[i]);
					}else{
						assignjson[fieldjson.columnName] = rowdata[i];
					}
				}
				$.setSelect(fieldjson.columnName, fieldjson.columnValues, "id", "value");
				if(fieldjson.columnLength>0){
					$.extend(true,validjson,{"name":fieldjson.columnName,"lengthMax":fieldjson.columnLength});
				}
				if(validjson.name != undefined){
					validfield.push(validjson);
				}
			}
			$.datetimepicker();
			$.valid("adddatatableform",validfield);	
			$.assign(assignjson);
			if(data.length>0){
				$.show("datatablefrom","save");
				if($.isEmpty("${pd.selectedId}")){
					$.show("delete");
				}
			}else if(!$.isEmpty("${pd.listadd}")){
				$.show("datatablefrom","save");
				$.hide("add");	
			}else{
				$.show("add");
			}
		}		
		$(document).ready(function() {
			
			$.getWidget("save").click(function() {

				if ($.validateForm("adddatatableform")) {
					var mydata={};
					for(var i=x;i<columnHeaders.length;i++){
						var fieldjson = columnHeaders[i];
						mydata[fieldjson.columnName] = $.value(fieldjson.columnName);
						/* 设置日期格式 */
						var dateFormat = $('input[name="'+fieldjson.columnName+'"]').attr('date-format');
						if(!$.isEmpty(dateFormat)){
							mydata["dateFormat"] = dateFormat;
						}
						/* 设置语言 */
						mydata["locale"] = "en";
					}				
					
						var datatype = "post";
						if(data.length>0){
							datatype = "put";
						}
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : datatype,
								"mydata" : mydata,
								"url" : api,
								"contentType" : "application/json"
							},
							callback : "add_success"
						});
											
				}
			});		
			
			$.getWidget("add").click(function() {
				$.show("datatablefrom","save");
				$.hide("add");
			});
			$.getWidget("delete").click(function() {
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
		
		
			function add_success(param){
				$.setReadOnly('adddatatableform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}	
		
			function delete_success(param){
				$.setReadOnly('adddatatableform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				if($.isEmpty(typeof(eval("document.all.oalert_msgDiv")))){
					window.location.href="<c:url value='loadPage.do?nextPage=system.datatable.app_datatable_add'/>&datatablename=${pd.datatablename}&notesid=${pd.notesid}";
				}
			}				
				
	</script>
</body>
</html>