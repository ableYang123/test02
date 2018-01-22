<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<c:url value='/js/jquery.webcam.min.js'/>"></script>
</head>
<body>
	<div class="div-cc">
		<div>
			<divstyle="height:40px;padding-top:5px;">
			 <p id="p1" style="font-size:18px;"></p>
		</div>
		
		<legend></legend>
		
			<div id="s1" style="float:right; height=35px; margin-bottom:10px;">
					<span id="editCenter"> <a href="javascript:void(0)"
						onclick="editCenterApplication()" style="margin-top: 3px" id="edit" name="edit"
						class="btn btn-primary btn-offset"> <i
							class="glyphicon glyphicon-edit"></i> 修改应用程序
					</a>
					</span> 
					 
					<span id="approve"> <a href="javascript:void(0)"
						onclick="approveSavingAccount()" style="margin-top: 3px" id="addgroup"
						name="addgroup" class="btn btn-primary btn-offset"> <i
							class="glyphicon glyphicon-plus"></i> 批准
					</a>
					</span> 
					</span> 
			
					<span id="assign"> <a href="javascript:void(0)"
						onclick="assignSavingStaff()" style="margin-top: 3px" id="newSaving"
						name="manageGroup" newSaving"" class="btn btn-primary btn-offset"/>
						 <i class="glyphicon glyphicon-plus"></i> 分配储蓄员工
					</a>
					</span> 

					<span class="dropdown" id="more1">
						<button style="margin-top:3px;padding-right:20px;"
							class="btn btn-primary dropdown-toggle" type="button"
							id="more" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="true">
							更多 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<li id="reject"><a href="javascript:void(0)"
								onclick="reject()">拒绝</a></li>
							<li id="withdraw"><a href="javascript:void(0)"
								onclick="withdrawSavingAccount()">退出客户端</a></li>
							<li id="addcharge"><a href="javascript:void(0)"
								onclick="addCharge()">添加费用</a></li>
							<li id="del"><a href="javascript:void(0)"
								onclick="deleteApplication()">删除</a></li>
						</ul>
					</span> 
			</div>
		<!-- 清除浮动 -->	
		<div  style="clear:both;margin:0;padding:0;"></div>	
			
		<div style="float:left;">
			<table class="table table-bordered" style="width: 400px;background-color:#f5f5f5;">
					<tr>
						<td>激活了</td>
						<td id="active"></td>
					</tr>
					<tr>
						<td>货币</td>
						<td id="currency" style="background-color:#FFFFFF;"></td>
					</tr>
					<tr>
						<td>外部ID</td>
						<td id="externalId"></td>
					</tr>
			</table>
		</div>
		
		<div style="float:right;">
			<table class="table table-bordered" style="width: 400px; background-color:#f5f5f5;">
					<tr>
						<td>职员</td>
						<td id="FieldOfficer"></td>
					</tr>
					<tr>
						<td>平衡</td>
						<td id="balance" style="background-color:#FFFFFF;">0</td>
					</tr>
			</table>
		</div>
		
		<div style="clear:both;"></div>
		
		<legend></legend>
		
		<legend><button id="btn1">test</button></legend>
		<legend></legend>
		
				 <div id="s3">
						<table id="savingList" class="table">
							<thead>
								<tr>
									<th name='id' width='200'>id</th>
									<th name="accountNo" width='200'>交易日期</th>
									<th name="productName" width='200'>交易类型</th>
									<th name="balance" width='200'>借方</th>
									<th name="balance" width='200'>信用</th>
									<th name="balance" width='200'>平衡</th>
									<th name="balance" width='200'>查收数据</th>
								</tr>
							</thead>
						</table>
					  </div>
					  <button id="btn2" style="float:right;display:none">ADD</button>
		</div>
</body>
	<script type="text/javascript">
	 var groupId="${pd.groupId}";
	 var savingsId="${pd.savingsId}";
	 var centerId="${pd.centerId}";
	 var status1="${pd.status1}";
	 var withHoldTax;
	 if(status1=="Rejected"){
		$("#editCenter").hide();
		$("#approve").hide();
		$("#editCenter").hide();
		$("#more").hide();
	 }
	
	$(document).ready(function(){
		
		
		$("#btn1").click(function(){
			$("#s3").css("display","none");
			$("#btn2").css("display","block");
		})
		$("#btn2").click(function(){
			//跳转到数据表-测试
		})
		centerInit();
		$('#myModal').on('hidden.bs.modal',
				function(event) {
					centerInit();
				});
	});
	
		function centerInit(){
			$.nest({
				url : "<c:url value='/fineract.do'/>",
				type : "post",
				async : true,
				data : {
					"dataType" : "GET",
					"mydata" : "",
					"url" : "api.v1.savingsaccounts."+savingsId+"?associations=all"
				},
				callback : "callback1"
			});	
		}
	
	  function callback1(param){
		  groupId = param.groupId;
		  withHoldTax = param.withHoldTax;
		  var savingsProductName=param.savingsProductName;
		  var accountNo=param.accountNo;
		  var str=savingsProductName+'#'+accountNo;
		  $("#p1").text(str);
		  
		  var flag=param.status.active;
		  
		  if(flag.toString()=="false"){
			  $("#active").text("未激活");
		  }else{
			  $("#active").text("已激活");
		  }
 
		  $("#currency").text(param.currency.name);
		  
		  if(typeof(param.externalId)!="undefined"){
			  $("#externalId").text(param.externalId);
		  }else{
			  $("#externalId").text(" ");
		  }
		 
		  var fieldOfficerName=param.fieldOfficerName;
		  if(typeof(fieldOfficerName)=="undefined"){
			  $("#FieldOfficer").text("未分配");
		  }else{
			  $("#FieldOfficer").text(fieldOfficerName);
		  }		  	
	  }	
	  
	  function editCenterApplication(param){
		  $.openWindow("loadPage.do?nextPage=center.editCenterApplication&savingsId="+savingsId+"&groupId="+groupId+"&withHoldTax="+withHoldTax);  
	  }
	  function approveSavingAccount(param){
		  $.openWindow("loadPage.do?nextPage=center.approveSavingAccount&centerId="+centerId);  
	  }
	  function assignSavingStaff(param){
		  $.openWindow("loadPage.do?nextPage=center.assignSavingStaff");
	  }
	  function unassignSavingStaff(param){
		  $.openWindow("loadPage.do?nextPage=center.unassignSavingStaff");

	  } 
	  function reject(param){
		  $.openWindow("loadPage.do?nextPage=center.rejectSavingAccount");
	  }
	  function withdrawSavingAccount(param){
		  $.openWindow("loadPage.do?nextPage=center.withdrawSavingAccount");
	  }
	  function addCharge(param){
		  $.openWindow("loadPage.do?nextPage=center.addCharge");
	  }
	  
	  function deleteApplication(param){  
		  $.openWindow("loadPage.do?nextPage=center.addCharge");
	  }
	  
	</script>
</html>

