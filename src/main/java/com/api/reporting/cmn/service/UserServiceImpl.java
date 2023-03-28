package com.api.reporting.cmn.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.api.reporting.cmn.dao.UserDAO;
import com.api.reporting.cmn.dto.LoginDTO;
import com.api.reporting.cmn.dto.MenuDTO;
import com.api.reporting.cmn.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	@Override
	public List<UserVO> select_user() throws Exception {

		return dao.select_user();
	}
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public List <MenuDTO> selectMenu(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMenu(dto);
	}	
	
}
