<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
			<form class="form-horizontal" id="survey" name="survey">
				<fieldset>
					<legend><spring:message code="lable.survey"/></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><spring:message code="lable.survey.name"/>
							<span style="font-size: 14px; color: #d9534f">*</span>
						</label>
						<div class="col-sm-3">
							<select class="form-control" id="surveyname" name="surveyname">
								<option><spring:message code="lable.please.choose"/></option>
							</select>
						</div>
					</div>
					<div id="qa" class="form-group" style="display: none;">
						<!-- <div>
							<div class="col-sm-3">
								<span id="question"></span>
							</div>
							<div class="col-sm-6">
								<span id="answer"></span>
							</div>
						</div> -->
					</div>
					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
		var clientId = ${pd.clientId};
		var questionDatas = [];
		var answerDatas = [];
		var data = [];
		var surveysId;
		//var userId = ${pd.userId};
		var jsonData = [];
		$(document).ready(function(){
				$.valid("survey", [{
					"name" : "surveyname",
					"notEmpty" : "不能为空"
				}]);
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "get",
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.surveys"
					},
					callback : "surveys"
				});
				
				$.getWidget("surveyname").change(function(){
					$.show('qa');
					$('#qa').empty();
					var surveryId = parseInt($.value('surveyname'));
					for(var i=0;i<data.length;i++){
						if(surveryId == data[i].id){
							questionDatas = data[i].questionDatas;
							for(var j=0;j<questionDatas.length;j++){
								$('#qa').append('<div class="form-group">'+
										'<div class="col-sm-4"><span style="margin-left:80px;" id="question'+j+'"></span></div>'+
										'<div class="col-sm-6"><span id="answer'+j+'"></span></div>'+
									'</div>');
								$('#question'+j+'').attr('code',questionDatas[j].id);
								$('#question'+j+'').append(questionDatas[j].text);
								answerDatas = questionDatas[j].responseDatas;
								for(var k=0;k<answerDatas.length;k++){
									$('#answer'+j).append('<input type="radio" code="'+answerDatas[k].id+'" key="'+answerDatas[k].value+'" id="questionAnswer'+k+'">'+'&nbsp;'+answerDatas[k].text+'<br>');
								}
							}
						}
					}
				});
				
				
				$.getWidget("save").click(function() {
					$('#qa .form-group').each(function(index,item){
						console.log($(this));
						var questId = $(this).children("div:first").find('span').attr('code');
						var node = $(this).children("div:last").find('input[type="radio"]:checked');
						var responseId = node.attr('code');
						var value = node.attr('key');
						var json = {"questionId":questId,"responseId":responseId,"value":value};
						jsonData.push(json);
					});
					console.log(jsonData);
					surveysId = parseInt($.value('surveyname'))
					var json = {
							  		"clientId" : clientId,
							  		"createdOn" : 1506412348177,
							  		"scorecardValues" : jsonData,
							  		"userId" : userId
								};
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : json,
							"url" : "api.v1.surveys."+surveysId+".scorecards"
						},
						callback : "callback"
					});
				});
		});
		function surveys(param){
			$.setSelect('surveyname', param, 'id', 'name');
			if(param != null || param != ''){
				data = param;
			}
		}
		function callback(param) {
			$.setReadOnly("assignStaffClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			if(param != null || param.length > 0 || typeof param != 'undefined'){
				window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
			}
			/* init(); */
		}
</script>