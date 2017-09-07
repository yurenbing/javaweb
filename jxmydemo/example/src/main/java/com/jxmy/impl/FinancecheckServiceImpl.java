package com.jxmy.impl;

import com.jxmy.dao.Jxmy_financecheckMapper;
import com.jxmy.pojo.Jxmy_financecheck;
import com.jxmy.service.IFinancecheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("financecheckService")
public class FinancecheckServiceImpl implements IFinancecheckService{

    @Autowired
    Jxmy_financecheckMapper financecheckDao;

    @Override
    public List<Jxmy_financecheck> selectFinancechecked() {
        return financecheckDao.selectFinancechecked();
    }

    @Override
    public List<Jxmy_financecheck> selectFinanceunchecked() {
        return financecheckDao.selectFinanceunchecked();
    }

    @Override
    public Jxmy_financecheck selectByPrimaryKey(Integer checkId) {
        return financecheckDao.selectByPrimaryKey(checkId);
    }

    @Override
    public int updateByPrimaryKeySelective(Jxmy_financecheck record) {
        return financecheckDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insert(Jxmy_financecheck record) {
        return financecheckDao.insertSelective(record);
    }

    @Override
    public List<Jxmy_financecheck> selectFinanceUnCheckInfo(String projectName) {
        return financecheckDao.selectFinanceUnCheckInfo(projectName);
    }

    @Override
    public List<Jxmy_financecheck> selectFinanceCheckedInfo(String projectName) {
        return financecheckDao.selectFinanceCheckedInfo(projectName);
    }

    @Override
    public List<Jxmy_financecheck> selectMyFinanceAll(String empOwner) {
        return financecheckDao.selectMyFinanceAll(empOwner);
    }

    @Override
    public List<Jxmy_financecheck> selectMyFinanceAllChecked(String empOwner) {
        return financecheckDao.selectMyFinanceAllChecked(empOwner);
    }

    @Override
    public List<Jxmy_financecheck> selectMyFinanceAllUnChecked(String empOwner) {
        return financecheckDao.selectMyFinanceAllUnChecked(empOwner);
    }
}
