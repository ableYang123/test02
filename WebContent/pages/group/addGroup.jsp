<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<form class="form-horizontal" id="addGroupForm" name="addGroupForm" method="post">
	<fieldset>
		<legend><spring:message code="group.add.group"/></legend>

		<div class="form-group">
			<label for="office" class="col-sm-2 control-label"><spring:message code="group.office"/>
			</label>
			<div class="col-sm-3" id="s1">
						<select id="officelist" name="officeName" class="form-control" style="width: 195">
							<option selected="selected" value=""><spring:message code="group.select.office"/></option>
						</select>
			</div>
			
			<label for="externalId" class="col-sm-2 control-label"><spring:message code="group.external.id"/> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="externalId" name="externalId" style="padding:12px;width:194px" />
			</div>
		</div>
		

		<div class="form-group">
			<label for="name" class="col-sm-2 control-label"><spring:message code="group.name"/>
			<span class="required" style="color: red">*</span>
			</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" value='' style="padding:12px;width:194px" />
			</div>                      
			
			<label for="submitDate" class="col-sm-2 control-label"><spring:message code="group.submit.on"/></label>
			<div class="col-sm-3" > 
				<input type="text" datetype="date" name="submitDate" local-date="true"/>
			</div>
		</div>



		<div class="form-group">
			<label for="staff" class="col-sm-2 control-label"><spring:message code="group.staff"/></label>
			<div class="col-sm-3">
				<select id="staff" name="staff" class="form-control" style="width:195">
					<option selected="selected"><spring:message code="group.select"/></option>
				</select>
			</div>
		</div>

		<div class="form-group">
				<label for="active" class="col-sm-2 control-label"><spring:message code="group.active"/></label>
				<div class="col-sm-3">
					<input type="checkbox" id="active" name="active" />
				</div>
	
				<label for="active" class="col-sm-2 control-label" id="label" style="display: none"><spring:message code="group.activation.date"/>
				    <span class="required" style="color: red">*</span>
				</label>
				<div id="upload1" class="col-sm-3" style="display: none">
					<input type="text" datetype="date" name="activeDate" local-date="true" />
				</div>
		</div>

		
      <div class="form-group">
			<label for="selectGroup" class="col-sm-2 control-label"><spring:message code="group.add.client"/>
			</label>
			<div class="col-sm-4 col-md-4">
				 <input datatype="search"  class="form-control" id="addClient" name="addClient" api="" autocomplete="off" textname="displayName">
				 <ul id="search" class="dropdown"></ul>
				<table class="table" >
					<tr>
						<td><spring:message code="group.client.details"/></td>
					</tr>
					<tr>
						<td><spring:message code="group.name"/></td>
						<td id="t1"></td>
					</tr>
					<tr>
						<td><spring:message code="group.id"/></td>
						<td id="t2"></td>
					</tr>
					<tr>
						<td><spring:message code="group.office"/></td>
						<td id="t3"></td>
					</tr>
				</table>
			</div>
			<div class="col-sm-1 col-md-1">
				<button id="btn_add" type="button" class="btn btn-primary" >
					<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
				</button>
			</div>
			<div label="list-client" class="col-sm-5 col-md-5">
			
			</div>
		</div>  


		<div class="form-group">                                     
			<div class="col-sm-offset-3">
				<a id="cancel" class="btn btn-default" href="#/listCenters"><spring:message code="btn.cancle"/></a>
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
			</div>
		</div>

	</fieldset>
</form>



