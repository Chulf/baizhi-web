package com.baizhi.filter;

import com.baizhi.entity.BaiZhiOrder;
import com.baizhi.entity.BaiZhiUser;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

/**
 * Created by Administrator on 2018/2/27.
 */

/**
 * 语言拦截器 判断浏览器的语言进行语言选择
 */
public class LanguageFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request2 = (HttpServletRequest)request;
        HttpSession session = request2.getSession();



        //获取请求的url
        String str = request2.getRequestURL().toString();
        //如果语言已经进行更存储就不再进行干涉
        if(session.getAttribute("languageStatus") != null || str.contains("/user/tomain")){
            filterChain.doFilter(request,servletResponse);
        }else {
            Locale locale = request.getLocale();
            String language = locale.getLanguage();
            System.out.println(language);
            session.setAttribute("orderSession", new BaiZhiOrder("0", "0", "1000"));
            if (language != null) {
                if (language.startsWith("de"))
                    session.setAttribute("languageStatus", "2");
                else if (language.startsWith("zh"))
                    session.setAttribute("languageStatus", "1");
                else session.setAttribute("languageStatus", "0");
            } else session.setAttribute("languageStatus", "0");
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            response.sendRedirect(request2.getContextPath() + "/user/tomain");
        }
    }

    @Override
    public void destroy() {

    }
}
