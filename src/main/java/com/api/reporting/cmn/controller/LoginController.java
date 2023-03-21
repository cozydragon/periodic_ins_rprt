package com.api.reporting.cmn.controller;

import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.api.reporting.cmn.dto.LoginDTO;
import com.api.reporting.cmn.dto.MenuDTO;
import com.api.reporting.cmn.dto.SearchCriteria;
import com.api.reporting.cmn.dto.UserVO;
import com.api.reporting.cmn.interceptor.Auth;
import com.api.reporting.cmn.interceptor.Auth.Role;
import com.api.reporting.cmn.service.AdminService;
import com.api.reporting.cmn.service.UserService;
import com.api.reporting.cmn.service.UtilService;

@Controller
@RequestMapping("/user")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private UserService service;

	@Inject
	private AdminService adminService;
	
	@Inject
	private UtilService utilService;
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String user(Locale locale, Model model) throws Exception{

		logger.info("user");
		
		List<UserVO> userList = service.select_user();
		
		model.addAttribute("userList", userList);

		return "user";
	}
	
	
	@RequestMapping(value="/login")
	public void loginGet(@ModelAttribute("dto") LoginDTO dto){
		logger.info("Call LoginPage.........");
	}
	
	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public String a(LoginDTO dto,HttpSession session, Model model) throws Exception {

		return "/user/a";
		
		
	}
	
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public void loginCheck(LoginDTO dto,HttpSession session, Model model) throws Exception {

		logger.debug("=======loginCheck");
		
		/* id 정보 셋팅 */
		UserVO userVo = service.login(dto);
		if(userVo == null){
			return ;
		}

		model.addAttribute("userVO",userVo);
		String site_id = userVo.getSite_id(); 
		model.addAttribute("site_id",site_id);
		
		/* 메뉴 정보 셋팅 */
		List <MenuDTO> menuDto = service.selectMenu(dto);
		model.addAttribute("menuDTO",menuDto);
				
	}

	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, Model model)
    {
        logger.info("로그아웃");
        session.removeAttribute("LOGIN");
		session.removeAttribute("loginyn");
        return "redirect:/user/login";
    }


	@RequestMapping(value="/read-information", method = RequestMethod.GET)
	public String readUser(HttpSession session, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		logger.info("read-information");
		
		
		try{
			
			UserVO userVO = (UserVO) session.getAttribute("LOGIN");
			
			model.addAttribute("UserVO",adminService.read_user(userVO.getUser_id()));

			model.addAttribute("code_role",utilService.show_code("tb_cmn_authrt","authrt_id","role_name"));
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			
		} catch (Exception e){
			
			e.printStackTrace();
		}
		
		return "/user/read-information";
	}
	
	@RequestMapping(value = "/modify-information", method = RequestMethod.GET)
	public String getModifyUser(@RequestParam("user_id") String user_id, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		try {
			model.addAttribute("UserVO",adminService.read_user(user_id));

			model.addAttribute("code_role",utilService.show_code("tb_cmn_authrt","authrt_id","authrt_nm"));
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_nm","site_nm","asc"));

		} catch (Exception e) { 

			e.printStackTrace();
		}
		
		return "/user/modify-information";
	}

	
	@RequestMapping(value = "/modify-information", method = RequestMethod.POST)
	public String modifyUser(UserVO dto, RedirectAttributes rttr, SearchCriteria cri,Model model){
		logger.info("modify-information");
		
		model.addAttribute("UserVO",dto);

		try{
			
			int cnt;

			boolean active;

			if (dto.getPw_change()) {

				cnt = adminService.password_check(dto);

				if (cnt == 1) {

					if (dto.getPswd_confirm().equals(dto.getPswd())) {

						active = true;
					}else {
						active = false;
						rttr.addFlashAttribute("result", "DIFFERENT_PASSWORD");
					}

				}else {

					active = false;
					rttr.addFlashAttribute("result", "FALSE_PASSWORD");

				}

			}else {

				active = true;

			}


			if (active) {
				adminService.update_user(dto);
				
				rttr.addFlashAttribute("result", "SUCCESS");
				
				rttr.addAttribute("page",cri.getPage());
				rttr.addAttribute("perPageNum",cri.getPerPageNum());
				rttr.addAttribute("searchType", cri.getSearchType());
				rttr.addAttribute("keyword", cri.getKeyword());
			}
			

		} catch (Exception e){
			logger.info(e.getMessage());
		}
		return "redirect:/user/modify-information?user_id="+dto.getUser_id();
	}
	
}
