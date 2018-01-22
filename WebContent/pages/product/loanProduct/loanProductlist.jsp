<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body style="background:#fff">
<div>
    <div style="margin: 30px 200px; font-size: large">
        <ul class="breadcrumb">
            <li class="active"><a href="#"><spring:message code="loan.product.list"/></a></li>
        </ul>
    </div>
    <div class="div-cc">
        <div class="row" style="margin: 5px">
            <button type='button' name="add" class="btn btn-primary pull-right" onclick="ADD()"><spring:message code="lable.create"/></button>
        </div>
        <table id="loanProductlist" style="display: none;">
            <thead>
            <tr>
                <th name='id' width='210' style='display: none;'>id</th>
                <th name='name' search="true" width='322'><spring:message code="lable.name"/></th>
                <th name='shortName' search="true" width='322'><spring:message code="deposit.label.shortName"/></th>
                <th name='closeDate' width='322' type="date"><spring:message code="Expiry.Date"/></th>
                <th name='status' width='322'><spring:message code="label.list.status"/></th>
            </tr>
            </thead>
        </table>
    </div>

</div>

<script type="text/javascript">
    var grid1;
    var productId;

    $(document).ready(function () {
        grid1 = $('#loanProductlist').flexigrid(
                {
                    title: '<spring:message code="loan.product.list" />',
                    pcpager: true,
                    /*buttons: [{
                        name: $.fn.bootstrapValidator.i18n.flexigrid.gridBtnAdd,
                        bclass: 'add',
                        onpress: ADD
                    }, {
                        name: $.fn.bootstrapValidator.i18n.flexigrid.gridBtnModify,
                        bclass: 'edit',
                        onpress: EDIT
                    },]*/
                });

        /* 初始化 */
        init();

        /* 模态框关闭事件 */
        $('#myModal').on('hidden.bs.modal', function (event) {
            init();
        });
    });

    $.getWidget("loanProductlist").click(function(){
        EDIT();
    });

    function init() {
        $.nest({
            url: "<c:url value='/fineract.do'/>",
            type: "post",
            async: true,
            data: {
                "dataType": "GET",
                "mydata": "",
                "url": "api.v1.loanproducts"
            },
            callback: "callback"
        });
    }

    function ADD() {
        /* 加载创建用户模态框 */
        $('#myModal').modal('show');
        $.openWindow("loadPage.do?nextPage=product.loanProduct.add_loanProduct");
    }

    function EDIT() {
        productId = grid1.colVal('id');
        $.openWindow("loadPage.do?nextPage=product.loanProduct.edit_loanProduct");
    }

    /* 成功获取数据后 的回调方法*/
    function callback(param) {
        for(var o in param){
            if(param[o].status=="loanProduct.inActive"){
                param[o].status = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(51, 51, 51);'></i>";
            }else{
                param[o].status = "<i class='glyphicon glyphicon-stop' style='font-size: 20px; color: rgb(64, 255, 106);'></i>";
            }
        }
        grid1.addRows(param);
    }

</script>
</body>
</html>