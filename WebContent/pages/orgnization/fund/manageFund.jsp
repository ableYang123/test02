<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div class=" div-cc">
			<form id="managefundform" id="managefundform" method="post">
				<fieldset>
					<legend>
						<spring:message code="menu.admin.manageFunds"/>
					</legend>
					
					<div class="form-group">
						<div class="col-md-10">
							<input id="fund" name="fund" class="form-control" type="text" placeholder="New Fund" />
						</div>
						<div class="col-md-1"><a id="create" class="btn bg-primary">+</a></div>
					</div>
					<br />
					<br />
					<br />
					<div  class="col-md-12">
						<div id="fundlist"></div>
					</div>
					
					
				</fieldset>
			</form>		
		</div>
	</div>
	<script type="text/javascript">
	 	$(document).ready(function(){
			
	 		$.valid("managefundform",[{
	 			"name" : "fund",
	 			"notEmpty" : ""
	 		}]);
	 		
	 		init();
	 		
	 		$.getWidget('create').click(function(e){
	 			$.nest({
		 			url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : {name: $.value('fund')},
						"url" : "api.v1.funds",
						"contentType" : "application/json"
					},
					callback : "addback"
		 		});
	 		});
	 		
	 		$(document).on('click','a[name="edit"]',function(){
	 			$(this).text('<spring:message code="btn.save" />').attr('name','save');
	 			
	 			$(this).closest('div[name="repeat-data"]').find('input[type="text"]').attr('readOnly',false);
	 		});
	 		$(document).on('click','a[name="save"]',function(){
	 			
	 			var input_node = $(this).closest('div[name="repeat-data"]').find('input[type="text"]');
	 			var fund_id = input_node.attr('code');
	 			var fund_val = input_node.val();
	 			
	 			$.nest({
	 				url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "PUT",
						"mydata" : {
							"name" : fund_val
						},
						"url" : "api.v1.funds." + fund_id
					},
					callback : "callback"
	 			});
	 			
	 			$(this).text('<spring:message code="btn.edit" />').attr('name','edit');
	 			input_node.attr('readOnly',true);
	 		});
	 	});
	 	
	 	function init(){
	 		$.nest({
	 			url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : '',
					"url" : "api.v1.funds"
				},
				callback : "callback"
	 		});
	 		$('#fund').val('');
	 	}
	 	
	 	function callback(param){
	 		if(param.length > 0){
	 			$.each(param,function(index,item){
	 				$('#fundlist').append('<div name="repeat-data" style="margin: 20px 0;"><div class="col-md-4" ><input class="form-control" code="'+ item.id +'" type="text" value="'+ item.name 
	 						+'" readonly/></div><div class="col-md-1"><a name="edit" class="btn btn-primary"><spring:message code="btn.edit" /></a></div></div>');
	 			});
	 		}
	 	}
	 	
	 	function addback(param){
	 		window.location.reload();
	 		$('#fundlist').empty().focus();
	 	}
	</script>
</body>
</html>
