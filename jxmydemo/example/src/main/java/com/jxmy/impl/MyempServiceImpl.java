package com.jxmy.impl;

import com.jxmy.dao.tb_myempMapper;
import com.jxmy.pojo.tb_myemp;
import com.jxmy.service.IMyempService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("myempService")
public class MyempServiceImpl implements IMyempService{

    @Autowired
    tb_myempMapper myempDao;

    @Override
    public int insert(tb_myemp record) {
        return myempDao.insert(record);
    }

    @Override
    public int insertSelective(tb_myemp record) {
        return myempDao.insertSelective(record);
    }
}
