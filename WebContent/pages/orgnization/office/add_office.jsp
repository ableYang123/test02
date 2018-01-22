<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="addofficeform" name="addofficeform" method="post">
				<fieldset>
					<legend><spring:message code="label.office.createOffice"/></legend>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">
							<spring:message code="label.office.officeName"/>
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">
							<spring:message code="label.office.parentOffice"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<select id="parentName" name="parentName" class="form-control"
								style="width: 198">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">
							<spring:message code="label.office.openedOn"/>
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <input type="text" datetype="date" name="openingDate"  local-date="true" afterToday="true" beforeToday=" "/>  
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">
							<spring:message code="label.office.externalId"/>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="externalId" name="externalId"
								value='' />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$.valid("addofficeform", [ {
					"name" : "name",
					"notEmpty" : ""
				}, {
					"name" : "parentName",
					"notEmpty" : ""
				}, {
					"name" : "openingDate",
					"notEmpty" : ""
				}]);
				
				
				/* 日历初始化并设置格式 */
				$.datetimepicker();
				
				
				/* 加载页面初始化 */
				init();
				
				/* 创建办公室表单提交 */
				$.getWidget("save").click(function() {
					if ($.validateForm("addofficeform")) {
						
						/* 获取必选项的值 */
						var o_name = $.trim($.value("name"));
						var p_officeId = parseInt($.value("parentName"));
						//var o_date = $('input[name="openingDate"]').val();
						var o_date = $.value('openingDate');
						
						/* 构造json请求参数 */
						var json = {
								"name" : o_name,
								"parentId" : p_officeId,
								"openingDate" : o_date,
								"dateFormat" : $.getDateFormat()
						};
						
						/* 可选项：设置外部ID */
						var e_ID = $('externalId');
						var e_IdVal = $.value('externalId');
						if(!$.isEmpty(e_IdVal)){
							json["externalId"] = e_IdVal;
						}
						
						/* 设置日期格式 */
						/* var dateFormat = $('input[name="openingDate"]').attr('date-format');
						if(!$.isEmpty(dateFormat)){
							json["dateFormat"] = $.getDateFormat();
						} */
						
						/* 设置语言 */
						json["locale"] = $.getLocale();
						
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "POST",
								"mydata" : json,
								"url" : "api.v1.offices",
								"contentType" : "application/json"
							},
							callback : "add_success"
						});
					}
				});
			});	
			
			function add_success(param){
				$.setReadOnly('addofficeform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
				pageType = 'L';
			}
		
		</script>


	

