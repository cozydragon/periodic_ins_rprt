package com.api.reporting.service;

import java.util.List;

import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.UserVO;

public interface UserService {
	
	public List<UserVO> select_user() throws Exception;
	
	public UserVO login(LoginDTO dto) throws Exception;
}
