<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="manageGroupForm" name="manageGroupForm" method="post">
	<fieldset>
        <div class="row">
        	<div class="col-md-7">
        		<legend><spring:message code="label.center.associateNewGroups"/></legend>
        		<div class="form-group">
					<label for="searchGroup" class="col-sm-4 control-label"><spring:message code="label.center.searchforaGroup"/></label>
					<div class="col-sm-4 col-md-4">
						<input datatype="search" id="searchGroup" name="searchGroup" api="" textname="name" autocomplete="off" class="form-control">
						<!-- <ul id="search"></ul> -->
					</div>
					<div class="col-sm-1 col-md-1">
						<button id="btn_add" type="button" class="btn btn-primary" style="display: none;">
							<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
						</button>
					</div>
				</div>
				 <div class="form-group">
		          	<div label="avaliable" class="col-md-6 col-md-offset-1">
				   		<p><spring:message code="label.center.groupSearchDetails"/></p>
							<table class="table" >
							<tbody>
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
							</tbody>
						</table>
		          	</div>
				</div>
        	</div>
        	<div label="list-group" class="col-md-5">
				<legend><spring:message code="label.center.groupDetails"/></legend>
			</div>
		
        </div>
		
		
		<div class="col-sm-3 col-md-offset-5">
			<div class="form-group">
				<button type="button" id="back" name="back" class="btn btn-primary">返回</button>
			</div>
		</div>
	</fieldset>
</form>
<script type="text/javascript">
   
    
		$(document).ready(function() {
			load();
			
			$(document).on('click','div[label="repeat-data"] button',function(){
				var div_node = $(this).closest('div[label="repeat-data"]');
				var groupMembers = [];
				groupMembers.push(parseInt(div_node.attr('code')));
				var json = {"groupMembers":groupMembers};
				
				//调用delete方法
				deleteGroup(json);
			});
			
			$(document).on('click','#searchBoxUl_searchGroup li ',function(){
		    	//$(this).hide();
		    	$('#searchGroup')[0].focus();
				$('#searchGroup').val($(this).text());
		    	$('#t1').text($(this).text());
		    	$('#t2').text($(this).attr('_id'));
		    	$('#t3').text($(this).attr('_officename'));
		    	$('#searchBoxUl_searchGroup').empty();
				$('#searchBoxUl_searchGroup').hide();
				
				if(!$.isEmpty($.value('searchGroup'))){
					$.show('btn_add')
				}
				
				
		    });
			
			$.getWidget('btn_add').click(function(){
				if($.isEmpty($.value('searchGroup')) || $.isEmpty($('#t1').text())){
					return false;
				}
				if($.value('searchGroup') != $('#t1').text()){
					return false;
				}
				
				var group = [parseInt($('#t2').text())];
				var req_json = {'groupMembers':group};
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : req_json,
						"url" : "api.v1.centers."+ centerId +"?command=associateGroups"
					},
					callback : function(param){
						var content = $('#t1').text() + '(id:'+  $('#t2').text()+')';
						var str = '<div label="repeat-data" code="'+ $('#t2').text() +'" class="form-group">';
						str += '<div class="col-sm-6 col-md-6"><input type="text" class="form-control input-xxlarge" placeholder="'+ content +'" disabled="disabled"/></div>';
						str += '<div class="col-sm-2 col-md-2"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i>';
						str += '</button></div></div>';
						
						$('div[label="list-group"]').append(str);
					}
				});
			});
			
		   //提交
			$.getWidget("back").click(function(){
				window.location.href="loadPage.do?nextPage=center.detail&centerId=" + centerId;
			  });

	   });
		
		function load(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.centers."+centerId+"?associations=groupMembers&template=true"
				},
				callback : "mainback"
			});
		}
	   function mainback(param){
		 //初始化搜索框
		var keyArr = ['id','officeName'];
		var api_url = 'api.v1.groups?officeId='+param.officeId+'&orderBy=name&orphansOnly=true&sortOrder=ASC&name=';
		$('#searchGroup').attr('api',api_url);
		$.inputSearchInit([],keyArr,'searchGroup','true','false');
	   	var members = param.groupMembers;
	   	if(members.length > 0){
		   $.each(members,function(index,item){
			   var str = '<div label="repeat-data" code="'+ item.id +'" class="form-group">';
				str += '<div class="col-sm-6 col-md-6"><input type="text" class="form-control input-xxlarge" placeholder="'+ item.name +'(id:'+ item.id +')" disabled="disabled"/></div>';
				str += '<div class="col-sm-2 col-md-2"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i>';
				str += '</button></div></div>';
				
				$('div[label="list-group"]').append(str);
		   });
	   	}
	   } 
	   
	   function deleteGroup(json){
		   var result = confirm('Delete');  
			if(result){
				console.log(1);
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : json,
						"url" : "api.v1.centers."+ centerId +"?command=disassociateGroups"
					},
					callback : function(param){
						window.location.href="loadPage.do?nextPage=center.detail&centerId=" + centerId;
					}
				});
			}
	   }
	   
	   
		
</script>