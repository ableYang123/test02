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
						&nbsp;<spring:message code="menu.admin.manageHoliday"/>
					</li>
				</ul>
		</div>
		<div class="row div-cc" >
			<div class="col-md-5">
				<select name="office" id="office" class="form-control">
					<option selected="selected" value=''><spring:message code="label.user.selectOffice" /></option>
				</select>
			</div>
			<br />
			<br />
			<table id="holidaylist" style="display: none;">
				<thead>
					<tr>
						<th name='id' width='210' style='display: none;'>id</th>
						<th name='name' search="true" width='210' ><spring:message code="label.holiday.holidayName" /></th>
						<th name='fromDate' type="date" width='210'><spring:message code="label.holiday.fromDate"/></th>
						<th name='toDate' type="date" width='210'><spring:message code="label.holiday.toDate"/></th>
						<th name="repaymentsRescheduledTo" type="date" width='210'><spring:message code="label.holiday.repaymentTo"/></th>
						<th name='status.value' width='210'><spring:message code="label.holiday.status"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var grid1;
		var officeId;
		var holidayId;
		var holidayName;
		$(document).ready(function() {
		
			grid1 = $('#holidaylist').flexigrid({
				title : '<spring:message code="label.holiday.title"/>',
				buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnActive,bclass:'active', onpress:ACTIVE},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,bclass : 'edit', onpress: EDIT},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]
			});
			
			

			/* 初始化 */
			init();
			
			$.getWidget('office').change(function(){
				
				officeId = $(this).val()
				$(this).attr('selectd',false);
				if(!$.isEmpty(officeId)){
					freshlist(officeId);
				}
			});
			
			
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				freshlist(officeId);
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
			
			/* 加载创建假期模态框 */
			$.openWindow("loadPage.do?nextPage=orgnization.holidays.add_holiday");
		}
		
		function EDIT(){
			
			holidayId = grid1.colVal('id');
			holidayName = grid1.colVal('name');
			if(grid1.colVal('status.value') != 'Deleted'){
				/* 加载编辑假期模态框 */
				$.openWindow("loadPage.do?nextPage=orgnization.holidays.edit_holiday");
			}else{
				$.bAlert($.fn.bootstrapValidator.i18n.holiday.alreadyDelete);
			}
		}
		function DELETE(){
			if(grid1.colVal('status.value') != 'Deleted'){
				holidayId = grid1.colVal('id');
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "DELETE",
						"mydata" : "",
						"url" : "api.v1.holidays."+holidayId
					},
					callback : "deleteback"
				});
			}else{
				$.bAlert($.fn.bootstrapValidator.i18n.holiday.alreadyDelete);
			}
		}
		
		function ACTIVE(){
			holidayId = grid1.colVal('id');
			var status = grid1.colVal('status.value');
			var json = {};
			
			if( status == 'Active' || status == 'Deleted'){
				$.bAlert($.fn.bootstrapValidator.i18n.holiday.alreadyActive + ' or ' + $.fn.bootstrapValidator.i18n.holiday.alreadyDelete);
			}else {
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.holidays."+holidayId+"?command=Activate",
						"contentType" : "application/json"		
					},
					callback : "activeback"
				});
			}
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			/* 填充办公室下拉框数据 */
			$.setSelect('office',param,'id','name');	
		}
		
		function loadback(param){
			$('#holidaylist tbody tr').each(function(){
				$(this).remove();
			});
			if(param.length > 0){
				/* 填充表格数据 */
				grid1.addRows(param);
				/* var txt = $('th[name="repaymentsRescheduledTo"]').text();
				$('#holidaylist tbody tr').each(function(){
					var td_node = $(this).children('td:eq(4)');
					var div_node = td_node.children('div:first');
					if(div_node.text() == 'NaN-NaN-NaN'){
						div_node.text($.fn.bootstrapValidator.i18n.holiday.rescheduleToNext);
					}
				}); */
			}
		}
		 
		function deleteback(param){
			freshlist(officeId);
			init();
		}
		
		function activeback(param){
			freshlist(officeId);
		}
		
		function freshlist(officeId){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.holidays?officeId=" + officeId
				},
				callback : "loadback"
			});
		}
		
		function compare_time(time1,time2){
		    time1 = Date.parse(new Date(time1));
		    time2 = Date.parse(new Date(time2));
		    return time3 = parseInt((Math.abs(time2 - time1)) / 1000 / 3600 / 24);
		}
	</script>

</body>
</html>
