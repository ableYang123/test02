<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body style="background-color: #fff">
     <div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><spring:message code="label.hook.title"/></a></li>
				</ul>
		</div>
		<div class="div-cc" >	
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=system.hooks.add_hook'/>" >
				<span id='test'></span>
			</a>
			
			<table id="hooklist" style="display:none;">
				<thead>
					<tr>
					    <th name='id' width='375' style='display: none;'>id</th>
						<th name='name' width='375' search="true"><spring:message code="label.hook.name"/></th>
						<th name='displayName' width='375'><spring:message code="label.hook.hookName"/></th>
						<th name='isActive' width='375'><spring:message code="label.hook.isActive"/></th>
					</tr>
				</thead> 	
			</table>
		</div>	  
     </div>



    <script type="text/javascript">
    var grid1;
    var listData;
    $(document).ready(function() {
		
		grid1 = $('#hooklist').flexigrid({
			title : '<spring:message code="label.hook.title"/>',
			pcpager : true,
			buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
				{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
				{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},]
		});
		/* 初始化 */
		init2();
		$('#myModal').on('hidden.bs.modal', function (event) {
			/* 实现局部刷新 */
			init2();
		});
	});
	//删除
	function DELETE(){
		var hookId = grid1.colVal('id');
		
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'DELETE',
					'mydata' : '',
					'url' : 'api.v1.hooks.'+hookId
				},
				callback : 'deleteback'
			});
	}
	function init2(){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.hooks"
			},
			callback : "callback"
		}); 
	}
	function ADD(){
		
		$.openWindow("loadPage.do?nextPage=system.hooks.add_hook");
	}
	
	function EDIT(){
		
		codeId = grid1.colVal('id');

		$.openWindow("loadPage.do?nextPage=system.hooks.edit_hook");
	}
	/* 成功获取数据后 的回调方法*/
	function callback(param) { 
		listData = param;
		/* 填充表格数据 */
		grid1.addRows(param);	
	}
	function deleteback(param){
		init2();
	}	

	</script>
</body>
</html>