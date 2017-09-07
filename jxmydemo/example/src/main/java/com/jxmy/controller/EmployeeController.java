package com.jxmy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jxmy.pojo.Jxmy_employessinfo;
import com.jxmy.service.IEmployeeService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
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
public class EmployeeController {
    @Resource
    IEmployeeService employeeService;

    private String IP="http://192.168.0.104:8089/upload/";
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/insertEmployee.do",method = RequestMethod.POST)
    public void insertEmp(HttpServletRequest request) throws Exception {

//        String empName=request.getParameter("empName");
//        String empGender;
//        String empNative;
//        String empNumber;
//        String empIdnumber;
//        Integer empDeptid;
//        String empNation;
//        Date empBirth;
//        String empPoliticalstatus;
//        Date empPartytime;
//        Date empLeaguetime;
//        String empHiredate;
//        String empHukoutype;
//        String empHukoulocation;
//        String empTpye;
//        Integer empTitle;
//        String empPosition;
//        String empMobilephone;
//        String empPhone;
//        String empQq;
//        String empHomeaddr;
//        String empAddr;
//        String empEducationallevel;
//        String empDegree;
//        Date empGraduationtime;
//        String empGraduationschool;
//        String empMaster;
//        String empComputerlevel;
//        String empLanguage1;
//        String empLanguage2;
//        String empLanguage3;
//        String empSpecialties;
//        String empStatus;
//        String empSocialsecurity;
//        String empSecuritynumber;
//        Double empSalary;
//        Jxmy_employessinfo employessinfo=new Jxmy_employessinfo();
////
//        String imgPath;
//        String path=request.getSession().getServletContext().getRealPath("/");
//        System.out.println(path);
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        try {
//            List items = upload.parseRequest(request);
//            System.out.println(items.size());
//            Iterator itr = items.iterator();
//            while (itr.hasNext()){
//                FileItem item = (FileItem) itr.next();
//                if (item.isFormField()){
//                    try {
//                        System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));
//                        if(item.getFieldName().equals("empName")){
//                            System.out.println(item.getString("UTF-8"));
//                            empName=item.getString("UTF-8");
//                            employessinfo.setEmpName(empName);
//                        };
//                        if(item.getFieldName().equals("empGender")){
//                            System.out.println(item.getString("UTF-8"));
//                            empGender=item.getString("UTF-8");
//                            employessinfo.setEmpGender(empGender);
//                        };
//                        if(item.getFieldName().equals("empNative")){
//                            System.out.println(item.getString("UTF-8"));
//                            empNative=item.getString("UTF-8");
//                            employessinfo.setEmpNative(empNative);
//                        };
//                        if(item.getFieldName().equals("empIdnumber")){
//                            System.out.println(item.getString("UTF-8"));
//                            empIdnumber=item.getString("UTF-8");
//                            employessinfo.setEmpIdnumber(empIdnumber);
//                        };
//                        if(item.getFieldName().equals("empNumber")){
//                            System.out.println(item.getString("UTF-8"));
//                            empNumber=item.getString("UTF-8");
//                            employessinfo.setEmpNumber(empNumber);
//                        };
//                        if(item.getFieldName().equals("empDeptid")){
//                            System.out.println(item.getString("UTF-8"));
//                            empDeptid=Integer.parseInt(item.getString("UTF-8"));
//                            employessinfo.setEmpDeptid(empDeptid);
//                        };
//                        if(item.getFieldName().equals("empNation")){
//                            System.out.println(item.getString("UTF-8"));
//                            empNation=item.getString("UTF-8");
//                            employessinfo.setEmpNation(empNation);
//                        };
//                        if(item.getFieldName().equals("empBirth")){
//                            System.out.println(item.getString("UTF-8"));
//                            empBirth=dateFormat.parse(item.getString("UTF-8"));
//                            employessinfo.setEmpBirth(empBirth);
//                        };
//                        if(item.getFieldName().equals("empPoliticalstatus")){
//                            System.out.println(item.getString("UTF-8"));
//                            empPoliticalstatus=item.getString("UTF-8");
//                            employessinfo.setEmpPoliticalstatus(empPoliticalstatus);
//                        };
//                        if(item.getFieldName().equals("empPartytime")){
//                            System.out.println(item.getString("UTF-8"));
//                            empPartytime=dateFormat.parse(item.getString("UTF-8"));
//                            employessinfo.setEmpPartytime(empPartytime);
//                        };
//                        if(item.getFieldName().equals("empLeaguetime")){
//                            System.out.println(item.getString("UTF-8"));
//                            empLeaguetime=dateFormat.parse(item.getString("UTF-8"));
//                            employessinfo.setEmpLeaguetime(empLeaguetime);
//                        };
//                        if(item.getFieldName().equals("empHiredate")){
//                            System.out.println(item.getString("UTF-8"));
//                            empHiredate=item.getString("UTF-8");
//                            employessinfo.setEmpHiredate(empHiredate);
//                        };
//                        if(item.getFieldName().equals("empHukoutype")){
//                            System.out.println(item.getString("UTF-8"));
//                            empHukoutype=item.getString("UTF-8");
//                            employessinfo.setEmpHukoutype(empHukoutype);
//                        };
//                        if(item.getFieldName().equals("empHukoulocation")){
//                            System.out.println(item.getString("UTF-8"));
//                            empHukoulocation=item.getString("UTF-8");
//                            employessinfo.setEmpHukoulocation(empHukoulocation);
//                        };
//                        if(item.getFieldName().equals("empTpye")){
//                            System.out.println(item.getString("UTF-8"));
//                            empTpye=item.getString("UTF-8");
//                            employessinfo.setEmpTpye(empTpye);
//                        };
//                        if(item.getFieldName().equals("empTitle")){
//                            System.out.println(item.getString("UTF-8"));
//                            empTitle=Integer.parseInt(item.getString("UTF-8"));
//                            employessinfo.setEmpTitle(empTitle);
//                        };
//                        if(item.getFieldName().equals("empPosition")){
//                            System.out.println(item.getString("UTF-8"));
//                            empPosition=item.getString("UTF-8");
//                            employessinfo.setEmpPosition(empPosition);
//                        };
//                        if(item.getFieldName().equals("empMobilephone")){
//                            System.out.println(item.getString("UTF-8"));
//                            empMobilephone=item.getString("UTF-8");
//                            employessinfo.setEmpMobilephone(empMobilephone);
//                        };
//                        if(item.getFieldName().equals("empPhone")){
//                            System.out.println(item.getString("UTF-8"));
//                            empPhone=item.getString("UTF-8");
//                            employessinfo.setEmpPhone(empPhone);
//                        };
//                        if(item.getFieldName().equals("empQq")){
//                            System.out.println(item.getString("UTF-8"));
//                            empQq=item.getString("UTF-8");
//                            employessinfo.setEmpQq(empQq);
//                        };
//                        if(item.getFieldName().equals("empHomeaddr")){
//                            System.out.println(item.getString("UTF-8"));
//                            empHomeaddr=item.getString("UTF-8");
//                            employessinfo.setEmpHomeaddr(empHomeaddr);
//                        };
//                        if(item.getFieldName().equals("empAddr")){
//                            System.out.println(item.getString("UTF-8"));
//                            empAddr=item.getString("UTF-8");
//                            employessinfo.setEmpAddr(empAddr);
//                        };
//                        if(item.getFieldName().equals("empEducationallevel")){
//                            System.out.println(item.getString("UTF-8"));
//                            empEducationallevel=item.getString("UTF-8");
//                            employessinfo.setEmpEducationallevel(empEducationallevel);
//                        };
//                        if(item.getFieldName().equals("empDegree")){
//                            System.out.println(item.getString("UTF-8"));
//                            empDegree=item.getString("UTF-8");
//                            employessinfo.setEmpDegree(empDegree);
//                        };
//                        if(item.getFieldName().equals("empGraduationtime")){
//                            System.out.println(item.getString("UTF-8"));
//                            empGraduationtime=dateFormat.parse(item.getString("UTF-8"));
//                            employessinfo.setEmpGraduationtime(empGraduationtime);
//                        };
//                        if(item.getFieldName().equals("empGraduationschool")){
//                            System.out.println(item.getString("UTF-8"));
//                            empGraduationschool=item.getString("UTF-8");
//                            employessinfo.setEmpGraduationschool(empGraduationschool);
//                        };
//                        if(item.getFieldName().equals("empMaster")){
//                            System.out.println(item.getString("UTF-8"));
//                            empMaster=item.getString("UTF-8");
//                            employessinfo.setEmpMaster(empMaster);
//                        };
//                        if(item.getFieldName().equals("empComputerlevel")){
//                            System.out.println(item.getString("UTF-8"));
//                            empComputerlevel=item.getString("UTF-8");
//                            employessinfo.setEmpComputerlevel(empComputerlevel);
//                        };
//                        if(item.getFieldName().equals("empLanguage1")){
//                            System.out.println(item.getString("UTF-8"));
//                            empLanguage1=item.getString("UTF-8");
//                            employessinfo.setEmpLanguage1(empLanguage1);
//                        };
//                        if(item.getFieldName().equals("empLanguage2")){
//                            System.out.println(item.getString("UTF-8"));
//                            empLanguage2=item.getString("UTF-8");
//                            employessinfo.setEmpLanguage2(empLanguage2);
//                        };
//                        if(item.getFieldName().equals("empLanguage3")){
//                            System.out.println(item.getString("UTF-8"));
//                            empLanguage3=item.getString("UTF-8");
//                            employessinfo.setEmpLanguage3(empLanguage3);
//                        };
//                        if(item.getFieldName().equals("empSpecialties")){
//                            System.out.println(item.getString("UTF-8"));
//                            empSpecialties=item.getString("UTF-8");
//                            employessinfo.setEmpSpecialties(empSpecialties);
//                        };
//                        if(item.getFieldName().equals("empStatus")){
//                            System.out.println(item.getString("UTF-8"));
//                            empStatus=item.getString("UTF-8");
//                            employessinfo.setEmpStatus(empStatus);
//                        };
//                        if(item.getFieldName().equals("empSocialsecurity")){
//                            System.out.println(item.getString("UTF-8"));
//                            empSocialsecurity=item.getString("UTF-8");
//                            employessinfo.setEmpSocialsecurity(empSocialsecurity);
//                        };
//                        if(item.getFieldName().equals("empSecuritynumber")){
//                            System.out.println(item.getString("UTF-8"));
//                            empSecuritynumber=item.getString("UTF-8");
//                            employessinfo.setEmpSecuritynumber(empSecuritynumber);
//                        };
//                        if(item.getFieldName().equals("empSalary")){
//                            System.out.println(item.getString("UTF-8"));
//                            empSalary=Double.valueOf(item.getString("UTF-8"));
//                            employessinfo.setEmpSalary(empSalary);
//                        };
//                    } catch (UnsupportedEncodingException e) {
//                        e.printStackTrace();
//                    }
//                }else{
//                        System.out.println("上传文件的大小:" + item.getSize());
//                        System.out.println("上传文件的类型:" + item.getContentType());
//                        // item.getName()返回上传文件在客户端的完整路径名称
//                        System.out.println("上传文件的名称:" + item.getName());
//                        File tempFile = new File(Math.random()*100+item.getName());
//                        // 上传文件的保存路径
//                        File file1 = new File("E:/javaweb/jxmydemo/example/src/main/webapp/upload/", tempFile.getName());
//                        File file2 = new File("C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/ROOT/upload", tempFile.getName());
//                        item.write(file1);
//                        item.write(file2);
//                        System.out.println(file1.getPath());
//                        imgPath=IP+tempFile.getName();
//                        employessinfo.setEmpPhotourl(IP+tempFile.getName());
//                    }
//                }
//        } catch (FileUploadException e) {
//            e.printStackTrace();
//        }
//        employeeService.insert(employessinfo);
    }

    @RequestMapping(value = "/updateEmployee.do",method = RequestMethod.POST)
    public void updateEmployee(HttpServletRequest request) throws ParseException {
        String empName=request.getParameter("empName");
        int empId;
        String empGender;
        String empNative;
        String empNumber;
        String empIdnumber;
        Integer empDeptid;
        String empNation;
        Date empBirth;
        String empPoliticalstatus;
        Date empPartytime;
        Date empLeaguetime;
        String empHiredate;
        String empHukoutype;
        String empHukoulocation;
        String empTpye;
        Integer empTitle;
        String empPosition;
        String empMobilephone;
        String empPhone;
        String empQq;
        String empHomeaddr;
        String empAddr;
        String empEducationallevel;
        String empDegree;
        Date empGraduationtime;
        String empGraduationschool;
        String empMaster;
        String empComputerlevel;
        String empLanguage1;
        String empLanguage2;
        String empLanguage3;
        String empSpecialties;
        String empStatus;
        String empSocialsecurity;
        String empSecuritynumber;
        Double empSalary;
        Jxmy_employessinfo employessinfo=new Jxmy_employessinfo();
//
        String imgPath;
        String path=request.getSession().getServletContext().getRealPath("/");
        System.out.println(path);
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
                        if(item.getFieldName().equals("empId")){
                            System.out.println(item.getString("UTF-8"));
                            empId=Integer.parseInt(item.getString("UTF-8"));
                            employessinfo.setEmpId(empId);
                        };
                        if(item.getFieldName().equals("empName")){
                            System.out.println(item.getString("UTF-8"));
                            empName=item.getString("UTF-8");
                            employessinfo.setEmpName(empName);
                        };
                        if(item.getFieldName().equals("empGender")){
                            System.out.println(item.getString("UTF-8"));
                            empGender=item.getString("UTF-8");
                            employessinfo.setEmpGender(empGender);
                        };
                        if(item.getFieldName().equals("empNative")){
                            System.out.println(item.getString("UTF-8"));
                            empNative=item.getString("UTF-8");
                            employessinfo.setEmpNative(empNative);
                        };
                        if(item.getFieldName().equals("empIdnumber")){
                            System.out.println(item.getString("UTF-8"));
                            empIdnumber=item.getString("UTF-8");
                            employessinfo.setEmpIdnumber(empIdnumber);
                        };
                        if(item.getFieldName().equals("empNumber")){
                            System.out.println(item.getString("UTF-8"));
                            empNumber=item.getString("UTF-8");
                            employessinfo.setEmpNumber(empNumber);
                        };
                        if(item.getFieldName().equals("empDeptid")){
                            System.out.println(item.getString("UTF-8"));
                            empDeptid=Integer.parseInt(item.getString("UTF-8"));
                            employessinfo.setEmpDeptid(empDeptid);
                        };
                        if(item.getFieldName().equals("empNation")){
                            System.out.println(item.getString("UTF-8"));
                            empNation=item.getString("UTF-8");
                            employessinfo.setEmpNation(empNation);
                        };
                        if(item.getFieldName().equals("empBirth")){
                            System.out.println(item.getString("UTF-8"));
                            empBirth=dateFormat.parse(item.getString("UTF-8"));
                            employessinfo.setEmpBirth(empBirth);
                        };
                        if(item.getFieldName().equals("empPoliticalstatus")){
                            System.out.println(item.getString("UTF-8"));
                            empPoliticalstatus=item.getString("UTF-8");
                            employessinfo.setEmpPoliticalstatus(empPoliticalstatus);
                        };
                        if(item.getFieldName().equals("empPartytime")){
                            System.out.println(item.getString("UTF-8"));
                            empPartytime=dateFormat.parse(item.getString("UTF-8"));
                            employessinfo.setEmpPartytime(empPartytime);
                        };
                        if(item.getFieldName().equals("empLeaguetime")){
                            System.out.println(item.getString("UTF-8"));
                            empLeaguetime=dateFormat.parse(item.getString("UTF-8"));
                            employessinfo.setEmpLeaguetime(empLeaguetime);
                        };
                        if(item.getFieldName().equals("empHiredate")){
                            System.out.println(item.getString("UTF-8"));
                            empHiredate=item.getString("UTF-8");
                            employessinfo.setEmpHiredate(empHiredate);
                        };
                        if(item.getFieldName().equals("empHukoutype")){
                            System.out.println(item.getString("UTF-8"));
                            empHukoutype=item.getString("UTF-8");
                            employessinfo.setEmpHukoutype(empHukoutype);
                        };
                        if(item.getFieldName().equals("empHukoulocation")){
                            System.out.println(item.getString("UTF-8"));
                            empHukoulocation=item.getString("UTF-8");
                            employessinfo.setEmpHukoulocation(empHukoulocation);
                        };
                        if(item.getFieldName().equals("empTpye")){
                            System.out.println(item.getString("UTF-8"));
                            empTpye=item.getString("UTF-8");
                            employessinfo.setEmpTpye(empTpye);
                        };
                        if(item.getFieldName().equals("empTitle")){
                            System.out.println(item.getString("UTF-8"));
                            empTitle=Integer.parseInt(item.getString("UTF-8"));
                            employessinfo.setEmpTitle(empTitle);
                        };
                        if(item.getFieldName().equals("empPosition")){
                            System.out.println(item.getString("UTF-8"));
                            empPosition=item.getString("UTF-8");
                            employessinfo.setEmpPosition(empPosition);
                        };
                        if(item.getFieldName().equals("empMobilephone")){
                            System.out.println(item.getString("UTF-8"));
                            empMobilephone=item.getString("UTF-8");
                            employessinfo.setEmpMobilephone(empMobilephone);
                        };
                        if(item.getFieldName().equals("empPhone")){
                            System.out.println(item.getString("UTF-8"));
                            empPhone=item.getString("UTF-8");
                            employessinfo.setEmpPhone(empPhone);
                        };
                        if(item.getFieldName().equals("empQq")){
                            System.out.println(item.getString("UTF-8"));
                            empQq=item.getString("UTF-8");
                            employessinfo.setEmpQq(empQq);
                        };
                        if(item.getFieldName().equals("empHomeaddr")){
                            System.out.println(item.getString("UTF-8"));
                            empHomeaddr=item.getString("UTF-8");
                            employessinfo.setEmpHomeaddr(empHomeaddr);
                        };
                        if(item.getFieldName().equals("empAddr")){
                            System.out.println(item.getString("UTF-8"));
                            empAddr=item.getString("UTF-8");
                            employessinfo.setEmpAddr(empAddr);
                        };
                        if(item.getFieldName().equals("empEducationallevel")){
                            System.out.println(item.getString("UTF-8"));
                            empEducationallevel=item.getString("UTF-8");
                            employessinfo.setEmpEducationallevel(empEducationallevel);
                        };
                        if(item.getFieldName().equals("empDegree")){
                            System.out.println(item.getString("UTF-8"));
                            empDegree=item.getString("UTF-8");
                            employessinfo.setEmpDegree(empDegree);
                        };
                        if(item.getFieldName().equals("empGraduationtime")){
                            System.out.println(item.getString("UTF-8"));
                            empGraduationtime=dateFormat.parse(item.getString("UTF-8"));
                            employessinfo.setEmpGraduationtime(empGraduationtime);
                        };
                        if(item.getFieldName().equals("empGraduationschool")){
                            System.out.println(item.getString("UTF-8"));
                            empGraduationschool=item.getString("UTF-8");
                            employessinfo.setEmpGraduationschool(empGraduationschool);
                        };
                        if(item.getFieldName().equals("empMaster")){
                            System.out.println(item.getString("UTF-8"));
                            empMaster=item.getString("UTF-8");
                            employessinfo.setEmpMaster(empMaster);
                        };
                        if(item.getFieldName().equals("empComputerlevel")){
                            System.out.println(item.getString("UTF-8"));
                            empComputerlevel=item.getString("UTF-8");
                            employessinfo.setEmpComputerlevel(empComputerlevel);
                        };
                        if(item.getFieldName().equals("empLanguage1")){
                            System.out.println(item.getString("UTF-8"));
                            empLanguage1=item.getString("UTF-8");
                            employessinfo.setEmpLanguage1(empLanguage1);
                        };
                        if(item.getFieldName().equals("empLanguage2")){
                            System.out.println(item.getString("UTF-8"));
                            empLanguage2=item.getString("UTF-8");
                            employessinfo.setEmpLanguage2(empLanguage2);
                        };
                        if(item.getFieldName().equals("empLanguage3")){
                            System.out.println(item.getString("UTF-8"));
                            empLanguage3=item.getString("UTF-8");
                            employessinfo.setEmpLanguage3(empLanguage3);
                        };
                        if(item.getFieldName().equals("empSpecialties")){
                            System.out.println(item.getString("UTF-8"));
                            empSpecialties=item.getString("UTF-8");
                            employessinfo.setEmpSpecialties(empSpecialties);
                        };
                        if(item.getFieldName().equals("empStatus")){
                            System.out.println(item.getString("UTF-8"));
                            empStatus=item.getString("UTF-8");
                            employessinfo.setEmpStatus(empStatus);
                        };
                        if(item.getFieldName().equals("empSocialsecurity")){
                            System.out.println(item.getString("UTF-8"));
                            empSocialsecurity=item.getString("UTF-8");
                            employessinfo.setEmpSocialsecurity(empSocialsecurity);
                        };
                        if(item.getFieldName().equals("empSecuritynumber")){
                            System.out.println(item.getString("UTF-8"));
                            empSecuritynumber=item.getString("UTF-8");
                            employessinfo.setEmpSecuritynumber(empSecuritynumber);
                        };
                        if(item.getFieldName().equals("empSalary")){
                            System.out.println(item.getString("UTF-8"));
                            empSalary=Double.valueOf(item.getString("UTF-8"));
                            employessinfo.setEmpSalary(empSalary);
                        };
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
            int i=employeeService.updateByPrimaryKeySelective(employessinfo);
            System.out.print(i);
    }

    @RequestMapping(value = "/deleteEmployee.do")
    public void deleteEmp(@RequestParam int empId,HttpServletResponse response){
        Integer id=new Integer(empId);
        employeeService.delete(id);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.print("success");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/selectInfo.do")
    public void selectInfo(HttpServletRequest request,HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("empName")+request.getParameter("empGender")+request.getParameter("empDeptid"));
            List<Jxmy_employessinfo> employessinfoList=new ArrayList<Jxmy_employessinfo>();
            System.out.println("hh");
            String format="yyyy-MM-dd";
            int id=Integer.parseInt(request.getParameter("empDeptid"));
            Integer empDeptid=new Integer(id);
            employessinfoList=employeeService.selectFindInfo(request.getParameter("empName"),request.getParameter("empGender"),empDeptid);
            JSONObject object=new JSONObject();
            object.put("Rows",employessinfoList);
            object.put("Total",employessinfoList.size());
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

    @RequestMapping(value = "/selectEmployeeInfo.do")
    public void selectEmployeeInfo(@RequestParam int empId,HttpServletResponse response){
        Integer id=new Integer(empId);
        Jxmy_employessinfo employessinfo=employeeService.selectByPrimaryKey(id);
        JSON.toJSONString(employessinfo);
//        JSONObject object=new JSONObject(employessinfo);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONString(employessinfo));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/selectAll.do")
    public void selectAll(HttpServletResponse response){
        List<Jxmy_employessinfo> employessinfoList=new ArrayList<Jxmy_employessinfo>();
        employessinfoList=employeeService.selectAll();
        String format="yyyy-MM-dd";
        JSONObject object=new JSONObject();
        object.put("Rows",employessinfoList);
        object.put("Total",employessinfoList.size());
        System.out.println(object);
        System.out.println("最后"+JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat));
        } catch (IOException e) {
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
