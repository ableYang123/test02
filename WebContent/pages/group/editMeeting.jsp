<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
		<form class="form-horizontal" id="editmeetingform" name="editmeetingform">
			<fieldset>
				<legend><spring:message code="group.edit.meeting"/>
                  <span class="pull-right">
                  	 <button id="editmeeting" name="editmeeting" type="button" class="btn btn-primary"><spring:message code="group.change.future.meeting"/></button>
                  </span>
            </legend>
            <div class="form-group">
            <alert type="danger"><spring:message code="group.note.care"/></alert>
            </div>
             <div class="form-group">
                <label class="control-label col-sm-2"><spring:message code="group.meeting.details"/></label>
                <table width="40%">
				<tr>
					<td width="30px">
						<label class="control-label"><spring:message code="group.repeat"/></label>
						<select id="frequency" class="input-sm form-control"></select>
					</td>
					<td style="width: 30%; padding-left: 20px;">
						<label class="control-label"><spring:message code="group.repeat.every"/></label>
						<select id="frequencyDay" class="input-sm form-control">
							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</td>
					<td style="width: 40%; padding-top: 25px;">
						<label class="control-label">day(s)</label>
					</td>
				</tr>
					
			</table>
			<div class="form-group">
				<label class="col-sm-2"></label>
				<table id="week"  width="40%">
				<tbody>
					<tr>
					</tr>
				</tbody>
			</table>
                </div>
            </div>
            <br>
            <div class="form-group">
             <label class="control-label col-sm-3"><spring:message code="group.above.changes.from"/><span style="color: #d9534f;">*</span></label>
             	<div class="col-sm-3">
					  <input type="text" datetype="date" id="startDate" name="startDate" local-date="true" />
				</div>
            </div>
            <div class="col-md-offset-4">
	            <button id="save" name="save" type="button" class="btn btn-primary"><spring:message code="btn.submit"/></button>
	        </div>
			</fieldset>
		</form>
		
		<!-- 变更未来会议 -->
		<form class="form-horizontal" id="editfuturemeetingform" name="editfuturemeetingform" style="display:none">
		  <fieldset>
			<legend><spring:message code="group.edit.meeting"/></legend>
			<div>
			<div class="form-group">
            <label class="control-label col-sm-2"><spring:message code="group.now.meetings.date"/></label>
            <div class="col-sm-3">
				<select  value="" class="form-control" name="presentmeetingdateId" id="presentmeetingdateId">
					<option style="display:none" value="" selected="selected"></option>
				</select>
			</div>
            <label class="control-label col-sm-2"><spring:message code="group.edit.meetings.date"/></label>
            <div class="col-sm-3">
				<input type="text" datetype="date" id="newmeetingdateId" name="newmeetingdateId" />
			</div>
			</div>
            <div class="col-md-offset-4">
	            <button id="save2" name="save2" type="button" class="btn btn-primary"><spring:message code="btn.submit"/></button>
	        </div>
	      </fieldset>
		</form>
		<script type="text/javascript">
		var weekOptions;
        var week;
        var flag = true;   
        var Presentmeetingdate;
        $(document).ready(function(){
	       
	        $.datetimepicker();
	      	//页面加载初始化
	      	init();
	      
	       //显示天数
	        showDay('daily');
       
        
	        $("#repeat").click(function(){
	      	  //判断是否选中
	      	  if($("#repeat").is(':checked')){
	      		  $("div[label='detail']").css("display","block");
	      		 flag = true;
	      	  }else{
	      		  $("div[label='detail']").css("display","none");
	      		flag = false;
	      	  }
	        });
        
	       $(document).on('change',"#frequency",function(){
	    	   var category= $(this).find("option:selected").text();
	    	 	//显示天数
	           showDay(category);
	          // $("#frequencyDay option:selected").attr('selected',false);
	          // $("#frequencyDay option:first").attr('selected',true);
	    	 if(category == 'weekly'){
	    		 //判断星期表tbody中是否存在数据
	    		 var len = $('#week tbody tr').children().length;
	    		 if(len <= 0){
	    			 $.each(weekOptions,function(index,item){
	    				 var id = item.id;
	    				 var code = item.code.split('\.');
	    				 var label = code[code.length-1].substring(0,3).toUpperCase();
	    				 if(id === week){
	    					 var str = '<td style="padding: 0 10px;"><input type="radio" name="weekly" value="'+ id +'" label="'+ label +'" checked/>'+ label +'</td>';
	    				 }else{
	    					 var str = '<td style="padding: 0 10px;"><input type="radio" name="weekly" value="'+ id +'" label="'+ label +'" />'+ label +'</td>';
	    				 }
	    				 $('#week tbody tr').append(str);
	    				 $.show('week');
	    			 });
	    		 }else{
	    			 $("input:radio[value='"+ week +"']")[0].checked = true;
	    			 $.show('week');
	    		 }
	    	 }else{
	    		 $("input[name='weekly']:checked").attr('checked',false);
	    		 $.hide('week');
	    	 }
	       });
	       
	       //提交编辑会议
	       	$.getWidget('save').click(function(){
	       		if($.validateForm("editmeetingform")){
	       			var json = { 
	       					"repeating":""+flag,
	       					"frequency":parseInt($.value('frequency')),
	       					"interval":$.value('frequencyDay'),
	       					"repeatsOnDay":$("input[name='weekly']:checked").val(),
	       					"startDate":$.value('startDate'),
	       					"locale":$.getLocale(),
	       					"dateFormat":$('input[name="startDate"]').attr('date-format'),
	       					"typeId":"1",
	       					"title":"groups_"+ groupId +"_CollectionMeeting"
	       				};	 
	       			
	       			if('${pd.pageType}' === 'center'){
	       				BaseNestPUT("api.v1.centers.${pd.centerId}.calendars."+calendarId,json,'attach_success');
	       			}else{
	       				BaseNestPUT("api.v1.groups."+groupId+".calendars."+calendarId,json,'attach_success');
	       			}
	       		}
	       	});
	         //提交变更未来会议
	       	$.getWidget('save2').click(function(){	      			
	       			if(ckdate()){
	       				if($.validateForm("editfuturemeetingform")){
			       			var json = { 
			       					"dateFormat":$('input[name="startDate"]').attr('date-format'),
			       					"locale":$.getLocale(),
			       					"newMeetingDate":$.value('newmeetingdateId'),
			       					"presentMeetingDate":$.value('presentmeetingdateId'),
			       					"reschedulebasedOnMeetingDates":true
			       				};
	       			}
		       			if('${pd.pageType}' === 'center'){
		       				BaseNestPUT("api.v1.centers.${pd.centerId}.calendars."+calendarId,json,'attach_success2');
		       			}else{
		       				BaseNestPUT("api.v1.groups."+groupId+".calendars."+calendarId,json,'attach_success2');
		       			}
		       		}
	       	});
      });
        
        function init(){
        	 //判断是否从中心传递过来的
        	  if('${pd.pageType}' === 'center'){
        		  BaseNestGET("api.v1.centers.${pd.centerId}.calendars.${pd.calendarId}?template=true",'callback1');
        	  }else{
        		  BaseNestGET("api.v1.groups."+groupId+".calendars."+calendarId+"?template=true",'callback1');
        	  }
        }
        //切换层
        $("#editmeeting").click(function(){
        	  $("#editmeetingform").css("display","none");
        	  $("#editfuturemeetingform").css("display","block");
        });
        
        function callback1(param) {
        	weekOptions = param.repeatsOnDayOptions;
        	Presentmeetingdate = param.nextTenRecurringDates;
        	 //对修改会议里的现有会议日期进行遍历，添加到下拉框中
         	for(var i in Presentmeetingdate){
         		Presentmeetingdate[i]=$.formatDate(Presentmeetingdate[i]); 
         	}
         	$.setSelectByList('presentmeetingdateId',Presentmeetingdate);
        	if(!$.isEmpty(param.repeatsOnDay)){
        		week = param.repeatsOnDay.id;
        	}else{
        		week = 1;
        	}
        	
        	var foptions = [];
        	$.each(param.frequencyOptions,function(index,item){
        		var jsonObj = {};
        		var val = item.code.split('\.');
        		jsonObj['id'] = item.id;
        		jsonObj['value'] = val[val.length-1];
        		foptions.push(jsonObj);
        	});
    		$.setSelect('frequency', foptions, 'id', 'value');
    		
    		$.assign({
    			"frequency" : param.frequency.id,
    			"frequencyDay" : param.interval,
    			"startDate" : $.formatDate(param.startDate)
    		});
    		showDay($('#frequency option:selected').text());
    		if((param.frequency.value.indexOf('WEEKLY')) > -1){
    			 //判断星期表tbody中是否存在数据
	    		 var len = $('#week tbody tr').children().length;
	    		 if(len <= 0){
	    			 $.each(weekOptions,function(index,item){
	    				 var id = item.id;
	    				 var code = item.code.split('\.');
	    				 var label = code[code.length-1].substring(0,3).toUpperCase();
	    				 if(id === week){
	    					 var str = '<td style="padding: 0 10px;"><input type="radio" name="weekly" value="'+ id +'" label="'+ label +'" checked/>'+ label +'</td>';
	    				 }else{
	    					 var str = '<td style="padding: 0 10px;"><input type="radio" name="weekly" value="'+ id +'" label="'+ label +'" />'+ label +'</td>';
	    				 }
	    				 $('#week tbody tr').append(str);
	    				 $.show('week');
	    			 });
	    		 }else{
	    			 $("input:radio[value='"+ week +"']")[0].checked = true;
	    			 $.show('week');
	    		 }
    		}
    		
    		
    	}
        
      function showDay(str){
    	  var td_node = $('#frequency').closest('tr').find('td:last');
    	  if(str === 'daily'){
    		  td_node.children(':first').text('day(s)');
    		  $('#frequencyDay option').each(function(index,item){
     	        	var $thisVal = $(this).val();
     	        	
    	        	if($thisVal > 3){
    	   	        	$(this).css("display","none");
    	   	        }else{
    	   	        	$(this).css("display","block");
    	   	        }
     	        });
    	  }else if(str === 'yearly'){
    		  td_node.children(':first').text('year(s)');
    		  $('#frequencyDay option').each(function(index,item){
   	        	var $thisVal = $(this).val();
   	        	
	      		if($thisVal > 3){
	 	        	$(this).css("display","none");
	 	        }else{
	 	        	$(this).css("display","block");
	 	        }
   	        });
     	}else if(str === 'monthly'){
     		 td_node.children(':first').text('month(s)');
     		 $('#frequencyDay option').each(function(index,item){
  	        	$(this).css("display","block");
  	        });
     		
     	}else{
     		 td_node.children(':first').text('week(s)');
     		 $('#frequencyDay option').each(function(index,item){
     			var $thisVal = $(this).val();
     			if($thisVal > 5){
	        		$(this).css("display","none");
	        	}else{
	        		$(this).css("display","block");
	        	}
   	        });
     	}
      }
       //判断现有会议日期和修订会议日期
      function ckdate() {
          var endtime = $.value('newmeetingdateId');
          var starttime = $.value('presentmeetingdateId'); 
          var mydate = new Date();
          var year=mydate.getFullYear();
          var month=mydate.getMonth() + 1;
          var date=mydate.getDate(); 
          var nowtime=year+"-"+(month<10 ? "0" + month : month)+"-"+(date<10 ? "0"+ date : date);
          if(starttime!='' && endtime!=''){
        	         
          if (endtime < nowtime) {
        	  $.bAlert('<spring:message code="group.prompt.not.past"/>'); 
              return false;
          }
          else {
              return true;
          }
          }else {
        	  $.bAlert('<spring:message code="group.prompt.content"/>');
          }
      }
          
       
       function BaseNestGET(apiUrl,backFunc){
    	   $.nest({
   			url : "<c:url value='/fineract.do'/>",
   			type : "post",
   			data : {
   				"dataType" : "GET",
   				"mydata" : "",
   				"url" : apiUrl
   			},
   			callback : backFunc
   		 }); 
       }
       
       function BaseNestPUT(apiUrl,json,backFunc){
    	   $.nest({
      			url : "<c:url value='/fineract.do'/>",
      			type : "post",
      			data : {
      				"dataType" : "PUT",
      				"mydata" : json,
      				"url" : apiUrl
      			},
      			callback : backFunc
      		 }); 
       }
       
      function attach_success(param){
    	$.setReadOnly("editmeetingform");
  		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
      } 
      function attach_success2(param){
    	$.setReadOnly("editfuturemeetingform");
  		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
      }
		</script>

