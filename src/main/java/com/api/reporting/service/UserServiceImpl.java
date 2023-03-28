package com.api.reporting.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.api.reporting.controller.LoginController;
import com.api.reporting.dao.UserDAO;
import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private UserDAO dao;
	
	@Override
	public List<UserVO> select_user() throws Exception {

		return dao.select_user();
	}
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginDAO(dto);
	}
}
