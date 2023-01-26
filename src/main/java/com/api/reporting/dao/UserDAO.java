package com.api.reporting.dao;

import java.util.List;

import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.UserVO;

public interface UserDAO {
	
	public List<UserVO> select_user() throws Exception;
	
	public UserVO loginDAO(LoginDTO dto) throws Exception;
	
}
