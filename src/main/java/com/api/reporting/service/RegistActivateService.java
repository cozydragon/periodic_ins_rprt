package com.api.reporting.service;

import java.util.List;
import java.util.Map;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.RegistActivateDTO;

public interface RegistActivateService {
	
	public int registActivate(Map<String, Object> param) throws Exception;
	
	public int registActivateByApi(Map<String, Object> param) throws Exception;
	
	public int registActivateByApiDto(RegistActivateDTO dto) throws Exception;
	
	public List<Object> day_report(Map<String, Object> param) throws Exception;
	
	public int reporting_count(Map<String, Object> param) throws Exception;

	public List<Object> month_report(Map<String, Object> param) throws Exception;
	
	public int month_report_count(Map<String,Object> param) throws Exception;
	
	public int day_report_success_cnt(Map<String,Object> param) throws Exception;

	public int day_report_full_cnt(Map<String,Object> param) throws Exception;
	
	public int registActivateSyncOne(RegistActivateDTO dto) throws Exception;

	public List<Object> year_report(Map<String, Object> param) throws Exception;

	public List<Object> monthlysum_report(Map<String, Object> param) throws Exception;

	public List<Object> variety_cnt(Map<String,Object> param) throws Exception;

	public List<Object> moduleserialsum_report(Map<String, Object> param) throws Exception;

}
