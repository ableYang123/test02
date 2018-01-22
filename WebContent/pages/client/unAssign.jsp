<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="unAssign" name="unAssign">
				<fieldset>
						<legend><spring:message code="unAssign"/></legend>
					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>

	<script type="text/javascript">
		var staffId; 
		$(document).ready(function() {
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : 'api.v1.clients.'+clientId
				},
				callback : 'staff'
			});
			$.getWidget("save").click(function() {
				var data = {
						'staffId' : staffId
				}; 
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'POST',
						'mydata' : data,
						'url' : 'api.v1.clients.'+clientId+'?command=unassignstaff'
					},
					callback : 'unassign'
				});
			});
		});
		function staff(param){
			if(typeof param.staffId != 'undefined'){
				staffId = param.staffId;
			}
		}
		function unassign(param) {
			$.setReadOnly("activeClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			var clientId;
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
</script>