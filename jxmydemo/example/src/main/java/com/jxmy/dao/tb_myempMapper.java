package com.jxmy.dao;

import com.jxmy.pojo.tb_myemp;
import org.springframework.stereotype.Repository;

@Repository
public interface tb_myempMapper {
    int insert(tb_myemp record);

    int insertSelective(tb_myemp record);
}