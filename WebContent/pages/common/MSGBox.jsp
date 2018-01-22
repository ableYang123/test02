<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container-fluid">
	<div class="row" style="text-align:center;width:100%;">
		<span class="form-group">
			<button id="box-confirm" class="btn btn-success">
				<span class="glyphicon glyphicon-ok"></span> <spring:message code="label.button.approve"/>
			</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="box-cancel" class="btn btn-info">
				<span class="glyphicon glyphicon-remove"></span> <spring:message code="label.button.cancel"/>
			</button>
		</span>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		var boxtype='${pd.boxtype}';
		$('#box-confirm').click(function(){
			var date,fun;
			switch(boxtype)
			{
			case '1':
				data='approvedOnDate';
				fun='approveLoans';
			  break;
			case '2':
				data='actualDisbursementDate';
				fun='actualDisbursement';
			  break;
			case '3':
				data='approvedOnDate';
				fun='approveLoans';
			  break;
			default:
			  return;
			}
		var json = JSON.parse('{"locale":"en","dateFormat":"yyyy-MM-dd","'+
				  data+'":"'+$.getLocaleDate()
				+'"}');
		$('#myModal').modal('hide');
		eval(fun+'(json)');
		});
		$('#box-cancel').click(function(){
			$('#myModal').modal('hide');
		});
	});
</script>