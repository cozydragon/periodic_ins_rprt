package com.api.reporting.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExcelDAOImpl implements ExcelDAO{
 
	@Inject
	private SqlSession session;	
    
	private static final String namespace = "com.api.reporting.mapper.excelMapper";

 
    @Override
    public List<Object> getBooks(Map<String, Object> searchMap){
        return session.selectOne(namespace+".activate");
    }
 
    @Override
    public List<Object> getBooksDetail(Map<String, Object> searchMap){
        return session.selectList("selectBooksDetail", searchMap);
    }
 
}
