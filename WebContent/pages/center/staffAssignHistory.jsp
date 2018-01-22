<%@ page pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<style type="text/css">
		h4 {
		    float: left;
    		margin: 0;
    		padding: 10px 10px;
    		font-size: 18px;
   		 	ont-weight: bold;
		}
		
		.toolbar {
				height: 40px;
   				border-bottom: 1px solid #e5e5e5;
		}
	</style>
<div>
	
	<div class="form-group">
		<div class="toolbar">
			<label><font>Staff Assignment History</font></label>
		</div>
		<div>
			<h4 class="col-md-2"><font id="centerId">CenterId:</font></h4>
			<label class="col-md-1"></label>
			<h4 class="col-md-2"><font id="centerName">CenterName:</font></h4>
		</div>
	</div>
	<table class="table" style="border-top: 1px solid #ddd;">
		<thead>
		      <tr class="graybg">
        		<th colspan="2" valign="middle">Staff Id</td>
        		<th colspan="3" valign="middle">Staff Name</td>
        		<th valign="middle">From</td>
        		<th colspan="3" valign="middle">Assigned On</td>
        		<th valign="middle">Assigned By</td>
        		<th valign="middle">To</td>
        		<th colspan="2" valign="middle">Unassigned On</td>
        		<th valign="middle">Unassigned By</td>
      		</tr>
		</thead>
		<tbody label="v_history">
		</tbody>
	</table>
</div>

<script type="text/javascript">
	 $(document).ready(function(){
		 var str = encodeURIComponent("Staff Assignment History");
		 var centerId = '${pd.centerId}';
			var api_url = "api.v1.runreports."+ str +"?output-type=HTML&tenantIdentifier=default&locale=zh_CN&R_centerId="+centerId;
			
			$.nest({
				url : '<c:url value="/fineract.do"/>',
				type : 'post',
				data : {
					'dataType' : 'GET',
					'mydata' : '',
					'url' : api_url
				},
				callback : function($xmlDoc){
					var tab_node = $xmlDoc.find('table')[0];
					console.log(tab_node);
					var tr_node = $(tab_node).find('tr');
					$('#centerId').append($($(tr_node[1]).find('td')[1]).text());
					$('#centerName').append($($(tr_node[1]).find('td')[3]).text());
					if(typeof(tr_node[3]) != 'undefined'){
						for(var i=3;i<tr_node.length;i++){
							var td_node = $(tr_node[i]);
							var str = '<tr class="graybg">';
							str += '<td colspan="2" valign="top">'+$(td_node.find('td')[0]).text()+'</td>';
							str += '<td colspan="3" valign="top">'+$(td_node.find('td')[1]).text()+'</td>';
							str += '<td valign="top">'+$(td_node.find('td')[2]).text()+'</td>';
							str += '<td />';
							str += '<td colspan="2" valign="top">'+$(td_node.find('td')[4]).text()+'</td>';
							str += '<td valign="top">'+$(td_node.find('td')[5]).text()+'</td>';
							str += '<td valign="top">'+$(td_node.find('td')[6]).text()+'</td>';
							str += '<td />';
							str += '<td valign="top" class="style-2">'+$(td_node.find('td')[8]).text()+'</td>';
						    str += '<td valign="top" class="style-2">'+$(td_node.find('td')[9]).text()+'</td>';  
						    str += '<td />'; 
							str += '</tr>';
							
							$('tbody[label="v_history"]').append(str);
						}
					}
				}
			});
	 });
	 
	
	
</script>