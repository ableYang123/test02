<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style type="text/css">
	.list-group-item {
		position: relative;
    	display: block;
    	padding: 10px 15px;
    	margin-bottom: -1px;
    	background-color: #fff;
    	border: 1px solid #ddd;
	}
	
	.list-group-item:first-child {
	    border-top-right-radius: 4px;
	    border-top-left-radius: 4px;
    }
    
    .list-group-item:last-child {
	    margin-bottom: 0;
	    border-bottom-right-radius: 4px;
	    border-bottom-left-radius: 4px;
	}
</style>
	<div class="content">
		<div class="row">
			<div class="col-sm-8">
				<form class="form-horizontal" id="addquestionform" name="addquestionform" method="post">
				<fieldset>
					<legend><spring:message code="label.surveys.questions"/></legend>
					
					<div class="form-group" id="btnform">
						<div class="col-sm-12">
							<a id="creQues" type="button" class="btn btn-md btn-primary"><i class="glyphicon glyphicon-plus"></i>
								<spring:message code="label.surveys.createQuestion"/>
							</a>
							<a id="creSur" type="button" class="btn btn-md btn-primary" disabled><i class="glyphicon glyphicon-plus"></i>
								<spring:message code="label.surveys.createSurvey"/>
							</a>
						</div>
					</div>
					
					<div id="quesform" style="display: none;">
						<div class="form-group">
							<label class="control-label col-sm-4">
								<spring:message code="label.surveys.key"/>
								<span style="color: #d9534f;">*</span>
							</label>
							
							<div class="col-sm-5">
								<input type="text" id="qkey" name="qkey" class="form-control" value='' />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">
								<spring:message code="label.surveys.text"/>
								<span style="color: #d9534f;">*</span>
							</label>
							
							<div class="col-sm-5">
								<input type="text" id="qtext" name="qtext" class="form-control" value='' />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">
								<spring:message code="label.surveys.description"/>
							</label>
	
							<div class="col-sm-5">
							   	 <textarea id="qdescription" name="qdescription" rows="2" type="text" class="form-control" style="overflow: hidden"></textarea> 
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6 col-sm-offset-4">
								<button type='button' id="resQues" name="resQues" class="btn btn-default"><spring:message code="btn.cancle"/></button>
								<button type='button' id="addQues" name="addQues" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i><spring:message code="label.surveys.createQuestion"/></button>
							</div>
						</div>
						
						<div id="options">
							<div style="height: 40px; border-bottom: 1px solid #e5e5e5">
								<h3><spring:message code="label.surveys.options" /></h3>
							</div>
							<div class="list-group" style="margin-bottom: 20px;padding-left: 0;">
							
							</div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<a id="creOpt" class="btn btn-md btn-primary"><i class="glyphicon glyphicon-plus"></i>
										<spring:message code="label.surveys.createOption"/>
									</a>
								</div>
							</div>
							<div id="optform" style="display: none">
								<div class="form-group">
									<label class="control-label col-sm-4">
										<spring:message code="label.surveys.text"/>
										<span style="color: #d9534f;">*</span>
									</label>
									<div class="col-sm-5">
										<input type="text" id="otext" name="otext" class="form-control" value='' />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">
										<spring:message code="label.surveys.value"/>
										<span style="color: #d9534f;">*</span>
									</label>
									<div class="col-sm-4">
										<input type="text" id="ovalue" name="ovalue" class="form-control" value='' />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-6 col-sm-offset-4">
										<button type='button' id="resOpt" name="resOpt" class="btn btn-default"><spring:message code="btn.cancle"/></button>
										<button type='button' id="addOpt" name="addOpt" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i><spring:message code="label.surveys.createOption"/></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</fieldset>
			</form>
			</div>
			<div id="questlist" class="col-sm-4">
				<div class="list-group">
				
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var questionDatas = [];
		var responseDatas = [];
		var questionDatas2 = [];
		var responseDatas2 = [];
		
		var responseIndexDel = [];
		var questionIndexDel = [];
		
		var ocount = 0;
		var qcount = 0;
		//var count = 0;
		$(document).ready(function(){
			
			$.valid("addquestionform",[{
				"name" : "qkey",
				"notEmpty" : ""
			},{
				"name" : "qtext",
				"notEmpty" : ""
			}]); 
			
			$.valid("optform",[{
				"name" : "otext",
				"notEmpty" : ""
			},{
				"name" : "ovalue",
				"notEmpty" : "",
				"regexp" : "/^((\-)+[1-9])|[0-9]$/",
				"regexpMsg" : "\"Value must be a Integer\""
			}]);
		
			
			
			$.getWidget('btnform').on('click','#creQues',function(){
				$('#qkey').val('');
				$('#qtext').val('');
				$('#qdescription').val('');
				var nextText = $('#qkey').next('i');
				var nextValue = $('#qtext').next('i');
				if(typeof nextText != 'undefined' && typeof nextValue != 'undefined'){
					nextText.remove();
					nextValue.remove();
				}
				$.show('quesform');
				$(this).hide();
				$.hide('creSur');
			});
			$.getWidget('options').on('click','#creOpt',function(){
				//清空text和value input框
				$('#otext').val('');
				$('#ovalue').val('');
				var nextText = $('#otext').next('i');
				var nextValue = $('#ovalue').next('i');
				if(typeof nextText != 'undefined' && typeof nextValue != 'undefined'){
					nextText.remove();
					nextValue.remove();
				}
				$.show('optform');
				$(this).hide();
			});
			
			$("#questlist").on('click','.list-group a',function(){
				var divNode2 = $(this).closest('.list-group-item');
				var delIndex = parseInt(divNode2.attr('label'));
				
				questionIndexDel.push(delIndex);
			/* 	$.each(questionDatas,function(index,item){
					if(item.sequenceNo != delIndex){
						questionDatas2.push(item);
					}
				}); */
				divNode2.remove();
				qcount = qcount - 1;
				var divNode = $('#questlist').find('div.list-group').children();
				if(divNode.length > 0){
					$('#creSur').attr('disabled',false);
					$.show('creSur');
					$.show('creQues');
				}else{
					$('#creSur').attr('disabled',true);
				}
			});
			
			$("#options").on('click','.list-group a',function(){
				var divNode2 = $(this).closest('.list-group-item');
				var delIndex = parseInt(divNode2.attr('label'));
			
				responseIndexDel.push(delIndex);
				/* $.each(responseDatas,function(index,item){
					if(responseDatas[index].sequenceNo != delIndex){
						responseDatas2.push(responseDatas[index]);
					}
				}); */
				divNode2.remove();
				ocount = ocount - 1;
			});
			
			$.getWidget('addQues').click(function(){
				if ($.validateForm("addquestionform")) {
					var divNode = $('#options').find('div.list-group').children();
					
					if(divNode.length > 0){
						qcount = qcount + 1;
						//清空选项列表
						var itemNode = $('#options .list-group').children();
						itemNode.remove();
						//隐藏选项表单
						$.show('btnform');
						$.hide('quesform');
						//验证成功之后，需要把该问题放在list-group中
						var qkey = $.value('qkey');
						var qtext = $.value('qtext');
						var qdescription = $('#qdescription').val();
						
						var str = '';
						str += '<div label="' + qcount + '" class="list-group-item"><h4 style="margin-top: 0; margin-bottom: 5px;">'+ qcount + '.' + qtext +'</h4>';
						str += '<a type="button"><i class="pull-right glyphicon glyphicon-remove" style="color: #a94442;margin-left: 2em; margin-top: -8px;"></i></a>';
						
						str += '<p style="margin-bottom: 0;line-height: 1.3px;">'+ qdescription +'</p></div>';
						
						$('#questlist').find('div.list-group').append(str);
						
						//将需要删除的option数据确认删除
						$.each(responseDatas,function(index,item){
							var ri = responseDatas[index];
							var sequenceNo = ri.sequenceNo;
							if(responseIndexDel.length > 0){
								$.each(responseIndexDel,function(i,e){
									if(sequenceNo != responseIndexDel[i]){
										responseDatas2.push(ri);
									}
								});
							}else{
								responseDatas2 = responseDatas;
							}
						});
						
						var questData = {
								"sequenceNo" : qcount,
								"text" : qtext,
								"key" : qkey,
								"description" : qdescription,
								"responseDatas" : responseDatas2
						};
						questionDatas.push(questData);
					
						//清空responseDatas数组
						responseDatas = [];
						responseDatas2 = [];
						
						var divNode2 = $('#questlist').find('div.list-group').children();
						if(divNode2.length > 0){
							$('#creSur').attr('disabled',false);
							$.show('creSur');
							$.show('creQues');
						}
					}else{
						$.bAlert($.fn.bootstrapValidator.i18n.survey.checkAddQuestion);
						return false;
					}
				}
			});
			/* 取消创建问题 */
			$.getWidget('resQues').click(function(){
				$.hide('quesform');
				$.show('btnform a');
			});
			/* 创建一个问题选项 */
			$.getWidget('addOpt').click(function(){
				if ($.validateForm("optform")) {
					$.hide('optform');
					//验证成功之后，需要把该选项放在list-group中
					var otext = $.value('otext');
					var ovalue = $.value('ovalue');
					ocount = ocount + 1;
					var str = '';
					str += '<div label="'+ ocount +'" class="list-group-item"><h4 style="margin-top: 0; margin-bottom: 5px;">'+ otext +'</h4>';
					str += '<a type="button"><i class="pull-right glyphicon glyphicon-remove" style="color: #a94442;margin-left: 2em; margin-top: -8px;"></i></a>';
					
					str += '<p style="margin-bottom: 0;line-height: 1.3px;"><spring:message code="label.surveys.value"/>:'+ ovalue +'</p></div>';
					
					$('#options').find('div.list-group').append(str);
					$.show('options a');
					
					var optionData = {
							"text" : otext,
							"value" : parseInt(ovalue),
							"sequenceNo" : ocount
					};
					responseDatas.push(optionData);
				}
			});
			/* 取消创建选项 */
			$.getWidget('resOpt').click(function(){
				$.hide('optform');
				$.show('options a');
			});
			
			//创建调查问卷
			$.getWidget('creSur').click(function(){
				//将需要删除的question数据确认删除
				$.each(questionDatas,function(index,item){
					var qi = questionDatas[index];
					var sequenceNo = qi.sequenceNo;
					if(questionIndexDel.length > 0){
						$.each(questionIndexDel,function(i,e){
							if(sequenceNo != questionIndexDel[i]){
								questionDatas2.push(qi);
							}
						});
					}else{
						questionDatas2 = questionDatas;
					}
				});
				
				//添加请求参数
				surveyData['questionDatas'] = questionDatas2;
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "POST",
						"mydata" : surveyData,
						"url" : "api.v1.surveys",
						"contentType" : "application/json"
					},
					callback : "add_success"
				});
			});
			
		});
		
		function add_success(param){
			$.setReadOnly('addquestionform');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
	</script>


	

