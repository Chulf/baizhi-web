package com.baizhi.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baizhi.entity.BaiZhiResource;
import com.baizhi.service.BaiZhiPageService;
import com.baizhi.service.BaiZhiResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baizhi.entity.BaiZhiUser;
import com.baizhi.service.BaiZhiUserService;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class BaiZhiUserController {
    @Autowired
    private BaiZhiUserService service;
    @Autowired
    private BaiZhiPageService baiZhiPageService;
    @Autowired
    private BaiZhiResourceService baiZhiResourceService;

    public BaiZhiPageService getBaiZhiPageService() {
        return baiZhiPageService;
    }

    public void setBaiZhiPageService(BaiZhiPageService baiZhiPageService) {
        this.baiZhiPageService = baiZhiPageService;
    }

    public BaiZhiResourceService getBaiZhiResourceService() {
        return baiZhiResourceService;
    }

    public void setBaiZhiResourceService(BaiZhiResourceService baiZhiResourceService) {
        this.baiZhiResourceService = baiZhiResourceService;
    }

    public BaiZhiUserService getService() {
        return service;
    }

    public void setService(BaiZhiUserService service) {
        this.service = service;
    }

    @RequestMapping("tologin")
    public String toupload(HttpServletRequest request) {
        String status = (String) request.getSession().getAttribute("languageStatus");
        if (status == null) {
            status = "0";
        }
        String content = baiZhiPageService.queryContentByPageNameAndStatus("login.jsp", status);
        String[] contents = content.split("_");
        request.setAttribute("contents", contents);
        return "login-form";
    }

    @RequestMapping("toreg")
    public String toreg(HttpServletRequest request) {
        String status = (String) request.getSession().getAttribute("languageStatus");
        if (status == null) {
            status = "0";
        }
        String content = baiZhiPageService.queryContentByPageNameAndStatus("reg.jsp", status);
        String[] contents = content.split("_");
        request.setAttribute("contents", contents);
        return "reg-form";
    }

    @RequestMapping("login")
    public @ResponseBody
    String login(HttpServletResponse response,HttpSession session, String username, String password) {

        try {
            BaiZhiUser user = service.login(username, password);
            session.setAttribute("user", user);

            //创建用户cookie
            Cookie userCookie = new Cookie("userCookie",user.getUsername());

            //设置cookie存活时间为一年
            userCookie.setMaxAge(3600*24*365);

            response.addCookie(userCookie);

            return "loginok";
        } catch (Exception e) {
            e.printStackTrace();
            return "loginno";
        }

    }

    @RequestMapping("reg")
    @ResponseBody
    public String reg(HttpSession session, BaiZhiUser user) {
        BaiZhiUser reg = service.reg(user);
        System.out.println("用户注册成功！");
        session.setAttribute("user", reg);
        return "regOk";
    }

    @RequestMapping("tomain")
    public String toMain(HttpServletRequest request, HttpSession session) {
        String status = (String) request.getSession().getAttribute("languageStatus");
        if (status == null) status = "0";
        String content = baiZhiPageService.queryContentByPageNameAndStatus("main.jsp", status);
        BaiZhiResource resource = baiZhiResourceService.getResource();
        session.setAttribute("resource", resource);
        String[] contents = content.split("_");
        session.setAttribute("contents", contents);
        return "/main";
    }

    @ResponseBody
    @RequestMapping("createtoken")
    public Boolean createtoken(HttpSession session,String username) {
        boolean b = service.checkUserOne(username);
        if(b){
            session.setAttribute("token", new Date());
            return false;
        }
        return true;

    }

    @ResponseBody
    @RequestMapping("checktoken")
    public Boolean checktoken(HttpSession session,String username) {
        Object token = session.getAttribute("token");
        Date oldtoken = (Date) token;
        long l = (new Date().getTime() - oldtoken.getTime()) / 1000;
        if (l >= 5) {
            //可以进行注册操作
            return false;
        } else {
            //您的操作过于频繁
            return true;
        }
    }


    @RequestMapping("logout")
    public String logout(HttpSession session,HttpServletResponse response,HttpServletRequest request) {
        //用户退出操作
        session.setAttribute("user",null);

        //清除用户token信息
        session.setAttribute("token",null);

        //删除用户cookie
        Cookie userCookie = new Cookie("userCookie", null);

        userCookie.setMaxAge(0);

        response.addCookie(userCookie);

        return "redirect:/user/tomain";
    }
}
