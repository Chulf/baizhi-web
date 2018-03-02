<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2018/1/24
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<div class="modal-header">
    <button class="close" data-dismiss="modal">&times;</button>
    <h4>${requestScope.contents[0]}</h4>
</div>
<div class="modal-body">
    <form role="form" action="${pageContext.request.contextPath}/user/reg.do" id="reg">

        <div class="form-group">
            <label for="username">${requestScope.contents[1]}</label>
            <input type="username" class="form-control" id="username" name="username"
                   onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
        </div>
        <div class="form-group">
            <label for="password">${requestScope.contents[2]}</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="form-group">
            <label for="password">${requestScope.contents[3]}</label>
            <input type="password" class="form-control" id="repassword">
        </div>
        <div class="form-group">
            <label for="email">${requestScope.contents[4]}</label>
            <input type="email" class="form-control" id="email" name="mail">
        </div>
        <div class="form-group">
            <label for="phone">${requestScope.contents[5]}</label>
            <input type="phone" class="form-control" id="phone" name="phone">
        </div>
        <div class="modal-footer">
            <input type="button" class="btn btn-primary" id="sbmt" value="${requestScope.contents[6]}">
        </div>
    </form>
</div>


<script type="text/javascript">

    $(function () {
        checkReg();
    })


    function checkReg() {

        ok1 = false;
        ok2 = false;
        ok3 = false;
        ok4 = false;
        ok5 = false;
        $("#sbmt").click(function () {
            //验证用户名
            if ($("#username").val().length >= 3 && $("#username").val().length <= 12 && $("#username").val() != '') {
                ok1 = true;
            } else {
                if(${sessionScope.languageStatus eq '1'}){
                    alert("用户名应该为3-20位之间!");
                }else if(${sessionScope.languageStatus eq '0'}){
                    alert("The username should be between 3-20!")
                }else{
                    alert("Der benutzername sollte zwischen A4 ein.")
                }
            }
            //验证密码
            if ($("#password").val().length >= 6 && $("#password").val().length <= 20 && $("#password").val() != '') {
                ok2 = true;
            } else {
                if(${sessionScope.languageStatus eq '1'}){
                    alert("密码应该为6-20位之间!");
                }else if(${sessionScope.languageStatus eq '0'}){
                    alert("The password should be between 6-20 bits！")
                }else{
                    alert("Das passwort sollte Platz für den 6 - 20.")
                }
            }


            //验证是否一致

            if($("#password").val()==$("#repassword").val()){
                ok5 = true;
            }else {
                if(${sessionScope.languageStatus eq '1'}){
                    alert("两次密码输入不一致");
                }else if(${sessionScope.languageStatus eq '0'}){
                    alert("Two password input is not consistent!")
                }else{
                    alert("Zwei passwort- eingabe passen nicht!.")
                }
            }
            //验证邮箱格式
            if ($("#email").val().search(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/) == -1) {
                if(${sessionScope.languageStatus eq '1'}){
                    alert("请输入正确的邮箱格式！");
                }else if(${sessionScope.languageStatus eq '0'}){
                    alert("Please enter the correct mailbox format！")
                }else{
                    alert("Bitte geben sie eine gültige e - mail - format.")
                }
            } else {
                ok3 = true;
            }
            //验证手机号格式
            if ( $("#phone").val() != '') {
                ok4 = true;
            } else {
                if(${sessionScope.languageStatus eq '1'}){
                    alert("请输入手机号！");
                }else if(${sessionScope.languageStatus eq '0'}){
                    alert("Please enter mobile phone numbers！")
                }else{
                    alert("bitte geben sie die handy - nummern.")
                }
            }
            if (${empty token}) {
                var username = $("#username").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/createtoken",
                    type: "get",
                    data:"username="+username,
                    dataType: "json",
                    success: function (result) {
                        if (result) {
                            if(${sessionScope.languageStatus eq '1'}){
                                alert("该用户名已被注册！");
                            }else if(${sessionScope.languageStatus eq '0'}){
                                alert("The username has been registered!")
                            }else{
                                alert("Der benutzername registriert Worden.")
                            }
                        } else {
                            if (ok1 && ok2 && ok3 && ok4&&ok5) {
                                $("#reg").submit();
                            }
                        }
                    }
                });
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/checktoken",
                    type: "get",
                    dataType: "json",
                    success: function (result) {
                        if (result) {
                            alert("您的操作过于频繁！");
                        } else {
                            if (ok1 && ok2 && ok3 && ok4&&ok5) {
                                $("#reg").submit();
                            }
                        }
                    }
                });
            }
        });
    }


</script>

</body>
</html>