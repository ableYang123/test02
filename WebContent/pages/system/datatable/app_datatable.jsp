<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<form class="form-horizontal" id="adddatatableform" name="adddatatableform">
		<ul class="nav nav-tabs" id="myTab"></ul>
		<div class="tab-content" id="myTabContent"></div>
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.datatables?apptable="+apptable
				},
				callback : "callback"
			}); 	
	});
	
	function callback(param){
		if(param.length>0){
			for(var i=0;i<param.length;i++){
				var btnjson = param[i];
				var name = $.replaceTemplate(btnjson.registeredTableName," ","");
				var tableHeader = btnjson.columnHeaderData;
				var url = "loadPage.do?nextPage=system.datatable.app_datatable_add";
				if(tableHeader != undefined && tableHeader[0] != undefined && tableHeader[0].columnName=="id"){
					url = "loadPage.do?nextPage=system.datatable.app_datatable_list";
				}
				url += "&datatablename="+btnjson.registeredTableName+"&notesid="+notesid;
				$("#myTab").append("<li><a href='#"+name+"'>"+btnjson.registeredTableName+"</a></li> ");
				$("#myTabContent").append("<div class='tab-pane' id='"+name+"' action='"+url+"'><div class='iframe-div'><iframe id='"+name+"Frm' class='iframe-style' src='''></iframe></div></div> ");
			}
        $('#myTab a:first').tab('show');//初始化显示哪个tab 
        $($('#myTab a:first').attr("href")+"Frm").attr("src",$($('#myTab a:first').attr("href")).attr("action"));
        $('#myTab a').click(function (e) { 
          e.preventDefault();//阻止a链接的跳转行为 
          $(this).tab('show');//显示当前选中的链接及关联的content 
          $($(this).attr("href")+"Frm").attr("src",$($(this).attr("href")).attr("action"));
        }) 			
		}
	}
	</script>
