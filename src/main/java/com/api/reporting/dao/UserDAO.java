package com.api.reporting.dao;

import java.util.List;

import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.MemberVO;
import com.api.reporting.dto.UserVO;

public interface UserDAO {
	
	public List<UserVO> select_user() throws Exception;
	
	public UserVO loginDAO(LoginDTO dto) throws Exception;

	public int userIdCheck(String user_id);
	
	public int join(MemberVO vo);
}
