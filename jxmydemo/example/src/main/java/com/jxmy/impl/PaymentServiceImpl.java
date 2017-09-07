package com.jxmy.impl;

import com.jxmy.dao.Jxmy_paymentinfoMapper;
import com.jxmy.pojo.Jxmy_paymentinfo;
import com.jxmy.service.IPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("paymentService")
public class PaymentServiceImpl implements IPaymentService{

    @Autowired
    Jxmy_paymentinfoMapper paymentDao;

    @Override
    public List<Jxmy_paymentinfo> selectPaymentAll() {
        return paymentDao.selectPaymentAll();
    }

    @Override
    public List<Jxmy_paymentinfo> selectPaymentInfo(String projetName) {
        return paymentDao.selectPaymentInfo(projetName);
    }

    @Override
    public int insert(Jxmy_paymentinfo record) {
        return paymentDao.insert(record);
    }

    @Override
    public Jxmy_paymentinfo selectByPrimaryKey(Integer paymentId) {
        return paymentDao.selectByPrimaryKey(paymentId);
    }

    @Override
    public int updateByPrimaryKey(Jxmy_paymentinfo record) {
        return paymentDao.updateByPrimaryKey(record);
    }
}
