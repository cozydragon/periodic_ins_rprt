package com.api.reporting.util;

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

import com.api.reporting.dto.RegistActivateDTO;
import com.api.reporting.dto.RegistActivateVO;
import com.api.reporting.dto.RegistActivateYearDTO;

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
        fontRED.setFontName("맑은 고딕");

        CellStyle csredString = wb.createCellStyle();
        
        csredString.setFont(fontRED);
        
        CellStyle csredInt = wb.createCellStyle();
        
        csredInt.setFont(fontRED);
        csredInt.setDataFormat(df.getFormat("#,###"));
        
        //target에 따라서 엑셀 문서 작성을 분기한다.
        if(target.equals("books")){
            //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
            List<RegistActivateDTO> listBooks = (List<RegistActivateDTO>) model.get("excelList");
 
            //Sheet 생성
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("activate_date");
            row.createCell(cellCount++).setCellValue("operation_code");
            row.createCell(cellCount++).setCellValue("cnt");
 
            // 데이터 Cell 생성
            for (RegistActivateDTO registActivateDTO : listBooks) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(registActivateDTO.getActivate_date()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(registActivateDTO.getOperation_code());
                row.createCell(cellCount++).setCellValue(registActivateDTO.getCnt());

            }
 
        }
 
        if(target.equals("booksDetail")){
 
            List<RegistActivateVO> booksDetailList = (List<RegistActivateVO>) model.get("excelList");
 
            //Sheet 생성
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("activate_date");
            row.createCell(cellCount++).setCellValue("module_serial");
            row.createCell(cellCount++).setCellValue("module_no");
            row.createCell(cellCount++).setCellValue("operation_code");
 
            // 데이터 Cell 생성
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
        	
            //Sheet 생성
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("일자");
            //row.createCell(cellCount++).setCellValue("내역");
            row.createCell(cellCount++).setCellValue("메시지");
            row.createCell(cellCount++).setCellValue("카운트");
            if (registActivateDTO != null && registActivateDTO.size() >=1 ) {
            	row.createCell(cellCount++).setCellValue("사이트명:"+registActivateDTO.get(0).getSite_name());
            }
            
            int fullcnt = Integer.valueOf(model.get("fullcnt").toString());
            
            row = sheet.createRow(rowCount++);
            cellCount = 0;
            row.createCell(cellCount++).setCellValue("합계");
            row.createCell(cellCount++).setCellValue("");
            row.createCell(cellCount++).setCellValue(fullcnt);
            
            Cell fullcntcell = row.getCell(cellCount-1);
            //위에 있는 cs 숫자에 컴마적용
            fullcntcell.setCellStyle(cscomma);
            
            //셀합병
            sheet.addMergedRegion(new CellRangeAddress(rowCount-1,rowCount-1,0,1)); 
            
            // 데이터 Cell 생성
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
        	
            //Sheet 생성
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("일자");
            row.createCell(cellCount++).setCellValue("시간");
            row.createCell(cellCount++).setCellValue("모듈NO");
            row.createCell(cellCount++).setCellValue("모듈SERIAL");
            row.createCell(cellCount++).setCellValue("내역");
            row.createCell(cellCount++).setCellValue("메시지");
            if (registActivateDTO != null && registActivateDTO.size() >=1 ) {
            	row.createCell(cellCount++).setCellValue("사이트명:"+registActivateDTO.get(0).getSite_name());
            }
 
            // 데이터 Cell 생성
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

            //Sheet 생성
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;

            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("사이트명");
            row.createCell(cellCount++).setCellValue("모듈종류");
            row.createCell(cellCount++).setCellValue("주말여부");
            row.createCell(cellCount++).setCellValue("1월");
            row.createCell(cellCount++).setCellValue("2월");
            row.createCell(cellCount++).setCellValue("3월");
            row.createCell(cellCount++).setCellValue("4월");
            row.createCell(cellCount++).setCellValue("5월");
            row.createCell(cellCount++).setCellValue("6월");
            row.createCell(cellCount++).setCellValue("7월");
            row.createCell(cellCount++).setCellValue("8월");
            row.createCell(cellCount++).setCellValue("9월");
            row.createCell(cellCount++).setCellValue("10월");
            row.createCell(cellCount++).setCellValue("11월");
            row.createCell(cellCount++).setCellValue("12월");

            // 데이터 Cell 생성
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

            //Sheet 생성
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;

            row = sheet.createRow(rowCount++);

            // 데이터 Cell 생성
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


            //Sheet 생성
            //Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;

            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);

            row.createCell(cellCount++).setCellValue("모듈SERIAL");
            row.createCell(cellCount++).setCellValue("SERIAL명");
            row.createCell(cellCount++).setCellValue("사이트명");
            row.createCell(cellCount++).setCellValue("합계");
            row.createCell(cellCount++).setCellValue(String.valueOf(thisyear)+"년");
            row.createCell(cellCount++).setCellValue(String.valueOf(lastyear)+"년");
            row.createCell(cellCount++).setCellValue(String.valueOf(twoyearsago)+"년");
            row.createCell(cellCount++).setCellValue(String.valueOf(twoyearsago)+"년이전");

            // 데이터 Cell 생성
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

        // 엑셀 다운로드시 month-report 로그 월별 전체 내역을 제외한 곳에서만 셀넓이 조정처리
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
