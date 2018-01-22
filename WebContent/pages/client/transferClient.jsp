<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form class="form-horizontal" id="transferClient" name="transferClient">
	<fieldset>
		<legend><spring:message code="lable.transfer.client"/></legend>
		
		<div class="form-group">
			<label class="col-sm-2 control-label"> <spring:message code="lable.office"/>
				<span style="font-size: 14px; color: #d9534f">*</span>
			</label>
			<div class="col-sm-3">
				<select name="officeId" id="officeId"></select>
			</div>
		</div>
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
			$.valid("transferClient", 
					[ {"name" : "officeId","notEmpty" : "不能为空"}]);
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.offices"
				},
				callback : "offices"
			});
			
			$.getWidget("save").click(function() {
				var officeId = parseInt($.value("officeId"));
				var json = {
							"dateFormat" : "dd MMMM yyyy",							
							  "locale":"en",
							  "destinationOfficeId":officeId,
							  "note" : $.value('note')
							}
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.clients."+clientId+"?command=proposeTransfer"
					},
					callback : "callback"
				});
		});
	});
	function callback(param) {
		$.setReadOnly("transferClient");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		var clientId;
		if(param != null || param.length > 0 || typeof param != 'undefined'){
			clientId = param.clientId;
			window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
		}
	}
	function offices(param){
		$.setSelect('officeId',param,'id','name');
	}
</script>