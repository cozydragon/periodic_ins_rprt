package com.api.reporting.cmn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.RegistActivateDTO;
import com.api.reporting.cmn.dto.SearchCriteria;

@Repository
public class RegistActivateDAOImpl implements RegistActivateDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.api.reporting.cmn.mapper.registActivateMapper";
	
	public int registActivate(Map<String, Object> param) throws Exception {

		return sqlSession.insert(namespace+".registActivate",param);
	}
	
	public int registActivateByApi(Map<String, Object> param) throws Exception {
		
		return sqlSession.insert(namespace+".registActivateByApi",param);
	}
	
	public int registActivateByApiDto(RegistActivateDTO dto) throws Exception {
		return sqlSession.insert(namespace+".registActivateByApi",dto);
	}
	
	
	public List<Object> day_report(Map<String, Object> param) throws Exception{
		
		return sqlSession.selectList(namespace+".day-report",param);
	}
	
	
	public int reporting_count(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne(namespace+".reporting_count",param);
	}
	
	public List<Object> month_report(Map<String, Object> param) throws Exception{
		
		return sqlSession.selectList(namespace+".month-report",param);
	}
	
	public List<Object> month_report_excel(Map<String, Object> param) throws Exception{
		
		return sqlSession.selectList(namespace+".month-report-excel",param);
	}
	
	public int month_report_count(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne(namespace+".month-report-count",param);
	}
	
	
	public int day_report_success_cnt(Map<String, Object> param) throws Exception{
		
		return sqlSession.selectOne(namespace+".day_report_success_cnt",param);
	}
	
	public int day_report_full_cnt(Map<String, Object> param) throws Exception{
		
		return sqlSession.selectOne(namespace+".day_report_full_cnt",param);
	}
	
	public int registActivateSyncOne(RegistActivateDTO dto) throws Exception{
		return sqlSession.selectOne(namespace+".registActivateSyncOne",dto);
		
	}

	public List<Object> year_report(Map<String, Object> param) throws Exception{
		return sqlSession.selectList(namespace+".year_report",param);
	}

	public List<Object> monthlysum_report(Map<String, Object> param) throws Exception{
		return sqlSession.selectList(namespace+".monthlysum_report",param);
	}

    public List<Object> variety_cnt(Map<String, Object> param) throws Exception{
        return sqlSession.selectList(namespace+".variety_cnt",param);
    }

	public List<Object> moduleserialsum_report(Map<String, Object> param) throws Exception{
		return sqlSession.selectList(namespace+".moduleserialsum_report",param);
	}

}
