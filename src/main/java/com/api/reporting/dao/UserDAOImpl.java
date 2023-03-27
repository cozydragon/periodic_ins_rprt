package com.api.reporting.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.api.reporting.controller.LoginController;
import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.MemberVO;
import com.api.reporting.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
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
	
	@Override
	public int userIdCheck(String user_id) {
		logger.info("@Repository : " + user_id);
		int count = 0;
		
		try {
			count = sqlSession.selectOne(namespace+".userIdCheck", user_id);
			logger.info("mapper connection Success!!");
			
		} catch (DataAccessException e) {
			logger.info("@result : " + count);
			logger.error(e.toString());
		}
		
		return count;
	}

	@Override
	public int join(MemberVO vo) {
		// TODO Auto-generated method stub
		int count = sqlSession.insert(namespace+".join", vo);
		logger.info("회원 가입 성공 여부 : " + count + "====");
		return count;
	}
}
