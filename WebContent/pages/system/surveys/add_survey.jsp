<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

			<form class="form-horizontal" id="addsurveyform" name="addsurveyform" method="post">
				<fieldset>
					<legend><spring:message code="label.surveys.createSurvey"/></legend>
					
					<div class="form-group">
						<label for="key" class="col-sm-2 control-label">
							<spring:message code="label.surveys.key"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="key"
								name="key" value='' />
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">
							<spring:message code="label.surveys.name"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.surveys.countryCode"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input id="countryCode" name="countryCode" class="form-control"
								vlaue='' />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.surveys.description"/>
						</label>

						<div class="col-sm-3">
						   	 <textarea id="description" name="description" rows="2" type="text" class="form-control" style="overflow: hidden"></textarea> 
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="next" name="next"
								class="btn btn-primary"><spring:message code="label.surveys.proceed"/></button>
						</div>
					</div>
				</fieldset>
			</form>
		<script type="text/javascript">
			var surveyData;
			
			$(document).ready(function(){
				
				$.valid("addsurveyform",[{
					"name" : "key",
					"notEmpty" : ""
				},{
					"name" : "name",
					"notEmpty" : ""
				},{
					"name" : "countryCode",
					"notEmpty" : "",
					"lengthMax" : "2"
				}]);
				
				
				$.getWidget("next").click(function() {
					if ($.validateForm("addsurveyform")) {
						surveyData = {
								"key" : $.value('key'),
								"name" : $.value('name'),
								"countryCode" : $.value('countryCode'),
								"description" : $('#description').val()
						};
						$.openWindow("loadPage.do?nextPage=system.surveys.add_question");
					}
				});
				
			});	
		</script>


	

