<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="addPaymentTypeForm"
	name="addPaymentTypeForm">
	<fieldset>
		<legend><spring:message code="title.create.paymentType"/></legend>

		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><spring:message code="lable.paymentType"/><span style="color: #d9534f;">*</span>
			</label>

			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name"
					value='' />
			</div>
		</div>

		<div class="form-group">
			<label for="description" class="col-sm-3 control-label"><spring:message code="lable.description"/></label>

			<div class="col-sm-3">
				<input type="text" class="form-control" id="description"
					name="description" value='' />
			</div>
		</div>

		<div class="form-group">
			<label for="isCashPayment" class="col-sm-3 control-label"><spring:message code="lable.isCashPayment"/></label>

			<div class="col-sm-3">
				<label class="checkbox"> <input id="isCashPayment"
					type="checkbox">
				</label>
			</div>
		</div>

		<div class="form-group">
			<label for="position" class="col-sm-3 control-label"><spring:message code="lable.position"/><span style="color: #d9534f;">*</span></label>

			<div class="col-sm-3">
				<input type="text" class="form-control" name="position" id="position" value='' />
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-5">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
	$(document).ready(function() {


	$.valid("addPaymentTypeForm", [ {
			"name" : "name",
			"notEmpty" : ""
		}, {
			"name" : "position",
			"notEmpty" : ""
		} ]);

		/* 创建办公室表单提交 */
		$.getWidget("save").click(function() {
			if ($.validateForm("addPaymentTypeForm")) {

				/* 获取必选项的值 */
				var paymentType = $.trim($.value("name"));

				/* 构造json请求参数 */
				var json = {
					"name" : paymentType
				};

				/* 可选项：设置外部ID */
				var description = $.value('description');
				var isCashPayment = $('#isCashPayment').is(':checked');
				var position = $.value('position');

				json["description"] = description;
				json["isCashPayment"] = isCashPayment;
				json["position"] = position;

				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.paymenttypes"
					},
					callback : "add_success"
				});
			}
		});
	});

	function add_success(param) {
		$.setReadOnly('addPaymentTypeForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>




