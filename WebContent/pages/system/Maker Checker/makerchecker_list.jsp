<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #fff">
            
		<div style="margin: 30px 200px;  font-size: large">
				<ul class="breadcrumb">
				<li class="active"><a href="#"><spring:message code="label.task.name"/></a></li>
				</ul>
		</div>
            <br>
         <form class="form-horizontal" id="makercheckerform" name="makercheckerform">
           <div class="div-cc" >  
                <div class="btn-group col-sm-2">
                    <a class="btn btn-primary" id="edit"><font><spring:message code="btn.edit"/></font></a>
                </div>           
            <table width="100%">
                <tbody>
                <tr>
                    <td width="25%" valign="top">
                        <table width="100%">
                            <tbody id="tbody1">
                            <tr>
                            <td style="padding-left:30px"><a grouping="accounting"><spring:message code="label.role.accounting"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="account_transfer"><spring:message code="label.role.accountTransfer"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="authorisation"><spring:message code="label.role.authorisation"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="cash_mgmt"><spring:message code="label.role.cashMgmt"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="collection_sheet"><spring:message code="label.role.collectionSheet"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="configuration"><spring:message code="label.role.configuration"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="datatable"><spring:message code="label.role.datatable"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="externalservices"><spring:message code="label.role.externalservices"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="infrastructure"><spring:message code="label.role.infrastructure"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="jobs"><spring:message code="label.role.jobs"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="LOAN_PROVISIONING"><spring:message code="label.role.loanProvisioning"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="loan_reschedule"><spring:message code="label.role.loanReschedule"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="organisation"><spring:message code="label.role.organisation"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="portfolio"><spring:message code="label.role.portfolio"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="portfolio_center"><spring:message code="label.role.center"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="portfolio_group"><spring:message code="label.role.group"/></a></td>
                        </tr>                     
                        <tr>
                            <td style="padding-left:30px"><a grouping="SHAREACCOUNT"><spring:message code="label.role.shareaccount"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="SHAREPRODUCT"><spring:message code="label.role.shareproduct"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="SSBENEFICIARYTPT"><spring:message code="label.role.ssbeneficiarytpt"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="survey"><spring:message code="label.role.survey"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="transaction_client"><spring:message code="label.role.clientTransactions"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="transaction_loan"><spring:message code="label.role.loanTransactions"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="transaction_savings"><spring:message code="label.role.saviingsTransactions"/></a></td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px"><a grouping="xbrlmapping"><spring:message code="label.role.xbrlmapping"/></a></td>
                        </tr>
                       		</tbody>
                        </table>
                    </td>
                    <td class="left-border" valign="top">
                        <table width="100%">
                            <tbody  id="tbody2">
                            
                        	</tbody>
                        </table>
                    </td>
                </tr>
              </tbody>
            </table>
            <div class="col-md-offset-3">
                <a  style="display:none" id="cancel" class="btn btn-default"><font><spring:message code="btn.cancle"/></font></a>
                <button style="display:none" id="save" type="button" class="btn btn-primary"><font><spring:message code="btn.submit"/></font></button>
            </div>
           </div>
         </form>
       <script type="text/javascript">
       $(document).ready(function() {
    	   //初始化
    	   init();
   	 $('tbody[id="tbody1"] td a').click(function(){
			var codevalue = $(this).attr('grouping');	
			$('tbody[id="tbody2"] tr').css('display','none');
			//获取grouping对应的值，并让右表中对应的tr input 显示出来
			$('tbody[id="tbody2"] tr[id="'+codevalue+'"]').css('display','block');
	
		});	
 	//提交
		$.getWidget("save").click(function(){
			if($.validateForm("makercheckerform")){	
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
			console.info(json_commit);
			 $.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				data : {
					'dataType' : "PUT",
					'mydata' : json_commit,
					"url" : "api.v1.permissions?makerCheckerable=true"
				},
				callback : "edit_success"
			}); 
			}
		});
       });
       function init(){ 
       //检索制造商检查任务列表
    	    $.nest({
    			url : "<c:url value='/fineract.do'/>",
    			type : "post",
    			data : {
    				"dataType" : "GET",
    				"mydata" : "",
    				"url" : "api.v1.permissions?makerCheckerable=true"
    			},
    			callback : "getvalue"
    		}); 
       }
       //点击编辑按钮后，复选框可选，取消按钮跟提交按钮显示出来
	   $("#edit").click(function(){ 
		   $("#edit").hide();
		   $("#cancel").show();
		   $("#save").show();
		   $('input[type=checkbox]').attr("disabled", false);	    		    
	   }); 
	   //点击取消按钮后
	   $("#cancel").click(function(){
		   $("#edit").show();
		   $("#cancel").hide();
		   $("#save").hide();
		   $('input[type=checkbox]').attr("disabled", true);
		   $('tbody[id="tbody2"]').empty();
		   init();
	   });
 			 	  
    	 function getvalue(param){
    		        
    			//遍历返回结果		
    			$.each(param,function(index,item){
    				if(param[index].selected==true){
    					$('tbody[id="tbody2"]').append('<tr id="'+param[index].grouping+'" style="display:none"><td><input type="checkbox" checked="true" disabled="disabled"/>'+param[index].code+'</td></tr>');
    				}else{
    					$('tbody[id="tbody2"]').append('<tr id="'+param[index].grouping+'" style="display:none"><td><input type="checkbox" disabled="disabled"/>'+param[index].code+'</td></tr>');
    				}
    			});    	
    			 //tbody2中数据填充完毕之后，初始化
    			$('tr[id="portfolio"]').show();	
    			
    	 }  
    	 function edit_success(param) {
    		//点击提交按钮后，编辑按钮出现，取消跟提交按钮消失，复选框变为不可选择
    	   $("#edit").show();
 		   $("#cancel").hide();
 		   $("#save").hide();
 		   $('input[type=checkbox]').attr("disabled", true);
 		  $('tbody[id="tbody2"]').empty();
    	   init();
    	   $('tr[id="portfolio"]').show();
    	 	}
       
       </script>
</body>
</html>