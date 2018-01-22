<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="noteClient" name="noteClient">
				<fieldset>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.Notes"/>
						</label>
						<div class="col-sm-3">
							<textarea id="note" rows="5" cols="30"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		$(document).ready(function() {
				$.getWidget("save").click(function() {
					var json = {
								  "note" : $.value('note')
								}
					if('${pd.pageType}' == 'center'){
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "POST",
								"mydata" : json,
								"url" : "api.v1.groups."+'${pd.centerId}'+".notes"
							},
							callback : "callback"
						});
					}else{
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "POST",
								"mydata" : json,
								"url" : "api.v1.clients."+clientId+".notes"
							},
							callback : "callback"
						});
					}
			});
		});
		function callback(param) {
			$.setReadOnly("noteClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
</script>