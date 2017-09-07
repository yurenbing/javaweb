package com.jxmy.controller;

import com.jxmy.pojo.Jxmy_login;
import com.jxmy.service.ILoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

@Controller
public class LoginController {
    @Resource
    ILoginService loginService=null;

    @RequestMapping(value="/loginCheck.do")
    public void loginCheck(Jxmy_login jxmy_login,HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            Jxmy_login login=loginService.selectLogin(jxmy_login.getLoginName(),jxmy_login.getLoginPassword());
            try {
                PrintWriter out=response.getWriter();
                if (login!=null){
                    out.print("main");
                }else {
                    out.print("null");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/login.do")
    public String login(HttpServletRequest request,Model model){
        String name=request.getParameter("login_name");
        model.addAttribute("name",name);
        request.getSession().setAttribute("login_name",name);
        return "main";
    }

    @RequestMapping(value = "/loginName.do")
    public void loginName(@RequestParam String login_name, HttpServletResponse response){
        Jxmy_login login=loginService.selectName(login_name);
        try {
            PrintWriter out=response.getWriter();
            if (login!=null){
                out.print("exit");
            }else {
                out.print("null");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
