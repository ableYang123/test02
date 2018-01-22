<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="form-group">
	<div class="viewchecker">
		<span class="form-group" id="button-group">
			<button id="approve-one" class="btn btn-success">
				<span class="glyphicon glyphicon-ok"></span> <spring:message code="label.button.approve"/>
			</button>
			<button id="delete-one" class="btn btn-danger">
				<span class="glyphicon glyphicon-trash"></span><spring:message code="label.button.delete"/>
			</button>
			<button id="reject-one" class="btn btn-warning">
				<span class="glyphicon glyphicon-remove"></span> <spring:message code="label.button.reject"/>
			</button>
		</span>
	</div>
	<div><spring:message code="label.anchor.viewcheckerinbox"/></div>
</div>
<hr>
<div class="form-group">
	<div class="paddedleft">
		<table width="100%">
			<tbody id="entity-table">
			</tbody>
		</table>
	</div>
</div>
<hr>
<spring:message code="label.heading.command"/>
<hr>
<div class="form-group">
	<div class="paddedleft">
		<table width="100%">
			<tbody id="command-table">
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		modeinit1();
		$('#approve-one').click(function () {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : "",
					"url" : "api.v1.makercheckers." + taskid + "?command=approve"
				},
				callback : "message1"
			});
		});
		$('#delete-one').click(function () {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "DELETE",
					"mydata" : "",
					"url" : "api.v1.makercheckers." + taskid
				},
				callback : "message1"
			});
		});
		$('#reject-one').click(function () {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "POST",
					"mydata" : "",
					"url" : "api.v1.makercheckers." + taskid + '?command=reject'
				},
				callback : "message1"
			});
		});
	});

		function message1(param) {
			$('#button-group button').each(function() {
				$(this).attr('disabled', true);
			});
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			init();
		}
			
	function modeinit1() {
			//加载列表数据
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.audits." + taskid
				},
				callback : "getAudit1"
			});
		}
		function getAudit1(param) {
			$('#entity-table')[0].innerHTML = '';
			$('#command-table')[0].innerHTML = '';
			var str = '<tr><td width="35%"><strong><spring:message code="label.heading.id"/>:</strong></td><td width="65%" >'
					+ param.id
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.status"/>:</strong></td><td width="65%">'
					+ param.processingResult
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.user"/>:</strong></td><td width="65%">'
					+ param.maker
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.action"/>:</strong></td><td width="65%">'
					+ param.actionName
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.entity"/>:</strong></td><td width="65%">'
					+ param.entityName
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.entityid"/>:</strong></td><td width="65%">'
					+ param.resourceId
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.date"/>:</strong></td><td width="65%">'
					+ $.formatDate(param.madeOnDate)
					+ '</td></tr>'
					+ '<tr><td width="35%"><strong><spring:message code="label.heading.office"/>:</strong></td><td width="65%">'
					+ param.officeName + '</td></tr>';
			$('#entity-table')[0].innerHTML += str;
			var command = jQuery.parseJSON(param.commandAsJson);
			str = '';
			$.each(command, function(i, n) {
				str += '<tr><td width="35%"><strong>' + i
						+ '</strong></td><td width="65%"><strong>' + n
						+ '</strong></td></tr>';
			});
			$('#command-table')[0].innerHTML += str;
		}		
</script>