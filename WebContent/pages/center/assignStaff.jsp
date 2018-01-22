<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="assignStaffCenter" name="assignStaffCenter" method="post">
	<fieldset>

		<legend><spring:message code="label.center.assignStaff"/></legend>


		<div class="form-group">
			 <label for="staff" class="col-sm-2 control-label"><spring:message code="label.center.staff"/>
			     <span class="required" style="color: red">*</span>
			 </label>
			
			<div class="col-sm-3">
				<select id="staff" name="staff" class="form-control "
					style="width: 198">
					<option selected="selected"><spring:message code="label.center.chose"/></option>
				</select>
			</div>
		</div>


		<div class="form-group">
			<div class="text-right" style="padding-right: 80px">
				<button type="button" id="save" name="save" class="btn btn-primary"><spring:message code="label.center.submit"/></button>
			</div>
		</div>
	</fieldset>
</form>

 <script type="text/javascript">
   $(document).ready(function() {
		 $.valid("assignStaffCenter", [ {
				"staff" : "staff",
				"notEmpty" : "不为空"
			}]
		  );
		 
          $.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "get",
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.groups."+centerId+"?groupOrCenter=centers&staffInSelectedOfficeOnly=true&template=true"	
			},    
			callback : "assignInit"
		  }); 
		  

          //提交表单
          $.getWidget("save").click(function() {
        	 var staffId= parseInt($("#staff").find("option:selected").attr("value"));
        	 var json={
                "staffId": staffId
                }
        	 
        	  $.nest({
        			url : "<c:url value='/fineract.do'/>",
        			type : "post",
        			data : {
        				"dataType" : "POST",
        				"mydata" : json,
        				"url" : "api.v1.groups."+centerId+"?command=assignStaff"
        			},           
        			callback : "assignSuccess"
        		  }) ;   
          }); 
      }); 
   
   
	        function assignInit(param){
	        	$.setSelect('office',param,'id','name');
	        	$.setSelect('staff',param.staffOptions,'id','displayName');	
	        }
	   	              
	        function assignSuccess(param){
	        	$.setReadOnly("assignStaffCenter");
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
	        }
			
 
 </script>