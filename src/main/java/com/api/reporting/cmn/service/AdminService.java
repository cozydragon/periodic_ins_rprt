package com.api.reporting.cmn.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.ModuleDTO;
import com.api.reporting.cmn.dto.ModuleVarietyDTO;
import com.api.reporting.cmn.dto.RegistStatusDTO;
import com.api.reporting.cmn.dto.SearchCriteria;
import com.api.reporting.cmn.dto.SiteDTO;
import com.api.reporting.cmn.dto.UserVO;

public interface AdminService {
	
	public List<SiteDTO> show_site() throws Exception;

	public List<SiteDTO> show_site(SearchCriteria cri) throws Exception;
	
	//����¡ ó�� ���� �� �Խñ�
	public int site_count(Criteria cri) throws Exception;
	
	public int write_site(SiteDTO dto) throws Exception;
	
	//�Ѱ� ����Ʈ ��ȸ
	public SiteDTO read_site(String site_id) throws Exception;
	
	public void update_site(SiteDTO dto) throws Exception;
	
	//����Ʈ ����
	public void delete_site(String site_id) throws Exception;


	//user ��ȸ
	public List<UserVO> show_user() throws Exception;
	
	//user ��ȸ
	public List<UserVO> show_user(SearchCriteria cri) throws Exception;
	
	
	public int user_count(Criteria cri) throws Exception;
	
	public int write_user(UserVO dto) throws Exception;
	
	public UserVO read_user(String user_id) throws Exception;
	
	public int password_check(UserVO dto) throws Exception;
	
	public void update_user(UserVO dto) throws Exception;
	
	public void delete_user(String site_id) throws Exception;

	public List<ModuleDTO> show_module() throws Exception;
	
	public List<ModuleDTO> show_module(HashMap<String,Object> param) throws Exception;
	
	public int module_count(HashMap<String,Object> param) throws Exception;
	
	public int write_module(ModuleDTO dto) throws Exception;
	
	public ModuleDTO read_module(String module_serial) throws Exception;
	
	public void update_module(ModuleDTO dto) throws Exception;
	
	public int count_module_use(String module_serial) throws Exception;
	
	public void delete_module(String module_serial) throws Exception;
	
	public List<ModuleVarietyDTO> show_module_kinds(HashMap<String,Object> param) throws Exception;

	public int module_variety_count(HashMap<String,Object> param) throws Exception;

	public ModuleVarietyDTO read_module_kinds(LinkedHashMap<String,Object> param) throws Exception;

	public void update_module_kinds(ModuleVarietyDTO dto) throws Exception;

	public int count_module_kinds(String module_variety) throws Exception;
	
	public void delete_module_kinds(String module_serial) throws Exception;
	
	public void write_module_kinds(ModuleVarietyDTO dto) throws Exception;

	public List<RegistStatusDTO> show_regist_status(HashMap<String,Object> param) throws Exception;
	
	public int regist_status_count(HashMap<String,Object> param) throws Exception;
	
	public RegistStatusDTO read_regist_status(HashMap<String,Object> param) throws Exception;

	public void update_regist_status(RegistStatusDTO dto) throws Exception;
	
	public void write_regist_status(RegistStatusDTO dto) throws Exception;	
	
	public int count_regist_kinds(String code) throws Exception;
	
	public void delete_regist_status(String code) throws Exception;	
}
