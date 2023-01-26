package com.api.reporting.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.api.reporting.mapper.userMapper";
	
	@Override
	public List<UserVO> select_user() throws Exception {

		return sqlSession.selectList(namespace+".show_user");
	}
	
	@Override
	public UserVO loginDAO(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", dto);
	}

}
