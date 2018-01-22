<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

			<form class="form-horizontal" id="activeCenter" name="activeCenter">
				<fieldset>
						<legend><spring:message code="label.center.activeCenter"/></legend>
	
					<div class="form-group">
						<label for="activationDate" class="col-sm-2 control-label"><spring:message code="label.center.activatedon"/>  <span
							style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="activeDate" local-date="true" afterToday="true" beforeToday="">
						</div>
					</div>
	
			    <div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="label.center.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>

	<script type="text/javascript">
		$(document).ready(function() {
			    $.datetimepicker();
				
				$.getWidget("save").click(function() {
				var json = {
							  "locale": "en",
							  "dateFormat": $('input[name="activeDate"]').attr('date-format'),
							  "activationDate": $.value('activeDate')
							}
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.centers."+centerId+"?command=activate"
					},
					callback : "activeSuccess"
				});
			});
		});
		
		function activeCenter(param){
			
		}
		function activeSuccess(param) {
			$.setReadOnly("activeCenter");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;	
		}
</script>