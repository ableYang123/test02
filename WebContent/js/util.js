jQuery.extend( {
    	
	isEmpty : function(val) {
		if (undefined == val || val == "" || val == null || val == "null") {
			return true;
		}
		return false;
	},
	
	strToJson : function(str){ 
		var json = (new Function("return " + str))(); 
		return json; 
	},
	/**
	 * 嵌套 uri:请求的url地址 data：请求时发送的参数 callback:请求完成，服务器数据返回时的回调方法
	 * 发生嵌套时，用模态方式禁止其他操作
	 */
	nest : function(options) {
		if(!$.isEmpty(options.data) && !$.isEmpty(options.data.mydata) && $.isJson(options.data.mydata)){
			var mydatajson = options.data.mydata;
			options.data.mydata = JSON.stringify(mydatajson);
		}
		var query = {
			url : options.url,
			type : options.type != "get" ? "post" : "get",
			async : options.async != "false" ? true : false,
			processData: options.processData != "false" ? true : false,
			//contentType: options.contentType != "false" ? '' : false,
			dataType : 'json',
			data : options.data,
			cache : false,
			timeout : 60000,
			beforeSend : function() {
				p_show();
			},
			success : function(data) {
				p_hide();
				if(data.status != undefined && data.status=="Y"){
					if (!$.isEmpty(options.callback)) {
						var param = data.result;
						var paramJson ={};
						var xmlDoc;
						if(param.indexOf('<?') != -1){
							var xml = $.parseXML(param);
							xmlDoc = $(xml);
							$.extend(true,paramJson,{result:param});
						}else if(param.indexOf("{")==0||param.indexOf("[")==0){
							paramJson = $.strToJson(param);
							if(data.page != undefined){
								$.extend(true,paramJson,{page : data.page});
								$.extend(true,paramJson,{pages : data.pages});
							}
						}else{
							$.extend(true,paramJson,{result:param});
						}

						var back = options.callback+"";
						if($.isJson(paramJson) && !$.isEmpty(paramJson["commandId"]) && paramJson["rollbackTransaction"] != undefined){
							taskid = paramJson["commandId"];
							var info = $.fn.bootstrapValidator.i18n.common.successfuloAlert+"<br><button id='oAlertDetial' type='button' class='btn btn-primary'>"+$.fn.bootstrapValidator.i18n.flexigrid.gridBtnDetial+"</button>";
							$.oAlert(info,"",paramJson["commandId"]);
						}
						if(!$.isEmpty(options.callback) && back.indexOf("function")==-1){
							eval(options.callback+"("+JSON.stringify(paramJson)+");");
						} else{
							if(typeof xmlDoc === 'undefined'){
								options.callback(paramJson);
							}else{
								options.callback(xmlDoc);
							}
						}
					}
				}else{
					var paramJson = $.strToJson(data.result);
					var errorInfo = "<span class='glyphicon glyphicon-hand-right'></span>&nbsp;&nbsp;"+getErrorMsg(paramJson);
					var errors = paramJson.errors;
					if (!$.isEmpty(errors) && errors.length>0) {
						for(var i=0;i<errors.length;i++){
							errorInfo += "<br><span class='glyphicon glyphicon-arrow-right'></span>&nbsp;&nbsp;"+getErrorMsg(errors[i]);
						}
					}
					$.oAlert(errorInfo,"danger");
				}
			},
			error : function() {
				p_hide()
				$.bAlert("Error: "+options.url);
				// error processing
			}
		}
		if(!$.isEmpty(options.contentType))
			query.contentType = options.contentType!= "false" ? options.contentType : false;
		$.ajax(query);
	},
	
	/**
	 * 模态框载入一个jsp页面 
	 * url为加载的JSP页面地址
	 * openType为打开的模式，openType为空时默认为模态框方式，openType为非空时使用iframe的方式打开JSP画面
	 * openWidth打开画面窗口的宽度
	 * openHeigth打开画面窗口的高度
	 */
	openWindow : function(url,openType,openWidth,openHeigth){
		$("#modal-body").empty();
		if(!$.isEmpty(openWidth)){
			$("#modal-dialog").css("width",openWidth);
		}
		if(!$.isEmpty(openHeigth)){
			$("#modal-dialog").css("height",openHeigth);
		}
		if($.isEmpty(openType)){
			$("#modal-body").load(url,function(){
				$('#myModal').modal('show');
			})
		}else{
			$("#modal-body").append("<iframe id='openWindowFrm' class='iframe-style' src='' style='height:100%'></iframe>");
			$("#openWindowFrm").attr("src",url);
			$('#myModal').modal('show');
		}
	},
	
	/**
	 * 根据控件名获取控件的对象，用于对控件操作时绑定事件
	 */
	getWidget : function(name) {
		return $("#" + name);
	},
	/**
	 *根据控件的名称获取控件的值 
	*/
	value : function(name) {
		var tmpVal;
		var fieldObject = $("#" + name);
		var obj = fieldObject[0];
		if(obj != undefined && obj.tagName != undefined && obj.tagName == "SELECT"){
			tmpVal = $('#'+name+' option:selected').attr('value');
		}else if(obj == undefined){
			tmpVal = $('input[name="'+name+'"]').val();
		}else{
			tmpVal = $("#" + name).val();
		}
		return tmpVal;
	},
	/**
	 * 结控件赋值，根据json格式赋值，key为控件名称，value为值
	 */
	assign : function(json) {
		$.each(json, function(i, n) {
			var fieldObject = $("#" + i);
			var obj = fieldObject[0];
			if(obj != undefined && obj.tagName != undefined && obj.tagName == "SELECT"){
				$("#" + i +' option[value="'+n+'"]').attr('selected',true);
			}else if(obj == undefined){
				$('input[name="'+ i +'"]').val(n);
			}else{
				$("#" + i).val(n);
			}
		});
	},
	/**
	 * 动态加载，根据json格式赋值
	 * fieldName为所要动态加载的select控件名称。
	 * selectList为动态加载的下拉列表项。
	 * valueName为下拉项KEY值在JSON中的名称。
	 * textName为下拉项value值在JSON中的名称。
	 */
	setSelect : function(fieldName,selectList,valueName,textName,isClear) {
		if(isClear === 'true'){
			$("#"+fieldName +" option").remove();
		}else{
			$("#"+fieldName+" option:not(:first)").remove();
		}
		if(typeof selectList != 'undefined' && selectList.length > 0){
			for (var i = 0; i < selectList.length; i++) {
				var val = "";
				var tex = "";
				$.each(selectList[i], function(x, n) {
					if(x == valueName){
						val = ""+n;
					}else if(x == textName){
						tex = n;
					}
				});
				if(val != ""){
					$("#"+fieldName).append("<option value='"+val+"'>"+tex+"</option>");
				}
			}
		}
	},	
	
	/**
	 * 动态加载，根据List格式赋值
	 * fieldName为所要动态加载的select控件名称。
	 * selectList为动态加载的下拉列表项。
	 */
	setSelectByList : function(fieldName,selectList) {
		$("#"+fieldName+" option:not(:first)").remove();
		for (var i = 0; i < selectList.length; i++) {
			var val = selectList[i];
			var tex = selectList[i];
			$("#"+fieldName).append("<option value='"+val+"'>"+tex+"</option>");
		}
	},
	/**
	 * 检查form中的校验是否通过，通过return true;不通过return false;
	 */
	validateForm : function(formName) {
	    var $form = $("#"+formName);
	    var data = $form.data('bootstrapValidator');
	    if (data) {
	    // 修复记忆的组件不验证
	        data.validate();
	        if (!data.isValid()) {
	            return false;
	        }
	    }
	    return true;
	},
	/**
	 * 在进行valid验证的时候，要验证的控件上一定要在<div class:"form-group">中,否则会报错。
	 */
	valid : function(formid,validatorjson){
				var jsonstr="{feedbackIcons:{" +
										" valid: 'glyphicon glyphicon-ok'," +
										" invalid: 'glyphicon glyphicon-remove'," +
										" validating: 'glyphicon glyphicon-refresh'}," +
							"fields:{";
				for(var i=0;i<validatorjson.length;i++){
					if(validatorjson[i].name!=null ){
						jsonstr=jsonstr+validatorjson[i].name+":{validators:{";
							
						/**
						 * 非空验证
						 * example:{"name":"***","notEmpty":"提示信息"}
						 * 若不输入提示信息，默认提示信息为：请填写必填项目
						 */
						if(validatorjson[i].notEmpty!=null){
							
							jsonstr=jsonstr+"notEmpty:{message:'"+validatorjson[i].notEmpty+"'},";
						}
						
						/**
						 * 邮箱验证
						 * example:{"name":"***","email":"提示信息"}
						 * 若不输入提示信息，默认提示信息为：请输入有效的邮件地址
						 */
						if(validatorjson[i].email!=null){
							jsonstr=jsonstr+"emailAddress:{message:'"+validatorjson[i].email+"'},";
						}
							
						/**
						 * 长度验证
						 * example:{"name":"***","lengthMax":"10","lengthMin":"2"}
						 * lengthMax:最大长度 lengthMin:最小长度
						 */
						if(validatorjson[i].lengthMax!=null || validatorjson[i].lengthMin!=null){
							if(validatorjson[i].lengthMax!=null&&validatorjson[i].lengthMin==null){
								jsonstr=jsonstr+"stringLength:{max:"+validatorjson[i].lengthMax+",message:'长度最大为"+validatorjson[i].lengthMax+"'},";
							}
							if(validatorjson[i].lengthMax==null&&validatorjson[i].lengthMin!=null){
								jsonstr=jsonstr+"stringLength:{min:"+validatorjson[i].lengthMin+",message:'长度最小为"+validatorjson[i].lengthMin+"'},";
							}
							if(validatorjson[i].lengthMax!=null&&validatorjson[i].lengthMin!=null){
								jsonstr=jsonstr+"stringLength:{min:"+validatorjson[i].lengthMin+",max:"+validatorjson[i].lengthMax+",message:'长度应在"+validatorjson[i].lengthMin+"~"+validatorjson[i].lengthMax+"之间'},";
							}
						}
								
						/**
						 * 正则验证
						 * example:{"name":"***","regexp":"/^[a-zA-Z0-9_\.]+$/","regexpMsg":"只能是数字、字母、下划线、\和."}
						 * regexp:正则表达式 regexpMsg:错误消息
						 * 若不输入regexpMsg，则默认提示消息为:'请输入符合正则表达式限制的值'
						 */
						if(validatorjson[i].regexp!=null){
							jsonstr=jsonstr+"regexp: {regexp:"+validatorjson[i].regexp+",message:'"+validatorjson[i].regexpMsg+"' },";
						}
								
						/**
						 * 日期验证
						 * example:{"name":"***","dateFormat":"YYYY/MM/DD"}
						 * dateFormat:日期格式
						 */
						if(validatorjson[i].dateFormat!=null){
							jsonstr=jsonstr+"date:{format:'"+validatorjson[i].dateFormat+"',message:'请输入正确的日期格式（"+validatorjson[i].dateFormat+"）'},"
						}
								
						/**
						 * 重复验证
						 * example:{"name":"***","indenticalTo":"password"}
						 * indenticalTo:要进行比较的控件的name值
						 */
						if(validatorjson[i].identicalTo!=null){
							jsonstr=jsonstr+" identical: {field:'"+validatorjson[i].identicalTo+"',message:'两次输入不一致，请重试'},"
						}

						jsonstr=jsonstr+'}},';
							
					}
							
				}	
				jsonstr=jsonstr+'}}';
						
				var json=eval('('+jsonstr+')');
				
				$('#'+formid).bootstrapValidator(json);
							
	},
	/**
	 * 设置提示信息，相当于JS中的alert的封装
	 * str为提示的内容
	 */
	oAlert : function(str,msgType,click){
		if(parent.window.oAlert(str,msgType,click)==null){
			oAlert(str,msgType,click);
		}
	},	
	/**
	 * 设置提示信息，相当于JS中的alert的封装
	 * str为提示的内容
	 */
	bAlert : function(str){
		if(parent.window.bAlert(str)==null){
			bAlert(str);
		}
	},	
	
	/**
	 * 设置form控件只读
	 * formName：表单id值
	 * ---------------------------------
	 * 修改之后，formName表示需要设置为只读控件的ID
	 * 除了表单，其他控件也可以通过该方法设置为只读
	 */
	setReadOnly : function(formName){
		var findObj = $('#' + formName);
		var obj = findObj[0];
		if(obj != undefined && obj.tagName != undefined && obj.tagName == 'FORM'){
			$("input,select,button,a,textarea",$("#" + formName)).attr("disabled", true);
		}else if(obj != undefined && obj.tagName != undefined){
			obj.attr('readonly',true);
		}else{
			
		}
	},
	
	
	/**
	 * 日历控件
	 */
	datetimepicker:function (){ 
		
		$(":input").each(function(){
			if($(this).attr("datetype")=="date"){
				var format=$(this).attr("format");
				var name=$(this).attr("name");
				var afterToday=$(this).attr("afterToday");
				var localdate=$(this).attr("local-date");
				var beforeToday=$(this).attr("beforeToday");
				if($.isEmpty(format)){
					format = $.getCookie("dateFormat");
				}				
				$(this).wrap("<div></div>");
				
				var divstr = '<div class="input-group date datetime" style="width:180;">'+
                '<input type="text" class="form-control" name="'+name+'"';
				if(localdate=='true'){
					divstr += ' value='+$.getLocaleDate(format);//$('input[name="'+name+'"]').val();
				}				
                divstr += ' /><span class="input-group-addon">'+
                '<span class="glyphicon glyphicon-calendar"></span>'+
                '</span>'+ 
           ' </div> ';
				$(this).parent().append(divstr);
				
				var jsonstr="{";
				if(format==null||format=="1"){
					jsonstr=jsonstr+"format:'yyyy-MM-dd',";
				}else if(format=="2"){
					jsonstr=jsonstr+"format:'yyyy/MM/dd',";
				}else if(format=="3"){
					jsonstr=jsonstr+"format:'dd-MM-yyyy',";
				}else if(format=="4"){
					jsonstr=jsonstr+"format:'dd/MM/yyyy',";
				}else{
					jsonstr=jsonstr+"format:'"+format+"',";
				}
					
				if(afterToday!=null&&afterToday=='true'){
					jsonstr=jsonstr+"endDate:new Date(),"
				}
				
				if(beforeToday!=null&&beforeToday=='true'){
					jsonstr=jsonstr+"startDate:new Date(),";
				}
				
			jsonstr=jsonstr+"autoclose: true,"+//当选择一个日期之后是否立即关闭此日期时间选择器。
		        "todayBtn: true,"+//如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
		        "minView:'month',"+
		        "language:'zh*CN',"+
		        "todayHighlight:true,"+//如果为true, 高亮当前日期。
		        "forceParse:true,"+//当选择器关闭的时候，是否强制解析输入框中的值。也就是说，当用户在输入框中输入了不正确的日期，选择器将会尽量解析输入的值，并将解析后的正确值按照给定的格式format设置到输入框中
		        "pickerPosition:'bottom-left',"+//此选项当前只在组件实现中提供支持。通过设置选项可以讲选择器放倒输入框下方            
		        "showMeridian:false"+//是否显示AM PM           
		        "}";
			var json = eval('('+jsonstr+')');
			$('input[name="'+name+'"]').attr('date-format',json['format']);
			$(".datetime").datetimepicker(json);
			$(".datetimepicker-inline").remove();	
			$(this).remove();
		}
		})
	},
	  
	  
	  /**
	   * format : 控件的格式类型
	   */
	  getLocaleDate : function(format){
		  var date = new Date();
		  var year = date.getFullYear();
		  var month = date.getMonth() + 1;
		  var strDate = date.getDate();
		  if (month >= 1 && month <= 9) {
		    month = "0" + month;
		  }
		  if (strDate >= 0 && strDate <= 9) {
		    strDate = "0" + strDate;
		  }
		  
		  var seperator = '';
		  var currentDate = '';
		  if(format==null||format==1){
			  seperator = "-";
			  currentDate = "" + year + seperator + month + seperator + strDate;
		  }else if(format==2){
			  seperator = "/";
			  currentDate = "" + year + seperator + month + seperator + strDate;
		  }else if(format==3){
			  seperator = "-";
			  currentDate = "" + strDate + seperator + month + seperator +  year;
		  }else if(format==4){
				 seperator = "/";
				 currentDate = "" + strDate + seperator + month + seperator +  year;
		  }else{
			 /*自定义格式类型*/
			  seperator = "/";
			  currentDate = "" + year + seperator + month + seperator + strDate;
		  }
		  return currentDate;
		 
	  },
	  
	  
	  /**
	   * 参数：日期数组 如：[2017,8,25]
	   * 返回：2017/8/25
	   */
	  localeFormat : function(openingDateArr){
		  if(openingDateArr[1] > 0 && openingDateArr[1] < 10){
			  return openingDateArr[0] + '/0' + openingDateArr[1] + '/' + openingDateArr[2] ;
		  }else{
		  return openingDateArr[0] + '/' + openingDateArr[1] + '/' + openingDateArr[2] ;
		  }
	  },

	  /**
	   * 返回：当前PC端日期格式，例如yyyy-mm-dd
	   */
	  getDateFormat  : function(){
		var format = $.getCookie("dateFormat")+"";
		if($.isEmpty(format) ||format=="1" || format == 'null'){
			format='yyyy-MM-dd';
		}else if(format=="2"){
			format='yyyy/MM/dd';
		}else if(format=="3"){
			format='dd-MM-yyyy';
		}else if(format=="4"){
			format='dd/MM/yyyy';
		}else{
			format='yyyy-MM-dd';
		}
		return format;
	  },
	  /**
	   * 参数：value为需要转换的日期，format为日期格式的类型，time为时间格式
	   * 返回：日期或时间
	   */
	  formatDate  : function(value,format,time){
		  	if((value+"").indexOf(",") != -1){
		  		value = $.replaceTemplate(value+"",",","/");
		  	}
		  	var date = new Date(value);
		  	
		    var paddNum = function(num){
		        num += "";
		        return num.replace(/^(\d)$/,"0$1");
		      }
		    
			if($.isEmpty(format)){
				format = $.getCookie("dateFormat")+"";
			}
			
			if($.isEmpty(format) ||format=="1" || format == 'null'){
				format='yyyy-MM-dd';
			}else if(format=="2"){
				format='yyyy/MM/dd';
			}else if(format=="3"){
				format='dd-MM-yyyy';
			}else if(format=="4"){
				format='dd/MM/yyyy';
			}
			if(!$.isEmpty(time)){
				format += ' hh:mm:ss';
			}
		      //指定格式字符
		      var cfg = {
		         yyyy : date.getFullYear() //年 : 4位
		        ,yy : date.getFullYear().toString().substring(2)//年 : 2位
		        ,M  : date.getMonth() + 1  //月 : 如果1位的时候不补0
		        ,MM : paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
		        ,d  : date.getDate()   //日 : 如果1位的时候不补0
		        ,dd : paddNum(date.getDate())//日 : 如果1位的时候补0
		        ,hh : date.getHours()  //时
		        ,mm : date.getMinutes() //分
		        ,ss : date.getSeconds() //秒
		      }
		      format || (format = "yyyy-MM-dd hh:mm:ss");
		      return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
	  },
	  
	  /**
	   * 参数：param 回调数组,必须有id和name属性，子节点带有parentId属性
	   * 返回：返回树数据 [{"id":"1","name":"a",nodes:[{"id":"2","pid":"1","name":"b"}]}]格式。
	   */
	  treeData : function(param){
			 for(var i=0;i<param.length;i++){
				if(!param[i].parentId)
					param[i].parentId = 0;
			 }
			 var fn = function(data,pid){
				 var result = [], temp;
		            for (var i = 0; i < data.length; i++) {
		                if (data[i].parentId == pid) {
		                    var obj = {"text": data[i].name,"id": data[i].id};
		                    temp = fn(data, data[i].id);
		                    if (temp.length > 0) {
		                        obj.nodes = temp;
		                    }
		                    result.push(obj);
		                }
		            }
		            return result;
			 } 
			 return fn(param,0);
		  },
	  
	 /**
	  * 动态添加表格
	  */
	  tableclone:function(tableId){
		  if($('#'+tableId+' tr').eq(1).children().children(".datetime").attr("datetype")=="none"){
			  $('#'+tableId+' tr').eq(1).children().children(".datetime").attr("datetype","date");
		  }

		

		  var tr = $('#'+tableId+' tr').eq(1).clone(true);
		  tr.css("display","table-row");
		  $('#'+tableId).append(tr);
		  if($('#'+tableId+' tr').eq(1).children().children(".datetime").attr("datetype")=="date"){
			  $('#'+tableId+' tr').eq(1).children().children(".datetime").attr("datetype","none");
			  $.datetimepicker();
			  $(".datetimepicker-inline").remove(); 
		  }
	  },
	  
	  /**
	   * 获取动态表格数据
	   */
	  tableDateArray : function(tableId){
		  var jsonstr="";
		  var arr=new Array();
		  $("#"+tableId+" tr:gt(1)").each(function(){
			  var json={};
			  $(this).children().each(function(){
				  var dw = $(this).attr("date-worthless");
				  var name= $(this).attr("name");
				  var node = $(this).find('input[name="'+name+'"]');
				  if(node.attr("type")=="checkbox"){
					  node=$(this).find('input[type=checkbox][name="'+name+'"]:checked');
					  if(node.val()== undefined){
						  jsonstr="{"+name+":''}";
					  }					
				  }
				  if(node.length==0){
					  node = $(this).find('select[name="'+name+'"] option:selected'); 
				  }
				  if(dw!="true"&&node.val()!=undefined){
					  jsonstr="{"+name+":'"+node.val()+"'}";
				  }
				  var jsons=eval('('+jsonstr+')');
				  $.extend(true,json,jsons);
			  });
//			  console.log(json)
			  arr.push(json);
		  });
//		  for(var i=0;i<arr.length;i++){
//			  console.log(JSON.stringify(arr[i]));
//		  }
		  return arr;
	  },
	  /**
	   * 判断一个字符串是否包含另一个字符串
	   * 如果包含返回true,否则返回false
	   */
	  isContains : function(str, substr) {
		    return new RegExp(substr).test(str);
	  },
	  /**
	   * 判断一个字符串是否为JSON对象
	   * 如果包含返回true,否则返回false
	   */
	  isJson : function(obj){
		  var isjson = jQuery.isArray(obj);
		  if(!isjson){
			  isjson = typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length; 
		  }
		  return isjson;
	 }, 
		/**
		 * 隐藏控件或DEV等 
		 */
	hide : function(widget) {	
		var temp = widget;
		if (widget.constructor != Array) {
			var temp = $.makeArray(arguments);
		}
		$.each(temp, function(i, n) {
			$("#" + n).hide();
		});			
	},
	/**
	 * 显示控件或DEV等 
	 */
	show : function(widget) {
		var temp = widget;
		if (widget.constructor != Array) {
			var temp = $.makeArray(arguments);
		}
		$.each(temp, function(i, n) {
			$("#" + n).show();
		});		
	},
	/**
	 * 将中文月份转为数字月份
	 * 输入一个带有中文月份的日期字符串的数组：“三月 5,2017”
	 * 返回一个数字月份的日期字符串：“3 5,2017”
	 */
	toDigitMonth : function(strDate) {
		var monthArr = ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'];
		var digitArr = ['01','02','03','04','05','06','07','08','09','10','11','12'];
		var str = '';
		for(var i=9;i<12;i++){
			if($.isContains(strDate,monthArr[i])){
				str = strDate.replace(monthArr[i],digitArr[i]);
			}
		}
		if(str.length <= 0){
			for(var i=0;i<9;i++){
				if($.isContains(strDate,monthArr[i])){
					str = strDate.replace(monthArr[i],digitArr[i]);
				}
			}
		}
		return str;
	},
  
	  
	/**
	 * 表格到处Excel文件
	 * 参数 
	 * 		tableid：导出表格的ID
	 */  
	  
	tableToExcel : function(tableid){
		var uri = 'data:application/vnd.ms-excel;base64,',
	    template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name></x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
	    base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
	    format = function(s, c) {
	        return s.replace(/{(\w+)}/g,
	        function(m, p) { return c[p]; }) }
	    return function(tableid, name) {
		    if (!tableid.nodeType) table = document.getElementById(tableid)
		    var tablestr =  "<thead>"+$("table thead")[0].innerHTML+"</thead>"+table.innerHTML;
		    var ctx = {worksheet: name || 'Worksheet', table: tablestr}
		    window.location.href = uri + base64(format(template, ctx))}
	    }(),
	    
	    /**
	     * 搜索框
	     * 	<input id="search" name="search" datatype="search" api="api.v1.clients?officeId=1&orderBy=displayName&orphansOnly=true&sortOrder=ASC&displayName=">
	     * 
	     */
	    searchBox : function(){
	    	var items;
	    	
			$(":input").each(function(){
				if($(this).attr("datatype")=="search"){
					
					
					var api=$(this).attr("api");
					var name=$(this).attr("name");
					var textName=$(this).attr("textname");
					
					$(this).wrap("<div class='dropdown'></div>")
					$(this).parent().append( "<ul class='dropdown-menu' aria-labelledby='dropdownMenu1' style='display:none' id='searchBoxUl_"+name+"'>"
					 +"</ul>");
					
					
					$(this).keyup(function(){
						var value=$(this).val();
						
//						console.log($(this).siblings("ul")[0].tagName)
						
						$("#searchBoxUl_"+name).children().empty();
						$("#searchBoxUl_"+name).css("display","none");
						if(value==""|| value==" "){
							return false;
						}
						var url=api+value;
						
						
						
						$.nest({
							url:"fineract.do",
							type:"post",
							async:true,
							data:{
								"dataType":"GET",
								"mydate":"",
								"url":url
								},
							callback:function(param){
								
								for (var i = 0; i < param.pageItems.length; i++) {
//									IF(I==UNDEFINED){
//										RETURN FALSE;
//									}
//				 					alert(0)
									var val = "";
									var tex = "";
									$.each(param.pageItems[i], function(x, n) {
										if(x == "id"){
											val = ""+n;
										}else if(x == textName){
											tex = n;
										}
									});
									if(val!=""){
										$("#searchBoxUl_"+name).css("display","block");
										$("#searchBoxUl_"+name).append("<li value='"+val+"'><a href='#' id='searchLiA' onclick='addtoInput(\""+tex+"\",\""+name+"\")'>"+tex+"</a></li>");
									}
								}
								
								
								
								if(param.pageItems.length==0){
									$("#searchBoxUl_"+name).css("display","none");
								}
								
								items=param.pageItems;
							}
						});
						url="";
						
						
					});
					
					
				
					
					
					
					
					
						
					}
				
			})
	 },
		/**
		 * template原始的字符串
		 * oldStr为被替换的字符串
		 * newStr为新的字符串	
		 */  
		replaceTemplate : function(template, oldStr,newStr) {
			template = template.replace(new RegExp(oldStr, "g"),newStr);
			var reg = /{\w*}/g;
			template = template.replace(reg, "");
			return template;
		},		  
	  
	  		/**
		 * 获取下拉选项框选中项的值 参数 selecteId：下拉框的ID
		 */ 
	  getSelectedValue : function(selecteId){
		 return parseInt($("#"+selecteId).find("option:selected").attr("value"));
	    },
	  
		/**
		 * 获取单选框选中项的值 参数 checkboxId：下拉框的ID
		 */ 
	  judgeCheckbox : function(checkboxId){
			if ($('#'+checkboxId).is(':checked'))
				return true;
				return false;
		},
	  
	    /**
		 * 获取input的值排除"" 参数 inputId：下拉框的ID
		 */ 
	  getInputValue : function(inputId){
		 var str = $("#"+inputId).val();
		 var str = jQuery.trim(str);
		 return str;
	  },
	  
	  /**
	   * 
	   * 不带有地址的搜索框初始化
	   * @param dataArr：搜素框数据源（是指显示在搜索列表中的数据）
	   * @param keyArr：其他关键性数据
	   * @param method:函数名或者匿名函数
	   * @returns
	   */
	  inputSearchInit : function(dataArr,keyArr,method,apiUrl,isRepeat){
		  if(apiUrl === 'true'){
				$('input[datatype="search"]').each(function(){
					var api = $(this).attr("api");
					var name = $(this).attr("name");
					var textName=$(this).attr("textname");
					
					$(this).wrap("<div class='dropdown'></div>")
					$(this).parent().append( "<ul class='dropdown-menu' aria-labelledby='dropdownMenu1' style='display:none' id='searchBoxUl_"+name+"'>"
					 +"</ul>");
					var last;
					$(this).keyup(function(event){
						$this = $(this);
						last = event.timeStamp;
						setTimeout(function(){
							if(last - event.timeStamp == 0){
								var value = $this.val();
								$("#searchBoxUl_"+name).empty();
								$("#searchBoxUl_"+name).css("display","none");
								if(value==""|| value==" "){
									return false;
								}
								var url=api+value;
								
								$.nest({
									url:"fineract.do",
									type:"post",
									async:true,
									data:{
										"dataType":"GET",
										"mydate":"",
										"url":url
										},
									callback:function(param){
										var data = [];
										if(typeof param.pageItems != 'undefined'){
											data = param.pageItems;
										}else{
											data = param;
										}
										if(data.length==0 || typeof data.length == 'undefined'){
											$("#searchBoxUl_"+name).css("display","none");
										}else{
											var paramVal = value;
											$.each(data,function(index,item){
												  var li_node = $('<li class="repeat-data"></li>');
												  var val;
												  if(typeof(keyArr) != 'undefined'){
													  $.each(keyArr,function(i,e){
														  val = eval('item.'+e);
														  li_node.attr("_"+e,val);
													  });
												  }
												  var text = eval('item.'+textName);
												  
												 // var name = text.replace(paramVal,'<b>'+paramVal+'</b>');
												  li_node.append(text);
												  li_node.appendTo($('#searchBoxUl_'+name));
												  
											  });
											  var ulNode = $('#searchBoxUl_'+name).children();
											  if(ulNode.length <= 0){
												  $.hide('searchBoxUl_'+name);
												}else{
													$.show('searchBoxUl_'+name);
												}
										}
									}
								});
							}
						},500);
					});
					$(document).on({
						mouseenter : function(){
							$(this).addClass('blue') ; 
						},
						mouseleave : function(){
							$(this).removeClass('blue') ; 
						}
						
					},'#searchBoxUl_'+name+' li');
				});
			}else{
				$('input[datatype="match"]').each(function(){
					  var inputId = $(this).attr('id');
					  var ulId = $(this).attr('for');
					  var source = $(this).attr('source');
					  var offset = $(this).offset();
					  var height = $(this).height();
					  
					  
					  //当匹配到一个输入搜索框时 构造一个<ul>列表
					  var ul_node = $('<ul id="'+ ulId +'" label="search"></ul>');
					  ul_node.insertAfter($(this));
					  
					  var divNode = $(this).closest('div').children();
						console.log(divNode.length);
						if(divNode.length >= 3){
							for(var k=2;k<divNode.length;k++){
								$(divNode[k]).remove();
							}
						}
						
					  var inputLeft = offset.left;
					  var inputTop = offset.top;
					  var ulHight = ($(this).scrollTop()+inputTop)/2;
					  /*if(typeof isRepeat === 'undefined' || isRepeat === 'true'){
						  $('#'+ulId).attr('style','position:absolute;');
						  $('#'+ulId).offset({'top' : ulHight,"left" : inputLeft});
					  }*/
					  $('#'+ulId).addClass('dpdown');
					 // $('#'+ulId).offsetParent();
					  $(this).keyup(function(){
						  var repeat = [];
						  var flag = false;
						  $('#'+ulId).empty();
							var input_val = $(this).val();
							if(!$.isEmpty(input_val)){
								var paramVal = input_val;
								$.each(dataArr,function(index,item){
									  var li_node = $('<li class="repeat-data"></li>');
									  var value;
									  if(typeof(keyArr) != 'undefined'){
										  $.each(keyArr,function(i,e){
											  value = eval('item.'+e);
											  li_node.attr("_"+e,value);
										  });
									  }
									  var text = eval('item.'+source);
									  if(typeof isRepeat === 'undefined' || isRepeat === 'true'){
										  if(index > 0){
											  $.each(repeat,function(it,et){
												  if(et === text){
													  flag = true;
													  return false;
												  }else{
													  repeat.push(text);
													  flag = false;
												  }
											  });
											  if(!flag){
												  if($.isContains('/['+text+']/',paramVal)){
													  var name = text.replace(paramVal,'<b>'+paramVal+'</b>');
													  li_node.append(name);
													  li_node.appendTo($('#'+ulId));
												  } 
											  }
										  }else{
											  repeat.push(text);
											  if(!flag){
												  if($.isContains('/['+text+']/',paramVal)){
													  var name = text.replace(paramVal,'<b>'+paramVal+'</b>');
													  li_node.append(name);
													  li_node.appendTo($('#'+ulId));
												  } 
											  }
											  
										  }
									  }else{
										  if($.isContains('/['+text+']/',paramVal)){
											  var name = text.replace(paramVal,'<b>'+paramVal+'</b>');
											  li_node.append(name);
											  li_node.appendTo($('#'+ulId));
										  } 
									  }
									  
								  });
								  var ulNode = $('#'+ulId).children();
								  if(ulNode.length <= 0){
									  $.hide(ulId);
									}else{
										$('#'+ulId).show();
									}
							}else{
								$.hide(ulId);
								if(typeof(method)=="function"){
						  			method('');
						  		}else{
						  			eval(method+"('')");
						  		}
							}
					  });
					  
					  $(document).on({
						  	click:function(){
						  		if(typeof(method)=="function"){
						  			method(this);
						  		}else{
						  			eval(method+"(this)");
						  		}
						  	},
							mouseenter : function(){
								$(this).addClass('blue') ; 
								/*$('#'+ulId).show();*/
							},
							mouseleave : function(){
								$(this).removeClass('blue') ; 
								/*$('#'+ulId).hide();*/
							}
							
						},'#'+ulId+' li');
					  
					  $(document).on({
							 mouseover : function(){
								 $('#'+ulId).show();
							 },
							mouseout : function(){
								$('#'+ulId).hide();
							}
					  },'#'+ulId);
					  
					  $(document).on({
						  mouseover : function(){
								if($('#'+ulId).children().length > 0){
									$('#'+ulId).show();
								}
						}},'#'+inputId);
					  
					  $(document).on('click',function(e){ 
							var e = e || window.event; //浏览器兼容性 
							var elem = e.target || e.srcElement; 
							var target = $(elem);
							if(target.closest(''+inputId).length != 0) return;
						    if(target.closest(''+ulId).length != 0) return;
						    $('#'+ulId).hide();
						}); 
				  });
			}
		  
	  },
		/**
		 * 获取客户端的Cookie值
		 * 参数 
		 * 	name：为Cookie变量的名称
		 * 本系统国际化Cookie的变量名称为clientLanguage；日期格式Cookie的变量名称为dateFormat
		 */  
	  getCookie : function(name)
	  {
		  var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
		  if(arr=document.cookie.match(reg))
		  return unescape(arr[2]);
		  else
		  return null;
	  },
		/**
		 * 设置客户端的Cookie值
		 * 参数 
		 * 	name：为Cookie变量的名称，value为Cookie的值
		 *  国际化Cookie的变量名称为clientLanguage；日期格式Cookie变量名称为dateFormat
		 */ 	  
	  setCookie : function(name,value) 
	  { 
	      var Days = 30; 
	      var exp = new Date(); 
	      exp.setTime(exp.getTime() + Days*24*60*60*1000); 
	      document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
	  },
	  
	  /**
	   * 返回当前locale格式
	   */
	  getLocale : function (){
		  var lang = $.getCookie("clientLanguage");
		  if($.isEmpty(lang) || lang == "zh_CN"){
			  lang = "zh_CN";
		  }else if(lang == "en_US"){
			  lang = "en";
		  }
		  return lang;
	  },
    /**
     * 上传文件
     * 参数：formId form表格的Id
     * 		url：上传接口 （api.v1.clients.1.documents）
     * 		callback：返回的回调方法
     */
    uploadFile : function (formId,url,callback) {
        var formData = new FormData($( "#"+formId )[0]);
        formData.append("url",url);
        $.nest({
            url : "upload.do",
            data : formData,
            callback : callback,
            type: 'POST',
            cache: "false",
            contentType: "false",
            processData: "false",
            async: "false",
        })
    },

});



