<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../common/header.jsp"%>

	<form class="form-horizontal" id="payCharge" name="payCharge" style="font-size: small;">
				<fieldset>
					<div class="form-group">
						<label class="col-sm-2 control-label"> <spring:message code="lable.transaction.amount"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"  name="editChargeAmount" >
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
			console.log(chargesViewId)
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url":"api.v1.savingsaccounts."+savingsId+".charges."+chargesViewId
				},
				
				callback:"cc"
			}); 
			
			
			$("#save").click(function(){
				var json={
						"amount":$.value("editChargeAmount"),	
						"locale":"en",
						"dateFormat":$.getCookie("dateFormat")
				}
				
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "PUT",
						"mydata" : json,
						"url":"api.v1.savingsaccounts."+savingsId+".charges."+chargesViewId
					},
					callback:"callback"
				})
			})
			
			
		});
		
		
		function cc(param){
			
			$.assign({
				"editChargeAmount":param.amount
			});
			
		}
		
		function callback(param){
			if(param != '' || param != null){
				var savingsId = param.savingsId;
				window.location.href="loadPage.do?nextPage=client.savingsaccounts&pageType=${pd.pageType}&savingsId="+savingsId;
			}
		}
		
		
		
</script>