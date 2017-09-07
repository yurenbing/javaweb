package com.jxmy.impl;

import com.jxmy.dao.Jxmy_employessinfoMapper;
import com.jxmy.pojo.Jxmy_employessinfo;
import com.jxmy.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl implements IEmployeeService{

    @Autowired
    Jxmy_employessinfoMapper employeeDao;

    @Override
    public void insert(Jxmy_employessinfo record) {
        employeeDao.insert(record);
    }

    @Override
    public List<Jxmy_employessinfo> selectAll() {
        return employeeDao.selectAll();
    }

    @Override
    public void delete(Integer empId) {
        employeeDao.deleteByPrimaryKey(empId);
    }

    @Override
    public Jxmy_employessinfo selectByPrimaryKey(Integer empId) {
        return employeeDao.selectByPrimaryKey(empId);
    }

    @Override
    public void updateByPrimaryKey(Jxmy_employessinfo record) {
        employeeDao.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Jxmy_employessinfo record) {
        return employeeDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<Jxmy_employessinfo> selectFindInfo(String empName, String empGender,Integer empDeptid) {
        return employeeDao.selectFindInfo(empName,empGender,empDeptid);
    }
}
