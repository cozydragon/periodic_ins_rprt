package com.api.reporting.cmn.interceptor;


import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.api.reporting.cmn.dto.MenuDTO;
import com.api.reporting.cmn.dto.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		if(session.getAttribute("LOGIN") != null){
			session.removeAttribute("LOGIN");
			session.removeAttribute("loginyn");
			logger.info("clear data login before");
			
		}
		if(request.getParameter("useCookie") != null){ 
			logger.info("remember me................");
			Cookie loginCookie = new Cookie("userId", request.getParameter("user_id").toString());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*15*1*1);
			response.addCookie(loginCookie);
		}

		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO userVO = (UserVO) modelMap.get("userVO");
		Object site_id = modelMap.get("site_id");
		
		if(userVO != null){
			
			logger.info("login success");
			
			session.setAttribute("LOGIN", userVO);
			
			session.setAttribute("site_id",site_id);
			
			session.setAttribute("loginyn","y");
			
			if (request.getParameter("useCookie")!=null) {
				logger.info("remember me" );
				Cookie loginCookie = new Cookie("userId",userVO.getUser_id() );
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
					
				}else {
					Cookie loginCookie = new Cookie("userId","");
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60*60*24*7);
					logger.info("remeber not");
					response.addCookie(loginCookie);
				}
				
				Object dest = session.getAttribute("dest");
				response.sendRedirect(dest != null ? (String)dest :"/home");
				
			} else {
				
				session.setAttribute("loginyn","n");
	
				response.sendRedirect("/user/login");
		}
		
		List <MenuDTO> menuDto = (List <MenuDTO>) modelMap.get("menuDTO");
		session.setAttribute("menuDTO", menuDto);
		
	    
	}
}
