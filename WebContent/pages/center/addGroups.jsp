<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style type="text/css">
	.list {
		padding-bottom: 40px;
	}
</style>
<form class="form-horizontal" id="addGroupForm" name="addGroupForm" method="post">
	<fieldset>
		<legend><spring:message code="label.center.addgroup"/></legend>

		<div class="form-group">
			<label for="office" class="col-sm-2 control-label"><spring:message code="label.center.officeName"/>
			</label>
			<div class="col-sm-3">
				<span id="s1"></span>
			</div>
			
			<label for="externalId" class="col-sm-2 control-label"><spring:message code="label.center.externalId"/></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="externalId" name="externalId" />
			</div>
		</div>
		
		<div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label"><spring:message code="label.center.name"/><span
					class="required" style="color: red">*</span>
				</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name" name="name" value='' />
				</div>
			</div>
			<div class="form-group">
				<label for="submitDate" class="col-sm-2 control-label"><spring:message code="label.center.submitdate"/></label>
				<div class="col-sm-3" >
					<input type="text" datetype="date" name="submitDate" local-date="true" afterToday="true"/>
				</div>
			</div>
		</div>
		



		<div class="form-group">
			<label for="staff" class="col-sm-2 control-label"><spring:message code="label.center.staff"/></label>
			<div class="col-sm-3">
				<select id="staff" name="staff" class="form-control "
					style="width: 198">
					<option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="active" class="col-sm-2 control-label"><spring:message code="label.center.active"/></label>
			<div class="col-sm-3">
				<input type="checkbox" id="active" name="active" />
			</div>
			
			<label for="activeDate" class="col-sm-2 control-label" id="label" style="display: none"><spring:message code="label.center.activationdate"/>
			    <span class="required" style="color: red">*</span>
			</label>
			<div id="upload1" class="col-sm-3" style="display: none">
				<input type="text" datetype="date" name="activeDate" local-date="true" afterToday='true' />
			</div>
		</div>
			
				
		
		

		
      <div class="form-group">
			<label for="selectGroup" class="col-sm-2 control-label"><spring:message code="label.center.addclient"/>
			</label>
			<div class="col-sm-4 col-md-4">
				 <input datatype="search" class="form-control" id="addClient" name="addClient" textname="displayName" autocomplete="off"/>
				<table class="table" >
					<tr>
						<td><spring:message code="label.center.aclientDetails"/></td>
					</tr>
					<tr>
						<td><spring:message code="label.center.name"/></td>
						<td id="t1"></td>
					</tr>
					<tr>
						<td>ID</td>
						<td id="t2"></td>
					</tr>
					<tr>
						<td><spring:message code="label.center.officeName"/></td>
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
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
			</div>
		</div>

	</fieldset>
</form>



<script type="text/javascript">
	var clientOptions;
    var officeId;
    var officename;
   
	 
		
	
		$(document).ready(function() {
			//日期控件
			$.datetimepicker();
			
			   //验证不为空
				$.valid("addGroupForm", [ {
					"name" : "name",
					"notEmpty" : ""
				}]
			);
	
			$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.groups.template?centerId="+centerId+"&orderBy=name&sortOrder=ASC&staffInSelectedOfficeOnly=true"
					},
					callback : "getTemplate"
			});
		  
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
			
		   $(document).on('click','#searchBoxUl_addClient li ',function(){
		    	//$(this).hide();
		    	$('#addClient')[0].focus();
				$('#addClient').val($(this).text());
		    	$('#t1').text($(this).text());
		    	$('#t2').text($(this).attr('_id'));
		    	$('#t3').text($(this).attr('_officename'));
		    	$('#searchBoxUl_addClient').empty();
				$('#searchBoxUl_addClient').hide();
		    });
				
			
			$.getWidget('btn_add').click(function(){
				if($.isEmpty($.value('addClient')) || $.isEmpty($('#t1').text())){
					return false;
				}
				if($.value('addClient') != $('#t1').text()){
					return false;
				}
				var str = '<div label="repeat-data" code="'+ $('#t2').text() +'" class="list">';
				str += '<div class="col-sm-10 col-md-10"><input type="text" class="form-control input-xxlarge" placeholder="'+ $('#t1').text() +'" disabled="disabled"/></div>';
				str += '<div class="col-sm-2 col-md-2"><button type="button" class="btn btn-primary" style="margin: 0 10px;"><i class="glyphicon glyphicon-remove"></i>';
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
							"centerId" : centerId,
							"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
							"locale" : "zh_CN",
							"officeId" : officeId,
							"name" : $.trim($.value('name')),
							"submittedOnDate" : $.value('submitDate')
					};
					
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
					//当有添加客户时，跳转到批准页面
					if(clientMembers.length > 0){
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
					}else{	//没有添加客户时，跳转到组详情页面去添加客户处理
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "GET",
							data : {
								'dataType' : "POST",
								'mydata' : json,
								'url' : 'api.v1.groups',
								'contentType':"application/json"
							   },
							callback : function(param){
								$.nest({
									url : "<c:url value='/fineract.do'/>",
									type : "post",
									async : true,
									data : {
										"dataType" : "GET",
										"mydata" : "",
										"url":"api.v1.centers."+centerId+'?associations=groupMembers,collectionMeetingCalendar'
									},
									callback :function(param2){
										var staffId;
										if($.isEmpty(param2.staffId)){
											staffId = 0;
										}else{
											staffId = param2.staffId;
										}
										window.location.href="loadPage.do?nextPage=group.detail&officeId="+param2.officeId+"&staffId="+staffId+"&userId="+${userId}+"&officeName="+param2.officeName+"&groupId="+param2.id;
									}
								});
							}
						});
					}
					
				   }
			});
	});

	function getTemplate(param) {
		officeId = param.officeId;
		officename = param.officeOptions[0].name;
		 $("#s1").text(officename);
		clientOptions = param.clientOptions;
		$("#s1").text(officename);
		//初始化搜索框
		var keyArr = ['id','officeName'];
		var api_url = 'api.v1.clients?officeId='+officeId+'&orderBy=displayName&orphansOnly=true&sortOrder=ASC&displayName=';
		$('#addClient').attr('api',api_url);
		$.inputSearchInit(clientOptions,keyArr,'searchClient','true','false');
		//getClient();
		
		$.setSelect('staff', param.staffOptions, 'id', 'displayName');
	}
	
	function addGroup_success(param) {
		$.setReadOnly("addGroupForm");
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		//window.location.href="<c:url value='loadPage.do?nextPage=center.detail'/>&type="+2+"&officeId="+ officeId +"&centerId="+ centerId +"&officename="+ officename;
	}
	
	/* function searchClient(obj){
		console.log(1);
		$('#addClient')[0].focus();
		$('#addClient').val($(obj).text());
    	$('#t1').text($(obj).text());
    	$('#t2').text($(obj).attr('_id'));
    	$('#t3').text($(obj).attr('_officename'));
    	$('#searchBoxUl_addClient').empty();
		$('#searchBoxUl_addClient').hide();
	} */
</script>
