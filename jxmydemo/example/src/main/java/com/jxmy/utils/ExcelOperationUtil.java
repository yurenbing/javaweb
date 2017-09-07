package com.jxmy.utils;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import com.jxmy.pojo.tb_myemp;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;


public class ExcelOperationUtil {
	

	public List<tb_myemp> readExcelFileToDB(String filePath){
	List<tb_myemp> list = new ArrayList<tb_myemp>();
	try{
		FileInputStream fis = new FileInputStream(filePath);
		POIFSFileSystem fs  = new POIFSFileSystem(fis);
		HSSFWorkbook workbook = new HSSFWorkbook(fs);//����Excel����������	
		HSSFSheet sheet = workbook.getSheetAt(0);//��ȡ��1��������
		HSSFPatriarch patriarch = sheet.getDrawingPatriarch();
	
		for(int i=2;i<=sheet.getLastRowNum();i++){//ѭ��Excel�ļ���ÿһ��
			tb_myemp emp = new tb_myemp();
			HSSFRow row = sheet.getRow(i);//��ȡ��i��
			HSSFCell cell1 = row.getCell(0);
			HSSFCell cell2 = row.getCell(1);
			HSSFCell cell3 = row.getCell(2);
			HSSFCell cell4 = row.getCell(3);
			HSSFCell cell5 = row.getCell(4);
			String name = cell1.getStringCellValue();//��ȡ��i�еĵ�1����Ԫ�������
			emp.setName(name);
			String sex = cell2.getStringCellValue();//��ȡ��i�еĵ�2����Ԫ�������
			emp.setSex(sex);
			String dept = cell3.getStringCellValue();//��ȡ��i�еĵ�3����Ԫ�������
			emp.setDept(dept);
			String duty = cell4.getStringCellValue();//��ȡ��i�еĵ�4����Ԫ�������
			emp.setDuty(duty);
			String phone = cell5.getStringCellValue();//��ȡ��i�еĵ�5����Ԫ�������
			emp.setTelephone(phone);
			list.add(emp);
		}
		fis.close();
		return list;
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	} 
}
}