function addtoInput(value,name){
	
//	alert(id+"====="+value);
	
	$("input[name="+name+"]").prop("value",value);
	$("input[name="+name+"]").siblings("ul").children().empty();
	$("input[name="+name+"]").siblings("ul").css("display","none");
}

function getErrorMsg(paramJson){
	var errorInfo = "";
	var errorCode = "";
	if($.isJson(paramJson)){
		var userMessageGlobalisationCode = paramJson["userMessageGlobalisationCode"];
		if(!$.isEmpty(userMessageGlobalisationCode)){
			errorInfo = $.fn.bootstrapValidator.i18n[userMessageGlobalisationCode];
		}
		if($.isEmpty(errorInfo)){
			errorInfo = paramJson["developerMessage"];
		}
		if($.isEmpty(errorInfo)){
			errorInfo = paramJson["defaultUserMessage"];
		}
		if($.isEmpty(errorInfo)){
			errorInfo = paramJson["message"];
		}
		if($.isEmpty(errorInfo)){
			errorInfo = paramJson["error"];
		}						
		if($.isEmpty(errorInfo)){
			errorInfo = userMessageGlobalisationCode;
		}
		errorCode = paramJson["httpStatusCode"];
		if($.isEmpty(errorCode)){
			errorCode = paramJson["status"];
		}
	}
	if($.isEmpty(errorInfo)){
		errorInfo = "ERROR.";
	}
	if(!$.isEmpty(errorCode)){
		errorInfo = errorCode+" - "+errorInfo;
	}
	var reg = /\{\{params(.*?)\}\}/gi;
	var tmp = errorInfo.match(reg); 
	var args = paramJson.args;
	if(!$.isEmpty(args) && args.length>0 && !$.isEmpty(tmp) && tmp.length>0){
		for(var i=0;i<tmp.length;i++){
			var reg1 = /\[(.*?)\]/gi;
			var tmp1 = tmp[i].match(reg1);
			var obj = eval("args"+tmp1);
			if(!$.isEmpty(args)){
				errorInfo = errorInfo.replace(tmp[i],obj.value);
			}
		}
	}
	return errorInfo;
}

