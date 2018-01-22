<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="unassignStaffCenter" name="unassignStaffCenter">
	<fieldset>

		<legend><spring:message code="label.center.unassignStaff"/></legend>

		<div class="form-group">
			<div class="text-right" style="padding-right: 80px">
			    <a id="cancel" class="btn btn-default" href="#"><spring:message code="label.center.cancel"/></a>
				<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="label.center.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
	<script type="text/javascript">
	$.getWidget('cancel').click(function(){
		window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
	}); 
	
	$.getWidget("save").click(function() {

		var json={
				"staffId":staffId
		}
      
		$.nest({
			url : '<c:url value="/fineract.do"/>',
			data : {
				'dataType' : 'post',
				'mydata' : json,
				'url' : "api.v1.groups." + centerId+"?command=unassignstaff"
			},
			callback : 'Success'
		});
	});
	
	function Success() {
	  $.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	  window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
	}
	</script>