package com.api.reporting.service;

import java.util.HashMap;
import java.util.List;

public interface UtilService {

	public List<HashMap<String,String>> show_code(String table_name,String code,String code_name) throws Exception;
	public List<HashMap<String,String>> show_code_length(String table_name,String code,String code_name,int name_length) throws Exception;
	public List<HashMap<String,String>> show_code_where(String table_name,String code,String code_name,String code_where1,String code_where2) throws Exception;
	public List<HashMap<String,String>> show_code_order(String table_name,String code,String code_name,String order_name,String order_kind) throws Exception;
	public List<HashMap<String,String>> show_code_module_variety(String code) throws Exception;
	public List<HashMap<String,String>> show_code_module_serial(String site_id,String module_variety) throws Exception;
	public List<HashMap<String,String>> show_year() throws Exception;

	public List<HashMap<String,String>> show_code_detail(String table_name,String code_master,String code_detail,String code_name_kr) throws Exception;


}
