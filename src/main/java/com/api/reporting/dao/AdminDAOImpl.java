package com.api.reporting.dao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.ModuleDTO;
import com.api.reporting.dto.ModuleVarietyDTO;
import com.api.reporting.dto.RegistStatusDTO;
import com.api.reporting.dto.SearchCriteria;
import com.api.reporting.dto.SiteDTO;
import com.api.reporting.dto.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.api.reporting.mapper.adminMapper";
	private static final String namespace_user = "com.api.reporting.mapper.userMapper";
	
	public List<SiteDTO> show_site() throws Exception {
		return sqlSession.selectList(namespace+".show_site"); 
	}
	
	public List<SiteDTO> show_site(SearchCriteria cri) throws Exception{
		
		return sqlSession.selectList(namespace+".show_site",cri); 
	}
	
	public int site_count(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".site_count",cri);
	}
	
	public int write_site(SiteDTO dto) throws Exception{
		
		return sqlSession.insert(namespace+".write_site", dto);
		
	}
	
	public SiteDTO read_site(String site_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".read_site", site_id);
	}
	
	public void update_site(SiteDTO dto) throws Exception{
		 sqlSession.update(namespace+".update_site",dto);
	}
	
	
	public void delete_site(String site_id) throws Exception {
		sqlSession.delete(namespace+".delete_site",site_id);
	}

	public List<UserVO> show_user() throws Exception {
		return sqlSession.selectList(namespace_user+".show_user"); 
	}
	
	public List<UserVO> show_user(SearchCriteria cri) throws Exception{
		
		return sqlSession.selectList(namespace_user+".show_user",cri); 
	}
	
	public int user_count(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace_user+".user_count",cri);
	}
	
	public int write_user(UserVO dto) throws Exception{
		
		return sqlSession.insert(namespace_user+".write_user", dto);
		
	}
	
	public UserVO read_user(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace_user+".read_user", user_id);
	}
	
	public int password_check(UserVO dto) throws Exception {
		return sqlSession.selectOne(namespace_user+".password_check",dto);
	}
	
	public void update_user(UserVO dto) throws Exception{
		 sqlSession.update(namespace_user+".update_user",dto);
	}
	
	public void delete_user(String user_id) throws Exception {
		sqlSession.delete(namespace_user+".delete_user",user_id);
	}
	

	
	public List<ModuleDTO> show_module() throws Exception {
		return sqlSession.selectList(namespace+".show_module");
	}
	
	public List<ModuleDTO> show_module(HashMap<String,Object> param) throws Exception {
		return sqlSession.selectList(namespace+".show_module",param);
	}
	
	public int module_count(HashMap<String,Object> param) throws Exception {
		return sqlSession.selectOne(namespace+".module_count",param);
	}
	
	public int write_module(ModuleDTO dto) throws Exception {
		return sqlSession.insert(namespace+".write_module", dto);
	}
	
	public ModuleDTO read_module(String module_serial) throws Exception{
		return sqlSession.selectOne(namespace+".read_module",module_serial);
	}
	
	public void update_module(ModuleDTO dto) throws Exception {
		sqlSession.update(namespace+".update_module",dto);
	}
	
	public int count_module_use(String module_serial) throws Exception{
		return sqlSession.selectOne(namespace+".count_module_use",module_serial);
	}
	
	
	public void delete_module(String module_serial) throws Exception{
		sqlSession.delete(namespace+".delete_module",module_serial);
	}
	
	public List<ModuleVarietyDTO> show_moudle_kinds(HashMap<String,Object> param) throws Exception{
		return sqlSession.selectList(namespace+".show_moudle_kinds");
	}
	
	public int module_variety_count(HashMap<String,Object> param) throws Exception {
		return sqlSession.selectOne(namespace+".module_variety_count",param);
	}
	
	public ModuleVarietyDTO read_module_kinds(LinkedHashMap<String,Object> param) throws Exception{
		return sqlSession.selectOne(namespace+".read_module_kinds",param);
	}


	public void update_moudle_kinds(ModuleVarietyDTO dto) throws Exception{
		sqlSession.update(namespace+".update_module_kinds",dto); 
	}
	
	public int count_module_kinds(String module_variety) throws Exception{
		return sqlSession.selectOne(namespace+".count_module_kinds",module_variety);
	}
	
	public void delete_module_kinds(String module_serial) throws Exception{
		sqlSession.update(namespace+".delete_module_kinds",module_serial); 

	}
	
	public void write_module_kinds(ModuleVarietyDTO dto) throws Exception{
		sqlSession.insert(namespace+".write_module_kinds",dto); 
		
	}
	
	public List<RegistStatusDTO> show_regist_status(HashMap<String,Object> param) throws Exception{
		return sqlSession.selectList(namespace+".show_regist_status",param);
	}

	public int regist_status_count(HashMap<String,Object> param) throws Exception{
		return sqlSession.selectOne(namespace+".regist_status_count",param);
	}
	
	public RegistStatusDTO read_regist_status(HashMap<String,Object> param) throws Exception{
		return sqlSession.selectOne(namespace+".read_regist_status",param);
	}
	
	public void update_regist_status(RegistStatusDTO dto) throws Exception{
		sqlSession.update(namespace+".update_regist_status",dto);
	}
	
	public void write_regist_status(RegistStatusDTO dto) throws Exception{
		sqlSession.insert(namespace+".write_regist_status",dto); 
	}
	
	public int count_regist_kinds(String code) throws Exception{
		return sqlSession.selectOne(namespace+".count_regist_kinds",code);
	}
	
	public void delete_regist_status(String code) throws Exception{
		sqlSession.delete(namespace+".delete_regist_status",code);
	}
	
	

}
