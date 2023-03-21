package com.api.reporting.cmn.util;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Color;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.api.reporting.cmn.dto.RegistActivateDTO;
import com.api.reporting.cmn.dto.RegistActivateVO;
import com.api.reporting.cmn.dto.RegistActivateYearDTO;

public class ExcelView extends AbstractExcelPOIView {
	 
    @SuppressWarnings("unchecked")
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
        String target = model.get("target").toString();
        
        Sheet sheet = workbook.createSheet(target);
        
        

        Workbook wb = sheet.getWorkbook();

        CellStyle cscomma = wb.createCellStyle();

        DataFormat df = (DataFormat) wb.createDataFormat();

        cscomma.setDataFormat(df.getFormat("#,###"));

        Font fontRED = wb.createFont();
        fontRED.setColor(HSSFColor.RED.index);
        fontRED.setFontName("���� ���");

        CellStyle csredString = wb.createCellStyle();
        
        csredString.setFont(fontRED);
        
        CellStyle csredInt = wb.createCellStyle();
        
        csredInt.setFont(fontRED);
        csredInt.setDataFormat(df.getFormat("#,###"));
        
        //target�� ���� ���� ���� �ۼ��� �б��Ѵ�.
        if(target.equals("books")){
            //Object�� �Ѿ�� ���� �� Model�� �°� ����ȯ ���ش�.
            List<RegistActivateDTO> listBooks = (List<RegistActivateDTO>) model.get("excelList");
 
            //Sheet ����
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // ���� Cell ����
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("activate_date");
            row.createCell(cellCount++).setCellValue("operation_code");
            row.createCell(cellCount++).setCellValue("cnt");
 
            // ������ Cell ����
            for (RegistActivateDTO registActivateDTO : listBooks) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(registActivateDTO.getActivate_date()); //�����͸� ������ �Է�
                row.createCell(cellCount++).setCellValue(registActivateDTO.getOperation_code());
                row.createCell(cellCount++).setCellValue(registActivateDTO.getCnt());

            }
 
        }
 
        if(target.equals("booksDetail")){
 
            List<RegistActivateVO> booksDetailList = (List<RegistActivateVO>) model.get("excelList");
 
            //Sheet ����
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // ���� Cell ����
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("activate_date");
            row.createCell(cellCount++).setCellValue("module_serial");
            row.createCell(cellCount++).setCellValue("module_no");
            row.createCell(cellCount++).setCellValue("operation_code");
 
            // ������ Cell ����
            for (RegistActivateVO registActivateVO : booksDetailList) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(registActivateVO.getActivate_date());
                row.createCell(cellCount++).setCellValue(registActivateVO.getModule_serial());
                row.createCell(cellCount++).setCellValue(registActivateVO.getModule_no());
                row.createCell(cellCount++).setCellValue(registActivateVO.getOperation_code());
 
            }
 
        }
        
        if (target.equals("day-report")) {
        	List<RegistActivateDTO> registActivateDTO = (List<RegistActivateDTO>) model.get("excelList");
        	
            //Sheet ����
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // ���� Cell ����
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("����");
            //row.createCell(cellCount++).setCellValue("����");
            row.createCell(cellCount++).setCellValue("�޽���");
            row.createCell(cellCount++).setCellValue("ī��Ʈ");
            if (registActivateDTO != null && registActivateDTO.size() >=1 ) {
            	row.createCell(cellCount++).setCellValue("����Ʈ��:"+registActivateDTO.get(0).getSite_name());
            }
            
            int fullcnt = Integer.valueOf(model.get("fullcnt").toString());
            
            row = sheet.createRow(rowCount++);
            cellCount = 0;
            row.createCell(cellCount++).setCellValue("�հ�");
            row.createCell(cellCount++).setCellValue("");
            row.createCell(cellCount++).setCellValue(fullcnt);
            
            Cell fullcntcell = row.getCell(cellCount-1);
            //���� �ִ� cs ���ڿ� �ĸ�����
            fullcntcell.setCellStyle(cscomma);
            
            //���պ�
            sheet.addMergedRegion(new CellRangeAddress(rowCount-1,rowCount-1,0,1)); 
            
            // ������ Cell ����
            for (RegistActivateDTO dto : registActivateDTO) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                

                row.createCell(cellCount++).setCellValue(dto.getActivate_date());
               // row.createCell(cellCount++).setCellValue(dto.getCode_nm());
                row.createCell(cellCount++).setCellValue(dto.getMessage());
                row.createCell(cellCount++).setCellValue(dto.getCnt());
                
                for (int i=0 ;i < cellCount; i++) {
                	
                    if (dto.getDayofweek() == 1 || dto.getDayofweek() == 7) {
                    	if (cellCount-1 == i) {
                    		row.getCell(i).setCellStyle(csredInt);
                    	} else {
                    		row.getCell(i).setCellStyle(csredString);
                    	}
                    } 
                }
                

            }
            

            
        }
        
        if (target.equals("month-report")) {
        	List<RegistActivateDTO> registActivateDTO = (List<RegistActivateDTO>) model.get("excelList");
        	
            //Sheet ����
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // ���� Cell ����
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("����");
            row.createCell(cellCount++).setCellValue("�ð�");
            row.createCell(cellCount++).setCellValue("���NO");
            row.createCell(cellCount++).setCellValue("���SERIAL");
            row.createCell(cellCount++).setCellValue("����");
            row.createCell(cellCount++).setCellValue("�޽���");
            if (registActivateDTO != null && registActivateDTO.size() >=1 ) {
            	row.createCell(cellCount++).setCellValue("����Ʈ��:"+registActivateDTO.get(0).getSite_name());
            }
 
            // ������ Cell ����
            for (RegistActivateDTO dto : registActivateDTO) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(dto.getActivate_date());
                row.createCell(cellCount++).setCellValue(dto.getActivate_time());
                row.createCell(cellCount++).setCellValue(dto.getModule_no());
                row.createCell(cellCount++).setCellValue(dto.getModule_serial());
                row.createCell(cellCount++).setCellValue(dto.getCode_nm());
                row.createCell(cellCount++).setCellValue(dto.getMessage());
 
            }
            
        }

        if (target.equals("year-report")) {
            List<RegistActivateYearDTO> RegistActivateYearDTO = (List<RegistActivateYearDTO>) model.get("excelList");

            //Sheet ����
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;

            // ���� Cell ����
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("����Ʈ��");
            row.createCell(cellCount++).setCellValue("�������");
            row.createCell(cellCount++).setCellValue("�ָ�����");
            row.createCell(cellCount++).setCellValue("1��");
            row.createCell(cellCount++).setCellValue("2��");
            row.createCell(cellCount++).setCellValue("3��");
            row.createCell(cellCount++).setCellValue("4��");
            row.createCell(cellCount++).setCellValue("5��");
            row.createCell(cellCount++).setCellValue("6��");
            row.createCell(cellCount++).setCellValue("7��");
            row.createCell(cellCount++).setCellValue("8��");
            row.createCell(cellCount++).setCellValue("9��");
            row.createCell(cellCount++).setCellValue("10��");
            row.createCell(cellCount++).setCellValue("11��");
            row.createCell(cellCount++).setCellValue("12��");

            // ������ Cell ����
            for (RegistActivateYearDTO dto : RegistActivateYearDTO) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(dto.getSite_name());
                row.createCell(cellCount++).setCellValue(dto.getVariety_name());
                row.createCell(cellCount++).setCellValue(dto.getHoli_name());
                row.createCell(cellCount++).setCellValue(dto.getMonth1());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth2());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth3());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth4());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth5());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth6());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth7());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth8());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth9());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth10());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth11());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getMonth12());
                row.getCell(cellCount-1).setCellStyle(cscomma);

            }

        }

        if (target.equals("monthlysum-report")) {
            List<RegistActivateYearDTO> registActivateYearDTO = (List<RegistActivateYearDTO>) model.get("excelList");

            //Sheet ����
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;

            row = sheet.createRow(rowCount++);

            // ������ Cell ����
            cellCount = 0;
            for (RegistActivateYearDTO dto : registActivateYearDTO) {

                row.createCell(cellCount++).setCellValue(dto.getSite_name());
            }

            row = sheet.createRow(rowCount++);

            cellCount = 0;

            for (RegistActivateYearDTO dto : registActivateYearDTO) {

                row.createCell(cellCount++).setCellValue(dto.getSummary());
            }


        }

        if (target.equals("moduleserialsum-report")) {
            List<RegistActivateYearDTO> registActivateYearDTO = (List<RegistActivateYearDTO>) model.get("excelList");

            LocalDate currentDate = LocalDate.now();
            int thisyear =  currentDate.getYear();
            int lastyear =  thisyear-1;
            int twoyearsago =  thisyear-2;


            //Sheet ����
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;

            // ���� Cell ����
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("���SERIAL");
            row.createCell(cellCount++).setCellValue("SERIAL��");
            row.createCell(cellCount++).setCellValue("����Ʈ��");
            row.createCell(cellCount++).setCellValue("�հ�");
            row.createCell(cellCount++).setCellValue(String.valueOf(thisyear)+"��");
            row.createCell(cellCount++).setCellValue(String.valueOf(lastyear)+"��");
            row.createCell(cellCount++).setCellValue(String.valueOf(twoyearsago)+"��");
            row.createCell(cellCount++).setCellValue(String.valueOf(twoyearsago)+"������");

            // ������ Cell ����
            for (RegistActivateYearDTO dto : registActivateYearDTO) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(dto.getModule_serial());
                row.createCell(cellCount++).setCellValue(dto.getSerial_name());
                row.createCell(cellCount++).setCellValue(dto.getSite_name());
                row.createCell(cellCount++).setCellValue(dto.getSummary());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getYearcur());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getYearcur_1());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getYearcur_2());
                row.getCell(cellCount-1).setCellStyle(cscomma);
                row.createCell(cellCount++).setCellValue(dto.getYearcur_3());
                row.getCell(cellCount-1).setCellStyle(cscomma);

            }


        }

        // ���� �ٿ�ε�� month-report �α� ���� ��ü ������ ������ �������� ������ ����ó��
        if (!"month-report".equals(target)) {
            for (int i = 0; i < sheet.getPhysicalNumberOfRows() ; i++) {
                sheet.autoSizeColumn(i);
                sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 512);
            }

        }

    }
 
    @Override
    protected Workbook createWorkbook() {
        return new XSSFWorkbook();
    }
 
}
