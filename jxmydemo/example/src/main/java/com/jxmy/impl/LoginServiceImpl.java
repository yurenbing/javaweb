package com.jxmy.impl;

import com.jxmy.dao.Jxmy_loginMapper;
import com.jxmy.pojo.Jxmy_login;
import com.jxmy.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements ILoginService{

    @Autowired
    Jxmy_loginMapper loginService;

    @Override
    public Jxmy_login selectLogin(String login_name, String login_password) {
        return loginService.selectLogin(login_name,login_password);
    }

    @Override
    public Jxmy_login selectName(String login_name) {
        return loginService.selectName(login_name);
    }
}
