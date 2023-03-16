package com.api.reporting.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.api.reporting.dto.UserVO;
import com.api.reporting.interceptor.Auth.Role;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		
		/*
		HttpSession session = request.getSession();
		if (session.getAttribute("LOGIN") == null) {
			logger.info("not logined");
			
			saveDest(request);
			
			response.sendRedirect("/user/login");
			
			return false;
		}
		return true;
		*/
		
		
		
	    // 1. handler ���� Ȯ��

	    // ���ɻ�� Controller�� �ִ� �޼����̹Ƿ� HandlerMethod Ÿ������ üũ

	    if( handler instanceof HandlerMethod == false ) {

	      // return true�̸�  Controller�� �ִ� �޼��尡 �ƴϹǷ�, �״�� ��Ʈ�ѷ��� ����

	      return true;

	    }

	 

	    // 2.�� ��ȯ

	    HandlerMethod handlerMethod = (HandlerMethod)handler;

	     


	    // 3. @Auth�� �ִ� ����̹Ƿ�, ������ �ִ��� üũ

	    HttpSession session = request.getSession();

	    if( session == null ) {

	      // �α��� ȭ������ �̵�

	      response.sendRedirect(request.getContextPath() + "/user/login");

	      return false;

	    }

	     

	    // 4. ������ �����ϸ� ��ȿ�� �������� Ȯ��

	    UserVO authUser = (UserVO)session.getAttribute("LOGIN");

	    if ( authUser == null ) {

	      response.sendRedirect(request.getContextPath() + "/user/login");

	      return false;

	    }
	    
	    String roleSession = (String) session.getAttribute("ROLE");

	    

	    // 5. @Auth �޾ƿ���

	    Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

	     

	    // 6. method�� @Auth�� ���� ���, �� ������ �ʿ� ���� ��û

	    if( auth == null ) {

	      return true;

	    }

	     
	    
	    // 7. admin�� ���

	    String role = auth.role().toString();

	    if( "ADMIN".equals(role) ) {

	      // admin���� �� �� �ִ� ������ �ۼ��Ѵ�.

	      // ex) ������ id�� sangwha�̸� admin�̴�.

	      if( "ADMIN".equals(roleSession) == false ){   // admin�� �ƴϹǷ� return false

	        response.sendRedirect(request.getHeader("REFERER"));

	        return false;

	      }

	    }

	    // 8. �����㰡, �� �޼��带 �����ϵ��� ��

	    return true;

	}
	

	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if (query==null || query.equals("null")) {
			query="";
		} else {
			query = "?"+query;
		}
		if(request.getMethod().equals("GET")) {
			logger.info("dest"+(uri+query));
			request.getSession().setAttribute("dest",  uri+query);
		}
		
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		if (userVO != null) {
			logger.info("login success");
			session.setAttribute("LOGIN", userVO);
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String) dest : "/");
		}
		
	}

}
