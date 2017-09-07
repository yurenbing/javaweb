package com.jxmy.impl;

import com.jxmy.dao.Jxmy_gatheringinfoMapper;
import com.jxmy.pojo.ExcelBean;
import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.pojo.Jxmy_paymentinfo;
import com.jxmy.service.IGatherService;
import com.jxmy.utils.ExcelUtil;
import com.jxmy.utils.PageData;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service("gatherService")
public class GatherServiceImpl implements IGatherService{

    @Autowired
    Jxmy_gatheringinfoMapper gatherDao;

    @Override
    public List<Jxmy_gatheringinfo> selectGatherAll() {
        return gatherDao.selectgatheringAll();
    }

    @Override
    public List<Jxmy_gatheringinfo> selectGatherInfo(String projetName) {
        return gatherDao.selectGatheringInfo(projetName);
    }

    @Override
    public int insert(Jxmy_gatheringinfo record) {
        return gatherDao.insert(record);
    }

    @Override
    public Jxmy_gatheringinfo selectByPrimaryKey(Integer gatheringId) {
        return gatherDao.selectByPrimaryKey(gatheringId);
    }

    @Override
    public int updateByPrimaryKey(Jxmy_gatheringinfo record) {
        return gatherDao.updateByPrimaryKey(record);
    }

    @Override
    public XSSFWorkbook exportGather() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException {
        List<Jxmy_gatheringinfo> list=gatherDao.selectgatheringAll();
        List<ExcelBean> excel=new ArrayList<>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("项目名称","projetName",0));
        excel.add(new ExcelBean("项目名称","projetName",0));
        excel.add(new ExcelBean("项目内容","projectInfo",0));
        excel.add(new ExcelBean("收款单位","payUnit",0));
        excel.add(new ExcelBean("付款金额","totalMoney",0));
        excel.add(new ExcelBean("付款日期","gatherDate",0));
        excel.add(new ExcelBean("备注","gatherNote",0));
        map.put(0, excel);
        String sheetName = "工程款收入明细";
        //调用ExcelUtil的方法
        xssfWorkbook = ExcelUtil.createExcelFile(Jxmy_gatheringinfo.class, list, map, sheetName);
        return xssfWorkbook;
    }

    @Override
    public List<PageData> listM(PageData pd) {
        return null;
    }
}
