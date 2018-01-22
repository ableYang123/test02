<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				<spring:message code="label.shareAccount.closeShareAccount" />
			</h3>
			<form class="form-horizontal" role="form" id="closedShareForm">
				<fieldset>
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="closedDate">
							<spring:message code="label.shareAccount.closedOn" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4 hideTag">
							<input class="form-control" datetype="date" id="closedDate" name="closedDate" type="text" local-date="true"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="note">
							<spring:message code="label.shareAccount.note" />
						</label>
						<div class="col-sm-4">
							<textarea class="form-control" id="note" name="note" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									<spring:message code="label.shareAccount.cancel" />
								</button>
								<button type="button" class="btn btn-primary" id="close_share">
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
		$('#close_share').click(function() {

			var formData = $('#closedShareForm').serializeArray();//获取form所有数据
			var dateFormat = $('input[name=closedDate]').attr("date-format");

			var json = {
				"locale" : "en",
				"dateFormat" : dateFormat,
			}
			$.each(formData, function() {
				json[this.name] = this.value;
			});
			closeShare(json);
		});
	});
	function closeShare(json) {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"contentType" : "application/json",
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.accounts.share." + shareAccountId
						+ "?command=close"
			},
			callback : "b_closeShare"
		});
	}
	function b_closeShare(param) {
		$.setReadOnly('closedShareForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>