<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>

<body style="background-color: #fff">
	<div>
		<div style="margin: 30px 200px;  font-size: large">
			<ul class="breadcrumb">
				<li>
					<i class="glyphicon glyphicon-hand-right"></i>&nbsp;
					<spring:message code="menu.admin.currencyConfig"/>
				</li>
			</ul>
		</div>
		<div class="div-cc" >
			<div class="row" style="margin: 5px 5px">
				<button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
			</div>
			<table id="currencyConfiglist" style="display:none;">
				<thead>
					<tr>
						<!-- <th name='id' width='179' style='display: none;'>id</th> -->
						<th name='name' width='400' >
							<spring:message code="label.currency.name" />
						</th>
						<th name="code" width='400'>
							<spring:message code="label.currency.code" />
						</th>

					</tr>
				</thead>
			</table>
		</div>
		
		  
	</div>
	
	<script type="text/javascript">
		var grid;
		var currencyOptions;
		var selectedCurrencyOptions;
		
		$(document).ready(function() {
		
			nestjson = {
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "GET",
						"mydata" : "",
						"url" : "api.v1.currencies"
					},
					callback : "callback"
				};
			
			grid = $('#currencyConfiglist').flexigrid({
				title : '<spring:message code="menu.admin.currencyConfig"  />',
				/*buttons : [{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,bclass:'add', onpress:ADD},
					{name : $.fn.bootstrapValidator.i18n.flexigrid.gridBtnDelete,bclass : 'delete', onpress: DELETE}]*/
			});
			
			
			/* 初始化 */
			init();
			
			
			$('#myModal').on('hidden.bs.modal', function (event) {
				/* 实现局部刷新 */
				init();
			});
		});
		
		function init(){
			$.nest(nestjson); 
		}

		$.getWidget("currencyConfiglist").click(function(){
			DELETE();
		});

		function ADD(){
			$.openWindow("loadPage.do?nextPage=orgnization.currency.add_currency");
		}
		
		function DELETE(){
			var code = grid.colVal('code');
			
			var currencies = [];
			$.each(selectedCurrencyOptions,function(index,item){
				currencies.push(item.code)
			});
			
			currencies.splice($.inArray(code,currencies),1);
			
			var delete_json = {
					"currencies" : currencies
			};
			
			
			
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "PUT",
					"mydata" : delete_json,
					"url" : "api.v1.currencies"
				},
				callback : "deleteback"
			});
		}
		
		/* 成功获取数据后 的回调方法*/
		function callback(param) {
			currencyOptions = param.currencyOptions;
			selectedCurrencyOptions = param.selectedCurrencyOptions;
			
			grid.addRows(selectedCurrencyOptions);
			
		}
		function deleteback(param){
			$.bAlert($.fn.bootstrapValidator.i18n.common.deleteSuccessful);
			init();
		}
		
	</script>

</body>
</html>
