<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head></head>
	<body>	
	<br>
		<div class="div-cc" >
			<table id="searchlist">
				<thead>
					<tr>
						<th name='entityId' style='display: none;'>entityId</th>
						<th name="entityName" width='250' search="true"><spring:message code="Libel.mina.search.name"/></th>
						<th name="entityAccountNo" width='250' search="true"><spring:message code="Libel.mina.search.no"/></th>
						<th name="entityType" width='100' search="true"><spring:message code="Libel.mina.search.type"/></th>
						<th name="parentName" width='154' search="true"><spring:message code="Libel.mina.search.office"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		var grid1;
		$(document).ready(function() {
			var url = "api.v1.search?exactMatch=false&query=${pd.query}&resource=${pd.resource}";
				var nestjson = {
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : url
				},
				callback : "searchlist"
			};		
			grid1 = $('#searchlist')
					.flexigrid(
							{
								nestjson : nestjson,
								title : $.fn.bootstrapValidator.i18n.common.searchResourceList,
								onDoubleClick : "detail",
								pcpager:true,
								buttons : [
										{
											name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetial,
											bclass : 'query', 
											onpress: detail
										},]
							});	
							
			$.nest(nestjson);
																	
		});
		
		function searchlist(param){
			grid1.addRows(param);
		}
		function detail(){
			var entityId = grid1.colVal('entityId');
			var entityType = grid1.colVal('entityType');
			var officeName = grid1.colVal('parentName');
			var userId = ${userId};
			if(entityType == "CLIENT"){
				$.openWindow("loadPage.do?nextPage=client.detail&clientId="+entityId,"iframe","80%","90%");
			}
			if(entityType == "GROUP"){
				$.openWindow("loadPage.do?nextPage=group.detail&groupId="+entityId+"&officeId=1&userId="+userId+"&officeName="+officeName,"iframe","80%","90%");
			}
			if(entityType == "CENTER"){
				$.openWindow("loadPage.do?nextPage=center.detail&centerId="+entityId,"iframe","80%","90%");
			}			
			if(entityType == "SAVING"){
				$.openWindow("loadPage.do?nextPage=client.savingsaccounts&savingsId="+entityId,"iframe","80%","90%");
			}			
			if(entityType == "LOAN"){
				$.openWindow("loadPage.do?nextPage=client.loanDetail&loanId="+entityId,"iframe","80%","90%");
			}			
			if(entityType == "SHARE"){
				$.openWindow("loadPage.do?nextPage=client.shareAccount.shareAccount&shareAccountId="+entityId,"iframe","80%","90%");
			}						
		}
	</script>
</html>
