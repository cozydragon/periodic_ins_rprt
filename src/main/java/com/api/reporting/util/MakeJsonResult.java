package com.api.reporting.util;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.context.annotation.Import;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.JSONValue;
import net.minidev.json.parser.JSONParser;

public class MakeJsonResult {
	

	//ok
		@SuppressWarnings("finally")
		public static JSONObject getOk(String procedureName, String successMsg) {		
			
			JSONObject root = new JSONObject();
			JSONObject menuObj = new JSONObject();
			JSONObject result = new JSONObject();
			JSONObject item = new JSONObject();
			LinkedHashMap<String, String> param = new LinkedHashMap<String, String>();
			
			try {
				//result.put("info", item);
				
				menuObj.put("query", procedureName);
				menuObj.put("param", param);
				menuObj.put("result", item);		
				
				menuObj.put("query_error_no", 1);
				menuObj.put("query_error_message", successMsg);
				
				root.put("sangwha", menuObj);
			}	
			finally {
				LogWrapper.INFO(root.toString());
				return root;
			}
		}
		
		//error
		@SuppressWarnings("finally")
		public static JSONObject getError(String procedureName, String errMsg) {		
			
			JSONObject root = new JSONObject();
			JSONObject menuObj = new JSONObject();
			JSONObject result = new JSONObject();
			JSONObject item = new JSONObject();
			LinkedHashMap<String, String> param = new LinkedHashMap<String, String>();
			
			try {
				//result.put("info", item);
				
				menuObj.put("query", procedureName);
				menuObj.put("param", param);
				menuObj.put("result", item);		
				
				menuObj.put("query_error_no", -1);
				menuObj.put("query_error_message", errMsg);
				
				root.put("sangwha", menuObj);
			}
			finally {
				LogWrapper.INFO(root.toString());
				return root;
			}
		}
		
		
		//only native query or redis
		@SuppressWarnings("finally")
		public static JSONObject getString(String procedureName, JSONArray item) {		
			
			LinkedHashMap<String, String> param = new LinkedHashMap<String, String>();
			JSONObject root = new JSONObject();
			JSONObject menuObj = new JSONObject();
			
			try {
				//result.put("info", item);
				
				menuObj.put("request_name", procedureName);
				menuObj.put("query", procedureName);
				menuObj.put("param", param);
				menuObj.put("result", item);		
				
				menuObj.put("query_error_no", 1);
				menuObj.put("query_error_message", "selected ok");
				
				root.put("sangwha", menuObj);	
				
			}		
			finally {
				LogWrapper.INFO(root.toString());
				return root;
			}
		}		
		
		
		//no group,no info 
		@SuppressWarnings("finally")
		public static JSONObject getString(List<Object> resultData, 
										   LinkedHashMap<String, String> param, 
										   LinkedHashMap<String, String> resultParam)  {
			
			JSONObject root = new JSONObject();
			JSONObject menuObj = new JSONObject();
			//JSONObject result = new JSONObject();
			JSONArray menuitemArray = new JSONArray();
			JSONArray result = new JSONArray();
			
			
			try {
				
				JSONParser parser = new JSONParser(JSONParser.DEFAULT_PERMISSIVE_MODE);
				
			
				
				if(resultData != null) {
					for(Object objs : resultData) {
						Object obj = parser.parse(objs.toString());
						JSONObject jsonObj = (JSONObject) obj;
						
						menuitemArray.add(jsonObj);
					}	
				}
				
				
			}
			catch(Exception e) {		 
				menuObj.put("query_error_no", -1);
				menuObj.put("query_error_message", e.getCause().getCause().getMessage());
				
				LogWrapper.ERROR(e.getMessage() + " " + e.getCause().getCause().getMessage());
			}
			finally {
				
				//result.put("info", menuitemArray);			
				menuObj.put("request_name", resultParam.get("request_name"));
				menuObj.put("query", resultParam.get("query"));
				menuObj.put("query_error_no", resultParam.get("query_error_no"));
				menuObj.put("query_error_message", resultParam.get("query_error_message"));
				menuObj.put("param", param);			
				menuObj.put("result", result);			
				
				root.put("sangwha", menuObj);
				LogWrapper.INFO(root.toString());
				return root;
			}
		}
		
		
		//group,no info
		@SuppressWarnings("finally")
		public static JSONObject getString(List<Object> resultData, 
				   						 LinkedHashMap<String, String> param, 
				   						 LinkedHashMap<String, String> resultParam, 
				   						 String groupTitle) {
			
			JSONObject root = new JSONObject();
			JSONObject menuObj = new JSONObject();		
			JSONArray menuitemArray = new JSONArray();
			
			try {
				
				JSONParser parser = new JSONParser(JSONParser.DEFAULT_PERMISSIVE_MODE);
				
				if(resultData != null) {
					for(Object objs : resultData) {
						Object obj = parser.parse(objs.toString());
						JSONObject jsonObj = (JSONObject) obj;
						
						menuitemArray.add(jsonObj);
					}	
				}								
			}		
			catch(Exception e) {		
				menuObj.put("query_error_no", -1);
				menuObj.put("query_error_message", e.getMessage() + " " + e.getCause().getCause().getMessage());
				
				LogWrapper.ERROR(e.getMessage() + " " + e.getCause().getCause().getMessage());
			}
			finally {
				
				LinkedHashMap<String, JSONArray> results =  new LinkedHashMap<String, JSONArray>();			
				
				for(Object temp : menuitemArray) {
					JSONObject jsonObj = (JSONObject)temp;	
					
					if(jsonObj.containsKey(groupTitle)) {
						String key = jsonObj.get(groupTitle).toString();

						if(results.containsKey(key)) {
							results.get(key).add(jsonObj);
						}			 
						else {
							JSONArray data = new JSONArray();
							data.add(jsonObj);
							
							results.put(key, data);
						}	
					}
					else {
						menuObj.put("query_error_message", "not found group title for json");
					}
				}			
				
				//menuObj.put("info", menuitemArray);
				//menuObj.put("query_error_no", resultParam.get("query_error_no"));
				menuObj.put("request_name", resultParam.get("request_name"));
				menuObj.put("query_error_no", resultParam.get("query_error_no"));
				menuObj.put("query_error_message", resultParam.get("query_error_message"));
				menuObj.put("param", param);
				menuObj.put("result", results);			
				
				root.put("sangwha", menuObj);
				LogWrapper.INFO(root.toString());
				
				return root;
				
			}
		}
}