function bAlert(str){
	var isIe=(document.all)?true:false;
	if(typeof(eval("document.all.balert_msgDiv"))== "undefined"){
		var msgw,msgh,bordercolor;
		msgw=200;// 提示窗口的宽度
		msgh=50;// 提示窗口的高度
		var sWidth,sHeight;
		sWidth=document.body.offsetWidth;
		sHeight=document.body.offsetHeight;
		var msgObj=document.createElement("div")
		msgObj.setAttribute("id","balert_msgDiv");
		msgObj.setAttribute("align","center");
		msgObj.style.position="absolute";
		msgObj.style.color="white";
		msgObj.style.background="#000000";
		msgObj.style.filter=(isIe)?"alpha(opacity=0);":"opacity:0;";
		msgObj.style.opacity="0.0";
		msgObj.style.font="bold 15px Arial";
		//msgObj.style.width=msgw + "px";
		// msgObj.style.height=msgh + "px";
		msgObj.style.padding = "10px";
		var top = (document.documentElement.scrollTop + (sHeight-msgh)/3) ;
		msgObj.style.top=top + "px";
		msgObj.style.left=(sWidth-msgw)/2 + "px";
		document.body.appendChild(msgObj);
		$("#balert_msgDiv").corner("10px");
		$("#balert_msgDiv").css("min-width","200px");
		$("#balert_msgDiv").css("z-index","200");
		showBackground(msgObj,70);
		var txt=document.createElement("p");
		// txt.style.margin="5px 1px";
		txt.setAttribute("id","msgTxt");
		txt.innerHTML=str;
		document.getElementById("balert_msgDiv").appendChild(txt);
		function showBackground(showobj,endInt){
			if(isIe){
				showobj.filters.alpha.opacity+=1;
				if(showobj.filters.alpha.opacity<endInt){
					setTimeout(function(){showBackground(showobj,endInt)},5);
				}else{		
					setTimeout(function(){if(typeof(eval("document.all.balert_msgDiv"))!= "undefined"){removeBackground(showobj,0);}},2000);
				}
			}else{
				var al=parseFloat(showobj.style.opacity);al+=0.01;
				showobj.style.opacity=al;
				if(al<(endInt/100)){
					setTimeout(function(){showBackground(showobj,endInt)},5);
				}else{
					setTimeout(function(){if(typeof(eval("document.all.balert_msgDiv"))!= "undefined"){removeBackground(showobj,0);}},2000);
				}
			}
		}
		function removeBackground(removeobj,endInt){
			if(isIe){
				removeobj.filters.alpha.opacity-=1;
				if(removeobj.filters.alpha.opacity>endInt){
					setTimeout(function(){removeBackground(removeobj,endInt)},5);
				}else{
					document.body.removeChild(msgObj);
				}
			}else{
				var al=parseFloat(removeobj.style.opacity);al-=0.01;
				removeobj.style.opacity=al;
				if(al>(endInt/100)){
					setTimeout(function(){removeBackground(removeobj,endInt)},5);
				}else{
					document.body.removeChild(msgObj);
				}
			}
		}
		return true;
	}
}

