<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<form id="addCurrencyform" name="addCurrencyform" method="post">
				<fieldset>
					<legend><spring:message code="label.currency.addCurrncy"/></legend>
					
					<div class="form-group">
						<label class="col-sm-1 control-label"> 
							<spring:message code="label.currency.name"/>
							<span style="color: #d9534f;">*</span>
						</label>
						
						<div class="col-sm-4">
							<input datatype="match" for="search" source="name" id="addCurrency" name="addCurrency" class="form-control" value='' autocomplete="off"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type='button' id="save" name="save" class="btn btn-primary"><spring:message code="btn.submit"/></button>
						</div>
					</div>
					
				</fieldset>
			</form>
	


	<script type="text/javascript">
		
		
		$(document).ready(function() {
		
			$.valid("addCurrencyform",[{
				"name" : "addCurrency",
				"notEmpty" : ""
			}]);
			
			init();
			
			//初始化搜索框
			var keyArr = ['code'];
			$.inputSearchInit(currencyOptions,keyArr,'searchCurrency','false','false');
			
			/* $('#addCurrency').on('input',function(){
				
				$('.dropdownmenu').empty();
				var input_val = $(this).val();
				
				if(!$.isEmpty(input_val)){
					$('#search').show();
					if(searchData(input_val)){
						$('#search').hide();
					};
				}else{
					$('#search').hide();
				}
			
				var ulNode = $('#search').children();
				if(ulNode.length <= 0){
					$('#search').hide();
				}
			}); */
			
			/* $(document).on({
				click : function(){
					$('#addCurrency')[0].focus();
					$('#addCurrency').val($(this).text());
					$('#addCurrency').attr('code',$(this).attr('_code'));
					
					$('#search').empty();
					$('#search').hide();
				}
			},'#search li'); */
			
			
			
			
			$.getWidget('save').click(function(){
				var currencies = [];
				
				var input_code = $('#addCurrency').attr('code');
				
				if(!$.isEmpty(input_code)){
					currencies.push(input_code);
				}
				
				$.each(selectedCurrencyOptions,function(index,item){
					currencies.push(item.code)
				});
				
				
				var request_json = {
						"currencies" : currencies
				};
				
				$.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					async : true,
					data : {
						"dataType" : "PUT",
						"mydata" : request_json,
						"url" : "api.v1.currencies"
					},
					callback : "add_success"
				});

			});
		});
		
		
		
		
		
		/* function searchData(param){
			var paramVal = $.trim(param);
			$.each(currencyOptions,function(index,item){
				var value_name = item.name ;
				var value_code = item.code;
				if($.isContains('/['+value_name+']/',paramVal) || $.isContains('/['+value_code+']/',paramVal)){
					var name = value_name.replace(paramVal,'<b>'+paramVal+'</b>');
					var code = value_code.replace(paramVal,'<b>'+paramVal+'</b>');
					$('.dropdownemnu').append('<li class="repeat-data" code="'+ value_code +'">'+ name +' &nbsp; ('+ code +')</li>');
					
				}
			}); 
		} */
		
		function add_success(){
			$.setReadOnly('addCurrencyform');
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
		}
		
		function searchCurrency(obj){
			$('#addCurrency')[0].focus();
			$('#addCurrency').val($.trim($(obj).text()));
			$('#addCurrency').attr('code',$(obj).attr('_code'));
			
			$('#search').empty();
			$('#search').hide();
		}
	</script>

