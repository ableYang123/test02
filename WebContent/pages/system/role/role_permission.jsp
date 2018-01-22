<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #fff"> 
          <form class="form-horizontal" id="rolepermission" name="rolepermission" method="post">
				<fieldset>
		<legend><spring:message code="label.role.editPermissions"/></legend>
		<table width="100%">
			<tbody> 
				<tr> 
					<td width="20%"><spring:message code="label.role.name"/></td> 
					<td width="80%">
						<span id="name"></span>			
					</td>
				</tr>
				<tr>
					<td width="20%"><spring:message code="label.role.description"/></td>
					<td width="80%">
						<span id="description"></span>	
					</td>
				</tr>
			</tbody>
		</table>
        <hr>
        </div>
        <h3>
        	<spring:message code="label.role.permissions"/>：&nbsp;&nbsp;
        <strong>
        	<spring:message code="label.role.special"/>
        </strong>
        </h3>
        <table width="100%">
            <tbody>
            <tr>
                <td width="30%" valign="top">
                    <table width="100%">
                        <tbody id="tbody1">
                        <tr>
                            <td><a grouping="accounting"><spring:message code="label.role.accounting"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="account_transfer"><spring:message code="label.role.accountTransfer"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="authorisation"><spring:message code="label.role.authorisation"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="cash_mgmt"><spring:message code="label.role.cashMgmt"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="collection_sheet"><spring:message code="label.role.collectionSheet"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="configuration"><spring:message code="label.role.configuration"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="datatable"><spring:message code="label.role.datatable"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="externalservices"><spring:message code="label.role.externalservices"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="infrastructure"><spring:message code="label.role.infrastructure"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="jobs"><spring:message code="label.role.jobs"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="LOAN_PROVISIONING"><spring:message code="label.role.loanProvisioning"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="loan_reschedule"><spring:message code="label.role.loanReschedule"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="organisation"><spring:message code="label.role.organisation"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="portfolio"><spring:message code="label.role.portfolio"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="portfolio_center"><spring:message code="label.role.center"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="portfolio_group"><spring:message code="label.role.group"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="report"><spring:message code="label.role.report"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="SHAREACCOUNT"><spring:message code="label.role.shareaccount"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="SHAREPRODUCT"><spring:message code="label.role.shareproduct"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="special"><spring:message code="label.role.special"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="SSBENEFICIARYTPT"><spring:message code="label.role.ssbeneficiarytpt"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="survey"><spring:message code="label.role.survey"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="transaction_client"><spring:message code="label.role.clientTransactions"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="transaction_loan"><spring:message code="label.role.loanTransactions"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="transaction_savings"><spring:message code="label.role.saviingsTransactions"/></a></td>
                        </tr>
                        <tr>
                            <td><a grouping="xbrlmapping"><spring:message code="label.role.xbrlmapping"/></a></td>
                        </tr>
                    </tbody></table>
                </td>
                <td width="70%" valign="top" class="left-border">
                    <table width="100%">
                        <tbody id="tbody2">
                        </tbody>
                  </table>
                </td>
            </tr>
        </tbody>
      </table>
	</fieldset>
		<div class="col-sm-offset-3">
				<button type='button' id="save" name="save"
				class="btn btn-primary"><spring:message code="btn.submit"/></button>
		</div>
 </form>
    <script type="text/javascript">
	var data;
    $(document).ready(function() {
    $.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		data : {
			"dataType" : "GET",
			"mydata" : "",
			"url" : "api.v1.roles."+roleid
		},
		callback : "getvalue"
	});
    //检索权限
    $.nest({
		url : "<c:url value='/fineract.do'/>",
		type : "post",
		data : {
			"dataType" : "GET",
			"mydata" : "",
			"url" : "api.v1.roles."+roleid+".permissions"
		},
		callback : "getpermission"
	}); 
				
		$('tbody[id="tbody1"] td a').click(function(){
			var codevalue = $(this).attr('grouping');	
			$('tbody[id="tbody2"] tr').css('display','none');
			//获取grouping对应的值，并让右表中对应的tr input 显示出来
			$('tbody[id="tbody2"] tr[id="'+codevalue+'"]').css('display','block');
	
		});	
		//提交
 		$.getWidget("save").click(function(){
 			if($.validateForm("rolepermission")){	
 			var permissions_json = {};
 			//被选中的勾选框
 			var input_node_ch = $('#tbody2 input[type="checkbox"]:checked').closest('td');	
 			//未被选中的勾选框
 			var input_node_un = $('#tbody2 input[type="checkbox"').not("input:checked").closest('td');
 			
 			
 			//遍历选中的input
 			$.each(input_node_ch,function(){
 				var txt = $(this).text();
 				if(!$.isEmpty(txt)){
 					permissions_json[txt] = true;
 				}
 			});
 			 //遍历未选中的input
 			 $.each(input_node_un,function(){
 				var txt = $(this).text();
 				
 				if(!$.isEmpty(txt)){
 					permissions_json[txt] = false;
 				}	
 			});  
 			var json_commit = {  
 					"permissions":permissions_json
 			};  
 			 $.nest({
 				url : "<c:url value='/fineract.do'/>",
 				type : "post",
 				data : {
 					'dataType' : "PUT",
 					'mydata' : json_commit,
 					"url" : "api.v1.roles."+roleid+".permissions"
 				},
 				callback : "editpermission_success"
 			}); 
 			}
 		});
 });
    //名称属性跟描述属性获取属性值
    function getvalue(param) {
 		$('#name').text(param.name);
 		$('#description').text(param.description);
 	}
 
    function getpermission(param){ 
        data = param.permissionUsageData;        
		//遍历返回结果		
		$.each(data,function(index,item){
			if(data[index].selected==true){
				$('tbody[id="tbody2"]').append('<tr id="'+data[index].grouping+'" style="display:none"><td><input type="checkbox" checked="true"/>'+data[index].code+'</td></tr>');
			}else{
				$('tbody[id="tbody2"]').append('<tr id="'+data[index].grouping+'" style="display:none"><td><input type="checkbox"/>'+data[index].code+'</td></tr>');
			}
		});	
		//tbody2中数据填充完毕之后，初始化
		$('tr[id="special"]').show();
		
	}
    function editpermission_success(param) {
 		$.setReadOnly("rolepermission");
 		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
 	}
   	
    </script>
    </body>
</html>