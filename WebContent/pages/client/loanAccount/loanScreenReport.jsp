<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>
<html>
	<body>
		<div class="card">
			<div class="toolbar">
				<h4>Loan Screen Report</h4>
			</div>
			<div>
				<table id="templateList" class="table">
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div id="tem" style="display: none;">
			<span id="template" style="font-size: large;">
				
			</span>
		</div>
	</body>
</html>
<script type="text/javascript">
	var templateId;
	$(document).ready(function(){
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.templates?entityId=1&typeId=0"
				},
			callback : "template"
		});
	});
	function template(param){
		if(param != null || param != ''){
			for(var i=0;i<param.length;i++){
				$('#templateList').append('<tr><td id="'+param[i].id+'" style="display:none;">ID</td>'
				+'<td><span><a href="javascript:void(0)" onclick="detail(this)">'+param[i].name+'</a></span></td>'
				+'</tr>')
			}
		}
	}
	
	function detail(obj){
		var trNode = obj.closest('tr');
		templateId = $(trNode).find('td:first').text();
		$.nest({
			url:'<c:url value="/fineract.do"/>',
			type:"post",
			data:{
				"dataType":"GET",
				"mydate":"",
				"url":"api.v1.templates."+templateId+"?loanId="+loanId
				},
			callback : "templateDate"
		});
	}
	function templateDate(param){
		$.show('tem');
		$('#template').empty();
		$('#template').append(param);
	}
</script>