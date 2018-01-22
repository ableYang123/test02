<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="loanDocument" name="loanDocument">
				<fieldset>
					<legend><spring:message code="lable.upload.client.document"/></legend>
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="lable.name"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="lable.description"/>
						</label>
						<div class="col-sm-3">
							<textarea id="description" name="description" rows="5" cols="30"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label"> <spring:message code="lable.file"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" name="files" id="files">
						</div>
					</div>

					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" >提交</button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		$(document).ready(function() {
				$.valid("identityClient", 
						[ {"name" : "name","notEmpty" : "不能为空"},
						  {"name" : "file","notEmpty" : "不能为空"}
						]);
				$.getWidget("save").click(function() {
					var url = "api.v1.loans."+loanId+".documents";
					$.uploadFile('loanDocument',url,callback);
				});
		});
		function callback(param) {
			$.setReadOnly("loanDocument");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
</script>