package com.api.reporting.cmn.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UtilDAOImpl implements UtilDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.api.reporting.mapper.utilMapper";
	
	@Override
	public List<HashMap<String,String>> show_code(HashMap<String,String> map) throws Exception {
		return sqlSession.selectList(namespace+".show_code",map);
	}
	
	@Override
	public List<HashMap<String,String>> show_code_length(HashMap<String,String> map) throws Exception {
		return sqlSession.selectList(namespace+".show_code_length",map);
	}
	
	@Override
	public List<HashMap<String,String>> show_code_where(HashMap<String,String> map) throws Exception {
		return sqlSession.selectList(namespace+".show_code_where",map);
	}

	@Override
	public List<HashMap<String,String>> show_code_order(HashMap<String,String> map) throws Exception{
		return sqlSession.selectList(namespace+".show_code_order",map);
	}


	@Override
	public List<HashMap<String,String>> show_code_module_variety(HashMap<String,String> map) throws Exception {
		return sqlSession.selectList(namespace+".show_code_module_variety",map);
	}
	
	@Override
	public List<HashMap<String,String>> show_code_module_serial(HashMap<String,String> map) throws Exception {
		return sqlSession.selectList(namespace+".show_code_module_serial",map);
	}

	@Override
	public List<HashMap<String,String>> show_year() throws Exception {
		return sqlSession.selectList(namespace+".show_year");
	}

	@Override
	public List<HashMap<String,String>> show_code_detail(HashMap<String,String> map) throws Exception {
		return sqlSession.selectList(namespace+".show_code_detail");
	}
}
