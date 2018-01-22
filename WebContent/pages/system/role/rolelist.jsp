<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #fff">
<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="label.role.title"/></a></li>
				</ul>
		</div>
		<div class="div-cc" >
			
			<a type='button' style='display:none;' class="btn btn-primary btn-default" href="<c:url value='/loadPage.do?nextPage=role.add_role'/>" >
				<span id='test'></span>
			</a>
			
			<table id="rolelist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='375' style='display: none;'>id</th>
						<th name='name' width='375' ><spring:message code="label.role.name"/></th>
						<th name='description' width='375'><spring:message code="label.role.description"/></th>
						<th name='disabled' width='375'><spring:message code="label.role.disabled"/></th>
					</tr>
				</thead>	
			</table>
		</div>	  
	</div>
	<script type="text/javascript">
		var grid1;
		var roleid;
		var role_name;
		
		$(document).ready(function() {
			init();	
			function EDIT(){
				roleid = grid1.colVal('id');
				$.openWindow("loadPage.do?nextPage=system.role.edit_role");
				//alert("修改角色");
				}
		
			grid1 = $('#rolelist').flexigrid({
				title : '<spring:message code="label.role.title"/>',
				pcpager : true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
							{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
							{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},
							{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDisable,bclass : 'disable', onpress: DISABLE},
							{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnEnable,bclass : 'enable', onpress: ENABLE},
		                    {name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnRolePermission,bclass : 'permission', onpress: PERMISSION}]
					});
			/* 初始化 */
			init();	
			
		});
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			/* 实现局部刷新 */
			init();
			//location.reload();
		});
		function init(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.roles"
				},
				callback : "callback"
			}); 
		}
		function ADD(){
			$.openWindow("loadPage.do?nextPage=system.role.add_role");
		}
		function PERMISSION(){
			roleid = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=system.role.role_permission");		 
		}
		function DISABLE(){
			roleid = grid1.colVal('id');
			role_name=grid1.colVal('name');
			$.openWindow("loadPage.do?nextPage=system.role.disable_role");
		}
		function ENABLE(){
			roleid = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=system.role.enable_role");
		}

		function DELETE(){
			var td_val = grid1.colVal('id');
			
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'DELETE',
						'mydata' : '',
						'url' : 'api.v1.roles.'+td_val
					},
					callback : 'deleteback'
				});
		}
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			grid1.addRows(param);	
			
		}
		function deleteback(param){
			//alert('deleteback:' + param);
			//location.reload(); 
			init();
		}	
	</script>
	
</body>
</html>