<script type="text/javascript">
    var officeId;
    var centerId;
    
     //日期控件
	$.datetimepicker();
	 $("#active").click(function () {
	       var $cr = $("#active");
	       if ($cr.is(":checked")) {
	       	$("#active").attr("lang","1");
	        $("#label").css("display", "block");  
	        $("#upload1").css("display", "block");  
	       }
	       else {
	       	$("#active").attr("lang","0");
	       	$("#label").css("display", "none");
	        $("#upload1").css("display", "none");
	      }
	   });		
		$(document).ready(function() {	
			   //验证不为空
				$.valid("addGroupForm", [{
								"name" : "officeName",
								"notEmpty" : "不能为空"
							},{
								"name" : "name",
								"notEmpty" : "不能为空"
							}]);
				var url = "api.v1.groups.template?&orderBy=name&sortOrder=ASC&staffInSelectedOfficeOnly=true";
			   if(centerId){
				   url+="&centerId="+centerId;
			   }
			   
				 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : url
					},
					callback : "getTemplate"
				}); 
				    

				/* 将office对应的员工信息填到对应框 */
				$.getWidget("officelist").change(function() {
					$('input[name=addClient]').val("");
					 officeId = parseInt($("#officelist").find("option:selected").attr("value"));
					 url2="api.v1.clients.template?"
					 if(!isNaN(officeId)){
						 url2+="officeId="+ officeId+ "&staffInSelectedOfficeOnly=true";
					 }
					/* 获得员工信息 */
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : url2
							},
						callback : "getTemplate2"
						});
						});
				
				$(document).on('keyup','#addClient',function(){
					$('.dropdown').empty();
					var input_val = $(this).val();
					if(input_val.length>=2){
						 //  获取组已有成员 
						 $.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							data : { 
								"dataType" : "GET",
								"url" : "api.v1.clients?displayName="+input_val+"&officeId="+officeId+"&orderBy=displayName&orphansOnly=true&sortOrder=ASC"
							},
							callback : "getClientMembers"
						});  
						
					}else{
						 $('#search').hide();
					}
					
				});
		  
			$(document).on({click : function(){
					$('#addClient')[0].focus();
					$('#addClient').val($(this).text());
					$('#t1').text($(this).text());
					$('#t2').text($(this).attr('code'));
					$('#t3').text($(this).attr('officeName'));
					$('#search').empty();
					$('#search').hide();
				},
				mouseenter : function(){
					$(this).addClass('blue') ; 
				},
				mouseleave : function(){
					$(this).removeClass('blue') ; 
				}
				
			},'#search li');
			
			
			$.getWidget('btn_add').click(function(){
				if($.isEmpty($.value('addClient')) || $.isEmpty($('#t1').text())){
					return false;
				}
				if($.value('addClient') != $('#t1').text()){
					return false;
				}
				var str = '<div label="repeat-data" code="'+ $('#t2').text() +'" class="list">';
				str += '<div class="col-sm-10 col-sm-10"><input type="text" class="form-control input-xxlarge" placeholder="'+ $('#t1').text() +'" disabled="disabled"/></div>';
				str += '<div class="col-sm-2 col-sm-2"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i>';
				str += '</button></div></div>';
				
				$('div[label="list-client"]').append(str);
			});
			
			
			$(document).on('click','div.list button',function(){
				$(this).closest('div[label="repeat-data"]').remove();
			});
			
		   //提交
			$.getWidget("save").click(function(){
				if($.validateForm("addGroupForm")){	
					var json = {
							"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
							"locale" : $.getLocale(),
							"officeId" : officeId,
							"name" : $.trim($.value('name')),
							"submittedOnDate" : $.value('submitDate')
					};
					//判断是否含有centerId-->从中心传过来的
					if(!isNaN(centerId)){
						json['centerId'] = centerId;
					}
					var staffId = $.value('staff');
					if($.isEmpty(staffId) || isNaN(staffId)){
						json["staffId"] = null;
					}else{
						json["staffId"] = parseInt(staffId);
					}
					
					var active_val = $('#active').is(':checked');
					if(active_val){
						json["active"] = true;
						json["activationDate"] = $.value('activeDate');
					}else{
						json["active"] = false;
					}
					
					var externalId = $.value('externalId');
					if(!$.isEmpty(externalId)){
						json['externalId'] = externalId;
					}
					
					var clientMembers = [];
					$('div[label="repeat-data"]').each(function(index,item){
						clientMembers.push(parseInt($(this).attr('code')));
					});
					json['clientMembers'] = clientMembers;
					
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "GET",
						data : {
							'dataType' : "POST",
							'mydata' : json,
							'url' : 'api.v1.groups',
							'contentType':"application/json"
						   },
						callback : "addGroup_success"
					});
				   }
			});
			
	});

	function getTemplate(param) {
		officeId = param.officeId;
		$.setSelect('officelist', param.officeOptions, 'id', 'name');
		if(centerId){
			$("#officelist").val(officeId);
			$("#officelist").trigger("change");
			$.hide("officelist");
			officename = param.officeOptions[0].name;
			$("#s1").append(officename);
		}
	}
	
	function getTemplate2(param) { 
		$.setSelect('staff', param.staffOptions, 'id', 'displayName');
		$("#staff").find('select').find('option:first').attr('selected',true);
	}
	
	 
	 function getClientMembers(param){ 
		var pageItems = param.pageItems;
		for(o in pageItems){
			var value_name = pageItems[o].displayName ;
			var value_id = pageItems[o].id;
			var value_office = pageItems[o].officeName;
			$('.dropdown').append('<li class="repeat-data" code="'+ value_id +'" officeName="'+ value_office +'">'+ value_name +'</li>');
		}
		var liNode = $('.dropdown').children().length;
		if(liNode>0){
			 $('#search').show();
		}else{
			$('#search').hide();
		}
	} 
	function addGroup_success(param) {
		$.setReadOnly("addGroupForm");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
	
	
</script>
