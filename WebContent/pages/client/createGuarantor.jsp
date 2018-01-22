<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.dropdown {
		position: absolute;
		float: left;
   		min-width: 160px;
    	padding: 5px 0;
    	margin: 2px 0 0;
    	list-style: none;
    	font-size: 14px;
    	text-align: left;
    	background-color: #fff; 
    	border: 1px solid rgba(0, 0, 0, 0.15);
    	border-radius: 4px;
    	display: none;
	}
	.blue { 
		background-color:#bcd4ec; 
	}
	
	.list {
		padding-bottom: 40px;
	}
</style>
			<form class="form-horizontal" id="createGuarantor" name="createGuarantor">
				<fieldset>
						<legend><spring:message code="create.guarantor"/></legend>
			<div class="form-group">
				<label class="col-sm-2 control-label"><spring:message
						code="existing.client" /></label>
				<div class="col-sm-3">
					<input type="checkbox" checked="checked" id="check" name="check">
				</div>
			</div>
			<div id="existingClientname" class="form-group">
				<label class="col-sm-2 control-label"><spring:message
						code="lable.name" /><span style="font-size: 14px; color: #d9534f">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="clientname" name="clientname">
					<ul id="search" class="dropdown"></ul>
				</div>
			</div>
			<div class="form-group" >
				<label class="col-sm-2 control-label"><spring:message
						code="lable.relationship" /></label>
				<div class="col-sm-3">
					<select class="form-control" id="relationship" name="relationship">
						<option selected="selected"><spring:message code="lable.please.choose"/></option>
					</select>
				</div>
			</div>
			<div id="clientDetailTable" style="display: none;" class="form-group col-sm-5 col-md-5 ng-bliding">
				<h3><spring:message code="Client.detail"/></h3>
				<div style="padding: 5px;box-sizing: border-box;border: none;">
					<br><hr>
					<table class="table table-bordered">
						<tr>
							<th><spring:message code="lable.name"/></th>
							<td><span id="name"> </span></td>
						</tr>
						<tr>
							<th>ID</th>
							<td><span id="id"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.office"/></th>
							<td><span id="office"> </span></td>
						</tr>
						<tr>
							<th><spring:message code="lable.active.date"/></th>
							<td><span id="activationDate"> </span></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="existingFalse" style="display: none;" class="form-group">
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.firstName" /><span style="font-size: 14px; color: #d9534f">*</span></label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="firstName" name="firstName">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.lastName" /><span style="font-size: 14px; color: #d9534f">*</span></label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="lastName" name="lastName">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">DOB</label>
					<div class="col-sm-3">
						<input class="form-control" datetype="date" id="dob" name="dob">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.address" /></label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="addressline1" name="addressline1" placeholder="line1">
					</div>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="addressline2" name="addressline2" placeholder="line2">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.city" /></label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="city" name="city">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.zip" /></label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="zip" name="zip">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.mobleNo" /></label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="mobile" name="mobile">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><spring:message
							code="lable.residence"/>#</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="residence" name="residence">
					</div>
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
	var clientOptions = [];
	var clientName;
	var clientId;
	var flag;
	var guarantorTypeId;
	var loanId
	$("#check").click(function(){
		flag = $('#check').is(':checked');
		if(flag == false){
			$.hide('existingClientname');
			$.show('existingFalse');
		}else{
			$.show('existingClientname');
			$.hide('existingFalse');
		}
	});
		$(document).ready(function() {
			$.valid("createGuarantor", [ {
				"name" : "clientname",
				"notEmpty" : "不能为空"
			}, {
				"name" : "firstName",
				"notEmpty" : "不能为空"
			}, {
				"name" : "lastName",
				"notEmpty" : "不能为空"
			} ]);
	$(document).on('input','#clientname',function(e){
				
				$('.dropdown').empty();
				var input_val = $(this).val();
				
				if(!$.isEmpty(input_val)){
					$('#search').show();
					if(searchData(input_val)){
						$('#search').hide();
					};
				}else{
					$('#search').hide();
				}
			
				var ulNode = $('#search').children();
				if(ulNode.length <= 0){
					$('#search').hide();
				}
				
			});
		    
			$(document).on({
				click : function(){
					$('#clientname')[0].focus();
					$('#clientname').val($(this).text());
					clientId = $(this).attr('code');
					$.show('clientDetailTable');
					$('#name').append($(this).text());
					$('#id').append($(this).attr('code'));
					$('#office').append($(this).attr('officeName'));
					$('#activationDate').append($(this).attr('activationDate'));
					$('#search').empty();
					$('#search').hide();
					$.nest({
						url : '<c:url value="/fineract.do"/>',
						type : 'post',
						data : {
							'dataType' : 'GET',
							'mydata' : '',
							'url' : "api.v1.loans."+loanId+".guarantors.accounts.template?clientId="+clientId
						},
						callback : 'guarantorType'
					});
				},
				mouseenter : function(){
					$(this).addClass('blue') ; 
				},
				mouseleave : function(){
					$(this).removeClass('blue') ; 
				}
				
			},'#search li');
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : "api.v1.loans."+loanId+".guarantors.template"
				},
				callback : 'relationship'
			});
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : "api.v1.clients"
				},
				callback : 'clients'
			});
			$.getWidget("save").click(function(){
				var json;
				var clientRelationshipTypeId = parseInt($.value('relationship'));
				flag = $('#check').is(':checked');
				if(flag == true){
					json={
							"clientRelationshipTypeId" : clientRelationshipTypeId,
							"entityId" : clientId,
							"guarantorTypeId" : guarantorTypeId ,
							"locale":"en"
					}
				}else{
					json = {
							"addressLine1" : $.value('addressline1'),
							"addressLine2" : $.value('addressline2'),
							"city" : $.value('city'),
							"clientRelationshipTypeId" : clientRelationshipTypeId,
							"dateFormat": $('input[name="dob"]').attr('date-format'),
							"dob" : $.value('dob'),
							"firstname": $.value('firstName'),
							"guarantorTypeId" :  guarantorTypeId,
							"housePhoneNumber" : $.value('residence'),
							"lastname" : $.value('lastName'),
							"locale" : "en",
							"mobileNumber" : $.value('mobile'),
							"zip" : $.value('zip')
					}
				}
				$.nest({
					url : '<c:url value="/fineract.do"/>',
					type : 'post',
					data : {
						'dataType' : 'POST',
						'mydata' : json,
						'url' : "api.v1.loans."+loanId+".guarantors"
					},
					callback : 'guarantor'
				});
			});
			
		});
		function relationship(param) {
			$.setSelect('relationship',param.allowedClientRelationshipTypes,'id','name');
		}
		function clients(param){
			clientOptions = param.pageItems;
		}
		function guarantorType(param){
			guarantorTypeId = param.guarantorType.id;
		}
		function guarantor(param){
			$.setReadOnly("createGuarantor");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param != ''){
				loanId = param.loanId;
				window.location.href="loadPage.do?nextPage=client.loanDetail&loanId="+loanId+"&requestType="+requestType;
			}
		}
	
		function searchData(param){
			var paramVal = $.trim(param);
			$.each(clientOptions,function(index,item){
				var value_name = item.displayName ;
				var value_id = item.id;
				var officeName = item.officeName;
				var activationDate;
				if(typeof item.timeline.activatedOnDate != 'undefined'){
					activationDate = $.formatDate(item.timeline.activatedOnDate);
				}else{
					activationDate = '';
				}
				if($.isContains('/['+value_name+']/',paramVal)){
					var name = value_name.replace(paramVal,'<b>'+paramVal+'</b>');
					$('.dropdown').append('<li class="repeat-data" officeName="'+officeName+'" activationDate="'+activationDate+'" code="'+ value_id +'">'+ name +'</li>');
				}
			}); 
		}
</script>