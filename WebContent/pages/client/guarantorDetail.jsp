<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

	<form class="form-horizontal" id="guarantorDetail" name="guarantorDetail" method="post">
		<div>
			<div>
				<h3><spring:message code="Guarantor.detail"/></h3>
			</div>
			<div>
				<table class="table table-bordered">
					<tboby>
						<tr id="first">
							<td><spring:message code="lable.firstName"/></td>
							<td id="firstName"></td>
						</tr>
						<tr id="last">
							<td><spring:message code="lable.lastName"/></td>
							<td id="lastName"></td>
						</tr>
						<tr id='relation'>
							<td><spring:message code="lable.relationship"/></td>
							<td id="relationship"></td>
						</tr>
						<tr id="guarantor">
							<td><spring:message code="lable.guarantor.type"/></td>
							<td id="guarantorType"></td>
						</tr>
						<tr>
							<td><spring:message code="lable.join.date"/></td>
							<td id="joinDate"></td>
						</tr>
						<tr>
							<td><spring:message code="lable.office"/></td>
							<td id="office"></td>
						</tr>
						<tr>
							<td><spring:message code="lable.status"/></td>
							<td id="status"></td>
						</tr>
					</tboby>
				</table>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.loans."+loanId+".guarantors."+guarantorId
				},
				callback : "guarantorShow"
			});
		});
		function guarantorShow(param) {
			console.log(param);
			if(typeof param.joinedDate != 'undefined'){
				param.joinedDate = $.formatDate(param.joinedDate);
			}
			if(typeof param.firstname == 'undefined'){
				param.firstname = '';
				$.hide('first');
			}else{
				$.show('first');
			}
			if(typeof param.lastname == 'undefined'){
				param.lastname = '';
				$.hide('last');
			}else{
				$.show('last');
			}
			if(typeof param.clientRelationshipType == 'undefined'){
				param.clientRelationshipType = '';
				$.hide('relation');
			}else{
				param.clientRelationshipType = param.clientRelationshipType.name;
				$.show('relation');
			}
			/* if(typeof param.guarantorType != 'undefined'){
				param.guarantorType = param.guarantorType.value;
				$.show('guarantor');
			}else{
				param.guarantorType = '';
				$.hide('guarantor');
			} */
			if(param.status == true){
				param.status = 'Active';
			}else{
				param.status = 'Deleted';
			}
			$('#firstName').append(param.firstname);
			$('#lastName').append(param.lastname);
			$('#relationship').append(param.clientRelationshipType);
			$('#guarantorType').append(param.guarantorType.value);
			$('#joinDate').append(param.joinedDate);
			$('#office').append(param.officeName);
			$('#status').append(param.status);
		}
</script>