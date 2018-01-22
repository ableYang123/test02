<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

			<form class="form-horizontal" id="closeCenter" name="closeCenter">
				<fieldset>
					<legend><spring:message code="label.center.closeCenter"/></legend>
					
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="label.center.closuredate"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" datetype="date" name="closeDate"  id="closeDate" local-date="true" afterToday="true" beforeToday=""/>
						</div>
					</div>
					<div class="form-group">
						<label for="activationReason" class="col-sm-3 control-label"><spring:message code="label.center.closurereason"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="closeReason" 
								name="closeReason">
							</select>
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
				
				$.valid("closeCenter", 
						[ {"name" : "closeDate","notEmpty" : "不能为空"},
						   {"name" : "closeReason","notEmpty" : "不能为空"}]);
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.centers.template?command=close"
					},
					callback : "closureReason"
				});
				
				$.getWidget("save").click(function() {
					
					var closureReasonId = parseInt($("#closeReason").find("option:selected").attr("value"));
					var closureDate= $('input[name="closeDate"]').val();
					var json = {
								  "dateFormat":$('input[name="closeDate"]').attr('date-format'),
								  "locale":"en",
								  "closureDate":closureDate,
								  "closureReasonId":closureReasonId
								}
					 if(t!=0){
						 $.bAlert("对不起,储蓄账户有未关闭,无法进行中心关闭操作！");
						  return false;
					}
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.centers."+centerId+"?command=close"
						},
						callback : "callback1"
					});
			});
      });				
		function callback1(param) {
			$.setReadOnly("closeCenter");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;	 
		}
		
		function closureReason(param){
			$.setSelect('closeReason',param.closureReasons,'id','name');
		} 
</script>
			