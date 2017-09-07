package com.jxmy.service;

import com.jxmy.pojo.Jxmy_employessinfo;

import java.util.List;

public interface IEmployeeService {

    public void insert(Jxmy_employessinfo record);

    public List<Jxmy_employessinfo> selectAll();

    public void delete(Integer empId);

    public Jxmy_employessinfo selectByPrimaryKey(Integer empId);

    public void updateByPrimaryKey(Jxmy_employessinfo record);

    public int updateByPrimaryKeySelective(Jxmy_employessinfo record);

    public List<Jxmy_employessinfo> selectFindInfo(String empName, String empGender,Integer empDeptid);
}
