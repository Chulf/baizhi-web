<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2018/1/25
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Pricing</title>
    <style>
        .clearfix{
            display:none !important;
        }
        .file-preview{
            display:none !important;
        }
        .file-preview-frame{
            display:none !important;
        }
        .file-preview-text{
            display:none !important;
        }
        .btn.btn-default.kv-fileinput-upload.fileinput-upload-button{
            display:none !important;
        }
    </style>
</head>
<body>

<jsp:include page="top.jsp"/>


<form action="${pageContext.request.contextPath}/order/orderandupdate.do" method="post" enctype="multipart/form-data"
      id="orderform">
    <div class="container" style="padding-top: 100px">

        <div class="row row01 bg-warning">

            <div class="col-md-9">
                <h3>${requestScope.contents[0]}</h3>

            </div>

            <div class="col-md-3">
                <h3>
                    <select name="type" id="type">

                    </select>
                </h3>
            </div>
        </div>

        <div class="row row01 bg-warning">

            <div class="col-md-9">
                <h3>${requestScope.contents[1]}</h3>

            </div>

            <div class="col-md-3">
                <h3>
                    <select name="demand" id="demand">

                    </select>
                </h3>
            </div>
        </div>

        <div class="row row01 bg-warning">

            <div class="col-md-9">
                <h3>${requestScope.contents[2]}</h3>

            </div>

            <div class="col-md-3">
                <h3>
                    <select name="number" id="number">

                    </select>
                </h3>
            </div>
        </div>
        <div class="row row01 bg-warning">

            <div class="col-md-9">
                <h3>
                    ${requestScope.contents[6]}

                    <span id="showPrice"></span></h3>

            </div>

            <div class="col-md-3">
                <h3>
                    <input class="btn btn-default" type="button" id="getPrice" value="${requestScope.contents[7]}">
                </h3>
            </div>
        </div>


        <div class="row row01 bg-warning">

            <div class="col-md-9">
                <h3>${requestScope.contents[3]} </h3>

            </div>

            <div class="col-md-3">
                <c:if test="${sessionScope.user!=null}">
                    <h3>
                            <%--<input class="file" type="file">Upload</input>--%>
                        <input id="updateTarget"  type="file" accept=".doc,.txt,.docx" name="file" class="file" >
                    </h3>
                </c:if>

                <c:if test="${sessionScope.user==null}">
                    <h4>${requestScope.contents[4]}
                    </h4>
                </c:if>
            </div>
        </div>


        <div class="row row01 bg-warning ">

            <div class="col-md-12">
                <h3>${requestScope.contents[5]}</h3>

            </div>

            <div class="col-md-12">
                <h3>
                    <textarea id="description" name="description" class="form-control" maxlength="3000"
                              rows="3">${sessionScope.orderSession.description}</textarea>
                </h3>
            </div>
        </div>


        <div class="row ">

            <h3>
                <input class="btn btn-default" id="subt" type="button" value="${requestScope.contents[8]}"
                       id="submitorder">
            </h3>

        </div>

    </div>

</form>

<div style="padding-top: 100px">

    <jsp:include page="foot.jsp"/>

</div>


<script type="text/javascript">


    $(function () {
        $(".tishi").hide();


        $("#subt").click(function () {
            checkLoginSubmit();
        })

    })

    function checkType() {

        alert('xxx');
        //检测上传文件的类型
        var imgName = $('#updateTarget').val();
        alert(imgName);
        alert(imgName.contains(".doc"));
        if(imgName.indexOf('.doc') || imgName.contains('.txt') || imgName.contains('.ocx')){
           alert("包含");
        }else{
           alert("只能上传.doc,.txt,.ocx结尾文件");
            $('#updateTarget').val("");
        }
    }

    function showFont() {
        $(".tishi").show();
    }

    $(function () {
        $.get("${pageContext.request.contextPath}/select/selectByPageName?source=order.jsp", function (result) {
            var option = ["type", "demand", "number"];
            var arr = [parseInt(${sessionScope.orderSession.type}), parseInt(${sessionScope.orderSession.demand})]
            if (parseInt(${sessionScope.orderSession.number}) == 1000) {
                arr[2] = 0;
            }
            else {
                arr[2] = parseInt(${sessionScope.orderSession.number}) / 300 - 3
            }

            for (var i in result) {
                var data = result[i].options.split("_");
                var prices = result[i].price.split("_")
                var t = data[parseInt(arr[i])]
                data[parseInt(arr[i])] = data[0]
                data[0] = t
                var t1 = prices[parseInt(arr[i])]
                prices[parseInt(arr[i])] = data[0]
                prices[0] = t1
                for (var j in data) {
                    $("#" + option[i]).append("<option value='" + prices[j] + "'>" + data[j] + "</option>");
                }
            }
        }, "json")

        $("#getPrice").click(function () {

            getPrice();
        })
    })

    function getPrice() {

        var type = $("#type").val();
        var number = $("#number").val();
        var demand = $("#demand").val();
        
        if(type == "3"){
        	number = 500
        }
        //alert(type);
        $.ajax({
                type: "post",
                url: "<c:url value="/order/getPrice"/>",
                data: "type=" + type + "&number=" + number + "&demand=" + demand,
                dataType: "json",
                success: function (result) {
                    //alert("成功获取价格，将显示在页面中！")
                    $("#showPrice").text(result);
                }
            }
        )

    }


    function checkLoginSubmit() {
        var description = $("#description").val();
        if(description.length<5){
            if (${sessionScope.languageStatus=="1"}) {
                alert("文档描述必须大于5个字！");
            }
            if (${sessionScope.languageStatus=="2"}) {
                alert("Beschreibung der Dokumentation muss größer als fünf Worte.");
            }
            if (${sessionScope.languageStatus=="0"}) {
                alert("The document description must be more than 5 words!");
            }
            return;
        }

        if (${sessionScope.user==null}) {

            <% session.setAttribute("isorder","yes");%>
            submitOrder();
            show_modal();
        } else {

            if (${sessionScope.languageStatus=="1"}) {
                alert("订单已经成功生成，稍后我们会有工作人员和您联系进一步沟通关于软件预定的情况！");
            }
            if (${sessionScope.languageStatus=="2"}) {
                alert("Bestellungen sind erfolgreich erzeugt, auf die WIR später wird personal und " +
                    "Kontakt MIT Ihnen die weitere Kommunikation über die software vorgegebenen Situation!");
            }
            if (${sessionScope.languageStatus=="0"}) {
                alert("The order has been successfully generated, and later we will have the staff to contact you " +
                    "to further communicate about the software reservation");
            }

            $("#orderform").submit();

        }


        function submitOrder() {

            var type = $("#type").val();
            var demand = $("#demand").val();
            var number = $("#number").val();


            var description = $("#description").val();
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/order/nologinorder.do",
                data: "type=" + type + "&number=" + number + "&demand=" + demand + "&description=" + description,
                dataType: "text",
                success: function (result) {
                    if (result == "success") {
                        if (${sessionScope.languageStatus=="1"}) {
                            alert("请先完成登录！");
                        }
                        if (${sessionScope.languageStatus=="2"}) {
                            alert("Bitte loggen Sie sich vor der Bestellung ein!");
                        }
                        if (${sessionScope.languageStatus=="0"}){
                            alert("Please login before submit order!");
                        }
                    }
                }
            })


        }


        function show_modal() {
            $('#login-modal').modal('show');
        }
    }

</script>

</body>
</html>
