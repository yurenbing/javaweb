package com.jxmy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jxmy.dao.StuInfoDao;
import com.jxmy.pojo.Jxmy_financecheck;
import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.service.IGatherService;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.IntrospectionException;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class GatherController {

    @Resource
    IGatherService gatherService;

    String format="yyyy-MM-dd";

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/selectGatherAll.do")
    public void selectGatherAll(HttpServletRequest request,HttpServletResponse response){
        System.out.print(request.getParameter("pagesize"));
        List<Jxmy_gatheringinfo> gatheringinfoList=new ArrayList<Jxmy_gatheringinfo>();
        gatheringinfoList=gatherService.selectGatherAll();
        JSONObject object=new JSONObject();
        object.put("Rows",gatheringinfoList);
        object.put("Total",gatheringinfoList.size());
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
            System.out.println(object.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/selectGatherInfo")
    public void selectGatherInfo(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("projetName"));
            List<Jxmy_gatheringinfo> gatheringinfoList=new ArrayList<Jxmy_gatheringinfo>();
            System.out.println("hh");
            gatheringinfoList=gatherService.selectGatherInfo(request.getParameter("projetName"));
            JSONObject object=new JSONObject();
            object.put("Rows",gatheringinfoList);
            object.put("Total",gatheringinfoList.size());
            response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            try {
                PrintWriter out=response.getWriter();
                out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "insertGatherInfo.do")
    public void insertGatherInfo(HttpServletRequest request){
        String payUnit;
        String gatherNote;
        String projetName;
        String projectInfo;
        Float totalMoney;
        Date gatherDate;
        Jxmy_gatheringinfo gatheringinfo=new Jxmy_gatheringinfo();
//
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List items = upload.parseRequest(request);
            System.out.println(items.size());
            Iterator itr = items.iterator();
            while (itr.hasNext()){
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()){
                    try {
                        System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));
                        if(item.getFieldName().equals("payUnit")){
                            System.out.println(item.getString("UTF-8"));
                            payUnit=item.getString("UTF-8");
                            gatheringinfo.setPayUnit(payUnit);
                        };
                        if(item.getFieldName().equals("gatherNote")){
                            System.out.println(item.getString("UTF-8"));
                            gatherNote=item.getString("UTF-8");
                            gatheringinfo.setGatherNote(gatherNote);
                        };
                        if(item.getFieldName().equals("projetName")){
                            System.out.println(item.getString("UTF-8"));
                            projetName=item.getString("UTF-8");
                            gatheringinfo.setProjetName(projetName);
                        };
                        if(item.getFieldName().equals("projectInfo")){
                            System.out.println(item.getString("UTF-8"));
                            projectInfo=item.getString("UTF-8");
                            gatheringinfo.setProjectInfo(projectInfo);
                        };
                        if(item.getFieldName().equals("totalMoney")){
                            System.out.println(item.getString("UTF-8"));
                            totalMoney=Float.valueOf(item.getString("UTF-8"));
                            gatheringinfo.setTotalMoney(totalMoney);
                        };
                        if(item.getFieldName().equals("gatherDate")){
                            System.out.println(item.getString("UTF-8"));
                            gatherDate=dateFormat.parse(item.getString("UTF-8"));
                            gatheringinfo.setGatherDate(gatherDate);
                        };
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        gatherService.insert(gatheringinfo);
    }

    @RequestMapping(value = "showGatherInfoForm.do")
    public void showGatherInfoForm(@RequestParam int gatheringId, HttpServletResponse response){
        Integer id=new Integer(gatheringId);
        Jxmy_gatheringinfo gatheringinfo=gatherService.selectByPrimaryKey(id);
        JSON.toJSONString(gatheringinfo);
//        JSONObject object=new JSONObject(employessinfo);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONString(gatheringinfo));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "updateGatherInfo.do")
    public void updateGatherInfo(HttpServletRequest request){
        int gatheringId;
        String payUnit;
        String gatherNote;
        String projetName;
        String projectInfo;
        Float totalMoney;
        Date gatherDate;
        Jxmy_gatheringinfo gatheringinfo=new Jxmy_gatheringinfo();
//
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List items = upload.parseRequest(request);
            System.out.println(items.size());
            Iterator itr = items.iterator();
            while (itr.hasNext()){
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()){
                    try {
                        System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));
                        if(item.getFieldName().equals("gatheringId")){
                            System.out.println(item.getString("UTF-8"));
                            gatheringId=Integer.parseInt(item.getString("UTF-8"));
                            gatheringinfo.setGatheringId(gatheringId);
                        };
                        if(item.getFieldName().equals("payUnit")){
                            System.out.println(item.getString("UTF-8"));
                            payUnit=item.getString("UTF-8");
                            gatheringinfo.setPayUnit(payUnit);
                        };
                        if(item.getFieldName().equals("gatherNote")){
                            System.out.println(item.getString("UTF-8"));
                            gatherNote=item.getString("UTF-8");
                            gatheringinfo.setGatherNote(gatherNote);
                        };
                        if(item.getFieldName().equals("projetName")){
                            System.out.println(item.getString("UTF-8"));
                            projetName=item.getString("UTF-8");
                            gatheringinfo.setProjetName(projetName);
                        };
                        if(item.getFieldName().equals("projectInfo")){
                            System.out.println(item.getString("UTF-8"));
                            projectInfo=item.getString("UTF-8");
                            gatheringinfo.setProjectInfo(projectInfo);
                        };
                        if(item.getFieldName().equals("totalMoney")){
                            System.out.println(item.getString("UTF-8"));
                            totalMoney=Float.valueOf(item.getString("UTF-8"));
                            gatheringinfo.setTotalMoney(totalMoney);
                        };
                        if(item.getFieldName().equals("gatherDate")){
                            System.out.println(item.getString("UTF-8"));
                            gatherDate=dateFormat.parse(item.getString("UTF-8"));
                            gatheringinfo.setGatherDate(gatherDate);
                        };
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        gatherService.updateByPrimaryKey(gatheringinfo);
    }

    /**
     * 导出Excel
     * @param request
     * @param response
     */
//    @RequestMapping(value = "exportGather.do")
//    public void export(HttpServletRequest request, HttpServletResponse response, ModelAndView model) throws ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException {
//        System.out.println("excel");
//        String salaryDate = request.getParameter("salaryDate");
//            response.reset(); //清除buffer缓存
//            Map<String, Object> map = new HashMap<String, Object>();
//            // 指定下载的文件名
//            response.setHeader("Content-Disposition", "attachment;filename=" + salaryDate + ".xlsx");
//            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Cache-Control", "no-cache");
//            response.setDateHeader("Expires", 0);
//            XSSFWorkbook workbook = null;
//            //导出Excel对象
//            workbook = gatherService.exportGather();
//            OutputStream output;
//            try {
//                output = response.getOutputStream();
//                BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
//                bufferedOutPut.flush();
//                workbook.write(bufferedOutPut);
//                bufferedOutPut.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//    }

    @RequestMapping(value = "exportGather.do")
    public void export(HttpServletRequest request, HttpServletResponse response, ModelAndView model) throws ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException, IOException {
//        out.clear();
//        out = pageContext.pushBody();
        response.setHeader("Content-Disposition","attachment;filename=gatherInfo.xls");
        response.setContentType("application/x-download; charset=utf-8");
//    java.util.List<String[]> list = new StuInfoDao().findByAll();
//    IGatherService gatherService;
        System.out.println("kk");
        List<Jxmy_gatheringinfo> list = gatherService.selectGatherAll();
        HSSFWorkbook workBook = new HSSFWorkbook();		//创建 一个excel文档对象
        HSSFSheet sheet = workBook.createSheet();			//创建一个工作薄对象
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        //设置样式
        HSSFCellStyle titleStyle = workBook.createCellStyle();	//创建样式对象
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);	//水平居中
        titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);	//垂直居中
        // 设置字体
        HSSFFont titleFont = workBook.createFont();			//创建字体对象
        titleFont.setFontHeightInPoints((short) 15);			//设置字体大小
        titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);	//设置粗体
        titleFont.setFontName("黑体");	//设置为黑体字
        titleStyle.setFont(titleFont);
        // 合并单元格操作
        sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 5));
        HSSFRow row = null;
        HSSFCell cell = null;
        row = sheet.createRow(0);
        cell = row.createCell(0);
        cell.setCellStyle(titleStyle);
        cell.setCellValue(new HSSFRichTextString("工程款入账明细表"));
        System.out.println("test7");
        // 设置表文样式
        HSSFCellStyle tableStyle = workBook.createCellStyle();
        tableStyle.setBorderBottom((short)1);
        tableStyle.setBorderTop((short)1);
        tableStyle.setBorderLeft((short)1);
        tableStyle.setBorderRight((short)1);
        tableStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        System.out.println("test8");
        // 设置表文字体
        HSSFFont tableFont = workBook.createFont();
        tableFont.setFontHeightInPoints((short) 12); 		//设置字体大小
        tableFont.setFontName("宋体"); 				//设置为黑体字
        tableStyle.setFont(tableFont);
        String[] title = {"项目名称","项目内容","收款单位","付款金额","付款日期","备注"};
        row = sheet.createRow(2);
        for (int i = 0; i < title.length; i++) {
            cell = row.createCell(i);
            cell.setCellStyle(tableStyle);
            cell.setCellValue(new HSSFRichTextString(title[i]));
        }
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i+3);
//        String[] stuInfo = list.get(i);
            String[] stuInfo =
                    {list.get(i).getProjetName(),list.get(i).getProjectInfo(),list.get(i).getPayUnit(),
                            String.valueOf(list.get(i).getTotalMoney()),dateFormat.format(list.get(i).getGatherDate()),list.get(i).getGatherNote()};
            for (int j = 0; j < stuInfo.length; j++) {
                cell = row.createCell(j);
                cell.setCellStyle(tableStyle);
                cell.setCellValue(new HSSFRichTextString(stuInfo[j]));
            }
        }
        OutputStream out;
        out=response.getOutputStream();
        BufferedOutputStream bufferedOutputStream=new BufferedOutputStream(out);
        bufferedOutputStream.flush();
        // 文件输出流
        workBook.write(bufferedOutputStream); 		//将文档对象写入文件输出流
        bufferedOutputStream.close();
        System.out.println("over");
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
