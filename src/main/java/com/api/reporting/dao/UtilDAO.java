package com.api.reporting.dao;

import java.util.HashMap;
import java.util.List;

public interface UtilDAO {
	public List<HashMap<String,String>> show_code(HashMap<String,String> map) throws Exception ;
	public List<HashMap<String,String>> show_code_length(HashMap<String,String> map) throws Exception ;
	public List<HashMap<String,String>> show_code_where(HashMap<String,String> map) throws Exception ;
	public List<HashMap<String,String>> show_code_order(HashMap<String,String> map) throws Exception;
	public List<HashMap<String,String>> show_code_module_variety(HashMap<String,String> map) throws Exception ;
	public List<HashMap<String,String>> show_code_module_serial(HashMap<String,String> map) throws Exception ;
	public List<HashMap<String,String>> show_year() throws Exception ;
	public List<HashMap<String,String>> show_code_detail(HashMap<String,String> map) throws Exception ;

}
