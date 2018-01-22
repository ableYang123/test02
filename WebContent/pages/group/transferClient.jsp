<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form class="form-horizontal" id="transferClient" name="transferClient" method="post">
	<fieldset>
		<div>
		<label><spring:message
				code="group.transfer.client.between.groups" /></label>
	</div>
	<hr style="margin-top: 5; margin-bottom: 15">
	<div
		style="height: 170px; margin-top: 20px; margin-left: 50px; margin-right: 50px">
		<div>
			<div class="col-sm-4 col-md-4" style="padding-left: 1px">
				<spring:message code="group.client" />
			</div>
			<div class="col-sm-4 col-md-4">
				<spring:message code="group.available.clients" />
			</div>
			<div class="col-sm-4 col-md-4" style="text-align: right">
				<spring:message code="group.selected.clients" />
			</div>
		</div>
		<div style="margin-left: 60px">
			<div class="col-sm-5 col-md-5" id="intrinsicMemberList"
				style="height: 200px; overflow-y: scroll; border: 1px solid #000; padding-left: 0px; padding-right: 0px">
			</div>
			<div class="col-sm-2 col-md-2">
				<div
					style="width: 20px; height: 50px; margin-top: 50px; margin-left: 25px">
					<button type="button" id="add" name="add" class="btn btn-primary"
						onclick="removeMember('removeMemberList')">>></button>
				</div>
				<div style="width: 20px; height: 50px; margin-left: 25px">
					<button type="button" id="add" name="add" class="btn btn-primary"
						onclick="removeMember('intrinsicMemberList')"><<</button>
				</div>
			</div>
			<div class="col-sm-5 col-md-5" id="removeMemberList"
				style="height: 200px; overflow-y: scroll; border: 1px solid #000">
			</div>
		</div>
	</div>
	<div
		style="height: 60px; margin-top: 50px; margin-left: 50px; margin-right: 50px">
		<div class="col-sm-3 col-md-3" style="margin-top: 25px;">
			<span><spring:message
					code="group.inherit.group.loan.officer"/></span>
		</div>
		<div class="col-sm-2 col-md-2"
			style="margin-top: 25px; padding-left: 0px">
			<input id="active" type="checkbox" lang="0">
		</div>
	</div>
	<div
		style="height: 50px; margin-top: 25px; margin-left: 50px; margin-right: 50px">
		<div class="col-sm-3 col-md-3">
			<spring:message code="group.destination.group" />
			<span style="color: #d9534f;">*</span>
		</div>
		<div class="col-sm-2 col-md-2" style="padding-left: 0px">
			<!-- <input type="text" id="targetGroup" name="targetGroup"> -->
			<input datatype="search" id="searchClient" name="searchClient" api="" textname="name" autocomplete="off" class="form-control">
		</div>
	</div>
	<div class="form-group" style="display:none" id="table">
		<table class="table" style="width:40%"> 
			<tbody id="tbody">
				<tr>
					<td><h3>目的地组细节</h3></td>
				</tr>
				<tr>
					<td>名称</td>
					<td id="t1"></td>
				</tr>
				<tr>
					<td>ID</td>
					<td id="t2"></td>
				</tr>
				<tr>
					<td>激活日期</td>
					<td id="t3"></td>
				</tr>
				<tr>
					<td>员工</td>
					<td id="t4"></td>
				</tr>
				<tr>
					<td>外部ID</td>
					<td id="t5"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="text-center" style="padding-right: 80px">
		<button type="button" class="btn btn-default" data-dismiss="modal">
			<spring:message code="btn.cancle"/>
		</button>
		<button type="button" id="save" name="save" class="btn btn-primary">
			<spring:message code="btn.submit"/>
		</button>
	</div>
	</fieldset>