function oAlert(str,msgType,click){
	var isIe=(document.all)?true:false;
	if(typeof(eval("document.all.oalert_msgDiv")) != "undefined"){
		$("#oalert_msgDiv").remove();
	}

	var msgw,msgh,bordercolor;
	msgw=200;// 提示窗口的宽度
	msgh=50;// 提示窗口的高度
	var sWidth,sHeight;
	sWidth=document.body.offsetWidth;
	sHeight=document.body.offsetHeight;
	var msgObj=document.createElement("div")
	msgObj.setAttribute("id","oalert_msgDiv");
	if($.isEmpty(msgType)){
		msgObj.setAttribute("class","alert alert-success");
	}else{
		msgObj.setAttribute("class","alert alert-"+msgType);
		//setTimeout(function(){removeOalert()},15000);
	}
	msgObj.style.position="absolute";
	var top = (document.documentElement.scrollTop + (sHeight-msgh)/3) ;
	msgObj.style.top=top + "px";
	msgObj.style.left=(sWidth-msgw)/2 + "px";
	document.body.appendChild(msgObj);

	$("#oalert_msgDiv").corner("10px");
	$("#oalert_msgDiv").css("min-width","200px");
	$("#oalert_msgDiv").css("z-index","200");
	$("#oalert_msgDiv").append('<a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow"  class="close" data-dismiss="alert">&nbsp;&nbsp;x</a>');
	$("#oalert_msgDiv").append(str);

	function removeOalert(){
		$("#oalert_msgDiv").remove();
	}
	if(!$.isEmpty(click)){
		$.getWidget("oAlertDetial").click(function() {
			taskid = click;
			$.openWindow("loadPage.do?nextPage=common.viewcheckerinbox","","90%");
			$("#oalert_msgDiv").remove();
		});
	}
	return true;
}