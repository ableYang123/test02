<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="editCenterForm" name="editCenterForm">
	<fieldset>
		<legend><spring:message code="label.center.editcenter"/></legend>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="label.center.name"/> <span style="color: #d9534f;">*</span></label>
            
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name"
					name="name" value='' />
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="label.center.staff"/> </label>
			<div class="col-sm-3">
				<select id="staff" name="staff" class="form-control"
					style="width: 198">
				  <option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label"> <spring:message code="label.center.externalId"/> </label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="externalId"
					name="externalId"  />
			</div>
		</div>
		
		<div class="form-group"  id="act" style="display:none;">
			<label class="col-sm-3 control-label"><spring:message code="label.center.activationdate"/><span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
			     <input type="text" datetype="date" id="activationDate" name="activationDate"  local-date="true" afterToday='true'/>
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
       // alert(staffId);
        if (flag.toString() == "Active") {
        	$("#act").css("display","block");
          }
        
			$(document).ready(function(){
				
				$.datetimepicker();
				
				//验证
				$.valid("editCenterForm", [ {
					"name" : "name",
					"notEmpty" : "不为空"
				  }]
				);
				
				//获取对应中心的信息
				 	$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "GET",
							"mydata" : '',
							"url" : "api.v1.centers." +centerId 
						},
						callback : "editback"
					});
			 
				$.nest({  
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.centers."+centerId+"?staffInSelectedOfficeOnly=true&template=true"
					},          
					callback : "client"
				});
				
				
          
				//提交表单
				$.getWidget("save").click(function() {
					
					if ($.validateForm("editCenterForm")) {
						
					 	var language = "zh_CN";
						if($.getCookie("clientLanguage")!==null)
							 language = "en"; 
				
						var name = $.trim($.value("name"));
						
						var staffId = parseInt($("#staff").find("option:selected").attr("value"));
						
						var externalId = $.trim($.value("externalId"));
						
						var activationDate= $('input[name="activationDate"]').val();
						
						if (flag.toString() == "Active") {
							
						    var json={
						    	 "name": name,
								 "staffId": staffId,
								 "externalId": externalId,
								 "dateFormat": $('input[name="activationDate"]').attr('date-format'),
								 "locale":language,
								 "activationDate":activationDate
						         }
						     var url="api.v1.centers."+centerId;
						   
						}else{
							var json={
									 "name": name,
									 "staffId": staffId,
									 "externalId": externalId,
							           }
							var url="api.v1.centers." + centerId+"?staffInSelectedOfficeOnly=true&template=true";
						     }
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "PUT",
								"mydata" : json,
								"url" : url 
							},
							callback : "edit_success"
						});
						
					}
				});
				
				
			});	
			
			//获取下拉框
			function editback(param) {
				var date = $.formatDate(param.activationDate);
				$.assign({
	     			"name" : param.name,
					"externalId" : param.externalId,
					"activationDate":date
				}); 
			}
			
			function client(param){
			   $.setSelect('staff', param.staffOptions, 'id', 'displayName');
			   $('select[name="staff"]').find('option[value="'+ staffId +'"]').attr('selected',true);
			}
			
			function edit_success(param) {
				$.setReadOnly("editCenterForm");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
			}
			
			
		</script>

