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




                <%
					if (session.getAttribute("languageStatus").equals("0")) {
				%>
                      <h1 class="page-header" style="">Imprint</h1>
                      <h4 style="text-shadow:4px 4px 4px #999">

                          </br>Contact:</br>

                           Telephone: 049 69 15619300</br>
                           e-Mail: contact@mainriversoft.com</br>
                           Website: www.mainriversoft.com</br></br>

                           </br>
                           According to § 6 Abs.2 MDStV</br>

                           Responsible Person  WangYan </br></br>

                           St.-Nr. 1387967987 </br>
                           USt-IdNr. DE298907540</br>
                           </br>
                      </h4>
				<% }
                %>


                <%
					if (session.getAttribute("languageStatus").equals("2")) {
				%>

                        <h1 class="page-header" style="">Impressum</h1>
                        <h4 style="text-shadow:4px 4px 4px #999">

                            </br>Kontakt:</br>

                            Telefon: 049 69 15619300</br>
                            e-Mail: contact@mainriversoft.com</br>
                            Website: www.mainriversoft.com</br></br>

                            </br>
                            Verantwortlich nach § 6 Abs.2 MDStV</br>

                            Vertreten durch  Wang Yan </br></br>

                            St.-Nr. 1387967987 </br>
                            USt-IdNr. DE298907540</br>
                            </br>
                        </h4>
				<% }
                %>


                <c:set var = "languageStatus" scope = "session" value = "${sessionScope.languageStatus}"/>

                <c:if test = "${languageStatus eq '1'}">
                    <h1 class="page-header" style="">版权所有</h1>
                    <h4 style="text-shadow:4px 4px 4px #999">
                            </br>联系方式:</br>

                            电话: 049 69 15619300</br>
                            电子邮箱: contact@mainriversoft.com</br>
                            网站地址: www.mainriversoft.com</br></br>

                            </br>
                            根据法律条款 § 6 Abs.2 MDStV</br>

                            负责人 WangYan </br></br>

                            St.-Nr. 1387967987 </br>
                            USt-IdNr. DE298907540</br>
                            </br>
                    </h4>
				</c:if>




                </div>


                <div class="col-md-6 col-xs-12 visible-xs-block">

                <%
					if (session.getAttribute("languageStatus").equals("0")) {
				%>
                      <h1 class="page-header" style="">Imprint</h1>
                      <h4 style="text-shadow:4px 4px 4px #999">

                          </br>Contact:</br>

                           Telephone: 049 69 15619300</br>
                           e-Mail: contact@mainriversoft.com</br>
                           Website: www.mainriversoft.com</br></br>

                           </br>
                           According to § 6 Abs.2 MDStV</br>

                           Responsible Person  WangYan </br></br>

                           St.-Nr. 1387967987 </br>
                           USt-IdNr. DE298907540</br>
                           </br>
                      </h4>
				<% }
                %>
                <%
					if (session.getAttribute("languageStatus").equals("1")) {
				%>
                    <h1 class="page-header" style="">版权</h1>
                        <h4 style="text-shadow:4px 4px 4px #999">
                            </br>联系方式:</br>

                            电话: 049 69 15619300</br>
                            电子邮箱: contact@mainriversoft.com</br>
                            网站地址: www.mainriversoft.com</br></br>

                            </br>
                            根据法律条款 § 6 Abs.2 MDStV</br>

                            负责人 WangYan </br></br>

                            St.-Nr. 1387967987 </br>
                            USt-IdNr. DE298907540</br>
                            </br>
                        </h4>
				<% }
                %>

                <%
 					if (session.getAttribute("languageStatus").equals("2")) {
 				%>
                    <h1 class="page-header" style="">Impressum</h1>
                    <h4 style="text-shadow:4px 4px 4px #999">
                        </br>Kontakt:</br>

                        Telefon: 049 69 15619300</br>
                        e-Mail: contact@mainriversoft.com</br>
                        Website: www.mainriversoft.com</br>

                        </br>
                        Verantwortlich nach § 6 Abs.2 MDStV</br>

                        Vertreten durch Minhong Wang </br></br>

                        St.-Nr. 1387967987 </br>
                        USt-IdNr. DE298907540</br>
                        </br>
                    </h4>
	            <% }
                %>

                </div>
            </div>
        </div>

        <div style="position:fixed;width:100%;bottom:0"><jsp:include page="foot.jsp"/></div>



    </body>
</html>
