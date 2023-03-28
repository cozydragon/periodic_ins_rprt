package com.api.reporting.cmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.api.reporting.cmn.dto.UserVO;
import com.api.reporting.cmn.interceptor.Auth.Role;

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
	    if( handler instanceof HandlerMethod == false ) {

	      return true;

	    }

	 
	    HandlerMethod handlerMethod = (HandlerMethod)handler;

	    HttpSession session = request.getSession();

	    if( session == null ) {

	      response.sendRedirect(request.getContextPath() + "/user/login");

	      return false;

	    }

	     

	    UserVO authUser = (UserVO)session.getAttribute("LOGIN");

	    if ( authUser == null ) {

	      response.sendRedirect(request.getContextPath() + "/user/login");

	      return false;

	    }
	    
	    String roleSession = (String) session.getAttribute("site_id");

	    

	    Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

	     

	    if( auth == null ) {

	      return true;

	    }

	     
	    
	    String role = auth.role().toString();

	    if( "ADMIN".equals(role) ) {

	      if( "ADMIN".equals(roleSession) == false ){   // admin�� �ƴϹǷ� return false

	        response.sendRedirect(request.getHeader("REFERER"));

	        return false;

	      }

	    }

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
