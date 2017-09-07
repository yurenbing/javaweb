package com.jxmy.dao;

import com.jxmy.pojo.Jxmy_login;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Jxmy_loginMapper {

    int deleteByPrimaryKey(Integer loginId);

    int insert(Jxmy_login record);

    int insertSelective(Jxmy_login record);

    Jxmy_login selectByPrimaryKey(Integer loginId);

    Jxmy_login selectLogin(@Param("loginName") String loginName, @Param("loginPassword") String loginPassword);

    Jxmy_login selectName(String loginName);

    int updateByPrimaryKeySelective(Jxmy_login record);

    int updateByPrimaryKey(Jxmy_login record);
}