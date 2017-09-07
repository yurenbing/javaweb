package com.jxmy.dao;

import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.pojo.Jxmy_paymentinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Jxmy_gatheringinfoMapper {
    int deleteByPrimaryKey(Integer gatheringId);

    int insert(Jxmy_gatheringinfo record);

    int insertSelective(Jxmy_gatheringinfo record);

    Jxmy_gatheringinfo selectByPrimaryKey(Integer gatheringId);

    int updateByPrimaryKeySelective(Jxmy_gatheringinfo record);

    int updateByPrimaryKey(Jxmy_gatheringinfo record);

    List<Jxmy_gatheringinfo> selectgatheringAll();

    List<Jxmy_gatheringinfo> selectGatheringInfo(String projetName);
}