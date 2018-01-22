<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<form class="form-horizontal" id="imageClient" name="imageClient">
				<fieldset>
					<legend><spring:message code="lable.file.upload"/></legend>
					<div><spring:message code="lable.capture.upload"/></div>
					<div class="form-group">
						<div id="webcam"></div>
						<input type="button" onclick="webcam.capture();" value="点击照相" >
					</div>
					<div><spring:message code="lable.select.image"/></div>
					<div class="form-group">
						<div class="col-sm-3"> 
							<input type="file" class="form-control" name="file" id="articleImgBtn">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">
							<img src="" id="articleImg" alt="">
						</div>
					</div>

					<div class="form-group">
						<div class="text-right" style="padding-right: 80px">
							<button type="button" id="save" name="save" class="btn btn-primary" ><spring:message code="btn.submit"/></button>
						</div>
					</div>
				</fieldset>
			</form>
	<script type="text/javascript">
	var base64;
	/*照相上传*/
	$(function() {
            var pos = 0, ctx = null, saveCB, image = [];
			//创建画布指定宽度和高度
            var canvas = document.createElement("canvas");
            canvas.setAttribute('width', 320);
            canvas.setAttribute('height', 240);
			//如果画布成功创建
            if (canvas.toDataURL) {
			//设置画布为2d，未来可能支持3d
                ctx = canvas.getContext("2d");
			//截图320*240，即整个画布作为有效区(cutx?)
                image = ctx.getImageData(0, 0, 320, 240);

                saveCB = function(data) {
					//把data切割为数组
                    var col = data.split(";");
                    var img = image;
					//绘制图像(这里不是很理解算法)
					//参数data  只是每行的数据  ，例如320*240 大小的照片，一张完整的照片下来需要240个data，每个data有320个rgb
                    for(var i = 0; i < 320; i++) {
                        //转换为十进制
                        var tmp = parseInt(col[i]);
                        img.data[pos + 0] = (tmp >> 16) & 0xff;
                        img.data[pos + 1] = (tmp >> 8) & 0xff;
                        img.data[pos + 2] = tmp & 0xff;
                        img.data[pos + 3] = 0xff;
                        pos+= 4;
                    }
					//当绘制320*240像素的图片时发给后端php
                    if (pos >= 4 * 320 * 240) {
					//把图像放到画布上,输出为png格式
                        ctx.putImageData(img, 0, 0);
                        $("#articleImg").attr('src',canvas.toDataURL("image/png"));
                        base64=canvas.toDataURL("image/png");
                        $("#webcam").empty();
                        //$.post("upload.php", {type: "data", image: canvas.toDataURL("image/png")});
                        pos = 0;
                    }
                };

            } else {
                saveCB = function(data) {
				//把数据一点点的放入image[]
                    image.push(data);
                    pos+= 4 * 320;
                    if (pos >= 4 * 320 * 240) {
                    alert(pos);
                        //$.post("upload.php", {type: "pixel", image: image.join('|')});
                        pos = 0;
                    }
                };
            }
            $("#webcam").webcam({
                width: 320,
                height: 240,
                mode: "callback",
                swffile: "<c:url value='/js/jscam_canvas_only.swf'/>",

                onSave: saveCB,

                onCapture: function () {
                    webcam.save();
                },

                debug: function (type, string) {
                    console.log(type + ": " + string);
                }
            });
        });
	/*路径上传*/
		$('#articleImgBtn').change(function(){    
	           run(this, function (data) {                                                                                                             
	               uploadImage(data);                                                                                                                  
	           });                                                                                                                                     
	      });
		 function run(input_file, get_data) {                                                                                                        
	           /*input_file：文件按钮对象*/                                                                                                                   
	           /*get_data: 转换成功后执行的方法*/                                                                                                                
	           if (typeof (FileReader) === 'undefined') {                                                                                              
	               alert("抱歉，你的浏览器不支持 FileReader，不能将图片转换为Base64，请使用现代浏览器操作！");                                                                         
	           } else {                                                                                                                                
	               try {                                                                                                                               
	                   /*图片转Base64 核心代码*/                                                                                                              
	                   var file = input_file.files[0];                                                                                                 
	                   //这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件                                                                                                
	                   if (!/image\/\w+/.test(file.type)) {                                                                                            
	                       alert("请确保文件为图像类型");                                                                                                        
	                       return false;                                                                                                               
	                   }                                                                                                                               
	                   var reader = new FileReader();                                                                                                  
	                   reader.onload = function () {                                                                                                   
	                       get_data(this.result);  
	                       base64 = this.result;
	                   }                                                                                                                               
	                   reader.readAsDataURL(file);                                                                                                     
	               } catch (e) {                                                                                                                       
	                   alert('图片转Base64出错啦！' + e.toString())                                                                                           
	               }                                                                                                                                   
	           }                                                                                                                                       
	       }
		 function uploadImage(img) {                                                                                                                 
	           //判断是否有选择上传文件                                                                                                                           
	               var imgPath = $("#articleImgBtn").val();                                                                                            
	               if (imgPath == "") {                                                                                                                
	                   alert("请选择上传图片！");                                                                                                              
	                   return;                                                                                                                         
	               }                                                                                                                                   
	               //判断上传文件的后缀名                                                                                                                        
	               var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);                                                                    
	               if (strExtension != 'jpg' && strExtension != 'gif'                                                                                  
	               && strExtension != 'png' && strExtension != 'bmp') {                                                                                
	                   alert("请选择图片文件");                                                                                                               
	                   return;                                                                                                                         
	               }     
	               $("#articleImg").attr('src', img);
	           }
		$(document).ready(function() {
		
				
			//初始化时加载客户的图片
				if(typeof imagePresent != 'undefined'){
					$.nest({
							url : "<c:url value='/fineract.do'/>",
							type : "post",
							async : true,
							data : {
								"dataType" : "GET",
								"mydata" : "",
								"url" : "api.v1.clients."+clientId+".images?maxHeight=150"
							},
							callback : "callbackImage"
					});
				}
					
					
				$.getWidget("save").click(function() {
					$.nest({
						url : "<c:url value='/fineract.do'/>",
						type : "post",
						async : true,
						data : {
							"dataType" : "POST",
							"mydata" : base64,
							"url" : "api.v1.clients."+clientId+".images",
							"contentType" : "text/plain"
						},
						callback : "callback"
					});
			});
		});
		function callback(param) {
			$.setReadOnly("imageClient");
			$.bAlert($.fn.bootstrapValidator.i18n.common.tipSaveSuccessful);
			//var clientId = param.clientId
			window.location.href="loadPage.do?nextPage=client.detail&clientId="+clientId;
		}
		
		function callbackImage(param) {
			$("#articleImg").attr('src',param.result);
		}
</script>