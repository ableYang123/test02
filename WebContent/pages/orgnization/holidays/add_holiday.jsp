<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form class="form-horizontal" id="addholidayform" name="addholidayform" method="post">
				<fieldset>
					<legend><spring:message code="label.holiday.createHoliday" /></legend>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.holidayName" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" class="form-control" id="name"
								name="name" value='' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.fromDate" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
							<input type="text" datetype="date" name="fromDate"  local-date="true" afterToday="false" beforeToday="true"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.toDate" />
							<span style="color: #d9534f;">*</span>
						</label>
						<div class="col-sm-3">
							<input type="text" datetype="date" name="toDate"  local-date="true" afterToday="false" beforeToday="true"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.repaymentType" />
							<span style="color: #d9534f;">*</span>
						</label>

						<div class="col-sm-3">
						   	  <select id="repaymentSchedulingRuleType" name="schedulingRule" class="form-control">
						   	  </select>
						</div>
					</div>
					
					<div class="form-group" id="reschedulDate">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.repaymentTo" />
							<span style="color: #d9534f;">*</span>
						</label>
						
						<div class="col-sm-3">
							<input type="text" datetype="date" name="repaymentScheduledTo"  local-date="true" afterToday="false" beforeToday="false"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.description" />
							
						</label>
						
						<div class="col-sm-3">
							<input id="description" name="description" type="text" value='' class="form-control"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<spring:message code="label.holiday.applicableOffices" />
							<span style="color: #d9534f;">*</span>
						</label>
						
						<div class="col-sm-8" id="applicableOffices">
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save"
								class="btn btn-primary"><spring:message code="btn.submit" /></button>
						</div>
					</div>
				</fieldset>
			</form>
		<script type="text/javascript">
			$(document).ready(function(){
				$.valid("addholidayform",[{
					"name" :"name",
					"notEmpty" : ""
 				}]);
				
				
				
				$.datetimepicker();
				
				$.getWidget('repaymentSchedulingRuleType').change(function(){
					if($(this).val() == '1'){
						$('#reschedulDate').css('display','none');
					}else if($(this).val() == '2'){
						$('#reschedulDate').css('display','block');
					}
				});
				
				/* 加载页面初始化 */
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.offices"
					},
					callback : "addback"
				});
				
				/* 表单提交 */
				$.getWidget("save").click(function(e) {
					if ($.validateForm("addholidayform")) {
						var name = $.value('name');
						//var fromDate = $('input[name="fromDate"]').val();
						//var toDate = $('input[name="toDate"]').val();
						
						var fromDate = $.value('fromDate');
						var toDate = $.value('toDate');
						
						var repaymentSchedulingRuleType = $('#repaymentSchedulingRuleType').val();
						var repaymentScheduledTo = $('input[name="repaymentScheduledTo"]').val();
						var description = $.value('description');
						
						var dateFormat = $('input[name="fromDate"]').attr('date-format');
						
						/**
						*     结束日期要大于开始日期，且还款日期必须在结束日期之后或者开始日期之前的的七天内
						*/
						var flag = false;
						if(repaymentSchedulingRuleType == '2'){
							if(toDate >= fromDate){
								if(repaymentScheduledTo <= fromDate){
									var day1 = compare_time(repaymentScheduledTo,fromDate);
									if(0 <= day1 <= 7){
										flag = true;
									}else{
										flag = false;
									}
								}else if(repaymentScheduledTo >= toDate){
									var day2 = compare_time(toDate,repaymentScheduledTo);
									if(0 <= day2 <= 7){
										flag = true;
									}else{
										flag = false;
									}
								}else{
									flag = false;
								}
							}
						}else{
							if(toDate >= fromDate){
								flag = true;
							}
						}
						
						
						if(flag == false){
							$.bAlert($.fn.bootstrapValidator.i18n.holiday.dateCheck);
							return false;
						}
						
						var json = {
								"name": name,
								"description": description,
								"dateFormat": $.getDateFormat(),
								"locale": $.getLocale(),
								"fromDate": fromDate,
								"toDate": toDate,
						};
						if(repaymentSchedulingRuleType == "2"){
							json['repaymentsRescheduledTo'] = repaymentScheduledTo;
							json['reschedulingType'] = 2;
						}else{
							json['reschedulingType'] = 1;
						}
						
						var officearr = $('div[id="applicableOffices"]').treeview('getChecked');
						var newarr = [];
						for (var key in officearr) {
							/* console.log(officearr[key]); */
							 newarr.push({
								 "officeId" : officearr[key].id
							 });
				         }
						
						if(newarr.length > 0){
							json['offices'] = newarr;
						}else{
							$.bAlert($.fn.bootstrapValidator.i18n.mapping.checkOffice);
							return false;
						}
						
						
						/* console.log(json); */
						
						$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "POST",
								"mydata" : json,
								"url" : "api.v1.holidays",
								"contentType" : "application/json"
							},
							callback : "add_success"
						});
					}
				});
			});	
			
			function add_success(param){
				$.setReadOnly('addholidayform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
			
			function addback(param){
				/* 将办公室树状显示 */
				var office_expand = $('div[id="applicableOffices"]');
				
				var dest = getTreeData(param);
				
				var arr = [];
				$.each(dest,function(index){
					var di = dest[index]; 
				
					if(di.parentId == 1){
						for(var i=0;i<di.data.length;i++){
							arr.push({
								id : di.data[i].id,
								text : di.data[i].name
							});
						}
						
					}
				});		
				
				var arr_copy = arr;
				$.each(arr,function(index){
					var ai = arr[index]; 
				
					for(var i=0;i<dest.length;i++){
						var key = dest[i].parentId;
						if(key != 1 && key == ai.id ){
							ai['nodes'] = [];
							for(var j=0;j<dest[i].data.length;j++){
								var did = dest[i].data;
								arr_copy[index].nodes.push({
									id : did[j].id,
									text : did[j].name
								});
							}
						}
					}
				}); 
				
			
				/* 首先将数据进行填充 */
				var treedate = [{
					id : 1,
					text : 'Head Office',
					nodes : arr_copy
					}];
				
				office_expand.treeview({
					data : treedate,
					color: "#428bca",
					showBorder: false,
					showIcon : false,
					showCheckbox: true,   //是否显示复选框
                    highlightSelected: true,  //是否高亮选中
                    multiSelect: true,
                    onNodeChecked: function (event,data) {
                        //选中父节点，则自动选择子节点
                        if(data.nodes != null)
                        {
                           var arrayInfo = data.nodes;
                           for (var i = 0; i < arrayInfo.length; i++) {
                        		   office_expand.treeview('checkNode', [ arrayInfo[i].nodeId, { silent: true } ]);
                           }
                        }
                     },
                     onNodeUnchecked: function (event, data) {
	                   //取消选中父节点，则自动取消选择子节点
	                   if(data.nodes != null)
	                   {
	                      var arrayInfo = data.nodes;
	                      for (var i = 0; i < arrayInfo.length; i++) {
	                    	  if(arrayInfo[i].selectable){
	                    		  office_expand.treeview('uncheckNode', [ arrayInfo[i].nodeId, { silent: true } ]);
                       	   		}
	                      }
	                   }
                   }
				});
				
				 
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : '',
						"url" : "api.v1.holidays.template"
					},
					callback : "getType"
				});
			}
			
			
			
			function getType(param){
				$.setSelect('repaymentSchedulingRuleType',param,'id','value');
				$.assign({
					"repaymentSchedulingRuleType" : param[0].id
				});
			}
			
			function getTreeData(param){
				/* 将param参数按照parentId对数据进行升序处理 */
				var jsonarr = param.sort(function(x,y){
					return (x.parentId > y.parentId)? 1 : -1;
				});
				
				/* console.log(jsonarr); */
				//定义一个集合
				var options = {}; 
				//定义一个数组
				var dest = [];
				
				/* 将具有同一父Id的元素进行分组 */
				for(var i=0;i<param.length;i++){
					if($.type(param[i].parentId) === 'undefined'){
						
					}else{
						var keep = param[i];
					
						if(!options[keep.parentId]){
							dest.push({
								parentId : keep.parentId,
								data : [keep]
							});
						options[keep.parentId] = keep;
						}else{
							for(var j=0;j<dest.length;j++){
								var tmp = dest[j];
								if(tmp.parentId == keep.parentId){
									tmp.data.push(keep);
									break;
								}
							}
						}
					}
				}
				return dest;
			}
			
			function add_success(param){
				$.setReadOnly('addholidayform');
				$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			}
			
			
		
		</script>


	

