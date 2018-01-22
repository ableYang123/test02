<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="editTaxGroupForm" name="editTaxGroupForm">
	<fieldset>
		<legend><spring:message code="lable.edit.tax.group" /></legend>

		<div class="form-group">
			<label for="name" class="col-sm-2 control-label"><spring:message code="lable.name" />：</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" value='' />
			</div>
		</div>
		
		<div class="form-group">
			<label for="taxGroupTable" class="col-sm-2 control-label"><spring:message code="lable.taxComponent" /></label>
			<div class="col-sm-8">
				<table class="table" id="taxGroupTable">
					<tr>
						<td><spring:message code="lable.tax.group"/></td>
						<td><spring:message code="lable.startDate"/></td>
						<td><spring:message code="lable.endDate"/></td>
						<td><button type="button" class="btn btn-link" onclick="addTaxComponent();">
							<span class="glyphicon glyphicon-plus"></span>
							<spring:message code="taxes.add" />
						</button></td>
					</tr>
					<tr style="display: none">
						<td><span id="S_taxComponentId" name="S_taxComponentId"></span></td>
						<td><span id="S_startDate" name="S_startDate"></td>
						<td><span id="S_endDate" name="S_endDate"></td>
						
					</tr>
				</table>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-10">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit" /></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	$(document).ready(function() {
		
			var componentData;//保存税务部门信息
			
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
			/*获取税务部门信息*/
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.taxes.component"
				},
				callback : "componentData"
			});
			$.getWidget("save").click(function() {
				if ($.validateForm("editTaxGroupForm")) {
					
					var name = $('input[name="name"]').val();
					var dateFormat = $('input[name="endDate"]').attr('date-format');
					if(typeof(dateFormat) =='undefined'){
						dateFormat = $('input[name="startDate"]').attr('date-format');
					}
					var json = {
						"name" : name,
						"dateFormat" : dateFormat
					};
					json["locale"] = "zh";
					
					var taxComponentsJson= new Array();
					//数据提交：获取不同tr的数据
					$('#taxGroupTable').find('tr').eq(1).nextAll().each(function() {
						
						var span=$(this).find('span[name="S_taxComponentId"]');
						if(span.length!=0){

							var taxAssociations=$(this).find('span[name="S_taxComponentId"]').attr('id');
							var id=taxAssociations.split('_');
							var endDate = $(this).find('input[name="endDate"]').val();
							if(typeof(endDate) =='undefined'){
								endDate = $(this).find('span[name="S_endDate"]').attr('date-format');
							}
							var S_rowJson = {
									"id":id[0],
									"taxComponentId" : id[1],
									"endDate" : endDate,
							};
							taxComponentsJson.push(S_rowJson);
						}else{
							
							var taxComponentId = parseInt($(this).find('select[name="taxComponentId"]').val());
							var startDate = $(this).find('input[name="startDate"]').val();
							var rowJson = {
									"taxComponentId" : taxComponentId,
									"startDate" : startDate,
							};
							taxComponentsJson.push(rowJson);
						}
					});
					
					json['taxComponents']=taxComponentsJson;
					$.nest({
								url : "<c:url value='/fineract.do'/>",
								type : "post",
								async : true,
								data : {
									"dataType" : "PUT",
									"mydata" : json,
									"url" : "api.v1.taxes.group."+taxGroupId
								},
								callback : "edit_success"
							});
				}
			});

	});
	/*写入页面*/
	function groupDetail(param){
		
		$('#name').val(param.name);
		var componentLength = param.taxAssociations.length;
		
		for (var i = 0; i < componentLength; i++) {
			
			$.tableclone("taxGroupTable");
			
			$('#taxGroupTable').find('tr').eq(i + 2).find('#S_taxComponentId').text(param.taxAssociations[i].taxComponent.name);
			var taxAssociations=param.taxAssociations[i].id+'_'+param.taxAssociations[i].taxComponent.id;
			$('#taxGroupTable').find('tr').eq(i + 2).find('#S_taxComponentId').attr("id",taxAssociations);
			
			/*日期显示处理*/
			var startDate = $.formatDate(param.taxAssociations[i].startDate);
			$('#taxGroupTable').find('tr').eq(i + 2).find('#S_startDate').text(startDate);
			
			var endDate = '';
			if (typeof (param.taxAssociations[i].endDate) != 'undefined') {
				endDate = $.formatDate(param.taxAssociations[i].endDate);
				$('#taxGroupTable').find('tr').eq(i + 2).find('#S_endDate').text(endDate);
			}else{
				var td='<input type="text" class="form-control "  datetype="date" name="endDate"  beforeToday="true" />';
				$('#taxGroupTable').find('tr').eq(i + 2).find('td').eq(2).html(td);
				$.datetimepicker();
			}
			
		}
	}
	/*增加 新的税务部门栏位*/
	function addTaxComponent(){
		
		var rowNum=componentData.rowNum;//栏位ID行数
		
		var arr=new Array();
		arr.push('<tr>');
		arr.push('<td><select id="'+rowNum+'_taxComponentId" name="taxComponentId" class="form-control" style="width: 198"><option></option></select></td>');
		arr.push('<td><input type="text" class="form-control "  datetype="date" name="startDate"  beforeToday="true" /></td>');
		arr.push('<td></td>');
		arr.push('<td><button type="button" class="btn btn-link " onclick="deleteTr(this)"><span class="glyphicon glyphicon-remove"></span></button></td>');
		arr.push('</tr>');
		
		$('#taxGroupTable').append(arr.join(''));
		$.datetimepicker();
		$.setSelect(rowNum+'_taxComponentId',componentData,'id','name');
		componentData['rowNum']=++rowNum;
	}
	
	function deleteTr(obj) {
		$(obj).parent().parent().remove();
		var rowNum=componentData.rowNum;
		componentData['rowNum']=--rowNum;
	}

	function componentData(param){
		componentData=param;
		componentData['rowNum']=1;
	}

	function edit_success(param) {
		$.setReadOnly('editTaxGroupForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>




