package com.jxmy.service;

import com.jxmy.pojo.Jxmy_login;

public interface ILoginService {

    public Jxmy_login selectLogin(String login_name, String login_password);


    public Jxmy_login selectName(String login_name);
}
