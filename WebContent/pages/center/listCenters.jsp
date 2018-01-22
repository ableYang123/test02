<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px auto;width:950px;font-size: large">
				<ul class="breadcrumb">
				<li class="active"><spring:message code="label.center.centerList"/></a></li>
				</ul>
		</div>
		
		<div class="div-cc">
			<div class="row" style="margin: 5px">
				<button type='button' name="add" class="btn btn-default pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="centerlist" style="display:none;">
				<thead>
					<tr>
				        <th name="id" style="display:none;" >id</th>
						<th name="name" width='205' search="true"><spring:message code="label.center.name"/></th>
						<th name="accountNo" width='205'><spring:message code="label.center.accountNo"/></th>
						<th name="externalId" width='200'><spring:message code="label.center.externalId"/></th>
						<th name="status.value" width='200' ><spring:message code="label.center.status"/></th>
						<th name="officeName" width='205' search="true"><spring:message code="label.center.officeName"/></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		var grid1;
		var centerId;
		var nestjson;
		$(document).ready(function() {
			nestjson = {
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"paging" : "Y",
						"url" : "api.v1.centers?paged=true"
					},
					callback : "callback"
				};
			grid1 = $('#centerlist').flexigrid({
				title : '<spring:message code="label.center.centerList"/>',
				nestjson : nestjson,
				//pcpager : true,
				buttons : [
				  ]
			});

			/* 初始化 */
			init();		
			
			/* 模态框关闭事件 */
			$('#myModal').on('hidden.bs.modal', function (event) {
					/* 实现局部刷新 */
					init();
			});
		});
		
		$.getWidget("centerlist").click(function(){
			centerId = grid1.colVal('id');
			if(centerId){
			$.openWindow("loadPage.do?nextPage=center.detail&centerId="+centerId,"iframe","80%","90%");
			}
			
		});
		function init(){
			$.nest(nestjson); 
		}
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=center.addCenters");
		}
	/* 	function detail() {
			centerId = grid1.colVal('id');	
			//window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
			$.openWindow("loadPage.do?nextPage=center.detail&centerId="+centerId,"iframe","80%","90%");
		} */
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
		     // grid1.addRows(param);
			$.each(param.pageItems,function(index,item){
				if(typeof item.externalId == 'undefined'){
					item.externalId = "";
				}
 				if(item.status.value == 'Active'){
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>"+' '+item.status.value
 				}else if(item.status.value == 'Pending'){
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: #FFA500;'></i>"+' '+item.status.value
 				}else{
 					item.status.value = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: #666F73;'></i>"+' '+item.status.value
 				}
			});
			grid1.addRows(param.pageItems);
			grid1.setPage(param.page, param.pages);
		}

		
	</script>

</body>
</html>
