package com.api.reporting.cmn.service;

import java.util.List;
import java.util.Map;
 
 
public interface ExcelService {
 
    public List<Object> getAllObjects(String target, Map<String, Object> searchMap) throws Exception;
 
}
