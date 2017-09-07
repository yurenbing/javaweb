package com.jxmy.dao;

import com.jxmy.pojo.Jxmy_financecheck;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Jxmy_financecheckMapper {
    int deleteByPrimaryKey(Integer checkId);

    int insert(Jxmy_financecheck record);

    int insertSelective(Jxmy_financecheck record);

    Jxmy_financecheck selectByPrimaryKey(Integer checkId);

    int updateByPrimaryKeySelective(Jxmy_financecheck record);

    int updateByPrimaryKey(Jxmy_financecheck record);

    List<Jxmy_financecheck> selectFinancechecked();     //查询所有已经审批的财务

    List<Jxmy_financecheck> selectFinanceunchecked();     //查询所有没有审批的财务

    List<Jxmy_financecheck> selectFinanceUnCheckInfo(String projectName);

    List<Jxmy_financecheck> selectFinanceCheckedInfo(String projectName);

    List<Jxmy_financecheck> selectMyFinanceAll(String empOwner);

    List<Jxmy_financecheck> selectMyFinanceAllChecked(String empOwner);

    List<Jxmy_financecheck> selectMyFinanceAllUnChecked(String empOwner);

}