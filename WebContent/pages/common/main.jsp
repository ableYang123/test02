<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/mainHeader.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 	<head>
	    <link rel="stylesheet" href="<c:url value='/style/bootstrap.css'/>" type="text/css"></link>
	  	<link rel="stylesheet" href="<c:url value='/style/main.css'/>" type="text/css"></link>
	  	<link rel="stylesheet" href="<c:url value='/style/bootstrapValidator.css'/>" type="text/css"></link>
	
	  	<style type="text/css">
	   		a:link{text-decoration: none;}
	    	a:hover{text-decoration: none;}
	    	a{
	    		cursor: pointer;
	    	}
	    	
	    	
	    			
			body{margin:0px;padding:0px;}
			#hidediv{position:absolute;left:0px;top:0px;width:100%;background-color:rgba(25,25,25,0.8);filter:alpha(opacity=60);opacity=60;display:none;z-Index:1001;height: 100%}
	    </style>
  
  	
  	


	</head>
	<body style="background-color: white;height:95.7%">
		<form id="languageForm" method="post" action="<c:url value='/'/>"> 
			<input type="hidden" value="" name="locale" id="locale">
			<input type="hidden" value="" name="nextPage" id="nextPage">
			<input type="hidden" value="" name="permissions" id="permissions">
		</form>  
		<div class="po-re color-grw" style="height:100%">	
			<div id="hidediv" > 
				<div class="spinner">
					<div class="spinner-container container1">
					    <div class="circle1"></div>
					    <div class="circle2"></div>
					    <div class="circle3"></div>
					    <div class="circle4"></div>
					</div>
					<div class="spinner-container container2">
					    <div class="circle1"></div>
					    <div class="circle2"></div>
					    <div class="circle3"></div>
					    <div class="circle4"></div>
					</div>
					<div class="spinner-container container3">
					    <div class="circle1"></div>
					    <div class="circle2"></div>
					    <div class="circle3"></div>
						<div class="circle4"></div>
					</div>
					<div style="padding-top:150px;  color:#1e90ff;font-size:x-large;font-family:'Futura';" >loading...</div> 				
				</div>
			</div>
			<div class="po-loab">
				<nav class="navbar navbar-default navbar-fixed-top ">
					<div class="container-fluid nonBor">
					
						<div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1" style="font-size: medium;">
							<div>
								<ul class="nav navbar-nav">
									<li style="padding-left: 180px">&nbsp;</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">客户<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=client.client.listClients'/>&userId=<%=request.getSession().getValue("userId")%>")'>客户列表</a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=group.listGroups'/>")'>组列表</a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=center.listCenters'/>")'>中心列表</a></li>
										</ul>
									</li>
									
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="deposit.label.accounting"/><span class="caret"></span></a>
										<ul class="dropdown-menu">
										<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.FrequentPostings.frequentPostings'/>")'><spring:message code="Frequent.Postings"/></a></li>
										<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.journalEntry.addJournalEntry'/>")'><spring:message code="Add.Journal.Entry"/></a></li>											
										<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.searchJournalEntries.searchJournalEntries'/>")'><spring:message code="search.journal.entries"/></a></li>
										<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.activitiesAccount.activitiesAccount'/>")'><spring:message code="deposit.label.mapping"/></a></li>
										<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.openingbalances.openingbalances'/>")'><spring:message code="opening.balances"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.chart.listCharts'/>")'><spring:message code="accounting.chart"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.glclosures.listClosures'/>")'><spring:message code="accounting.glclosures"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.role.listRoles'/>")'><spring:message code="accounting.rule"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.accrual.listAccruals'/>")'><spring:message code="accounting.accrual"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=accounting.entry.listEntries'/>")'><spring:message code="accounting.entry"/></a></li>
										</ul>
									</li>	
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="menu.report.report"/><span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reportsAll'/>")'><spring:message code="menu.report.all"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reports_clients'/>")'><spring:message code="menu.report.client"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reports_loans'/>")'><spring:message code="menu.report.loan"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reports_savings'/>")'><spring:message code="menu.report.savings"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reports_funds'/>")'><spring:message code="menu.report.fund"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reports_accounting'/>")'><spring:message code="menu.report.accounting"/></a></li>
											<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=report.reports_XBRLList'/>")'><spring:message code="menu.report.XBRL"/></a></li>

										</ul>
									</li>	
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
										<spring:message code="menu.admin.title"/>
										<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li>
												<a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=user.userlist'/>")'>
													<spring:message code="menu.admin.user"/>
												</a>
											</li>
											
											<li  class="dropdown-submenu">
												<a href="#" tabindex="-1" href="#" >
													<spring:message code="menu.admin.organization"/>
												</a>
												<ul class="dropdown-menu">  
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.office.officelist'/>")'>
														<spring:message code="menu.admin.manageOffices"/>
													</a></li>  

													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.holidays.holidaylist'/>")'>
														<spring:message code="menu.admin.manageHoliday"/>
													</a></li>  
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.staff.stafflist'/>")'>
														<spring:message code="menu.admin.manageEmployees"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.history.standinginstructions'/>")'>
														<spring:message code="menu.admin.standingInstruction"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.fund.search'/>")'>
														<spring:message code="menu.admin.fundMapping"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.password.passwordPreferences'/>")'>
														<spring:message code="menu.admin.passwordPreferences"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.provisioning.provisioningCriteriaList'/>")'>
														<spring:message code="menu.admin.loanProvisioningCriteria"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.datatable.entityDataTableList'/>")'>
														<spring:message code="menu.admin.entityDateTable"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.currency.currencyConfigList'/>")'>
														<spring:message code="menu.admin.currencyConfig"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.fund.manageFund'/>")'>
														<spring:message code="menu.admin.manageFunds"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.bulkLoan.bulkLoanReassignment'/>")'>
														<spring:message code="menu.admin.bulkLoanReassignment"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.cashier.tellerlist'/>")'>
														<spring:message code="menu.admin.cashierManagerment"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.working.workingDays'/>")'>
														<spring:message code="menu.admin.workingDays"/>
													</a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=orgnization.paymentType.paymentTypeList'/>")'>
														<spring:message code="menu.admin.paymentType"/>
													</a></li>
												</ul>  
											</li>
											
											<li  class="dropdown-submenu">
												<a href="#" tabindex="-1" href="#" ><spring:message code="menu.admin.system"/></a>
												<ul class="dropdown-menu">  
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.datatable.datatable_list'/>")'><spring:message code="menu.admin.system.datatables"/></a></li> 
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.code.code_list'/>")'><spring:message code="menu.admin.system.codes"/></a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.role.rolelist'/>")'><spring:message code="menu.admin.system.rolespermissions"/></a></li>  				
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.Maker Checker.makerchecker_list'/>")'><spring:message code="menu.admin.system.configuremaker"/></a></li> 
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.hooks.hook_list'/>")'><spring:message code="menu.admin.system.hooks"/></a></li>  
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.mapping.entityToEntity'/>")'><spring:message code="menu.admin.system.entitymapping"/></a></li>	
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.surveys.surveyslist'/>")'><spring:message code="menu.admin.system.surveys"/></a></li>				
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.audit.listAudits'/>")'><spring:message code="menu.admin.system.audittrails"/></a></li> 
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.report.listReports'/>")'><spring:message code="menu.admin.system.reports"/></a></li> 
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.jobs.listJobs'/>")'><spring:message code="menu.admin.system.schedulerjobs"/></a></li>  				
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.config.listConfigs'/>")'><spring:message code="menu.admin.system.configurations"/></a></li>  				
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=system.account.listAccounts'/>")'><spring:message code="menu.admin.system.account"/></a></li>  			
												</ul>  
											</li>
											<li  class="dropdown-submenu">
												<a href="#" tabindex="-1" href="#" ><spring:message code="label.list.product"/></a>
												<ul class="dropdown-menu">  
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.loanProduct.loanProductlist'/>")'><spring:message code="label.mapping.loanProducts"/></a></li>  	
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.savingsProduct.savingsProductlist'/>")'><spring:message code="label.mapping.savingsProducts"/></a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.shareProduct.shareProductlist'/>")'><spring:message code="share.product"/></a></li> 
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.cost.costlist'/>")'><spring:message code="label.mapping.charges"/></a></li>		
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.productMix.listProductMix'/>")'><spring:message code="lable.product.mix"/></a></li>		
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.fixedDepositProducts.fixedDepositProductList'/>")'><spring:message code="menu.admin.product.fixedDP"/></a></li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.recurringDepositProducts.recurringDepositProductList'/>")'><spring:message code="menu.admin.product.recurringDP"/></a></li>
													<li class="dropdown-submenu"><a href="#"><spring:message code="menu.admin.product.manageTaxConfig"/></a>
														<ul class="dropdown-menu">  
															<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.taxes.component.taxComponentList'/>")'><spring:message code="menu.admin.product.manageTaxComponent"/></a></li>
															<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.taxes.group.taxGroupList'/>")'><spring:message code="menu.admin.product.manageTaxGroup"/></a></li>
														</ul>
													</li>
													<li><a href="#" onclick='changePage("<c:url value='/loadPage.do?nextPage=product.floatingRates.floatingRatesList'/>")'><spring:message code="menu.admin.product.floatingRate"/></a></li>
												</ul>  
 											</li> 
										</ul>
									</li>										       
								</ul>
							</div>
									
							<div class=" collapse navbar-collapse navbar-right">
								<ul class="nav navbar-nav " >
								 <li>
									<div class="input-group" style="padding-top: 2px;width: 300px;">
									    <input type="text" name="query" id="query" class="form-control input-lg" style="width: 177px">
									    <select id="resource" class="form-control" style="width: 83px;height:46px">
											<option selected="selected" value="clients,clientIdentifiers,groups,savings,shares,loans"><spring:message code="zmenu.search.all"/></option>
											<option value="clients,clientIdentifiers"><spring:message code="menu.search.clients"/></option>
											<option value="groups"><spring:message code="menu.search.groups"/></option>
											<option value="savings"><spring:message code="menu.search.savings"/></option>
											<option value="loans"><spring:message code="menu.search.loans"/></option>
											<option value="shares"><spring:message code="menu.search.shares"/></option>
										</select>
									    <span class="input-group-addon" onclick="search();"><a href="#" class=" glyphicon glyphicon-search"></a></span>
									</div>
								</li> 
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=request.getSession().getValue("username")%><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=user.userCenter'/>")'><span class="glyphicon glyphicon-user"></span>个人中心</a></li>
										<li><a onclick='changePage("<c:url value='/loadPage.do?nextPage=user.setting'/>")'><span class="glyphicon glyphicon-cog"></span>设置</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="<c:url value='/LoginController/loginOut.do'/>">注销</a></li>
									</ul>
								</li>
								</ul>
							</div>
										
						</div>
								 
					</div>
				</nav>
			</div>
				
			<div class="insideWid po-lohi" id="accordion" style="padding-right: 20px;height:95%"  >
				<nav class="navbar navbar-fixed-top insideWid" >
					<div  class="nonBor insideHe" id="mainBtn">
						<div class="panel-heading  insideHe " >
							<button type="button" class="btn btn-default color-deep" aria-label="Left Align" >
								<span class="glyphicon glyphicon-th-list colorW-font"  saria-hidden="true" ></span>
							</button>
							<a href="#" class=" title-sty" onclick='changePage("<c:url value='/loadPage.do?nextPage=common.index'/>")'>
								<img src="<c:url value='/img/logo.png'/>"></img>
							</a>
						</div>
						<div id="collapseOne" class="btnmain-div" style=" background-color: rgba(3, 17, 24,0.85);width: 25%;position: absolute;">
						
							<ul class="nav nav-pills nav-stacked" >
								<li><a style="color: white ;" href="#" aria-label="Left Align" onclick='changePage("<c:url value='/loadPage.do?nextPage=common.index'/>")'><i class="glyphicon glyphicon-heart-empty"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;首页</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=common.tasks'/>')" ><i class="glyphicon glyphicon-fire"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;<spring:message code="label.anchor.tasks"/></span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('test.jsp')" ><i class="glyphicon glyphicon-fire"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;收取款项明细表</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('test.jsp')"><i class="glyphicon glyphicon-send"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;个人收集表</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=accounting.FrequentPostings.frequentPostings'/>')"><i class="glyphicon glyphicon-tower"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;频繁过账</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=accounting.journalEntry.addJournalEntry'/>')"><i class="glyphicon glyphicon-tree-conifer"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;添加日记条目</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=accounting.glclosures.listClosures'/>')"><i class="glyphicon glyphicon-tree-deciduous"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;关闭条目</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=accounting.chart.listCharts'/>')"><i class="glyphicon glyphicon-tree-conifer"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;会计科目</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('test.jsp')"><i class="glyphicon glyphicon-leaf"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;通知</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=client.client.addClient'/>')"><i class="glyphicon glyphicon-plus"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;+客户</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=group.addGroup'/>')"><i class="glyphicon glyphicon-plus"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;+组</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('<c:url value='/loadPage.do?nextPage=center.addCenters'/>')"><i class="glyphicon glyphicon-fire"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;+中心</span></a></li>
								<li><a style="color: white;" href="#" aria-label="Left Align" onclick="changePage('test.jsp')"><i class="glyphicon glyphicon-leaf"></i>&nbsp;<span style="display: inline-block">&nbsp;&nbsp;&nbsp;balabala</span></a></li>

							</ul>
						</div>
					</div>
				</nav>
	  		</div>
	
	
	  
		  	<div class="iframe-div" style="margin-left:2%;margin-top: 2%">
		  		<iframe id="mainFrm" class="iframe-style" src="<c:url value='/loadPage.do?nextPage=common.index'/>"></iframe>
		  	</div>
		  
			<div class="footer text-center">  版权所有 @loyalquality  </div>  
    
		</div>
  
		<script type="text/javascript">

			$("#collapseOne li span").css("display","none");
		
			
		$("#collapseOne").mouseenter(function(){
			
				$("#collapseOne").css("position","absolute");
				$("#collapseOne li span").css("display","");
				$("#collapseOne li").css("width","200");
				$("#collapseOne").stop().animate({
					width:'100%',
				},function(){
					$("#collapseOne").css("position","absolute");
					$("#collapseOne li").css("width","200");
					$("#collapseOne li span").css("display","");
				});
				
			
			
			
		});
		
		
		$("#collapseOne").mouseleave(function(){
			
			$("#collapseOne").stop().animate({width:"25%"},function(){
				$("#collapseOne li").css("width","0");
				$("#collapseOne li").css("height","40");
				$("#collapseOne li span").css("display","none");
			});
			
		});
		
		
		

			$("#collapseOne").on("mouseenter mouseleave","li",function(event){
				if(event.type == "mouseenter") {
					$("#collapseOne li").removeClass("active");
					$(this).addClass("active");
				}else if(event.type == "mouseleave"){
					$("#collapseOne li").removeClass("active");
				}	
			})

  			/*$("#mainBtn").hover(function(){
  				$("#collapseOne").css("visibility","visible");
  			},function(){
  				$("#collapseOne").css("visibility","hidden");
  			});*/
  			var permissions = "${pd.permissions}".split(",");
  			var permissionsJson = {};
  			var ALL_FUNCTIONS = false;
  			if(!$.isEmpty(permissions) && permissions.length>0){
  				for(var i=0;i<permissions.length;i++){
  					permissionsJson[permissions[i]] = "true";
  					if(permissions[i] == "ALL_FUNCTIONS"){
  						ALL_FUNCTIONS = true;
  					}
  				}
  			}
  			
  			function getPermissions(str){
  				if(!$.isEmpty(permissionsJson[str]) || ALL_FUNCTIONS) {
  					return true;
  				}else{
  					return false;
  				}
  			}
  	
  			function p_show()
  			{
  			   $("#hidediv").css("display","block");

  			}
  			function p_hide()
  			{
  				$("#hidediv").css("display","none");
  			}
  				
			  function search()
			{
			
				var url = "<c:url value='/loadPage.do?nextPage=common.search'/>"+"&query="+$.value("query")+"&resource="+$.value("resource");
				$("#mainFrm").attr("src",url);
			}			
			function language(locale){
				$("#languageForm").attr("action", "<c:url value='/loadPage.do'/>");
				$.assign({"nextPage":"common.main"});
				$.assign({"permissions":"${pd.permissions}"});
				$.assign({"locale":locale});
				$("#languageForm").submit();
			}		
  			if(!$.isEmpty("${pd.locale}")){
				changePage("<c:url value='/loadPage.do?nextPage=user.setting'/>");
  			}
  		</script>
  
	</body>
</html>
