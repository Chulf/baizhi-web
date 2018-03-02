<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2018/1/25
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Foot</title>
    <style>
        h4inline{
            font-size: 18px;
            font-family: inherit;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css">
    <style>
        #foot_nav{
            margin-bottom:0 !important;
        }
    </style>
</head>
<body>
<div class="main_nav_bottom">
    <nav id="foot_nav" class="navbar navbar-default navbar-static-top " style="background: #313131;">
        <div class="container" align="center">
            <style>
                .nav-tabs {
                    text-align: center;
                    height: 40px;
                    line-height: 40px;

                }
            </style>
            <ul class="nav nav-tabs nav-tabs-justified hidden-xs">
                <div class="row" align="center">
                    <div class="col-md-3 col-sm-3 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon glyphicon-phone" ></span><h5>
                            ${sessionScope.resource.phone}</h5></a></li>
                    </div>

                    <div class="col-md-3 col-sm-3 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon glyphicon-envelope" ></span><h5>
                            ${sessionScope.resource.email}</h5></a></li>
                    </div>

                    <div class="col-md-3 col-sm-3 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon iconfont  icon-yooxi" style="margin-top: 0px;"></span>
                            <h5>WeChatNumber:017672221728</h5></a></li>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon glyphicon-road" ></span><h5>
                            ${sessionScope.resource.address}</h5></a></li>
                    </div>
                </div>
            </ul>
            <ul class="nav nav-tabs nav-tabs-justified visible-xs-block">
                <div class="row" align="center">

                    <div class="col-md-4 col-sm-4 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon glyphicon-phone" ></span><h4inline>
                            ${sessionScope.resource.phone}</h4inline></a></li>
                    </div>



                    <div class="col-md-4 col-sm-4 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon glyphicon-envelope" ></span><h4inline>
                            ${sessionScope.resource.email}</h4inline></a></li>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12" align="center">
                        <li><a href="#"><span class="iconfont glyphicon icon-yooxi" ></span><h4inline>
                            WeChatNumber:017672221728</h4inline></a></li>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12" align="center">
                        <li><a href="#"><span class="glyphicon glyphicon-road" ></span><h4inline>
                            ${sessionScope.resource.address}</h4inline></a></li>
                    </div>
                </div>
            </ul>

        </div>

    </nav>
</div>


</body>
</html>
