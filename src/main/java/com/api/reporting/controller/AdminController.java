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
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private AdminService service;
	
	@Inject
	private UtilService utilService;
	
	SangwhaUtil utility = new SangwhaUtil();
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/admin-home", method = RequestMethod.GET)
	public String admin_home(Locale locale,Model model) {
		logger.info("====admin-home 화면====");
		
		logger.info("admin-home");
		
		LinkedHashMap<String, String> param = new LinkedHashMap<String, String>();
		param.put("site_id", "all");
		
		try{
			//model.addAttribute("list",service.reporting(param));
			//PageMaker pageMaker = new PageMaker();
			//pageMaker.setTotalCount(service.reporting_count(param));
			
			//model.addAttribute(pageMaker);

			
		} catch (Exception e){
			
		}
		
		return "/admin/admin-home";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/show-site")
	public String show_branch(Model model,@ModelAttribute("cri") SearchCriteria cri) {
		logger.info("====site 등록 화면-조회====");
		
		logger.info("show-site");
		
		try{
			model.addAttribute("list",service.show_site(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.site_count(cri));
			
			model.addAttribute(pageMaker);

			
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "/admin/show-site";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-site", method = RequestMethod.GET)
	public String getWriteSite(){
		return "/admin/write-site";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-site", method = RequestMethod.POST)
	public String writeSite(SiteDTO dto, RedirectAttributes rttr){
		logger.info("writeSite");
		
		try{
			service.write_site(dto);
			rttr.addFlashAttribute("result", "SUCCESS");
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "redirect:/admin/show-site";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/read-site", method = RequestMethod.GET)
	public String readSite(@RequestParam("site_id") String site_id, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		logger.info("read-site");
		
		try{
			model.addAttribute("SiteDTO",service.read_site(site_id));
			
		} catch (Exception e){
			
			e.printStackTrace();
		}
		
		return "/admin/read-site";
	}
	

	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-site", method = RequestMethod.GET)
	public String getModifySite(@RequestParam("site_id") String site_id, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		try {
			model.addAttribute("SiteDTO",service.read_site(site_id));
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return "/admin/modify-site";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-site", method = RequestMethod.POST)
	public String modifySite(SiteDTO dto, RedirectAttributes rttr, SearchCriteria cri){
		logger.info("modifySite");
		
		try{
			service.update_site(dto);
			rttr.addFlashAttribute("result", "SUCCESS");
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		return "redirect:/admin/show-site";
	}
	
	
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/delete-site", method = RequestMethod.POST)
	public String deleteSite(@RequestParam("site_id") String site_id, SearchCriteria cri,RedirectAttributes rttr){
		
		logger.info("show-delete");
		
		try{
			service.delete_site(site_id);
			rttr.addFlashAttribute("result", "SUCCESS");
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		
		return "redirect:/admin/show-site";
	}
	

	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/show-user")
	public String show_user(Model model,@ModelAttribute("cri") SearchCriteria cri) {
		logger.info("show-user");
		
		try{
			model.addAttribute("list",service.show_user(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.user_count(cri));
			
			model.addAttribute(pageMaker);

			
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "/admin/show-user";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-user", method = RequestMethod.GET)
	public String getWriteUser(Model model){
		
		try {
			model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
            model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			
		} catch (Exception e){
			logger.info(e.getMessage());
		}

		
		return "/admin/write-user";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-user", method = RequestMethod.POST)
	public String writeUser(UserVO dto, RedirectAttributes rttr){
		logger.info("writeUser");
		
		try{
			service.write_user(dto);
			rttr.addFlashAttribute("result", "SUCCESS");
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "redirect:/admin/show-user";
	}
	


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/read-user", method = RequestMethod.GET)
	public String readUser(@RequestParam("user_id") String user_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("read-user");

        model.addAttribute("UserVO",service.read_user(user_id));

        model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
        model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));

        return "/admin/read-user";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-user", method = RequestMethod.GET)
	public String getModifyUser(@RequestParam("user_id") String user_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

        model.addAttribute("UserVO",service.read_user(user_id));

        model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
        model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));

        return "/admin/modify-user";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-user", method = RequestMethod.POST)
	public String modifyUser(UserVO dto, RedirectAttributes rttr, SearchCriteria cri,Model model) throws Exception {
		logger.info("modifyUser");
		
		model.addAttribute("UserVO",dto);

        int cnt = 0;

        Boolean active = false;

        if (dto.getPw_change() != true) {

            active = true;

        } else {

            cnt = service.password_check(dto);

            if (cnt != 1) {

                active = false;
                rttr.addFlashAttribute("result", "FALSE_PASSWORD");

            } else {

                if (dto.getPassword_confirm().equals(dto.getPassword())) {

                    active = true;
                }else {
                    active = false;
                    rttr.addFlashAttribute("result", "DIFFERENT_PASSWORD");
                }

            }

        }


        if (!active) {
            return "redirect:/admin/modify-user?user_id="+dto.getUser_id();
        }
        service.update_user(dto);

        rttr.addFlashAttribute("result", "SUCCESS");

        rttr.addAttribute("page",cri.getPage());
        rttr.addAttribute("perPageNum",cri.getPerPageNum());
        rttr.addAttribute("searchType", cri.getSearchType());
        rttr.addAttribute("keyword", cri.getKeyword());


        return "redirect:/admin/modify-user?user_id="+dto.getUser_id();
	}

	

	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/delete-user", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("user_id") String user_id, SearchCriteria cri,RedirectAttributes rttr){
		
		logger.info("delete-user");
		
		try{
			service.delete_user(user_id);
			rttr.addFlashAttribute("result", "SUCCESS");
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		
		return "redirect:/admin/show-user";
	}	


	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/show-module")
	public String showModule(SearchCriteria cri,Model model,HttpSession session, WebRequest request) {
		logger.info("show-module");
		
		String site_id = utility.convertNull(request.getParameter("site_id"));
		String module_serial = utility.convertNull(request.getParameter("module_serial"));
		
		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		
		param.put("pageStart",cri.getPageStart() );
		param.put("perPageNum",cri.getPerPageNum() );
		param.put("site_id",site_id);
		param.put("module_serial", module_serial);

		
		try{
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("list",service.show_module(param));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.module_count(param));
			
			model.addAttribute(pageMaker);


			
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "/admin/show-module";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-module", method = RequestMethod.GET)
	public String writeModule(Model model){
		
		try {
			model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
            model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("code_module_variety",utilService.show_code("tb_module_variety","module_variety","variety_name"));
			
		} catch (Exception e){
			logger.info(e.getMessage());
		}

		
		return "/admin/write-module";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-module", method = RequestMethod.POST)
	public String writeModule(ModuleDTO dto, RedirectAttributes rttr){
		logger.info("writeModule");
		
		if ("".equals(dto.getModule_variety())) {
			dto.setModule_variety(null);
		}

		try{
			service.write_module(dto);
			rttr.addFlashAttribute("result", "SUCCESS");
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "redirect:/admin/show-module";
	}
	


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/read-module", method = RequestMethod.GET)
	public String readModule(@RequestParam("module_serial") String module_serial, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("read-module");

        model.addAttribute("ModuleDTO",service.read_module(module_serial));

        model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
        model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
        model.addAttribute("code_module_variety",utilService.show_code("tb_module_variety","module_variety","variety_name"));


        return "/admin/read-module";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-module", method = RequestMethod.GET)
	public String getModifyModule(@RequestParam("module_serial") String module_serial, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		try {
			model.addAttribute("ModuleDTO",service.read_module(module_serial));

			model.addAttribute("code_role",utilService.show_code("tb_role","role_id","role_name"));
            model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("code_module_variety",utilService.show_code("tb_module_variety","module_variety","variety_name"));

		} catch (Exception e) { 

			e.printStackTrace();
		}
		
		return "/admin/modify-module";
	}
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-module", method = RequestMethod.POST)
	public String modifyModule(ModuleDTO dto, RedirectAttributes rttr, SearchCriteria cri,Model model){
		logger.info("modifyModule");
		
		model.addAttribute("ModuleDTO",dto);
		
		
		if ("".equals(dto.getModule_variety())) {
			dto.setModule_variety(null);
		}

		try{
				service.update_module(dto);
			
				rttr.addFlashAttribute("result", "SUCCESS");
				
				rttr.addAttribute("page",cri.getPage());
				rttr.addAttribute("perPageNum",cri.getPerPageNum());
				rttr.addAttribute("searchType", cri.getSearchType());
				rttr.addAttribute("keyword", cri.getKeyword());

		} catch (Exception e){
			logger.info(e.getMessage());
		}
		return "redirect:/admin/modify-module?module_serial="+dto.getModule_serial();
	}

	

	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/delete-module", method = RequestMethod.POST)
	public String deleteModule(@RequestParam("module_serial") String module_serial, SearchCriteria cri,RedirectAttributes rttr){
		
		logger.info("delete-module");
		
		try{
			
			int cnt = service.count_module_use(module_serial);
			
			if (cnt==0) {
				service.delete_module(module_serial);
				rttr.addFlashAttribute("result", "SUCCESS");
			}else {
				rttr.addFlashAttribute("result", "FailCodeIsInIt");
			}
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		
		return "redirect:/admin/show-module";
	}	
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/show-module-kinds")
	public String showModuleKinds(SearchCriteria cri,Model model,HttpSession session, WebRequest request) {
		logger.info("show-module-kinds");
		
		String site_id = utility.convertNull(request.getParameter("site_id"));
		//String module_serial = utility.convertNull(request.getParameter("module_serial"));
		
		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		
		param.put("pageStart",cri.getPageStart() );
		param.put("perPageNum",cri.getPerPageNum() );
		param.put("site_id",site_id);
		//param.put("module_serial", module_serial);

		
		try{
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("list",service.show_module_kinds(param));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.module_variety_count(param));
			
			model.addAttribute(pageMaker);


			
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "/admin/show-module-kinds";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-module-kinds", method = RequestMethod.GET)
	public String writeModuleKinds(Model model){
		
		return "/admin/write-module-kinds";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-module-kinds", method = RequestMethod.POST)
	public String writeModuleKinds(ModuleVarietyDTO dto, RedirectAttributes rttr){
		logger.info("writeModule");
		
		if ("".equals(dto.getModule_variety())) {
			dto.setModule_variety(null);
		}

		try{
			service.write_module_kinds(dto);
			rttr.addFlashAttribute("result", "SUCCESS");
		} catch (Exception e){
			logger.info(e.getMessage());
			rttr.addFlashAttribute("result", "FAIL");
		}
		
		return "redirect:/admin/show-module-kinds";
	}
	


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/modify-module-kinds", method = RequestMethod.GET)
	public String readModuleKinds(@RequestParam("module_variety") String module_variety, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("modify-module-kinds");
		
		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		
		param.put("module_variety", module_variety);

        model.addAttribute("ModuleVarietyDTO",service.read_module_kinds(param));

        return "/admin/modify-module-kinds";
	}
	
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-module-kinds", method = RequestMethod.POST)
	public String modifyModuleKinds(ModuleVarietyDTO dto, RedirectAttributes rttr, SearchCriteria cri,Model model){
		logger.info("modifyModule");
		
		model.addAttribute("ModuleVarietyDTO",dto);
		
		
		if ("".equals(dto.getModule_variety())) {
			dto.setModule_variety(null);
		}

		try{
				service.update_module_kinds(dto);
			
				rttr.addFlashAttribute("result", "SUCCESS");
				
				rttr.addAttribute("page",cri.getPage());
				rttr.addAttribute("perPageNum",cri.getPerPageNum());
				rttr.addAttribute("searchType", cri.getSearchType());
				rttr.addAttribute("keyword", cri.getKeyword());

		} catch (Exception e){
			logger.info(e.getMessage());
		}
		return "redirect:/admin/modify-module-kinds?module_variety="+dto.getModule_variety();
	}

	

	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/delete-module-kinds", method = RequestMethod.POST)
	public String deleteModuleKinds(@RequestParam("module_variety") String module_variety, SearchCriteria cri,RedirectAttributes rttr){
		
		logger.info("delete-module");
		
		try{
			
			int cnt = service.count_module_kinds(module_variety);
			
			if (cnt==0) {
 				service.delete_module_kinds(module_variety);
				rttr.addFlashAttribute("result", "SUCCESS");
			}else {
				rttr.addFlashAttribute("result", "FailModuleIsInIt");
			}
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
			
		}
		
		
		return "redirect:/admin/show-module-kinds";
	}	
	
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/show-regist-status")
	public String showRegistStatus(SearchCriteria cri,Model model,HttpSession session, WebRequest request) {
		logger.info("show-regist-status");
		
		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		
		param.put("pageStart",cri.getPageStart() );
		param.put("perPageNum",cri.getPerPageNum() );

		
		try{
			model.addAttribute("list",service.show_regist_status(param));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.regist_status_count(param));
			
			model.addAttribute(pageMaker);


			
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "/admin/show-regist-status";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-regist-status", method = RequestMethod.GET)
	public String writeRegistStatus(Model model){
		
		return "/admin/write-regist-status";
	}


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/write-regist-status", method = RequestMethod.POST)
	public String writeRegistStatus(RegistStatusDTO dto, RedirectAttributes rttr){
		logger.info("writeModule");
		
		try{
			service.write_regist_status(dto);
			rttr.addFlashAttribute("result", "SUCCESS");
		} catch (Exception e){
			logger.info(e.getMessage());
			rttr.addFlashAttribute("result", "FAIL");
		}
		
		return "redirect:/admin/show-regist-status";
	}
	


	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/modify-regist-status", method = RequestMethod.GET)
	public String readRegistStatus(@RequestParam("code") String code, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("modify-regist-status");
		
		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		
		param.put("code", code);

        model.addAttribute("RegistStatusDTO",service.read_regist_status(param));

        return "/admin/modify-regist-status";
	}
	
	
	@Auth(role=Role.ADMIN)	
	@RequestMapping(value = "/modify-regist-status", method = RequestMethod.POST)
	public String modifyRegistStatus(RegistStatusDTO dto, RedirectAttributes rttr, SearchCriteria cri,Model model){
		logger.info("modifyModule");
		
		model.addAttribute("RegistStatusDTO",dto);
		
		
		try{
				service.update_regist_status(dto);
			
				rttr.addFlashAttribute("result", "SUCCESS");
				
				rttr.addAttribute("page",cri.getPage());
				rttr.addAttribute("perPageNum",cri.getPerPageNum());
				rttr.addAttribute("searchType", cri.getSearchType());
				rttr.addAttribute("keyword", cri.getKeyword());

		} catch (Exception e){
			logger.info(e.getMessage());
		}
		return "redirect:/admin/modify-regist-status?code="+dto.getCode();
	}

	

	@Auth(role=Role.ADMIN)	
	@RequestMapping(value="/delete-regist-status", method = RequestMethod.POST)
	public String deleteRegistStatus(@RequestParam("code") String code, SearchCriteria cri,RedirectAttributes rttr){
		
		logger.info("delete-regist-status"); 
		
		try{
			
			int cnt = service.count_regist_kinds(code);
			
			if (cnt==0) {
				service.delete_regist_status(code);
				rttr.addFlashAttribute("result", "SUCCESS");
			}else {
				rttr.addFlashAttribute("result", "FailCodeI");
			}

			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
			rttr.addFlashAttribute("result", "FAIL");
		}
		
		
		return "redirect:/admin/show-regist-status";
	}	
	
}

