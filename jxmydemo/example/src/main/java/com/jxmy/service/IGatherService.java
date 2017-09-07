package com.jxmy.service;

import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.pojo.Jxmy_paymentinfo;
import com.jxmy.utils.PageData;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;

public interface IGatherService {
    public List<Jxmy_gatheringinfo> selectGatherAll();

    public List<Jxmy_gatheringinfo> selectGatherInfo(String projetName);

    public int insert(Jxmy_gatheringinfo record);

    public Jxmy_gatheringinfo selectByPrimaryKey(Integer gatheringId);

    public int updateByPrimaryKey(Jxmy_gatheringinfo record);

    public XSSFWorkbook exportGather() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException;

    public List<PageData> listM(PageData pd);
}
