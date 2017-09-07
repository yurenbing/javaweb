package com.jxmy.dao;

import com.jxmy.pojo.Jxmy_paymentinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Jxmy_paymentinfoMapper {
    int deleteByPrimaryKey(Integer paymentId);

    int insert(Jxmy_paymentinfo record);

    int insertSelective(Jxmy_paymentinfo record);

    Jxmy_paymentinfo selectByPrimaryKey(Integer paymentId);

    int updateByPrimaryKeySelective(Jxmy_paymentinfo record);

    int updateByPrimaryKey(Jxmy_paymentinfo record);

    List<Jxmy_paymentinfo> selectPaymentAll();

    List<Jxmy_paymentinfo> selectPaymentInfo(String projetName);
}