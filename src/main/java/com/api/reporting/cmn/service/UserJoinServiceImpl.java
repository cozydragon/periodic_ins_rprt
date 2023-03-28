package com.api.reporting.cmn.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.api.reporting.cmn.controller.LoginController;
import com.api.reporting.cmn.dao.UserDAO;
import com.api.reporting.cmn.dto.MemberVO;

@Service
public class UserJoinServiceImpl implements UserJoinService {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNum;
	
	@Inject
	private UserDAO userdao;
	
	/*
	 * @author 		: 박준영
	 * @date   		: 2023-03-22
	 * @description : 이메일인증을 위한 난수를 생성한다
	 * @param
	 * @return
	 */
	public void makeAuthNumber() {
		Random randomNum = new Random();
		int checkNum = randomNum.nextInt(888888) + 111111;
		logger.info("현재 인증 번호 : " + checkNum);
		authNum = checkNum;
	}
	
	/*
	 * @author 		: 박준영
	 * @date   		: 2023-03-22
	 * @description : 인증을 위한 이메일 양식을 만들어준다
	 * @param		: [email]
	 * @return		: [authNum]
	 */
	public String makeCheckEmail(String email) {
		// 난수생성
		makeAuthNumber();
		// 발신자 이메일 주소 (추후 관리자에 의해 수정이 필요)
		String fromEmail    = "joonyoung@iteyes.co.kr";
		String toEmail    	= email;
		String emailTitle 	= "아이티아이즈 CMS 인증번호입니다.";
		String emailContent = "<img src='/src/main/webapp/resources/img/email_banner.png'>" +
							  "<br><br>" +
						  	  "아이티아이즈 CMS를 방문해주셔서 감사합니다." + 
		                	  "<br><br>" + 
		                	  "인증 번호는 " + "<span style='font-weight: bold'>" + authNum + "</span>" + "입니다." + 
		                	  "<br><br>" + 
		                	  "해당 인증번호를 확인하시고 인증란에 기입하여 주세요.";
		
		
		logger.info(emailContent);
		sendEmail(fromEmail, toEmail, emailTitle, emailContent);
		return Integer.toBinaryString(authNum);
	}
	
	/*
	 * @author 		: 박준영
	 * @date   		: 2023-03-22
	 * @description : 인증 이메일 전송
	 * @param 		: [fromEmail, toEmail, emailTitle, emailContent]
	 * @return
	 */	
	public void sendEmail(String fromEmail, String toEmail, String emailTitle, String emailContent) {
		MimeMessage message = mailSender.createMimeMessage();
		
		logger.info("message : " + message.toString());
		logger.info("content : " + emailContent);
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom(fromEmail);
			helper.setTo(toEmail);
			helper.setSubject(emailTitle);
			helper.setText(emailContent,true);
			mailSender.send(message);
			
			logger.info("이메일 메시지 전송 !!");
		} catch (MessagingException e) {
			logger.error(e.toString());
		}
	}
	
	public int userIdCheck(String user_id) throws Exception {
		int result = userdao.userIdCheck(user_id);
		return result;
	}

	@Override
	public String join(MemberVO vo) {
		int count = userdao.join(vo);
		String result = "";
			
		if(count == 1) {
			result = "Success";
		} else {
			result = "Fail";
		}
		
		return result;
	}
}
