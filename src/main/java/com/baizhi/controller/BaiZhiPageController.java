package com.baizhi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/page")
public class BaiZhiPageController {

    @RequestMapping("/changeStatus")
    public String changeStatus(HttpSession session, HttpServletRequest req,String status){
        String str = req.getHeader("Referer");
        String[] path = str.split("/");
        String pageName = path[path.length-1];
        if(status.equals("0")){
            session.setAttribute("languageStatus","0");
        }else if(status.equals("1")){
            session.setAttribute("languageStatus","1");
        }else if(status.equals("2")){
            session.setAttribute("languageStatus","2");
        }
        
        if(pageName.equals("main.jsp") || str.endsWith(".com/") || str.endsWith(".cn/")) {
              str="/user/tomain";        
        }
        String url = "redirect:"+str;
        return url;
    }
}
