<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<form class="form-horizontal"  id="editProductMix" name="editProductMix" >
	<fieldset>
		<legend>
			<spring:message code="product.mix.edit" />
		</legend>

<div class="form-group">
						<div class="col-sm-3 col-md-3 col-md-offset-1">
							<label class="control-label col-sm-9">
								<spring:message code="Allowed.products"/>
							</label> 
							<select
								id="ProductName" class="form-control multiselectmin"
								name="ProductName" multiple="multiple">
							</select>

						</div>
						<div class="col-sm-5 col-md-1 padddetop25px"
							style="margin-top: 45px; margin-left: 45px;">
							<button id='addProduct' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-right" style="color: #fff;"></i>
							</button>
							<button id='delProduct' class="btn btn-primary" type="button">
								<i class="glyphicon glyphicon-chevron-left" style="color: #fff;"></i>
							</button>
						</div>
						<div class="col-sm-3 col-md-3 col-md-offset-1">
							<label class="control-label col-sm-9">
								<spring:message code="Restricted.products"/>
							</label> 
							<select
								id="product" class="form-control multiselectmin" name="product"
								multiple="multiple">
							</select>

						</div>
					</div>

		
		<div style="width: 380px; text-align: right; padding-top: 20px;">
		<a class="btn btn-default" href=""><spring:message code="btn.cancle"/></a>
			<button type="button" class="btn btn-info" id="edit"><spring:message code="btn.submit" /></button>
		</div> 
		</fieldset>
</form>
<script type="text/javascript">
function getSelect(param){
	$.setSelect('ProductName', param.allowedProducts, 'id', 'name');
	$.setSelect('product', param.restrictedProducts, 'id', 'name');
	
	 $('#ProductName option[value="' + param.ProductName.id + '"]').attr('selected', true);
	 $('#product option[value="' + param.product.id + '"]').attr('selected', true);
}
function getSelect2(param){
	$.setSelect('ProductName', param.allowedProducts, 'id', 'name');
	$.setSelect('product', param.restrictedProducts, 'id', 'name');
}
$(document).ready(function(){
	$.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		async : true,
		data : {
			"dataType" : "GET",
			"mydata" : "",
			"url" : "api.v1.loanproducts."+pId+".productmix"
		},
		callback : "getSelect"
	});
	
	/* 添加贷款产品按钮 */
	$(document).on('click','#addProduct',function() {
		var product = $('#product');
		var option_arr = $('#ProductName option:selected');
		if (option_arr != null && typeof(option_arr) != 'undefined') {
			$.each(option_arr,function(index,item) {
				var txt = $(this).text();
				var value = $(this).val();		
					product.append("<option value='" + value + "'>"+ txt + "</option>");
					$('#ProductName option[value='+ value +']').remove();
				
			});
		}
	});

	/* 删除贷款产品按钮 */
	$(document).on('click','#delProduct',function() {
		var option_arr = $('#product option:selected');
		if (null != option_arr && typeof(option_arr) != 'undefined') {
			$.each(option_arr,function(index) {
				var value = $(this).val();
				var txt = $(this).text();			
				$("#product option[value="+ value + "]").remove();
				$('#ProductName').append("<option value='" + value + "'>"
						+ txt + "</option>");
			});
		}
	});
	
	 $.getWidget("edit").click(function() {
		 if ($.validateForm("editProductMix")) {
			 var restrictedProducts=[];
				$('#product option').each(function() {
					restrictedProducts.push(parseInt($(this).attr("value")));
				});
			 var date;
			 date={
					 "restrictedProducts":restrictedProducts,	 
			 }
			 $.nest({
					url : "<c:url value='/fineract.do'/>",
					type : "post",
					data : {
						'dataType' : "PUT",
						'mydata' : date,
						'url' : 'api.v1.loanproducts.'+pId+".productmix"
					},
					callback : "callbackadd"
					
				});
		 }
		
	 })
})
function callbackadd(param) {
	$.setReadOnly("editProductMix");
	$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	init(); 
}
</script>