package com.api.reporting.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.api.reporting.util.SangwhaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.api.reporting.service.ExcelService;
import com.api.reporting.service.RegistActivateService;
 
@Controller
public class ExcelController {
 
    @Autowired
    ExcelService excelService;
    
    @Autowired
	private RegistActivateService registActivateService;

    SangwhaUtil utility = new SangwhaUtil();

    @RequestMapping(value="/excelDownload")
    public String excelTransform(HttpSession session,@RequestParam Map<String, Object> paramMap, Map<String, Object> ModelMap, HttpServletResponse response) throws Exception{
         
        /*
        excelDownload?target=books&id=b2
         
        위와 같은 형식으로 파라미터가 온다고 가정
        target에 따라서 가져올 리스트를 선택
         */
    	
    	String today = LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE); 
    	
        String target = paramMap.get("target").toString();
        
		String site_id = utility.convertNull(paramMap.get("site_id"));
		
		paramMap.put("site_id",site_id);
         
        response.setHeader("Content-disposition", "attachment; filename=" + target +"-"+ today+"-"+site_id + ".xlsx"); //target명을 파일명으로 작성
        
 
        //엑셀에 작성할 리스트를 가져온다.
        List<Object> excelList= excelService.getAllObjects(target, paramMap); 
         
        //ExcelView(kr.co.myapp.util.ExcelView) 에 넘겨줄 값 셋팅
        ModelMap.put("excelList", excelList); 
        ModelMap.put("target", target);
 
        if(target.equals("day-report")) {
        	int fullcnt = registActivateService.day_report_full_cnt(paramMap);
        	ModelMap.put("fullcnt", fullcnt);
        }
        
        return "excelView"; //servlet-context.xml 에서 name이 excelView
 
    }
 
}
