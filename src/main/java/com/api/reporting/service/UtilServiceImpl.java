package com.api.reporting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.api.reporting.dao.UtilDAO;

@Service
public class UtilServiceImpl implements UtilService{

	@Inject
	private UtilDAO dao;
	
	//공통코드
	@Override
	public List<HashMap<String,String>> show_code(String table_name,String code,String code_name) throws Exception{
		
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		try{
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("table_name", table_name);
			map.put("code", code);
			map.put("code_name", code_name);
			
			result = dao.show_code(map);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
		
	}
	//공통코드
	@Override
	public List<HashMap<String,String>> show_code_length(String table_name,String code,String code_name,int name_length) throws Exception{
		
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		try{
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("table_name", table_name);
			map.put("code", code);
			map.put("code_name", code_name);
			map.put("name_length", String.valueOf(name_length));
			
			result = dao.show_code_length(map);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
		
	}
	//공통코드
	@Override
	public  List<HashMap<String,String>> show_code_where(String table_name,String code,String code_name,String code_where1,String code_where2) throws Exception {
		
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		try{
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("table_name", table_name);
			map.put("code", code);
			map.put("code_name", code_name);
			map.put("code_where1", code_where1);
			map.put("code_where2", code_where2);
			
			result = dao.show_code_where(map);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
		
	}

	//공통코드
	@Override
	public List<HashMap<String,String>> show_code_order(String table_name,String code,String code_name,String order_name,String order_kind) throws Exception{

		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();

		try{

			HashMap<String,String> map = new HashMap<String,String>();

			map.put("table_name", table_name);
			map.put("code", code);
			map.put("code_name", code_name);
			map.put("order_name", order_name);
			map.put("order_kind", order_kind);

			result = dao.show_code_order(map);

		} catch (Exception e){
			e.printStackTrace();
		}

		return result;

	}


	//공통코드
	@Override
	public List<HashMap<String,String>> show_code_module_variety(String code) throws Exception{
		
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		try{
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("code", code);
			
			result = dao.show_code_module_variety(map);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
		
	}
	//공통코드
	@Override
	public List<HashMap<String,String>> show_code_module_serial(String site_id,String module_variety) throws Exception{
		
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		try{
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("site_id", site_id);
			map.put("module_variety", module_variety);
			
			result = dao.show_code_module_serial(map);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
		
	}

	@Override
	public List<HashMap<String,String>> show_year() throws Exception{
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();

		result = dao.show_year();

		return result;
	}

	@Override
	public List<HashMap<String,String>> show_code_detail(String table_name,String code_master,String code_detail,String code_name_kr) throws Exception{
		
		List<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		
		try{
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("table_name", table_name);
			map.put("code_master", code_master);
			map.put("code_detail", code_detail);
			map.put("code_name_kr", code_name_kr);
			
			result = dao.show_code_detail(map);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
		
	}
}
