package com.baizhi.filter;

import com.baizhi.dao.BaiZhiUserDAO;
import com.baizhi.entity.BaiZhiUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
@Component
public class LoginFilter implements Filter {
    private ServletContext servletContext;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        servletContext = filterConfig.getServletContext();
    }

    @Autowired
    private BaiZhiUserDAO baiZhiUserDAO;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request2 = (HttpServletRequest) servletRequest;

        HttpSession session = request2.getSession();

        Object user = session.getAttribute("user");

        if (user == null) {

            //进行免登陆操作
            Cookie[] cookies = request2.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    if (name.equals("userCookie")) {
                        //代表用户已经登录过 存储session 免登陆操作
                        String value = cookie.getValue();

                        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);

                        baiZhiUserDAO = context.getBean(BaiZhiUserDAO.class);

                        //这里先不进行验证 后续再进行验证相关操作
                        BaiZhiUser baiZhiUser = baiZhiUserDAO.queryUserByUsername(value);

                        //存储用户到session 代表登录
                        session.setAttribute("user", baiZhiUser);
                    }
                }
            }
        }
        //代表用户已经登录直接放行
        filterChain.doFilter(servletRequest, servletResponse);


    }

    @Override
    public void destroy() {

    }
}
