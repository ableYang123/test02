<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
					<li>
						<i class="glyphicon glyphicon-hand-right"></i>&nbsp;
						<spring:message code="label.user.title"/>
					</li>
				</ul>
		</div>
		<div class="div-cc" >
			<table id="userlist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='firstname' search="true" width='210' ><spring:message code="label.user.firstName"/></th>
						<th name='lastname' search="true" width='210'><spring:message code="label.user.lastName"/></th>
						<th name='email' width='210'><spring:message code="label.user.email"/></th>
						<th name='officeName' width='210'><spring:message code="label.user.office"/></th>
					</tr>
				</thead>
				
			</table>
		</div>
		
	</div>
	
	<script type="text/javascript">
		var grid1;
		var userid;
		
		$(document).ready(function() {
			nestjson = {
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.users"
					},
					callback : "callback"
				};
			
			grid1 = $('#userlist').flexigrid({
				title : '<spring:message code="label.user.title"/>',
				pcpager:true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
			});

			/* 初始化 */
			
			init();		
			
			/* 模态框关闭事件 */
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				init();
				//location.reload();
			});
		});
		
		function init(){
			$.nest(nestjson); 
		}
		
		
		function ADD(){
			/* 加载创建用户模态框 */
			$('#myModal').modal('show');
			$.openWindow("loadPage.do?nextPage=user.add_user");
		}
		
		function EDIT(){
			userid = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=user.edit_user");
		}

		function DELETE(){
			var td_val = grid1.colVal('id');
			var td_first_val = grid1.colVal('firstname');
			var td_last_val = grid1.colVal('lastname');
			var com_td = td_first_val + td_last_val;
			if(com_td == 'AppAdministrator' || com_td == 'systemsystem' || com_td == 'zengdandan'){
				$.bAlert($.fn.bootstrapValidator.i18n.common.nopermission);
			}else{
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'DELETE',
						'mydata' : '',
						'url' : 'api.v1.users.'+td_val
					},
					callback : 'deleteback'
				});
			}
		}
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			grid1.addRows(param);	
		}
		 
		function deleteback(param){
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
			//location.reload(); 
			init();
		}		
		
	</script>









</body>
</html>
