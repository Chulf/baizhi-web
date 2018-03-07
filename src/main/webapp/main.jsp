<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2018/1/25
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>mainriversoft.com</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css">
        <style>
            html,body{
                background-color:#313131 !important;
            }
            .navbar.navbar-default.navbar-static-top{
                border-width: 0 !important;
            }
            .one_meun{
                margin: 0;
                padding: 0;
            }
            .one_meun>li{
                margin: 0;
                padding: 0;
                float: left;
                list-style: none;
                text-align: center;
                height:108px;
            }
            .iconfont{
                display:block;
                margin:0 auto;
                font-size:36px;
                color:#fff;
                margin-top:16px;
            }
            #select_lang{
                list-style:none;
                margin:0;
                padding:0;
            }
            #select_lang li{
                margin:0;
                padding:10px 0 10px 20px;
            }
        </style>

    </head>
    <body>
        <jsp:include page="top.jsp"/>
        <div class="carousel slide" data-ride="carousel" id="slideshow">
            <div class="carousel-inner">

                <ol class="carousel-indicators">
                    <li data-target="#sildeshow" data-slide-to="0" class="active"></li>
                    <li data-target="#sildeshow" data-slide-to="1"></li>
                </ol>

                <div class="item active" >
                    <img src="${pageContext.request.contextPath}/image/banner.jpg" alt=""/>
                </div>

                <div class="item">
                    <img src="${pageContext.request.contextPath}/image/banner.jpg" alt=""/>
                </div>
                <a href="#slideshow" class="left carousel-control" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a href="#slideshow" class="right carousel-control" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>


            </div>
        </div>
        <div class="container visible-xs" style="background-color: #313131;overflow: auto;padding-bottom:22px">
            <ul class="one_meun" >
                <li class="col-xs-4"><a href="${pageContext.request.contextPath}/file/tohow"><i class="iconfont icon-cc-guidepost"></i>
                        <c:if
                            test="${sessionScope.languageStatus eq '1'}">使用指南</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '0'}">How it works</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '2'}">Wie es funktioniert</c:if>
                        </a></li>
                    <li class="col-xs-4"><a href="${pageContext.request.contextPath}/order/toorder"><i class="iconfont icon-xiangmu1"></i><c:if
                            test="${sessionScope.languageStatus eq '1'}">定制软件</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '0'}">Pricing</c:if>

                        <c:if
                            test="${sessionScope.languageStatus eq '2'}">Preisgestaltung</c:if></a></li>
                <li class="col-xs-4"><a href="${pageContext.request.contextPath}/file/toabout"><i class="iconfont icon-aboutus"></i><c:if
                            test="${sessionScope.languageStatus eq '1'}">关于我们</c:if><c:if
                            test="${sessionScope.languageStatus eq '0'}">About us</c:if>

                        <c:if
                            test="${sessionScope.languageStatus eq '2'}">Über uns</c:if></a>
                    </li>
                    <li class="col-xs-4"><a data-toggle="modal" data-target="#langModal"><i class="iconfont icon-theearth2diqiu"></i><c:if
                            test="${sessionScope.languageStatus eq '1'}">语言选择</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '0'}">Language</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '2'}">Sprache</c:if></a></li>
                <li class="col-xs-4"><a href="javascript:" <c:if test="${sessionScope.user == null}">data-toggle="modal" data-target="#login-modal"</c:if><c:if test="${sessionScope.user != null}">onclick="
                if (${sessionScope.languageStatus eq '1'}) {
                    alert('您已登录!');
                } else if (${sessionScope.languageStatus eq '0'}) {
                    alert('You have been logged in!')
                } else {
                    alert('Sie Sind angemeldet.')
                }"</c:if>><i class="iconfont icon-login"></i><c:if
                            test="${sessionScope.languageStatus eq '1'}">用户登录</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '0'}">Log in</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '2'}">Einloggen</c:if></a></li>
                <li class="col-xs-4"><a href="" <c:if test="${sessionScope.user ==null}">data-toggle="modal" data-target="#reg-modal"</c:if><c:if test="${sessionScope.user != null}">onclick="
                if (${sessionScope.languageStatus eq '1'}) {
                    alert('您已登录!');
                } else if (${sessionScope.languageStatus eq '0'}) {
                    alert('You have been logged in!')
                } else {
                    alert('Sie Sind angemeldet.')
                }"</c:if>><i class="iconfont icon-register-o"></i><c:if
                            test="${sessionScope.languageStatus eq '1'}">用户注册</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '0'}">Register</c:if>
                        <c:if
                            test="${sessionScope.languageStatus eq '2'}">Registrieren</c:if></a></li>

                </ul>

            </div>
            <style>

            </style>
            <div class="container">
                <div class="row" style="font-size:22px;padding:14px 0;color:#f2f2f2;width:100%;overflow:hidden;margin-right:0px;margin-left:0px">
                    <div id="marquee" width=100% direction=left align=middle>${sessionScope.contents[0]}</div>
            </div>
        </div>
        <script>
            (function (f) {
                f.fn.marquee = function (x) {
                    return this.each(function () {
                        var a = f.extend({}, f.fn.marquee.defaults, x), b = f(this), c, t, e = 3, y = "animation-play-state", p = !1, E = function (a, b, c) {
                            for (var e = ["webkit", "moz", "MS", "o", ""], d = 0; d < e.length; d++)
                                e[d] || (b = b.toLowerCase()), a.addEventListener(e[d] + b, c, !1)
                        }, F = function (a) {
                            var b = [], c;
                            for (c in a)
                                a.hasOwnProperty(c) && b.push(c + ":" + a[c]);
                            b.push();
                            return"{" + b.join(",") + "}"
                        }, l = {pause: function () {
                                p && a.allowCss3Support ? c.css(y, "paused") : f.fn.pause && c.pause();
                                b.data("runningStatus",
                                        "paused");
                                b.trigger("paused")
                            }, resume: function () {
                                p && a.allowCss3Support ? c.css(y, "running") : f.fn.resume && c.resume();
                                b.data("runningStatus", "resumed");
                                b.trigger("resumed")
                            }, toggle: function () {
                                l["resumed" == b.data("runningStatus") ? "pause" : "resume"]()
                            }, destroy: function () {
                                clearTimeout(b.timer);
                                b.find("*").addBack().unbind();
                                b.html(b.find(".js-marquee:first").html())
                            }};
                        if ("string" === typeof x)
                            f.isFunction(l[x]) && (c || (c = b.find(".js-marquee-wrapper")), !0 === b.data("css3AnimationIsSupported") && (p = !0), l[x]());
                        else {
                            var u;
                            f.each(a, function (c, d) {
                                u = b.attr("data-" + c);
                                if ("undefined" !== typeof u) {
                                    switch (u) {
                                        case "true":
                                            u = !0;
                                            break;
                                            case "false":
                                            u = !1
                                        }
                                    a[c] = u
                                }
                            });
                            a.speed && (a.duration = parseInt(b.width(), 10) / a.speed * 1E3);
                            var v = "up" == a.direction || "down" == a.direction;
                            a.gap = a.duplicated ? parseInt(a.gap) : 0;
                            b.wrapInner('<div class="js-marquee"></div>');
                            var h = b.find(".js-marquee").css({"margin-right": a.gap, "float": "left"});
                            a.duplicated && h.clone(!0).appendTo(b);
                            b.wrapInner('<div style="width:100000px" class="js-marquee-wrapper"></div>');
                            c = b.find(".js-marquee-wrapper");
                            if (v) {
                                var k = b.height();
                                c.removeAttr("style");
                                b.height(k);
                                b.find(".js-marquee").css({"float": "none", "margin-bottom": a.gap, "margin-right": 0});
                                a.duplicated && b.find(".js-marquee:last").css({"margin-bottom": 0});
                                var q = b.find(".js-marquee:first").height() + a.gap;
                                a.startVisible && !a.duplicated ? (a._completeDuration = (parseInt(q, 10) + parseInt(k, 10)) / parseInt(k, 10) * a.duration, a.duration *= parseInt(q, 10) / parseInt(k, 10)) : a.duration *= (parseInt(q, 10) + parseInt(k, 10)) / parseInt(k, 10)
                            } else {
                                var m =
                                        b.find(".js-marquee:first").width() + a.gap;
                                var n = b.width();
                                a.startVisible && !a.duplicated ? (a._completeDuration = (parseInt(m, 10) + parseInt(n, 10)) / parseInt(n, 10) * a.duration, a.duration *= parseInt(m, 10) / parseInt(n, 10)) : a.duration *= (parseInt(m, 10) + parseInt(n, 10)) / parseInt(n, 10)
                            }
                            a.duplicated && (a.duration /= 2);
                            if (a.allowCss3Support) {
                                h = document.body || document.createElement("div");
                                var g = "marqueeAnimation-" + Math.floor(1E7 * Math.random()), A = ["Webkit", "Moz", "O", "ms", "Khtml"], B = "animation", d = "", r = "";
                                h.style.animation &&
                                        (r = "@keyframes " + g + " ", p = !0);
                                if (!1 === p)
                                    for (var z = 0; z < A.length; z++)
                                        if (void 0 !== h.style[A[z] + "AnimationName"]) {
                                            h = "-" + A[z].toLowerCase() + "-";
                                            B = h + B;
                                            y = h + y;
                                            r = "@" + h + "keyframes " + g + " ";
                                            p = !0;
                                            break
                                        }
                                p && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s infinite " + a.css3easing, b.data("css3AnimationIsSupported", !0))
                            }
                            var C = function () {
                                c.css("transform", "translateY(" + ("up" == a.direction ? k + "px" : "-" + q + "px") + ")")
                            }, D = function () {
                                c.css("transform", "translateX(" + ("left" == a.direction ? n + "px" : "-" + m + "px") + ")")
                            };
                            a.duplicated ?
                                    (v ? a.startVisible ? c.css("transform", "translateY(0)") : c.css("transform", "translateY(" + ("up" == a.direction ? k + "px" : "-" + (2 * q - a.gap) + "px") + ")") : a.startVisible ? c.css("transform", "translateX(0)") : c.css("transform", "translateX(" + ("left" == a.direction ? n + "px" : "-" + (2 * m - a.gap) + "px") + ")"), a.startVisible || (e = 1)) : a.startVisible ? e = 2 : v ? C() : D();
                            var w = function () {
                                a.duplicated && (1 === e ? (a._originalDuration = a.duration, a.duration = v ? "up" == a.direction ? a.duration + k / (q / a.duration) : 2 * a.duration : "left" == a.direction ? a.duration + n /
                                        (m / a.duration) : 2 * a.duration, d && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s " + a.css3easing), e++) : 2 === e && (a.duration = a._originalDuration, d && (g += "0", r = f.trim(r) + "0 ", d = g + " " + a.duration / 1E3 + "s 0s infinite " + a.css3easing), e++));
                                v ? a.duplicated ? (2 < e && c.css("transform", "translateY(" + ("up" == a.direction ? 0 : "-" + q + "px") + ")"), t = {transform: "translateY(" + ("up" == a.direction ? "-" + q + "px" : 0) + ")"}) : a.startVisible ? 2 === e ? (d && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s " + a.css3easing), t = {transform: "translateY(" +
                                            ("up" == a.direction ? "-" + q + "px" : k + "px") + ")"}, e++) : 3 === e && (a.duration = a._completeDuration, d && (g += "0", r = f.trim(r) + "0 ", d = g + " " + a.duration / 1E3 + "s 0s infinite " + a.css3easing), C()) : (C(), t = {transform: "translateY(" + ("up" == a.direction ? "-" + c.height() + "px" : k + "px") + ")"}) : a.duplicated ? (2 < e && c.css("transform", "translateX(" + ("left" == a.direction ? 0 : "-" + m + "px") + ")"), t = {transform: "translateX(" + ("left" == a.direction ? "-" + m + "px" : 0) + ")"}) : a.startVisible ? 2 === e ? (d && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s " + a.css3easing),
                                        t = {transform: "translateX(" + ("left" == a.direction ? "-" + m + "px" : n + "px") + ")"}, e++) : 3 === e && (a.duration = a._completeDuration, d && (g += "0", r = f.trim(r) + "0 ", d = g + " " + a.duration / 1E3 + "s 0s infinite " + a.css3easing), D()) : (D(), t = {transform: "translateX(" + ("left" == a.direction ? "-" + m + "px" : n + "px") + ")"});
                                b.trigger("beforeStarting");
                                if (p) {
                                    c.css(B, d);
                                    var h = r + " { 100%  " + F(t) + "}", l = c.find("style");
                                    0 !== l.length ? l.filter(":last").html(h) : f("head").append("<style>" + h + "</style>");
                                    E(c[0], "AnimationIteration", function () {
                                        b.trigger("finished")
                                    });
                                    E(c[0], "AnimationEnd", function () {
                                        w();
                                        b.trigger("finished")
                                    })
                                } else
                                    c.animate(t, a.duration, a.easing, function () {
                                        b.trigger("finished");
                                        a.pauseOnCycle ? b.timer = setTimeout(w, a.delayBeforeStart) : w()
                                    });
                                b.data("runningStatus", "resumed")
                            };
                            b.bind("pause", l.pause);
                            b.bind("resume", l.resume);
                            a.pauseOnHover && (b.bind("mouseenter", l.pause), b.bind("mouseleave", l.resume));
                            p && a.allowCss3Support ? w() : b.timer = setTimeout(w, a.delayBeforeStart)
                        }
                    })
                };
                f.fn.marquee.defaults = {allowCss3Support: !0, css3easing: "linear", easing: "linear",
                    delayBeforeStart: 1E3, direction: "left", duplicated: !1, duration: 5E3, gap: 20, pauseOnCycle: !1, pauseOnHover: !1, startVisible: !1}
            })(jQuery);
        </script>
        <script>
            $("#marquee").marquee();
        </script>
        <jsp:include page="foot.jsp"/>
    </body>
</html>
<div class="modal fade in" id="langModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <ul id="select_lang">

                <li><a href="${pageContext.request.contextPath}/page/changeStatus?status=0">
                        <button class="usa"><img
                                src="${pageContext.request.contextPath}/img/USA.jpg"></img></button>
                        &nbsp;&nbsp;English
                    </a></li>

                <li><a href="${pageContext.request.contextPath}/page/changeStatus?status=1">
                        <button class="cn"><img src="${pageContext.request.contextPath}/img/CN.jpg"></img>
                        </button>
                        &nbsp;&nbsp;简体中文
                    </a></li>

                <li><a href="${pageContext.request.contextPath}/page/changeStatus?status=2">
                        <button class="dg"><img src="${pageContext.request.contextPath}/img/dg.jpg"></img>
                        </button>
                        &nbsp;&nbsp;Deutsch
                    </a></li>

            </ul>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>