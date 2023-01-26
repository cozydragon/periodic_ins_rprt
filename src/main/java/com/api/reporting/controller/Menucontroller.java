package com.api.reporting.controller;

import java.util.LinkedHashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.api.reporting.dto.ModuleDTO;
import com.api.reporting.dto.ModuleVarietyDTO;
import com.api.reporting.dto.PageMaker;
import com.api.reporting.dto.RegistStatusDTO;
import com.api.reporting.dto.SearchCriteria;
import com.api.reporting.dto.SiteDTO;
import com.api.reporting.dto.UserVO;
import com.api.reporting.interceptor.Auth;
import com.api.reporting.interceptor.Auth.Role;
import com.api.reporting.service.AdminService;
import com.api.reporting.service.UtilService;
import com.api.reporting.util.SangwhaUtil;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/menu")
public class Menucontroller {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private AdminService service;
	
	@Inject
	private UtilService utilService;
	
	SangwhaUtil utility = new SangwhaUtil();
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/{name}", method = RequestMethod.GET)
	public String menu1(@PathVariable String name,Locale locale,Model model) {
		
		LinkedHashMap<String, String> param = new LinkedHashMap<String, String>();
		param.put("site_id", "all");
		
		try{
			//model.addAttribute("list",service.reporting(param));
			//PageMaker pageMaker = new PageMaker();
			//pageMaker.setTotalCount(service.reporting_count(param));
			
			//model.addAttribute(pageMaker);
			//model.addAttribute("code_detail",utilService.show_code_where("tb_code_detail","code_detail","code_name_kr","code_master","10"));
			
			//model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
            //model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			//model.addAttribute("code_module_variety",utilService.show_code("tb_module_variety","module_variety","variety_name"));

			
		} catch (Exception e){
			
		}
		
		return "/menu/"+name;
	}


	
	
	
}

