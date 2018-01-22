<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="../common/header.jsp"%>

	<form class="form-horizontal" id="accountDeposit" name="accountDeposit">
		<div class="content-container">
			<div class="row clearfix">
				
				<div class="form-group">
					<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.startDate"/>
					</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" datetype="date" name="startDate" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label"> <spring:message code="client.savingaccount.endDate"/>
					</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" datetype="date" name="endDate" >
					</div>
				</div>
				<div class="form-group">
					<div class="text-right" style="padding-right: 80px">
						<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
					</div>
				</div>
		
				<div class="col-md-12 column" id="dataArea">
					<iframe width="100%" height="600px" frameborder="0" id="dataIframe"></iframe>
				</div>
			</div>
		</div>
	</form>
<script type="text/javascript">
	$(document).ready(
		function() {
			
			$.getWidget("save").click(function(){
				var startDate=$.value("startDate");
				var endDate=$.value("endDate");
				var requestParam = "?docPath=api.v1.runreports.Client Loan Account Schedule&output-type=PDF&tenantIdentifier=default&locale=zh_CN&R_startDate="+startDate+"&R_endDate="+endDate+"&R_selectLoan="+accountNo;
				var url = "<c:url value='/document.do'/>";
				var xhr = new XMLHttpRequest();
				xhr.open('POST', url+ requestParam,true); 
				xhr.responseType = "blob"; 
				xhr.onload = function() {
					if (this.status === 200) {
						var blob = this.response;
						var reader = new FileReader();
						reader.readAsDataURL(blob); 
						reader.onload = function(e) {
							$('#dataIframe').attr('src',e.target.result);
							$('#dataArea').show();
						}
					}
				};
				xhr.send();
			});
			
			
		
		}
	)
</script>