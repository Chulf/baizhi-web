<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2018/1/25
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Impressum</title>
    </head>
    <body>
        <jsp:include page="top.jsp"/>

        <div class="container" style="padding-bottom:180px;">

            <div class="row">
                <div class="col-md-6 col-xs-12 hidden-xs">
                    <h1><br><br></h1>
                    <img style="width:500px;height:300px;margin-top:40px;box-shadow:16px 12px 24px #888;max-width:100%" src="${pageContext.request.contextPath}/image/timg.jpg">
                </div>
                <div class="col-md-6 col-xs-12 visible-xs-block">
                    <img style="width:500px;height:300px;margin-top:40px;box-shadow:16px 12px 24px #888;max-width:100%" src="${pageContext.request.contextPath}/image/timg.jpg">
                </div>
                <div class="col-md-6 col-xs-12 hidden-xs" style="height:540px">
                    <h1 class="page-header" style="">Impressum</h1>
                    <h4 style="text-shadow:4px 4px 4px #999">
                        
                        </br>
                        Kontakt:</br>

                        Telefon: 049 69 15619300</br>
                        e-Mail: contact@mainriversoft.com</br>
                        Website: www.mainriversoft.com</br></br>

                        </br>
                        Verantwortlich nach § 6 Abs.2 MDStV</br>

                        Vertreten durch Minhong Wang </br></br>

                        St.-Nr. 1387967987 </br>
                        USt-IdNr. DE298907540</br>
                        </br>
                    </h4>
                </div>
                <div class="col-md-6 col-xs-12 visible-xs-block">
                    <h1 class="page-header" style="">Impressum</h1>
                    <h4 style="text-shadow:4px 4px 4px #999">Impressum: </br>

                        Max Mustermann </br>
                        Musterstraße 12</br>
                        12345 Berlin</br></br>

                        Kontakt:</br>

                        Telefon: 030/12345678</br>
                        Telefax: 030/12345679</br>
                        e-Mail: e-Mail@mustermann.de</br>
                        Website: www.mustermann.de</br></br>

                        ##Bei redaktionellen Inhalten zusätzlich:##</br>

                        Verantwortlich nach § 6 Abs.2 MDStV</br>

                        Paul Schreiber</br>
                        Redakteur Hardware und Software“ </br>
                        Ahornallee 1 </br>
                        12345 Berlin</br></br>

                        Registergericht: AG Berlin</br>
                        HRB-Nummer: 54321</br>
                        Umsatzsteueridentifikationsnummer: 123456789</br>
                        Nennung des vertretungsberechtigten Gesch?ftsführer einer GmbH</br>
                    </h4>
                </div>
            </div>
        </div>

        <div style="position:fixed;width:100%;bottom:0"><jsp:include page="foot.jsp"/></div>



    </body>
</html>
