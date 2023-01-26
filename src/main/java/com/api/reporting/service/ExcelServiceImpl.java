package com.api.reporting.service;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.api.reporting.dao.ExcelDAO;
import com.api.reporting.dao.RegistActivateDAO;
 
@Service
public class ExcelServiceImpl implements ExcelService {
 
    @Inject
    private ExcelDAO excelDAO;
    
	@Inject
	private RegistActivateDAO registActivateDAO;
 
 
    
    
    @Override
    public List<Object> getAllObjects(String target, Map<String, Object> searchMap) throws Exception{
         
        //controller에서 넘어온 target에 따라서 dao 실행을 구분
        if(target.equals("books")){
            return excelDAO.getBooks(searchMap);//검색조건 searchMap를 넘겨줌
        }else if(target.equals("booksDetail")){
            return excelDAO.getBooksDetail(searchMap);//검색조건 searchMap를 넘겨줌
        }else if(target.equals("month-report")) {
        	return registActivateDAO.month_report_excel(searchMap);
        }else if(target.equals("day-report")) {
        	return registActivateDAO.day_report(searchMap);
        }else if(target.equals("year-report")) {
            return registActivateDAO.year_report(searchMap);
        }else if(target.equals("monthlysum-report")) {
            return registActivateDAO.monthlysum_report(searchMap);
        }else if(target.equals("moduleserialsum-report")) {
            return registActivateDAO.moduleserialsum_report(searchMap);
        }
 
        return null;
    }
 
}
