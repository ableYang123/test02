<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal" id="addCenterForm" name="addCenterForm" method="post">
	<fieldset>
		<legend><spring:message code="lable.center.createCenter"/></legend>

		<div class="form-group">
			<label for="name" class="col-sm-2 control-label"><spring:message code="label.center.name"/>
				<span class="required" style="color: red">*</span>
			</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" value='' />
			</div>
		</div>

		<div class="form-group">
			<label for="office" class="col-sm-2 control-label"><spring:message code="label.center.officeName"/>
				<span class="required" style="color: red">*</span>
			</label>

			<div class="col-sm-3">
				<select id="office" name="office" class="form-control" style="width: 198">
					<option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="staff" class="col-sm-2 control-label"><spring:message code="label.center.staff"/></label>
			<div class="col-sm-3">
				<select id="staff" name="staff" class="form-control" style="width: 198">
					<option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>

		<div class="form-group">
				<label for="active" class="col-sm-2 control-label"><spring:message code="label.center.isactive"/></label>
				<div class="col-sm-3">
					<input type="checkbox" id="active" name="active" />
				</div>
	
				<label for="active" class="col-sm-2 control-label" id="label" style="display: none"><spring:message code="label.center.activationdate"/>
				    <span class="required" style="color: red">*</span>
				</label>
				<div id="upload1" class="col-sm-3" style="display: none">
					<input type="text" datetype="date" id="activeDate" name="activeDate" local-date="true" afterToday="true" />
				</div>
		</div>

		<div class="form-group">
			<label for="externalId" class="col-sm-2 control-label"><spring:message code="label.center.externalId"/></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="externalId" name="externalId" />
			</div>
		</div>

		<div class="form-group">
			<label for="submitDate" class="col-sm-2 control-label"><spring:message code="label.center.submitdate"/></label>
			<div class="col-sm-3" >
				<input type="text" datetype="date" name="submitDate" id="submittedDate" local-date="true" afterToday='true'/>
			</div>
		</div>

      <div class="form-group">
			<label for="selectGroup" class="col-sm-2 control-label"><spring:message code="lable.center.selectandaddgroups"/></label>

			<div class="col-sm-3">
				<select id="selectGroup" name="selectGroup" class="form-control" style="width: 198;">
					<option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
				<div class="row" label="list-group">
			
				</div>
			</div>
			<div class="col-sm-1 col-md-1" id="lb2" style="display: none">
			 	<button label="plus" type="button" class="btn btn-primary" style="padding: 10px;"><i class="glyphicon glyphicon-plus"></i></button>
			</div>
			<div class="col-sm-6">
				<table class="table" id="tb1" style="display: none">
				    <tr><input type=text class="form-control" style="display: none" /></tr>
					<tr>
						<td colspan="2"><spring:message code="label.center.groupSearchDetails"/></td>
					</tr>
					<tr>
						<td width="36%"><spring:message code="label.center.name"/></td>
						<td id="t1"></td>
					</tr>
					<tr>
						<td  width="36%">ID</td>
						<td id="t2"></td>
					</tr>
					<tr>
						<td  width="36%"><spring:message code="label.center.officeName"/></td>
						<td id="t3"></td>
					</tr>
				</table>
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
			//日期控件
			$.datetimepicker();
		   //验证不为空
			$.valid("addCenterForm", [ {
				"name" : "name",
				"notEmpty" : "不为空"
			}]);
			   
           $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "get",
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.offices"
				},
				callback : "callback1"
			}); 
			
			$.getWidget("office").change(function(){
				
			   var officeId = parseInt($("#office").find("option:selected").attr("value"));  
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.centers.template?officeId="+officeId+"&staffInSelectedOfficeOnly=true"
					},
					callback : "client"
				});
				$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "get",
						data : {
							"dataType" : "GET",
							"mydata" : "",
							"url" : "api.v1.groups?officeId="+officeId
						},
						callback : "callback2"
					});	
				
				
				$.getWidget("selectGroup").change(function(){
					 var staffId=parseInt($.value('staff'));
					 var groupName=$("#selectGroup").find("option:selected").text();
					 var groupId=parseInt($("#selectGroup").find("option:selected").attr("value"));
					 var office_name=$("#office").find("option:selected").text();
					 $("#t1").text(groupName);
					 $("#t2").text(groupId);
					 $("#t3").text(office_name);
					 $("#tb1").css("display", "block");
					 $("#lb2").css("display", "block");
				});	   
			});
			
			$('#lb2').on('click','button',function(){
				if($(this).attr('label') === 'plus'){
					var str = '<div label="repeat-data" code="'+ $('#t2').text() +'">';
					str += '<div class="col-sm-12 col-md-12" style="margin-top: 2px;"><input type="text" class="form-control input-xxlarge" placeholder="'+ $('#t1').text() +'" disabled="disabled"/></div>';
					str += '</div>';
					$('div[label="list-group"]').append(str);
					
					var str1 = '<button code="'+$('#t2').text()+'" label="del" type="button" class="btn btn-primary" style="padding: 10px;"><i class="glyphicon glyphicon-remove"></i></button>'
					$('#lb2').append(str1);
				}else{
					$('div[label="list-group"]').find('div[code="'+ $(this).attr('code') +'"]').remove();
					$(this).remove();
				}
			});
			
			 //提交
			$.getWidget("save").click(function(){
				if($.validateForm("addCenterForm")){
					var groupId=parseInt($("#selectGroup").find("option:selected").attr("value"));
					var externalId = $.trim($.value("externalId"));
					var staffId=parseInt($.value('staff'));
					officeId = parseInt($("#office").find("option:selected").attr("value"));
					var value = $("#active").attr("lang");
					var groupName=$("#selectGroup").find("option:selected").text();
					var groupMembers = [];
					$('div[label="repeat-data"]').each(function(index,item){
						groupMembers.push(parseInt($(this).attr('code')));
					});
					var json = {
						"officeId":officeId,
						"name" : $.value('name'),
						"dateFormat" : $('input[name="submitDate"]').attr('date-format'),
						"submittedOnDate" : $.value('submitDate'),
						"locale" : "zh_CN",
						"groupMembers" : groupMembers
					};
					if(!$.isEmpty(externalId)){
						json['externalId'] = externalId;
					}
					if(!isNaN(staffId)){
						json['staffId'] = staffId;
					}
					if(value == 1){
						json["active"] = true;
						json["activationDate"] = $.value("activeDate");
					} else {
						json["active"] = false;
					}

					$.nest({
								url : "<c:url value='/fineract.do'/>",
								type : "post",
								data : {
									'dataType' : "POST",
									'mydata' : json,
									'url' : 'api.v1.centers'
								},
								callback : "call1back"
					});
				}
			});
		});

	function callback1(param) {
		$.setSelect('office', param, 'id', 'name');
	}
	function callback2(param) {
		$.setSelect('selectGroup', param, 'id', 'name');
	}

	function client(param) {
		$.setSelect('staff', param.staffOptions, 'id', 'displayName');
	}

	function call1back(param) {
		$.setReadOnly("addCenterForm");
		init();
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		 window.location.href='<c:url value="loadPage.do?nextPage=center.listCenters"/>&centerId='+centerId
		//$.openWindow("loadPage.do?nextPage=center.listCenters");
	}
</script>

