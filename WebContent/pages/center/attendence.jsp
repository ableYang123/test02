<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="attendenceForm" name="attendenceForm" method="post">
	<fieldset>
		<legend><spring:message code="lable.center.attendance"/></legend>

		<div class="form-group">
			<label class="col-sm-3 control-label"><spring:message code="lable.center.meetingdate"/><span style="color: #d9534f;">*</span></label>
			<div class="col-sm-3">
				<input type="text" datetype="date" id="MeetingDate" name="MeetingDate"  local-date="true"/>
				<p style="font-size:14px;"><spring:message code="lable.center.nextMeetingon"/>:<span id="nextDate"></span></p>
			</div>
			
			<label></label>
			<div class="col-sm-5">
				<table id="attendence" class="table">
					<thead>
						 <tr style="background-color:#F5F5F5;" id="tr1">
							 <td style="width:80px;" >Name</td>
							 <td>Attendence</td>
						 </tr>
				 	</thead>
				 	<tbody>
				 	
				 	</tbody>
				</table>
			</div>
			
		</div>

		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="label.center.submit"/></button>
			</div>
		</div>
		
	</fieldset>
</form>
<script type="text/javascript">

$(document).ready(function(){
	$.datetimepicker();
	
	$.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		async : true,
		data : {
			"dataType" : "GET",
			"mydata" : '',
			"url" : "api.v1.centers."+centerId+"?associations=groupMembers,collectionMeetingCalendar"
		},
		callback : "loadMeeting"
	});
	
	$.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		async : true,
		data : {
			"dataType" : "GET",
			"mydata" : '',
			"url" : "api.v1.centers."+centerId+".meetings.template?calenderId=" + calendarId
		},
		callback : "loadClient"
	});
	
	$.getWidget("save").click(function() {
	   if ($.validateForm("attendenceForm")) {
			var meetingDate = $.value('MeetingDate');
			var dateFormat = $('input[name="MeetingDate"]').attr('date-format');
			var clientsAttendance = [];
			if($('#attendence tbody').children().length > 0){
				$('#attendence tbody tr').each(function(){
					var clientId = parseInt($(this).find('td:first').attr('code'));
					var attendanceType = parseInt($(this).find('select[name="attend"] option:selected').val());
					var clientJson = {
							"clientId" : clientId,
							"attendanceType" : attendanceType
					};
					clientsAttendance.push(clientJson);
				});
			}
			
			var json={
					'calendarId' : calendarId,
					'clientsAttendance' : clientsAttendance,
					'dateFormat' : dateFormat,
					'locale' : "zh_CN",
					'meetingDate' : meetingDate
			   }
	
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "Post",
					"mydata" : json,
					"url" : "api.v1.centers."+centerId+".meetings?calendarId="+calendarId
				},
				callback : "attendenceSuccess"
	          });
	     }	
   });	
});
     function loadMeeting(param){
    	 var nextDate = $.formatDate(param.collectionMeetingCalendar.nextTenRecurringDates[0]);
    	 $('#nextDate').text(nextDate);
     }
      function loadClient(param){
    	 if(param.clients.length>0){
    	 for(var i=0;i<param.clients.length;i++){
    		var name1 = param.clients[i].displayName;
    		var code = param.clients[i].id;
			var str='';
			str += '<tr><td style="width:40px;" code="'+code+'">'+name1+'</td><td><select name="attend"></select></td></tr>';
    		$("#attendence tbody").append(str);	
    	 }
    	// $('#tab select[name="attend"]').attr('style','width:80px;').attr('style','height:35px;')
    	 $.setSelect('attendence select[name="attend"]', param.attendanceTypeOptions, 'id', 'value'); 
      }
  }  
      
      function attendenceSuccess(param){
    		$.setReadOnly("attendenceForm");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			window.location.href="loadPage.do?nextPage=center.detail&centerId="+centerId;
      }
</script>

