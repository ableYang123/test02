<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="background-color: f8f8f8">
	<div>
		<div style="margin: 30px 200px; font-size: large">
			<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="closure.list.title"/></a></li>
			</ul>
		</div>
		<div class="div-cc row">
			<div class="col-md-5">
				<select name="office" id="office" class="form-control">
					<option selected="selected" value=''><spring:message code="closure.list.alloff"/></option>
				</select>
			</div>
			<br />	
			<br />
			<table id="glclosuresList" style="display:none;">
				<thead>
					<tr>
						<th name="id" width='210' style="display:none;">ID</th>
						<th name="officeName" width='210'><spring:message code="closure.list.office"/></th>
						<th name="closingDate" type="date" width='280'><spring:message code="closure.list.closuredate"/></th>
						<th name="comments" width='210'><spring:message code="closure.list.comments"/></th>
						<th name="createdByUsername" width='500'><spring:message code="closure.list.createdby"/></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var closureId;
		
		//初始化  
		$(document).ready(function() {
			grid1 = $('#glclosuresList').flexigrid(
					{
						title : '<spring:message code="closure.list.title"/>',
						pcpager : true,
						buttons :  [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnView,bclass : 'view', onpress: VIEW},
		        					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE},
		        					]
					});
			init();
		});
		
		function init() {
			//加载列表数据
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.offices"
				},
				callback : "listOffices"
			});
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.glclosures"
				},
				callback : "listGlclosures"
			});
			
		};
		
		$('#myModal').on('hidden.bs.modal', function (event) {
			init();
		});
		
		function listOffices(param){
			$.setSelect('office',param,'id','name');
		}
		
		function listGlclosures(param){
			if($.type(param.comments) === 'undefined'){
				param.comments = '';
			}
			grid1.addRows(param);
		}
		
		function ADD(){
			$.openWindow("loadPage.do?nextPage=accounting.glclosures.addClosure");
		}
		
		function DELETE(){
			closureId = grid1.colVal('id');
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "DELETE",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.glclosures."+closureId
				},
				callback : "init"
			});
		}
		
		function VIEW(){
			closureId = grid1.colVal('id');
			$.openWindow("loadPage.do?nextPage=accounting.glclosures.viewClosure");

		}
		
		$.getWidget("office").change(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.glclosures?officeId="+this.value
				},
				callback : "listGlclosures"
			});
		});
		
	</script>
</body>
</html>





	