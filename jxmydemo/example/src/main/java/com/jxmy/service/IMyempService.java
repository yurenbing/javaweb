package com.jxmy.service;

import com.jxmy.pojo.tb_myemp;

public interface IMyempService {

    public int insert(tb_myemp record);

    public int insertSelective(tb_myemp record);
}
