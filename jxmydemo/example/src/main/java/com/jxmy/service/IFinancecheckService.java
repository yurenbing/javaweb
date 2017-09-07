package com.jxmy.service;

import com.jxmy.pojo.Jxmy_financecheck;

import java.util.List;

public interface IFinancecheckService {

    public List<Jxmy_financecheck> selectFinancechecked();     //查询所有已经审批的财务

    public List<Jxmy_financecheck> selectFinanceunchecked();     //查询所有没有审批的财务

    public Jxmy_financecheck selectByPrimaryKey(Integer checkId);   //查找财务审核信息

    public int updateByPrimaryKeySelective(Jxmy_financecheck record);

    public int insert(Jxmy_financecheck record);

    public List<Jxmy_financecheck> selectFinanceUnCheckInfo(String projectName);

    public List<Jxmy_financecheck> selectFinanceCheckedInfo(String projectName);

    public List<Jxmy_financecheck> selectMyFinanceAll(String empOwner);

    public List<Jxmy_financecheck> selectMyFinanceAllChecked(String empOwner);

    public List<Jxmy_financecheck> selectMyFinanceAllUnChecked(String empOwner);

}
