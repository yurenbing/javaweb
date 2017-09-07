package com.jxmy.service;

import com.jxmy.pojo.Jxmy_paymentinfo;

import java.util.List;

public interface IPaymentService {
    public List<Jxmy_paymentinfo> selectPaymentAll();

    public List<Jxmy_paymentinfo> selectPaymentInfo(String projetName);

    public int insert(Jxmy_paymentinfo record);

    public Jxmy_paymentinfo selectByPrimaryKey(Integer paymentId);

    public int updateByPrimaryKey(Jxmy_paymentinfo record);
}
