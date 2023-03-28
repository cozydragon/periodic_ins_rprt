package com.api.reporting.cmn.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.api.reporting.cmn.dao.RegistActivateDAO;
import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.RegistActivateDTO;

@Service
public class RegistActivateServiceImpl implements RegistActivateService  {
	
	@Inject
	private RegistActivateDAO dao;
	
	
	@Override
	public int registActivate(Map<String, Object> param)  throws Exception {

		return dao.registActivate(param);
	}
	
	@Override
	public int registActivateByApi(Map<String, Object> param)  throws Exception {
		
		return dao.registActivateByApi(param);
	}
	
	@Override
	public int registActivateByApiDto(RegistActivateDTO dto) throws Exception {
		return dao.registActivateByApiDto(dto);
	}
	
	
	@Override
	public List<Object> day_report(Map<String, Object> param) throws Exception{
		
		return dao.day_report(param);
	}
	
	@Override
	public int reporting_count(Map<String, Object> param) throws Exception{
		
		return dao.reporting_count(param);
		
	}
	
	@Override
	public List<Object> month_report(Map<String, Object> param) throws Exception{
		
		return dao.month_report(param);
	}
	
	@Override
	public int month_report_count(Map<String,Object> param) throws Exception{
		return dao.month_report_count(param);
	}
	
	@Override
	public int day_report_success_cnt(Map<String,Object> param) throws Exception{
		
		return dao.day_report_success_cnt(param);
	}
	
	@Override
	public int day_report_full_cnt(Map<String,Object> param) throws Exception{
		
		return dao.day_report_full_cnt(param);
	}
	
	@Override
	public int registActivateSyncOne(RegistActivateDTO dto) throws Exception{
		return dao.registActivateSyncOne(dto);
		
	}

	@Override
	public List<Object> year_report(Map<String, Object> param) throws Exception{
		return dao.year_report(param);
	}

	@Override
	public List<Object>	monthlysum_report(Map<String, Object> param) throws Exception{
		return dao.monthlysum_report(param);
	}

	@Override
	public List<Object>	variety_cnt(Map<String, Object> param) throws Exception{
		return dao.variety_cnt(param);
	}


	@Override
	public List<Object>	moduleserialsum_report(Map<String, Object> param) throws Exception{
		return dao.moduleserialsum_report(param);
	}



}
