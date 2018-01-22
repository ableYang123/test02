<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="identityClient" name="identityClient">
				<fieldset>
					<legend><spring:message code="client.identity.client"/></legend>
					
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="client.input.document.type"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" name="documentTypeId" id="documentTypeId"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="client.document.type"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" name="status" id="status">
								<option value=""></option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="client.unique.ID"/>ID
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="documentKey" id="documentKey">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="client.discription"/>
						</label>
						<div class="col-sm-3">
							<textarea id="description" name="description" rows="5" cols="30"></textarea>
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
				$.valid("identityClient", 
						[ {"name" : "documentTypeId","notEmpty" : "不能为空"},
						  {"name" : "status","notEmpty" : "不能为空"},
						  {"name" : "documentKey","notEmpty" : "不能为空"}
						]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.clients."+clientId+".identifiers.template"
					},
					callback : "identity"
				});
				
				$.getWidget("save").click(function() {
					if ($.validateForm("identityClient")) {
						var documentTypeId = parseInt($.value("documentTypeId"));
						var json = {
									"description":$.value('description'),
									"documentKey":$.value('documentKey'),
									"documentTypeId":documentTypeId,
									"status": $.value('status')
									}
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "POST",
								"mydata" : json,
								"url" : "api.v1.clients."+clientId+".identifiers"
							},
							callback : "callback"
						});
					}
			});
		});
		function callback(param) {
			$.setReadOnly("identityClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				clientId = param.clientId;
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
		}
		function identity(param){
			$.setSelect('documentTypeId',param.allowedDocumentTypes,'id','name');
		}
</script>