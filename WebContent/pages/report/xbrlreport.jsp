<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="content-container">
	<h3><spring:message code="label.report.xbrlreport"/></h3>
	<div class="col-md-offset-11">
		<button class="btn btn-primary" id="export"><spring:message code="label.report.export"/></button>
	</div>
	<div id="xbrlreport"></div>
	
</div>

<script type="text/javascript">
$('#export').click(function(){
	$.tableToExcel('xbrlTable');
});
$(document).ready(function() {

	$.nest({
			url : "<c:url value='/fineract.do'/>",
			type : "post",
			async : true,
			data : {
				"dataType" : "GET",
				"mydata" : "",
				"url" : "api.v1.mixreport?startDate=" + startDate + "&endDate=" + endDate
			},
			callback : 'xbrl_back'
		});
});
function xbrl_back(param){
    /*转换xml数据为数组*/
    var xmlDoc=browersJudge(param.result); 
    var datas=[];//数据集合
    var allNodes=xmlDoc.documentElement.childNodes;
   
    for(var i=0;i<allNodes.length;i++){
    	
    	var contextId=allNodes[i].getAttribute('contextRef');//要显示的表格数据
    	if(contextId!=null){
    		var row=[];
    		row.push(allNodes[i].nodeName);//title
    		
    		var scenario=xmlDoc.getElementById(contextId).getElementsByTagName('scenario')[0];
    		if(scenario!=null){
    			var dimension=scenario.getElementsByTagName('explicitMember')[0].childNodes[0].nodeValue;
    			row.push(dimension);//dimension
    		}else{
    			row.push('');
    		}
    		var value=allNodes[i].childNodes[0].nodeValue;
    		row.push(value);//value
    		datas.push(row);
    	}
    }
    /*画表格*/
    drawXbrlTable(datas);
}
function drawXbrlTable(datas){
	var arr=[];
	arr.push('<div style="width:880px; height:400px; overflow:scroll;">');
	arr.push('<table class="table table-bordered"  width="732px" id="xbrlTable" align="center">');
	/*表头*/
	arr.push('<thead>');
	arr.push('<tr>');
	arr.push('<th>');
	arr.push('Title');
	arr.push('</th>');
	arr.push('<th>');
	arr.push('Dimension');
	arr.push('</th>');
	arr.push('<th>');
	arr.push('Value');
	arr.push('</th>');
	arr.push('</tr>');
	arr.push('</thead>');
	/*表体*/
	arr.push('<tbody>');
	$.each(datas,function(n,obj){
		arr.push('<tr>');
		for(var i=0;i<obj.length;i++){
			arr.push('<td>');
			arr.push(obj[i]);
			arr.push('</td>');
		}
		arr.push('</tr>');
	});

	arr.push('</tbody>');
	arr.push('</table>');
	arr.push('</div>');
	$("#xbrlreport").append(arr.join(''));
}
function browersJudge(xmlString){
	//判断浏览器的类型
	var xmlDoc = null;
	if (window.DOMParser) {//非IE浏览器
		parser = new DOMParser();
		xmlDoc = parser.parseFromString(xmlString, "text/xml");
	} else {
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = false;
		xmlDoc.loadXML(xmlString);
	}
	return xmlDoc;
}
</script>

