package com.api.reporting.cmn.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.api.reporting.cmn.dto.LoginDTO;
import com.api.reporting.cmn.dto.MemberVO;
import com.api.reporting.cmn.dto.MenuDTO;
import com.api.reporting.cmn.dto.UserVO;


@Mapper
@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	
	
	private static final String namespace = "com.api.reporting.cmn.mapper.userMapper";
	
	@Override
	public List<UserVO> select_user() throws Exception {

		return sqlSession.selectList(namespace+".show_user");
	}
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", dto);
	}
	
	@Override
	public List <MenuDTO> selectMenu(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectMenu", dto);
	}
	
	@Override
	public int userIdCheck(String user_id) {
		int count = 0;
		
		try {
			count = sqlSession.selectOne(namespace+".userIdCheck", user_id);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int join(MemberVO vo) {
		// TODO Auto-generated method stub
		int count = sqlSession.insert(namespace+".join", vo);
		return count;
	}
	
}
