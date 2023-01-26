package com.api.reporting.dao;

import java.util.List;
import java.util.Map;
 
public interface ExcelDAO {
     
    public List<Object> getBooks(Map<String, Object> searchMap);
     
    public List<Object> getBooksDetail(Map<String, Object> searchMap);
     
}
