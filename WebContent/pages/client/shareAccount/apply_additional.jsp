<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				<spring:message code="title.shareAccount.applyAddShares" />
			</h3>
			<form class="form-horizontal" role="form" id="applyShareForm">
				<fieldset>
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="requestedDate">
							<spring:message code="label.shareAccount.reDate" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4 hideTag">
							<input class="form-control" datetype="date" id="requestedDate" name="requestedDate" type="text" local-date="true"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="requestedShares">
							<spring:message code="label.shareAccount.numberOfShares" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="requestedShares" name="requestedShares" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="unitprice">
							<spring:message code="label.shareAccount.todayPrice" />
						</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="unitPrice" name="unitPrice" disabled="disabled" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									<spring:message code="label.shareAccount.cancel" />
								</button>
								<button type="button" class="btn btn-primary" id="apply_share">
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
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.accounts.share." + shareAccountId
			},
			callback : "b_applyInit"

		});
		$('#apply_share').click(function() {

			var formData = $('#applyShareForm').serializeArray();//获取form所有数据
			var dateFormat = $('input[name=requestedDate]').attr("date-format");

			var json = {
				"locale" : "en",
				"dateFormat" : dateFormat,
			}
			$.each(formData, function() {
				json[this.name] = this.value;
			});
			applyShare(json);
		});
	});
	function b_applyInit(param){
		$('#unitPrice').val(param.currentMarketPrice);
		if($.type(param.currency.displaySymbol)!=='undefined'){
			var arr=[];
			arr.push('('+param.currency.displaySymbol+')');
			$('label[for="unitprice"]').append(arr.join(''));
		}
	}
	
	function applyShare(json) {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"contentType" : "application/json",
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.accounts.share." + shareAccountId + "?command=applyadditionalshares"
			},
			callback : "b_applyShare"
		});
	}
	function b_applyShare(param) {
		$.setReadOnly('applyShareForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>