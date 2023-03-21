package com.api.reporting.cmn.dao;

import java.util.List;

import com.api.reporting.cmn.dto.LoginDTO;
import com.api.reporting.cmn.dto.UserVO;

public interface UserDAO {
	
	public List<UserVO> select_user() throws Exception;
	
	public UserVO loginDAO(LoginDTO dto) throws Exception;
	
}
