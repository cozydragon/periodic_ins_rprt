package com.api.reporting.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.ModuleDTO;
import com.api.reporting.dto.ModuleVarietyDTO;
import com.api.reporting.dto.RegistStatusDTO;
import com.api.reporting.dto.SearchCriteria;
import com.api.reporting.dto.SiteDTO;
import com.api.reporting.dto.UserVO;

public interface AdminService {
	
	public List<SiteDTO> show_site() throws Exception;

	public List<SiteDTO> show_site(SearchCriteria cri) throws Exception;
	
	//페이징 처리 위한 총 게시글
	public int site_count(Criteria cri) throws Exception;
	
	public int write_site(SiteDTO dto) throws Exception;
	
	//한개 사이트 조회
	public SiteDTO read_site(String site_id) throws Exception;
	
	public void update_site(SiteDTO dto) throws Exception;
	
	//사이트 삭제
	public void delete_site(String site_id) throws Exception;


	//user 조회
	public List<UserVO> show_user() throws Exception;
	
	//user 조회
	public List<UserVO> show_user(SearchCriteria cri) throws Exception;
	
	//user 페이징 처리 위한 총 게시글
	public int user_count(Criteria cri) throws Exception;
	
	public int write_user(UserVO dto) throws Exception;
	
	//한개 user 조회
	public UserVO read_user(String user_id) throws Exception;
	
	//패스워드 확인
	public int password_check(UserVO dto) throws Exception;
	
	public void update_user(UserVO dto) throws Exception;
	
	//사이트 삭제
	public void delete_user(String site_id) throws Exception;

	//module 조회
	public List<ModuleDTO> show_module() throws Exception;
	
	//module 조회
	public List<ModuleDTO> show_module(HashMap<String,Object> param) throws Exception;
	
	//module 페이징 처리 위한 총 게시글
	public int module_count(HashMap<String,Object> param) throws Exception;
	
	//module 등록
	public int write_module(ModuleDTO dto) throws Exception;
	
	//한개 module 조회
	public ModuleDTO read_module(String module_serial) throws Exception;
	
	//module 수정
	public void update_module(ModuleDTO dto) throws Exception;
	
	//module 삭제여부 확인
	public int count_module_use(String module_serial) throws Exception;
	
	//module 삭제
	public void delete_module(String module_serial) throws Exception;
	
	//module 종류 조회
	public List<ModuleVarietyDTO> show_module_kinds(HashMap<String,Object> param) throws Exception;

	//module 종류 페이징 처리 위한 총 게시글
	public int module_variety_count(HashMap<String,Object> param) throws Exception;

	//module종류 조회
	public ModuleVarietyDTO read_module_kinds(LinkedHashMap<String,Object> param) throws Exception;

	
	//module종류 수정
	public void update_module_kinds(ModuleVarietyDTO dto) throws Exception;

	
	//module삭제 가능 확인
	public int count_module_kinds(String module_variety) throws Exception;
	
	//module종류 삭제
	public void delete_module_kinds(String module_serial) throws Exception;
	
	//module종류 등록
	public void write_module_kinds(ModuleVarietyDTO dto) throws Exception;

	//모듈 메시지 조회
	public List<RegistStatusDTO> show_regist_status(HashMap<String,Object> param) throws Exception;
	
	//모듈 메시지 페이징 처리 위한 총 게시글
	public int regist_status_count(HashMap<String,Object> param) throws Exception;
	
	//모듈 메시지 수정조회
	public RegistStatusDTO read_regist_status(HashMap<String,Object> param) throws Exception;

	//모듈 메시지 수정
	public void update_regist_status(RegistStatusDTO dto) throws Exception;
	
	//모듈 메시지 등록
	public void write_regist_status(RegistStatusDTO dto) throws Exception;	
	
	
	//모듈 삭제가능 확인
	public int count_regist_kinds(String code) throws Exception;
	
	//모듈 메시지 삭제
	public void delete_regist_status(String code) throws Exception;	
}
