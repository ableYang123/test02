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
					<spring:message code="menu.admin.manageEmployees"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			<div class="row" style="margin: 5px 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="stafflist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='displayName' search="true" width='210' ><spring:message code="label.staff.staffName"/></th>
						<th name='isLoanOfficer' width='210'><spring:message code="label.staff.isLoanOfficer"/></th>
						<th name='officeName' width='210'><spring:message code="label.office.officeName"/></th>
						<th name='isActive' width='210'><spring:message code="label.staff.isActive"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var grid1;
		var staffId;
		
		
		$(document).ready(function() {
		
			grid1 = $('#stafflist').flexigrid({
				title : '<spring:message code="label.staff.title"/>',
				pcpager:true,
				/*buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT}]*/
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
					"url" : "api.v1.staff?status=all"
				},
				callback : "callback"
			}); 
		}
		
		
		function ADD(){
			
			/* 加载创建办公室模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.staff.add_staff");
		}

		$.getWidget("stafflist").click(function(){
			EDIT();
		});

		function EDIT(){
			
			staffId = grid1.colVal('id');
			/* 加载创建办公室模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.staff.edit_staff");
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			/* 填充表格数据 */
			grid1.addRows(param);	
		}
		 
		
	</script>

</body>
</html>
