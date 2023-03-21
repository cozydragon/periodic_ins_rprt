package com.api.reporting.cmn.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.api.reporting.cmn.dto.LoginDTO;
import com.api.reporting.cmn.service.UserService;

@Controller
public class InterceptorController {

	@Inject
	private UserService service; 
	
	
	@Auth
	@RequestMapping(value="/modify" , method=RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
	
	  LoginDTO vo = (LoginDTO)session.getAttribute("LOGIN");
	
	  //vo = service.login(vo);
	
	  model.addAttribute("vo", vo);
	
	  if( vo == null ) {
	
	    return "redirect:/home";
	
	  }
	
	  return "/user/update";
	
	}

}