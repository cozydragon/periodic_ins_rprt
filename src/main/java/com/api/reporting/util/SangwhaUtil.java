package com.api.reporting.util;

import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.api.reporting.service.UtilService;

public class SangwhaUtil {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	public String convertNull(Object value) {
	
		return convertNull(value,"");
			
		
	}
	
	public String convertNull(Object value,String param) {
		
		if(value == null) { 
			return param;
		}else if (value.equals("true")){
			
			return "1";
			
		}else if (value.equals("false")) {
		
			return "0";
			
		}else {
		
			return value.toString();
		}
		
	}
	
	public String sJoin (String sB) {

		String ddaom = "\"";
		
		String joinSB = ddaom+sB+ddaom;

		return joinSB;
	}
	
	public boolean isValidDate(String date) {
		
		boolean result = false;
		
		if (date == null) {
			result =  false;
		}
		
		String format = null;
		try {
			format = sdf.format(sdf.parse(date)); 
		} catch (ParseException e) {
			result = false;
		}
		
		if (date.equals(format)) {
			result = true;
		}
		
		return result;
		
	}
	
    public Object convertMapToObject(Map<String,Object> map,Object obj){
        String keyAttribute = null;
        String setMethodString = "set";
        String methodString = null;
        @SuppressWarnings("rawtypes")
		Iterator itr = map.keySet().iterator();
        
        while(itr.hasNext()){
            keyAttribute = (String) itr.next();
            methodString = setMethodString+keyAttribute.substring(0,1).toUpperCase()+keyAttribute.substring(1);            
            Method[] methods = obj.getClass().getDeclaredMethods();
            for(int i=0;i<methods.length;i++){
                if(methodString.equals(methods[i].getName())){
                    try{
                        methods[i].invoke(obj, map.get(keyAttribute));
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }
        }
        return obj;
    }
	
	
}
