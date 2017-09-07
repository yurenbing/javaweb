package com.jxmy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jxmy.pojo.Jxmy_employessinfo;
import com.jxmy.pojo.Jxmy_financecheck;
import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.service.IFinancecheckService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class FinancecheckController {

    @Resource
    IFinancecheckService financecheckService;

    String format="yyyy-MM-dd";

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/insertFinance.do",method = RequestMethod.POST)
    public void insertFinance(HttpServletRequest request){
        String empOwner;
        String empDep;
        String projetName;
        String projectInfo;
        Double projectMoney;
        Date projectDate;
        Jxmy_financecheck financecheck=new Jxmy_financecheck();
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
                        if(item.getFieldName().equals("empOwner")){
                            System.out.println(item.getString("UTF-8"));
                            empOwner=item.getString("UTF-8");
                            financecheck.setEmpOwner(empOwner);
                        };
                        if(item.getFieldName().equals("empDep")){
                            System.out.println(item.getString("UTF-8"));
                            empDep=item.getString("UTF-8");
                            financecheck.setEmpDep(empDep);
                        };
                        if(item.getFieldName().equals("projetName")){
                            System.out.println(item.getString("UTF-8"));
                            projetName=item.getString("UTF-8");
                            financecheck.setProjetName(projetName);
                        };
                        if(item.getFieldName().equals("projectInfo")){
                            System.out.println(item.getString("UTF-8"));
                            projectInfo=item.getString("UTF-8");
                            financecheck.setProjectInfo(projectInfo);
                        };
                        if(item.getFieldName().equals("projectMoney")){
                            System.out.println(item.getString("UTF-8"));
                            projectMoney=Double.valueOf(item.getString("UTF-8"));
                            financecheck.setProjectMoney(projectMoney);
                        };
                        if(item.getFieldName().equals("projectDate")){
                            System.out.println(item.getString("UTF-8"));
                            projectDate=dateFormat.parse(item.getString("UTF-8"));
                            financecheck.setProjectDate(projectDate);
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
        System.out.println(financecheck.getEmpOwner());
        financecheckService.insert(financecheck);
    }

    @RequestMapping(value = "/updateFinancecheck.do",method = RequestMethod.POST)
    public void updateFinancecheck(HttpServletRequest request){
        int checkId;
        String empOwner;
        String empDep;
        String projetName;
        String projectInfo;
        Double projectMoney;
        Date projectDate;
        String empCheck;
        Date checkDate;
        String checkInfo;
        String financeNote;
        Jxmy_financecheck financecheck=new Jxmy_financecheck();

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
                        if(item.getFieldName().equals("checkId")){
                            System.out.println(item.getString("UTF-8"));
                            checkId=Integer.parseInt(item.getString("UTF-8"));
                            financecheck.setCheckId(checkId);
                        };
                        if(item.getFieldName().equals("empOwner")){
                            System.out.println(item.getString("UTF-8"));
                            empOwner=item.getString("UTF-8");
                            financecheck.setEmpOwner(empOwner);
                        };
                        if(item.getFieldName().equals("empDep")){
                            System.out.println(item.getString("UTF-8"));
                            empDep=item.getString("UTF-8");
                            financecheck.setEmpDep(empDep);
                        };
                        if(item.getFieldName().equals("projetName")){
                            System.out.println(item.getString("UTF-8"));
                            projetName=item.getString("UTF-8");
                            financecheck.setProjetName(projetName);
                        };
                        if(item.getFieldName().equals("projectInfo")){
                            System.out.println(item.getString("UTF-8"));
                            projectInfo=item.getString("UTF-8");
                            financecheck.setProjectInfo(projectInfo);
                        };
                        if(item.getFieldName().equals("projectMoney")){
                            System.out.println(item.getString("UTF-8"));
                            projectMoney=Double.valueOf(item.getString("UTF-8"));
                            financecheck.setProjectMoney(projectMoney);
                        };
                        if(item.getFieldName().equals("projectDate")){
                            System.out.println(item.getString("UTF-8"));
                            projectDate=dateFormat.parse(item.getString("UTF-8"));
                            financecheck.setProjectDate(projectDate);
                        };
                        if(item.getFieldName().equals("empCheck")){
                            System.out.println(item.getString("UTF-8"));
                            empCheck=item.getString("UTF-8");
                            financecheck.setEmpCheck(empCheck);
                        };
                        if(item.getFieldName().equals("checkDate")){
                            System.out.println(item.getString("UTF-8"));
                            checkDate=dateFormat.parse(item.getString("UTF-8"));
                            financecheck.setCheckDate(checkDate);
                        };
                        if(item.getFieldName().equals("checkInfo")){
                            System.out.println(item.getString("UTF-8"));
                            checkInfo=item.getString("UTF-8");
                            financecheck.setCheckInfo(checkInfo);
                        };
                        if(item.getFieldName().equals("financeNote")){
                            System.out.println(item.getString("UTF-8"));
                            financeNote=item.getString("UTF-8");
                            financecheck.setFinanceNote(financeNote);
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
        System.out.println(financecheck.getCheckInfo());
        System.out.println(financecheck.getEmpOwner());
        int i=financecheckService.updateByPrimaryKeySelective(financecheck);
        System.out.print(i);
    }

    @RequestMapping(value = "selectFinancechecked.do")
    public void selectFinancechecked(HttpServletResponse response){
        List<Jxmy_financecheck> financecheckList=new ArrayList<Jxmy_financecheck>();
        financecheckList=financecheckService.selectFinancechecked();
        JSONObject object=new JSONObject();
        object.put("Rows",financecheckList);
        object.put("Total",financecheckList.size());
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "selectFinanceunchecked.do")
    public void selectFinanceunchecked(HttpServletResponse response){
        List<Jxmy_financecheck> financecheckList=new ArrayList<Jxmy_financecheck>();
        financecheckList=financecheckService.selectFinanceunchecked();
        JSONObject object=new JSONObject();
        object.put("Rows",financecheckList);
        object.put("Total",financecheckList.size());
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "selectFinanceUnCheckInfo.do")
    public void selectFinanceUnCheckInfo(HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("projetName"));
            List<Jxmy_financecheck> financecheckList=new ArrayList<Jxmy_financecheck>();
            financecheckList=financecheckService.selectFinanceUnCheckInfo(request.getParameter("projetName"));
            JSONObject object=new JSONObject();
            object.put("Rows",financecheckList);
            object.put("Total",financecheckList.size());
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


    @RequestMapping(value = "selectFinanceCheckedInfo.do")
    public void selectFinanceCheckedInfo(HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("projetName"));
            List<Jxmy_financecheck> financecheckList=new ArrayList<Jxmy_financecheck>();
            System.out.println("hh");
            financecheckList=financecheckService.selectFinanceCheckedInfo(request.getParameter("projetName"));
            JSONObject object=new JSONObject();
            object.put("Rows",financecheckList);
            object.put("Total",financecheckList.size());
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

    @RequestMapping(value = "selectFinancecheckByPrimaryKey.do")
    public void selectFinancecheckByPrimaryKey(@RequestParam int checkId, HttpServletResponse response){
        Integer id=new Integer(checkId);
        System.out.println(id);
        Jxmy_financecheck financecheck=financecheckService.selectByPrimaryKey(id);
//        JSONObject object=new JSONObject(financecheck);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONString(financecheck));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "selectMyFinanceAll.do")
    public void selectMyFinanceAll(HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
//            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAll(request.getParameter("empOwner"));
//            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAll("测试");
            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAll(String.valueOf(request.getSession().getAttribute("login_name")));
            JSONObject object=new JSONObject();
            object.put("Rows",financecheckList);
            object.put("Total",financecheckList.size());
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

    @RequestMapping(value = "selectMyFinanceAllChecked.do")
    public void selectMyFinanceAllChecked(HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
//            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAllChecked(request.getParameter("empOwner"));
            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAllChecked(String.valueOf(request.getSession().getAttribute("login_name")));
            JSONObject object=new JSONObject();
            object.put("Rows",financecheckList);
            object.put("Total",financecheckList.size());
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

    @RequestMapping(value = "selectMyFinanceAllUnChecked.do")
    public void selectMyFinanceAllUnChecked(HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
//            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAllUnChecked(request.getParameter("empOwner"));
            List<Jxmy_financecheck> financecheckList=financecheckService.selectMyFinanceAllUnChecked(String.valueOf(request.getSession().getAttribute("login_name")));
            JSONObject object=new JSONObject();
            object.put("Rows",financecheckList);
            object.put("Total",financecheckList.size());
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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
