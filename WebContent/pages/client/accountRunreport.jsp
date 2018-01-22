<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">


		<div class="col-md-12 column" id="dataArea">
			<iframe width="100%" height="600px" frameborder="0" id="dataIframe"></iframe>
		</div>
		</div>
</div>
<script type="text/javascript">
	$(document).ready(
		function() {
			var requestParam = "?docPath=api.v1.runreports.Savings Transaction Receipt&output-type=PDF&tenantIdentifier=default&locale=zh_CN&R_transactionId="
				+transactionId;
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
		}
	)
</script>