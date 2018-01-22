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
						<i class="glyphicon glyphicon-hand-right"></i>
						&nbsp;<spring:message code="menu.admin.manageOffices"/>
					</li>
				</ul>
		</div>
		<div class="div-cc" >
			<table id="officelist" style="display:none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' width='210' search="true"><spring:message code="label.office.officeName"/></th>
						<th name='externalId' search="true" width='210'><spring:message code="label.office.externalId"/></th>
						<th name='parentName' width='210'><spring:message code="label.office.parentOffice"/></th>
						<th name='openingDate' type="date" width='210'><spring:message code="label.office.openedOn"/></th>
					</tr>
				</thead>
				
			</table>
		</div>
		
		  
	</div>
	
	<script type="text/javascript">
		var grid1;
		var officeId;
		var pageType = 'L';
		var apptable = "";
		var notesid = "";
		
		$(document).ready(function() {
		
			grid1 = $('#officelist').flexigrid({
				title : '<spring:message code="label.office.title"/>',
				pcpager : true,
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnUpdateInfo,bclass : 'edit', onpress: info}]
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
					"url" : "api.v1.offices"
				},
				callback : "callback"
			}); 
		}
		
		
		function ADD(){
			pageType = 'A';
			/* 加载创建办公室模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.office.add_office");
		}
		
		function EDIT(){
			pageType = 'E';
			officeId = grid1.colVal('id');
			/* 加载创建办公室模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.office.edit_office");
		}

		function info(){
			notesid = grid1.colVal('id');
			apptable="m_office";
			/* 加载填充办公室资料模态框 */
			$.openWindow("loadPage.do?nextPage=system.datatable.app_datatable");
		}
				
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			if(pageType == 'L'){
				/* var date = ''; */
		
				//遍历日期以及上一级办公室名称和外部ID，改写日期格式
				$.each(param,function(index,item){
					if($.type(item.parentName) === 'undefined'){
						item.parentName = '';
					}
					if($.type(item.externalId) === 'undefined'){
						item.externalId = '';
					}
					
					/* date = $.localeFormat(item.openingDate);
					item.openingDate = date; */
				});
				grid1.addRows(param);	
			}else {
				$.setSelect('parentName',param,'id','name');
			}
			
		}
	</script>

</body>
</html>
