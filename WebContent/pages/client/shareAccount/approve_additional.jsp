<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				<spring:message code="title.shareAccount.ASPR" />
			</h3>
			<form class="form-horizontal" role="form" id="approveAddShareForm">
				<fieldset>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>
									<spring:message code="label.shareAccount.tranDate" />
								</th>
								<th>
									<spring:message code="label.shareAccount.totalShares" />
								</th>
								<th>
									<spring:message code="label.shareAccount.price" />
								</th>
								<th>
									<spring:message code="label.shareAccount.status" />
								</th>
								<th>
									<spring:message code="label.shareAccount.approve" />
								</th>
							</tr>
						</thead>
						<tbody id="additionalTbody">
						</tbody>
					</table>
					<div class="form-group">
						<div class="col-sm-offset-10">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									<spring:message code="label.shareAccount.cancel" />
								</button>
								<button type="button" class="btn btn-primary" id="approveAdd_share">
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
	$(document).ready(
			function() {
				 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.accounts.share." + shareAccountId
					},
					callback : "approveAddInit"

				}); 
				$('#approveAdd_share').click(
						function() {
							var json={};
							var IdArr=[];
							$('#additionalTbody').find('tr').each(function(){
								var approveRequest=$(this).find('input[name=approveRequest]').is(':checked');
								if(approveRequest){
									var IdValue=$(this).find('td').eq(0).text();
									var value=parseInt(IdValue);
									var IdJson={"id":value};
									IdArr.push(IdJson);
								}
								
							});
							json['requestedShares']=IdArr;
							approveAddShare(json);
						});
			});
	function approveAddInit(param){
		var currencySymbol=param.currency.displaySymbol;
		if($.type(currencySymbol)=='undefined'){
			currencySymbol='';
		}
		$.each(param.purchasedShares,function(i,obj){
			if(obj.status.value=="Pending Approval"){
				var arr=[];
				arr.push('<tr>');
				arr.push('<td style="display: none;">');
				arr.push(obj.id);
				arr.push('</td>');
				arr.push('<td>');
				var purchasedDate=$.formatDate(obj.purchasedDate,'yyyy-MM-dd');
				arr.push(purchasedDate);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(obj.numberOfShares);
				arr.push('</td>');
				arr.push('<td>');
				arr.push(currencySymbol+obj.purchasedPrice);
				arr.push('</td>');
				arr.push('<td>');
				arr.push('<span class="glyphicon glyphicon-stop" style="font-size: 20px; color: rgb(255, 106, 64);"></span>');
				arr.push('</td>');
				arr.push('<td>');
				arr.push('<input type="checkbox" name="approveRequest" value="true">');
				arr.push('</td>');
				arr.push('</tr>');
				$('#additionalTbody').append(arr.join(''));
			}
		});
	}
	function approveAddShare(json) {
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"contentType" : "application/json",
				"dataType" : "POST",
				"mydata" : json,
				"url" : "api.v1.accounts.share." + shareAccountId
						+ "?command=approveadditionalshares"
			},
			callback : "b_approveAddShare"
		});
	}
	function b_approveAddShare(param) {
		$.setReadOnly('approveAddShareForm');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
</script>