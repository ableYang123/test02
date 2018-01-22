<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				<spring:message code="title.shareAccount.actAccountApp" />
			</h3>
			<form class="form-horizontal" role="form" id="activateShareForm">
				<fieldset>
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="activatedDate">
							<spring:message code="label.shareAccount.activatedOn" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4 hideTag">
							<input class="form-control" datetype="date" id="activatedDate" name="activatedDate" type="text" local-date="true"  />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									<spring:message code="label.shareAccount.cancel" />
								</button>
								<button type="button" class="btn btn-primary" id="activate_share">
									<spring:message code="label.shareAccount.submit" />
								</button>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$.datetimepicker();
		$('#activate_share').click(function() {

			var activatedDate = $('input[name=activatedDate]').val();
			var dateFormat = $('input[name=activatedDate]').attr("date-format");

			var json = {
				"locale" : "en",
				"dateFormat" : dateFormat,
				"activatedDate":activatedDate
			}
			activateShare(json);
		});
	});
	function activateShare(json){
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"contentType" : "application/json",
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.accounts.share."+shareAccountId+"?command=activate"
			},
			callback : "b_activateShare"
		});
	}
	function b_activateShare(param){
		$.setReadOnly('activateShareForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>