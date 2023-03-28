package com.api.reporting.service;

import com.api.reporting.dto.MemberVO;

public interface UserJoinService {

	public void makeAuthNumber() throws Exception;
	
	public String makeCheckEmail(String email) throws Exception;
	
	public void sendEmail(String fromEmail, String toEmail, String emailTitle, String emailContent) throws Exception;
	

	public int userIdCheck(String user_id) throws Exception;
	
	public String join(MemberVO vo);
}
