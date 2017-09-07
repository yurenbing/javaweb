package com.jxmy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jxmy.dao.Jxmy_paymentinfoMapper;
import com.jxmy.pojo.Jxmy_employessinfo;
import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.pojo.Jxmy_paymentinfo;
import com.jxmy.service.IPaymentService;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Controller
public class PaymentController {

    @Resource
    IPaymentService paymentService=null;

    String format="yyyy-MM-dd";

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/selectPaymentAll.do")
    public void selectPaymentAll(HttpServletResponse response){
        System.out.print("j");
        List<Jxmy_paymentinfo> paymentinfoList=new ArrayList<Jxmy_paymentinfo>();
        paymentinfoList=paymentService.selectPaymentAll();
        JSONObject object=new JSONObject();
        object.put("Rows",paymentinfoList);
        object.put("Total",paymentinfoList.size());
        System.out.print("j");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.print("j");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "selectPaymentInfo")
    public void selectPaymentInfo(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("projetName"));
            List<Jxmy_paymentinfo> paymentinfoList=new ArrayList<Jxmy_paymentinfo>();
            System.out.println("hh");
            paymentinfoList=paymentService.selectPaymentInfo(request.getParameter("projetName"));
            JSONObject object=new JSONObject();
            object.put("Rows",paymentinfoList);
            object.put("Total",paymentinfoList.size());
            response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            try {
                PrintWriter out=response.getWriter();
                out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
                System.out.print(object.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "insertPaymentInfo.do")
    public void insertPaymentInfo(HttpServletRequest request){
        String gatherUnit;
        String paymentNote;
        String projetName;
        String projectInfo;
        Float totalMoney;
        Date paymentDate;
        Jxmy_paymentinfo paymentinfo=new Jxmy_paymentinfo();
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
                        if(item.getFieldName().equals("gatherUnit")){
                            System.out.println(item.getString("UTF-8"));
                            gatherUnit=item.getString("UTF-8");
                            paymentinfo.setGatherUnit(gatherUnit);
                        };
                        if(item.getFieldName().equals("paymentNote")){
                            System.out.println(item.getString("UTF-8"));
                            paymentNote=item.getString("UTF-8");
                            paymentinfo.setPaymentNote(paymentNote);
                        };
                        if(item.getFieldName().equals("projetName")){
                            System.out.println(item.getString("UTF-8"));
                            projetName=item.getString("UTF-8");
                            paymentinfo.setProjetName(projetName);
                        };
                        if(item.getFieldName().equals("projectInfo")){
                            System.out.println(item.getString("UTF-8"));
                            projectInfo=item.getString("UTF-8");
                            paymentinfo.setProjectInfo(projectInfo);
                        };
                        if(item.getFieldName().equals("totalMoney")){
                            System.out.println(item.getString("UTF-8"));
                            totalMoney=Float.valueOf(item.getString("UTF-8"));
                            paymentinfo.setTotalMoney(totalMoney);
                        };
                        if(item.getFieldName().equals("paymentDate")){
                            System.out.println(item.getString("UTF-8"));
                            paymentDate=dateFormat.parse(item.getString("UTF-8"));
                            paymentinfo.setPaymentDate(paymentDate);
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
        paymentService.insert(paymentinfo);
    }

    @RequestMapping(value = "showPaymentInfoForm.do")
    public void showPaymentInfoForm(@RequestParam int paymentId, HttpServletResponse response){
        Integer id=new Integer(paymentId);
        Jxmy_paymentinfo paymentinfo=paymentService.selectByPrimaryKey(id);
        JSON.toJSONString(paymentinfo);
//        JSONObject object=new JSONObject(employessinfo);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONString(paymentinfo));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "updatePaymentInfo.do")
    public void updatePaymentInfo(HttpServletRequest request){
        int paymentId;
        String gatherUnit;
        String paymentNote;
        String projetName;
        String projectInfo;
        Float totalMoney;
        Date paymentDate;
        Jxmy_paymentinfo paymentinfo=new Jxmy_paymentinfo();
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
                        if(item.getFieldName().equals("paymentId")){
                            System.out.println(item.getString("UTF-8"));
                            paymentId=Integer.parseInt(item.getString("UTF-8"));
                            paymentinfo.setPaymentId(paymentId);
                        };
                        if(item.getFieldName().equals("gatherUnit")){
                            System.out.println(item.getString("UTF-8"));
                            gatherUnit=item.getString("UTF-8");
                            paymentinfo.setGatherUnit(gatherUnit);
                        };
                        if(item.getFieldName().equals("paymentNote")){
                            System.out.println(item.getString("UTF-8"));
                            paymentNote=item.getString("UTF-8");
                            paymentinfo.setPaymentNote(paymentNote);
                        };
                        if(item.getFieldName().equals("projetName")){
                            System.out.println(item.getString("UTF-8"));
                            projetName=item.getString("UTF-8");
                            paymentinfo.setProjetName(projetName);
                        };
                        if(item.getFieldName().equals("projectInfo")){
                            System.out.println(item.getString("UTF-8"));
                            projectInfo=item.getString("UTF-8");
                            paymentinfo.setProjectInfo(projectInfo);
                        };
                        if(item.getFieldName().equals("totalMoney")){
                            System.out.println(item.getString("UTF-8"));
                            totalMoney=Float.valueOf(item.getString("UTF-8"));
                            paymentinfo.setTotalMoney(totalMoney);
                        };
                        if(item.getFieldName().equals("paymentDate")){
                            System.out.println(item.getString("UTF-8"));
                            paymentDate=dateFormat.parse(item.getString("UTF-8"));
                            paymentinfo.setPaymentDate(paymentDate);
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
        paymentService.updateByPrimaryKey(paymentinfo);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
