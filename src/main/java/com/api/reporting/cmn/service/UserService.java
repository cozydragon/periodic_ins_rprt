package com.api.reporting.cmn.service;

import java.util.ArrayList;
import java.util.List;

import com.api.reporting.cmn.dto.LoginDTO;
import com.api.reporting.cmn.dto.MenuDTO;
import com.api.reporting.cmn.dto.UserVO;

public interface UserService {
	
	public List<UserVO> select_user() throws Exception;
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public List<MenuDTO> selectMenu(LoginDTO dto) throws Exception;
	
}
