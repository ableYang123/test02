<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="deleteCenter" name="deleteCenter" method="post">
	<fieldset>

		<legend><spring:message code="label.center.deleteCenter"/></legend>

		<div class="form-group">
			<div class="text-right" style="padding-right: 80px">
			    <a id="cancel" class="btn btn-default" href="#"><spring:message code="btn.cancle"/></a>
				<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="btn.confirm"/></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	$.getWidget('cancel').click(function(){
		window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
	}); 
	
	$.getWidget("save").click(function() {
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			data : {
				'dataType' : 'DELETE',
				'mydata' : '',
				'url' : "api.v1.centers." + centerId
			},
			callback : 'delete_success'
		});
	});
	
	function delete_success() {
	 // $.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	  window.location.href="loadPage.do?nextPage=center.listCenters";
	}