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
		
		
		
	    // 1. handler 종류 확인

	    // 관심사는 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크

	    if( handler instanceof HandlerMethod == false ) {

	      // return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행

	      return true;

	    }

	 

	    // 2.형 변환

	    HandlerMethod handlerMethod = (HandlerMethod)handler;

	     


	    // 3. @Auth가 있는 경우이므로, 세션이 있는지 체크

	    HttpSession session = request.getSession();

	    if( session == null ) {

	      // 로그인 화면으로 이동

	      response.sendRedirect(request.getContextPath() + "/user/login");

	      return false;

	    }

	     

	    // 4. 세션이 존재하면 유효한 유저인지 확인

	    UserVO authUser = (UserVO)session.getAttribute("LOGIN");

	    if ( authUser == null ) {

	      response.sendRedirect(request.getContextPath() + "/user/login");

	      return false;

	    }
	    
	    String roleSession = (String) session.getAttribute("ROLE");

	    

	    // 5. @Auth 받아오기

	    Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

	     

	    // 6. method에 @Auth가 없는 경우, 즉 인증이 필요 없는 요청

	    if( auth == null ) {

	      return true;

	    }

	     
	    
	    // 7. admin일 경우

	    String role = auth.role().toString();

	    if( "ADMIN".equals(role) ) {

	      // admin임을 알 수 있는 조건을 작성한다.

	      // ex) 서비스의 id가 sangwha이면 admin이다.

	      if( "ADMIN".equals(roleSession) == false ){   // admin이 아니므로 return false

	        response.sendRedirect(request.getHeader("REFERER"));

	        return false;

	      }

	    }

	    // 8. 접근허가, 즉 메서드를 실행하도록 함

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
