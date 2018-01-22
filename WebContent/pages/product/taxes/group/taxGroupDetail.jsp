<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="taxGroupDetailForm" name="taxGroupDetailForm">
	<fieldset>
		<legend><spring:message code="title.tax.group.detail" /></legend>

		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="lable.name" />：</label>
			<div class="col-sm-3">
				<span  class="form-control" name="name" id="name"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label for="taxGroupTable" class="col-sm-3 control-label"><spring:message code="lable.taxComponent" /></label>
			<div class="col-sm-8">
				<table class="table" id="taxGroupTable">
					<tr>
						<td><spring:message code="lable.tax.group"/></td>
						<td><spring:message code="lable.startDate"/></td>
						<td><spring:message code="lable.endDate"/></td>
					</tr>
					<tr style="display: none">
						<td><span id="taxComponentId" name="taxComponentId"></span></td>
						<td><span id="startDate" name="startDate"></td>
						<td><span id="endDate" name="endDate"></td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
</form>
<div class="form-group">
	<div class="col-sm-offset-10">
		<button  onclick="modifyData();" id="modify" name="modify" class="btn btn-link">
			<span class="glyphicon glyphicon-edit"></span>
			<spring:message code="lable.midify" />
		</button>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {

			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.taxes.group."+taxGroupId
				},
				callback : "groupDetail"
			});
	});
	/*写入页面*/
	function groupDetail(param){
		
		$('#name').text(param.name);
		var componentLength = param.taxAssociations.length;
		
		for (var i = 0; i < componentLength; i++) {
			
			$.tableclone("taxGroupTable");
			
			$('#taxGroupTable').find('tr').eq(i + 2).find('#taxComponentId').text(param.taxAssociations[i].taxComponent.name);
			
			/*日期显示处理*/
			var startDate = $.formatDate(param.taxAssociations[i].startDate);
			var endDate = '';
			if (typeof (param.taxAssociations[i].endDate) != 'undefined') {
				endDate = $.formatDate(param.taxAssociations[i].endDate);
			}
			
			$('#taxGroupTable').find('tr').eq(i + 2).find('#startDate').text(startDate);
			$('#taxGroupTable').find('tr').eq(i + 2).find('#endDate').text(endDate);
		}
	}

	function modifyData(){
		$.openWindow("loadPage.do?nextPage=product.taxes.group.edit_taxGroup");
	}
	
</script>




