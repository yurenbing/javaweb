package com.jxmy.controller;

import com.jxmy.pojo.tb_myemp;
import com.jxmy.service.IMyempService;
import com.jxmy.utils.ExcelOperationUtil;
import com.jxmy.utils.UploadBean;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
public class MyempController {

    @Resource
    IMyempService myempService;

    @RequestMapping(value = "/uploadtest.do",method = RequestMethod.POST)
    public void uploadtest(HttpServletRequest request, HttpServletResponse response, Object command) throws IOException {
        System.out.println("hhhh");

        MultipartHttpServletRequest mulReq = (MultipartHttpServletRequest) request;
        MultipartFile file = mulReq.getFile("name");
        InputStream in=file.getInputStream();

        File file1=new File("E:/javaweb/jxmydemo/example/src/main/webapp/upload/",file.getName()+".jpg");
        FileOutputStream out=new FileOutputStream(file1);
//        CommonsMultipartResolver commonsMultipartResolver = new
//                CommonsMultipartResolver(request.getSession().getServletContext());
////设置编码
//        commonsMultipartResolver.setDefaultEncoding("utf-8");
//        //判断 request 是否有文件上传,即多部分请求...
//        if (commonsMultipartResolver.isMultipart(request)) {
//            //转换成多部分request
//            MultipartHttpServletRequest multipartRequest =
//                    commonsMultipartResolver.resolveMultipart(request);
//
//            // file 是指 文件上传标签的 name=值
//            // 根据 name 获取上传的文件...
//            MultipartFile file1 = multipartRequest.getFile("name");
//
//            //上传后记录的文件...
//            File imageFile = new File("fileName");
//            //上传...
//            file.transferTo(imageFile);
//        }
            String root=request.getSession().getServletContext().getRealPath("/");
        System.out.println(root);
//        File file=new File(root+"/");

        //获取上传的文件
//        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
//        MultipartFile file = multipart.getFile("upfile");
//        String month = request.getParameter("month");
//        InputStream in = file.getInputStream();
//        //数据导入
//        in.close();
//        try {
//            request.setCharacterEncoding("GBK");
//            System.out.println(request.getSession().getServletContext().getRealPath("emp.xls"));
//            String filePath =request.getSession().getServletContext().getRealPath("emp.xls");
//            ExcelOperationUtil excelUtil = new ExcelOperationUtil();
//            List<tb_myemp> list = excelUtil.readExcelFileToDB(filePath);
//            for (int i=0;i<list.size();i++){
//                myempService.insert(list.get(i));
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
    }
}
