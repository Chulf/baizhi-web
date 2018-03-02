<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2018/1/25
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charest=UTF8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>How it works?</title>

</head>
<body>
<jsp:include page="top.jsp"/>


<div class="container">
    <div class="row ">

        <div class="embed-responsive embed-responsive-16by9">
            <video controls="controls" loop="loop">
                <%--英语--%>
                <c:if
                        test="${sessionScope.languageStatus eq '0'}">
                    <source src="${pageContext.request.contextPath }/video/cn.mp4" type="video/mp4">
                </c:if>
                <%--中文--%>
                <c:if
                        test="${sessionScope.languageStatus eq '1'}">
                    <source src="${pageContext.request.contextPath }/video/cn.mp4" type="video/mp4">
                </c:if>
                <%--德语--%>
                <c:if
                        test="${sessionScope.languageStatus eq '2'}">
                    <source src="${pageContext.request.contextPath }/video/cn.mp4" type="video/mp4">
                </c:if>

            </video>
        </div>
    </div>

    <div class="row ">
        <div class="col-md-12">
            <h1 class="page-header" style="text-align: center;">${requestScope.contents[0]}</h1>
        </div>
    </div>

    <div class="container">
        <div class="row ">
            <div class="col-md-4 col-sm-12 " style="text-align:center"><img style="width: 200px;height: 150px;"
                                                  src="${pageContext.request.contextPath }/img/alibaba.jpg"
                                                  alt="阿里巴巴"></div>
            <div class="col-md-4 col-sm-12 " style="text-align:center"><img style="width: 200px;height: 150px;"
                                                 src="${pageContext.request.contextPath }/img/baidu.jpg" alt="百度">
            </div>
            <div class="col-md-4 col-sm-12 " style="text-align:center"><img style="width: 200px;height: 150px;"
                                                  src="${pageContext.request.contextPath }/img/tengxun.jpg"
                                                  alt="腾讯"></div>
            <div class="col-md-4 col-sm-12 " style="text-align:center"><img style="width: 200px;height: 150px;"
                                                  src="${pageContext.request.contextPath }/img/xiaomi.jpg"
                                                  alt="小米"></div>
            <div class="col-md-4 col-sm-12 " style="text-align:center"><img style="width: 200px;height: 150px;"
                                                  src="${pageContext.request.contextPath }/img/ximenzi.jpg"
                                                  alt="西门子"></div>
            <div class="col-md-4  col-sm-12 " style="text-align:center"><img style="width: 200px;height: 150px;"
                                                  src="${pageContext.request.contextPath }/img/huawei.jpg"
                                                  alt="华为"></div>

        </div>
    </div>
    <div class="row ">
        <div class="col-md-12">
            <h1 class="page-header" style="text-align: center;">${requestScope.contents[1]}</h1>
        </div>
    </div>

    <div class="container">
        <style>
            .proj-img{
                border:4px double #888;
                padding:30px 15px;
            }
            .proj-title{
                text-align:center;
                font-size:20px;
                padding:8px 0;
            }
        </style>
        <div class="row ">
            <div class="col-md-6 col-xs-12">
                <img class="proj-img" src="${pageContext.request.contextPath }/img/project01.png">
                <div class="proj-title"><c:if
                        test="${sessionScope.languageStatus eq '1'}">电商类项目开发</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '0'|| sessionScope.languageStatus == null}">E-Commerce Project Development</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '2'|| sessionScope.languageStatus == null}">E-Commerce Projektentwicklung</c:if></div>
            </div>
            <div class="col-md-6  col-xs-12">
                <img class="proj-img" src="${pageContext.request.contextPath }/img/project02.jpg">
                <div class="proj-title"><c:if
                        test="${sessionScope.languageStatus eq '1'}">OA管理类项目开发</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '0'|| sessionScope.languageStatus == null}">OA Management Project Development</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '2'|| sessionScope.languageStatus == null}">OA-Verwaltung Projektentwicklung</c:if></div>
            </div>
        </div>
        <div class="row ">
            <div class="col-md-6  col-xs-12">
                <img class="proj-img" src="${pageContext.request.contextPath }/img/project03.png">
                <div class="proj-title"><c:if
                        test="${sessionScope.languageStatus eq '1'}">大数据征信类项目开发</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '0'|| sessionScope.languageStatus == null}">Big Data Credit Project Development</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '2'|| sessionScope.languageStatus == null}">Großes Datenguthaben Projektentwicklung</c:if></div>
            </div>
            <div class="col-md-6  col-xs-12">
                <img class="proj-img" src="${pageContext.request.contextPath }/img/project04.png">
                <div class="proj-title"><c:if
                        test="${sessionScope.languageStatus eq '1'}">统计分析类项目开发</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '0'|| sessionScope.languageStatus == null}">Statistical Analysis Project Development</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '2'|| sessionScope.languageStatus == null}">Die Statistische analyse Projektentwicklung</c:if></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6  col-xs-12">
                <img class="proj-img" src="${pageContext.request.contextPath }/img/project05.png">
                <div class="proj-title"><c:if
                        test="${sessionScope.languageStatus eq '1'}">小程序团购类项目开发</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '0'|| sessionScope.languageStatus == null}">Small program group purchase Project Development</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '2'|| sessionScope.languageStatus == null}">Kleines Programm kaufen Projektentwicklung</c:if></div>
            </div>
            <div class="col-md-6  col-xs-12">
                <img class="proj-img" src="${pageContext.request.contextPath }/img/project06.png">
                <div class="proj-title"><c:if
                        test="${sessionScope.languageStatus eq '1'}">app点购类项目开发</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '0'|| sessionScope.languageStatus == null}">App point purchase Project Development</c:if>
                    <c:if
                            test="${sessionScope.languageStatus eq '2'|| sessionScope.languageStatus == null}">App - Kauf Projektentwicklung</c:if></div>
            </div>
        </div>
    </div>
</div>
<div style="padding-top: 80px;">
    <jsp:include page="foot.jsp"/>
</div>


</body>
</html>
