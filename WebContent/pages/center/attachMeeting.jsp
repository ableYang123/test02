<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form class="form-horizontal" id="attachMeetingCenter" name="attachMeetingCenter" method="post">
	<fieldset>
		<legend>附加会议</legend>

		<div class="form-group">
			<label class="col-sm-2 control-label">开始日期
			 <span style="color: #d9534f;">*</span>
			</label>
			<div class="col-sm-3">
		       <input type="text" datetype="date" id="startDate" name="startDate" local-date="true" />
			</div>
		</div>

		<div class="form-group">
			<label for="repeat" class="col-sm-2 control-label">重复 </label>
			<div class="col-sm-3">
				<input type="checkbox" id="repeat" name=repeat />
			</div>
		</div>

		
			<div label="detail">
				<span>
				<label class="col-sm-2 control-label" style="padding-top: 10px;">
					<h4 style="padding-top: 10px;">重复细节</h4>
				</label>
			</span>
			<br/>
			<table width="40%">
				<tr>
					<td width="30px">
						<label class="control-label">重复</label>
						<select id="frequency" class="input-sm form-control"></select>
					</td>
					<td style="width: 30%; padding-left: 20px;">
						<label class="control-label">重复每一个</label>
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
		 
		<div class="col-md-offset-3" style="padding-top: 20px;">
			<button type='button' id="save" name="save" class="btn btn-primary">提交</button>
		</div>
	</fieldset>
</form>

 <script type="text/javascript">
    	var weekOptions;
        var week;
        var flag = true;
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
	           $("#frequencyDay option:selected").attr('selected',false);
	           $("#frequencyDay option:first").attr('selected',true);
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
	       
	       	$.getWidget('save').click(function(){
	       		if($.validateForm("attachMeetingCenter")){
	       			var json = {
	       					"repeating":""+flag,
	       					"frequency":parseInt($.value('frequency')),
	       					"interval":$.value('frequencyDay'),
	       					"repeatsOnDay":$("input[name='weekly']:checked").val(),
	       					"startDate":$.value('startDate'),
	       					"locale":"zh_CN",
	       					"dateFormat":$('input[name="startDate"]').attr('date-format'),
	       					"typeId":"1",
	       					"title":"centers_"+ centerId +"_CollectionMeeting"
	       				};
	       			
	       			console.log(json);
	       			
	       			$.nest({
	          			url : "<c:url value='/fineract.do'/>",
	          			type : "post",
	          			data : {
	          				"dataType" : "POST",
	          				"mydata" : json,
	          				"url" : "api.v1.centers."+centerId+".calendars",
	          				"contentType":"application/json"
	          			},
	          			callback : "attach_success"
	          		 }); 
	       			
	       		}
	       	});
       
      });
        function init(){
        	  $.nest({
      			url : "<c:url value='/fineract.do'/>",
      			type : "post",
      			data : {
      				"dataType" : "GET",
      				"mydata" : "",
      				"url" : "api.v1.centers."+centerId+".calendars.template"
      			},
      			callback : "callback1"
      		 }); 
        }
        
        function callback1(param) {
        	weekOptions = param.repeatsOnDayOptions;
        	week = param.repeatsOnDay.id;
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
    			"frequency" : param.frequency.id
    		});
    	}
        
      function showDay(str){
    	  var td_node = $('#frequency').closest('tr').find('td:last');
    	  if(str === 'daily'){
    		  td_node.children(':first').text('day(s)');
    		  setDay(3);
    	  }else if(str === 'yearly'){
    		  td_node.children(':first').text('year(s)');
    		  setDay(3);
     	}else if(str === 'monthly'){
     		td_node.children(':first').text('month(s)');
     		setDay(12);
     		
     	}else{
     		 td_node.children(':first').text('week(s)');
     		 setDay(5);
     	}
      }
      
      function setDay(n){
    	  $('#frequencyDay option').each(function(index,item){
   			var $thisVal = $(this).val();
   			if($thisVal > n){
	        		$(this).css("display","none");
	        	}else{
	        		$(this).css("display","block");
	        	}
 	       });
      }
      
      function attach_success(param){
    	$.setReadOnly("attachMeetingCenter");
  		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
  		window.location.href="<c:url value='loadPage.do?nextPage=center.detail'/>&centerId="+ centerId;
      }
	 
</script>