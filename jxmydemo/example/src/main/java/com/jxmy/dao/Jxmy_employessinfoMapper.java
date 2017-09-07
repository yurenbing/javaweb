package com.jxmy.dao;

import com.jxmy.pojo.Jxmy_employessinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface Jxmy_employessinfoMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Jxmy_employessinfo record);

    int insertSelective(Jxmy_employessinfo record);

    Jxmy_employessinfo selectByPrimaryKey(Integer empId);

    int updateByPrimaryKeySelective(Jxmy_employessinfo record);

    int updateByPrimaryKeyWithBLOBs(Jxmy_employessinfo record);

    int updateByPrimaryKey(Jxmy_employessinfo record);

    List<Jxmy_employessinfo> selectFindInfo(@Param("empName") String empName,@Param("empGender") String empGender,@Param("empDeptid") Integer empDeptid);

    public List<Jxmy_employessinfo> selectAll();
}