<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="uploadSignature" name="uploadSignature">
				<fieldset>
						<legend><spring:message code="select.client.signature"/></legend>
			<div class="form-group" style="display: none;">
				<label class="col-sm-4 control-label"> <spring:message code="lable.name"/>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="name" value="clientSignature">
				</div>
			</div>
			<div class="form-group" style="display: none;">
				<label class="col-sm-4 control-label"> <spring:message code="lable.description"/>
				</label>
				<div class="col-sm-3">
					<input id="description" name="description" value="client signature">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<input type="file" class="form-control" name="file" id="file">
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
					/* $.nest({
						url : '<c:url value="/fineract.do"/>',
						type : 'post',
						data : {
							'dataType' : 'POST',
							'mydata' : data,
							'url' : 'api.v1.clients.'+clientId+'.documents',
							"contentType" : "text/plain"
						},
						callback : 'upload'
					}); */
					var url = "api.v1.clients."+clientId+".documents";
					$.uploadFile('uploadSignature',url,callback);
			});
		});
		function callback(param) {
			$.setReadOnly("uploadSignature");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
</script>