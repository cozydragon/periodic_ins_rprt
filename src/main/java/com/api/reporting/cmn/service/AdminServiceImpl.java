package com.api.reporting.cmn.service;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.api.reporting.cmn.dao.AdminDAO;
import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.ModuleDTO;
import com.api.reporting.cmn.dto.ModuleVarietyDTO;
import com.api.reporting.cmn.dto.RegistStatusDTO;
import com.api.reporting.cmn.dto.SearchCriteria;
import com.api.reporting.cmn.dto.SiteDTO;
import com.api.reporting.cmn.dto.UserVO;

@Service
public class AdminServiceImpl implements AdminService  {
	
	@Inject
	private AdminDAO dao;
	
	
	@Override
	public List<SiteDTO> show_site() throws Exception{
		
		return dao.show_site();
	}
	
	
	
	@Override
	public List<SiteDTO> show_site(SearchCriteria cri) throws Exception{
		
		return dao.show_site(cri);
	}
	
	
	@Override
	public int site_count(Criteria cri) throws Exception {
		return dao.site_count(cri);
	}

	
	@Override
	public int write_site(SiteDTO dto) throws Exception{
		
		return dao.write_site(dto);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public SiteDTO read_site(String site_id) throws Exception {
		return dao.read_site(site_id);
	}
	
	public void update_site(SiteDTO dto) throws Exception{
		dao.update_site(dto);
	}
	
	
	@Override
	public void delete_site(String site_id) throws Exception {
		dao.delete_site(site_id);
	}

	@Override
	public List<UserVO> show_user() throws Exception{
		
		return dao.show_user();
	}
	
	@Override
	public List<UserVO> show_user(SearchCriteria cri) throws Exception{
		
		return dao.show_user(cri);
	}
	
	
	@Override
	public int user_count(Criteria cri) throws Exception {
		return dao.user_count(cri);
	}

	
	@Override
	public int write_user(UserVO dto) throws Exception{
		
		return dao.write_user(dto);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public UserVO read_user(String user_id) throws Exception {
		return dao.read_user(user_id);
	}
	
	@Override
	public int password_check(UserVO dto) throws Exception {
		return dao.password_check(dto);
	}
	
	@Override
	public void update_user(UserVO dto) throws Exception{
		dao.update_user(dto);
	}
	
	
	@Override
	public void delete_user(String site_id) throws Exception {
		dao.delete_user(site_id);
	}
	
	@Override
	public List<ModuleDTO> show_module() throws Exception {
		return dao.show_module();
	}
	
	@Override
	public List<ModuleDTO> show_module(HashMap<String,Object> param) throws Exception {
		return dao.show_module(param);
	}
	
	@Override
	public int module_count(HashMap<String,Object> param) throws Exception {
		return dao.module_count(param);
	}
	
	@Override
	public int write_module(ModuleDTO dto) throws Exception {
		return dao.write_module(dto);
	}
	
	@Override
	public ModuleDTO read_module(String module_serial) throws Exception{
		return dao.read_module(module_serial);
	}
	
	@Override
	public void update_module(ModuleDTO dto) throws Exception {
		dao.update_module(dto);
	}
	
	@Override
	public int count_module_use(String module_serial) throws Exception{
		return dao.count_module_use(module_serial);
	}
	
	@Override
	public void delete_module(String module_serial) throws Exception{
		dao.delete_module(module_serial);
	}
	
	@Override
	public List<ModuleVarietyDTO> show_module_kinds(HashMap<String,Object> param) throws Exception{
		return dao.show_moudle_kinds(param);
	}
	
	@Override
	public int module_variety_count(HashMap<String,Object> param) throws Exception {
		return dao.module_variety_count(param);
	}

	
	@Override
	public ModuleVarietyDTO read_module_kinds(LinkedHashMap<String,Object> param) throws Exception{
		return dao.read_module_kinds(param);
	}

	
	@Override
	public void update_module_kinds(ModuleVarietyDTO dto) throws Exception{
		dao.update_moudle_kinds(dto);
	}
	
	@Override
	public int count_module_kinds(String module_variety) throws Exception{
		return dao.count_module_kinds(module_variety);
	}
	
	@Override
	public void delete_module_kinds(String module_serial) throws Exception{
		dao.delete_module_kinds(module_serial);

	}
	

	
	@Override
	public void write_module_kinds(ModuleVarietyDTO dto) throws Exception{
		dao.write_module_kinds(dto);
	}

	@Override
	public List<RegistStatusDTO> show_regist_status(HashMap<String,Object> param) throws Exception{
		return dao.show_regist_status(param);
	}

	@Override
	public int regist_status_count(HashMap<String,Object> param) throws Exception {
		return dao.regist_status_count(param);
	}

	@Override
	public RegistStatusDTO read_regist_status(HashMap<String,Object> param) throws Exception{
		return dao.read_regist_status(param);
	}
	
	@Override
	public void update_regist_status(RegistStatusDTO dto) throws Exception{
		dao.update_regist_status(dto);
	}
	
	@Override
	public void write_regist_status(RegistStatusDTO dto) throws Exception{
		dao.write_regist_status(dto);
	}
	
	@Override
	public int count_regist_kinds(String code) throws Exception{
		return dao.count_regist_kinds(code);
	}

	
	@Override
	public void delete_regist_status(String code) throws Exception{
		dao.delete_regist_status(code);
	}
	
}