</form>

	<script type="text/javascript">
	var selectedId = -1;
	var selectedMember;
	var clientMembersList;
	$(document).ready(function() {
		initThisWindow();
	});

	function initThisWindow() {
		/* 获取组已有成员 */
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"url" : "api.v1.groups." + groupId
						+ "?associations=clientMembers&template=true"
			},
			callback : "initClientMembers"
		});
	}

	/* 初始化组的成员列表 */
	function initClientMembers(param) {
		//初始化搜索框
		var keyArr = ['id','name','activationDate','staffName','externalId'];
		var api_url = 'api.v1.groups?officeId='+param.officeId+'&orderBy=name&sortOrder=ASC&name=';
		$('#searchClient').attr('api',api_url);
		$.inputSearchInit([],keyArr,'searchClient','true','false');
		clientMembersList = param.clientMembers;
		if(typeof(clientMembersList)=="undefined")
			return 0;
		var name;
		var accountNo;
		var id;
		for (var i = 0, l = clientMembersList.length; i < l; i++) {
			name = clientMembersList[i].displayName;
			accountNo = clientMembersList[i].accountNo;
			id = clientMembersList[i].id;
			var Member = accountNo + "  " + name;
			addMember(Member, id, "intrinsicMemberList");
		}
	}
	
	
	$(document).on('click','#searchBoxUl_searchClient li ',function(){
		$("#t1").empty();
		$("#t2").empty();
		$("#t3").empty();
		$("#t4").empty();
		$("#t5").empty();
    	$('#searchClient')[0].focus();
		$('#searchClient').val($(this).text());
    	$('#t1').text($(this).text());
    	$('#t2').text($(this).attr('_id'));
        $('#t3').text($.formatDate($(this).attr('_activationDate')));
    	$('#t4').text($(this).attr('_staffName'));
    	$('#t5').text($(this).attr('_externalId'));
    	$('#searchBoxUl_searchClient').empty();
		$('#searchBoxUl_searchClient').hide();
		$("#table").show();
		
    });

	/*在列表中添加Member  */
	function addMember(Member, id, TargetId) {
		$("#" + TargetId)
				.append(
						"<div id="
								+ id
								+ " class='list-group-item'"
								+ "style='padding-left: 5; padding-right: 5';border:0px"
								+ " onclick='selectMember(" + id + ")'>"
								+ Member + "</div>");
	}

	/* 选中Member */
	function selectMember(id) {
		var TargetChilds = $($("#"+ id).parent()).children();
		selectedId = id;
		var childId;
		for (var i = TargetChilds.length - 1; i >= 0; i--) {
			childId = $(TargetChilds[i]).attr("id");
			if (childId == id) {
				$("#" + childId).css("background-color", "#3399FF");
				selectedMember = $("#" + childId).text();
			} else {
				$("#" + childId).css("background-color", "#FFFFFF");
			}
		}
	}

	/* 移动Member */
	function removeMember(targetId) {
		var parantId = $("#" + selectedId).parent().attr("id");
		if (selectedId >= 0) {
			if (targetId != parantId) {
				$("#" + selectedId).remove();
				addMember(selectedMember, selectedId, targetId);
			}
		}
		selectedId = -1;
	}
	//提交表单
	$.getWidget("save").click(function(){
		if($.isEmpty($.value('searchClient')) || $.isEmpty($('#t1').text())){
			return false;
		}
		if($.value('searchClient') != $('#t1').text()){
			return false;
		}
	var client_member={};
	var clients=[];
	var client_length=$("#removeMemberList")[0].childNodes.length;
	for(var i=1;i<client_length;i++){
		var client_id=$("#removeMemberList")[0].childNodes[i].id;
		client_member={id:client_id};
		clients.push(client_member);
	}
		var data={
				"clients":clients,
				"destinationGroupId":parseInt($('#t2').text()),
				"inheritDestinationGroupLoanOfficer":$("#active").is(":checked"),
				"locale":$.getLocale(),
		};
		$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "POST",
				"mydata" : data,
				"url" : "api.v1.groups."+ groupId +"?command=transferClients"
			},
			callback : "transfersuccess"
		});
	});
	function transfersuccess(param) {
		$.setReadOnly('transferClient');
		$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
	}
	
	</script>