package com.api.reporting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.api.reporting.dto.LoginDTO;
import com.api.reporting.dto.MemberVO;
import com.api.reporting.dto.PageMaker;
import com.api.reporting.dto.SearchCriteria;
import com.api.reporting.dto.UserVO;
import com.api.reporting.interceptor.Auth;
import com.api.reporting.interceptor.Auth.Role;
import com.api.reporting.service.AdminService;
import com.api.reporting.service.UserJoinService;
import com.api.reporting.service.UserService;
import com.api.reporting.service.UtilService;

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
	
	@Inject
	private UserJoinService joinService;
	
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
		logger.info("Call LoginPage.........!!");
	}
	
	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public String a(LoginDTO dto,HttpSession session, Model model) throws Exception {

		return "/user/a";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public void loginCheck(LoginDTO dto,HttpSession session, Model model) throws Exception {

		logger.debug("=======loginCheck");
		
		UserVO vo = service.login(dto);
		if(vo == null){
			return ;
		}
		
		model.addAttribute("userVO",vo);
		
		String role_id = vo.getAuthrt_id();
		
		if ("sangwha".equals(vo.getUser_id())){
			
			model.addAttribute("role","ADMIN");
			
		}else {
			model.addAttribute("role",role_id);
		}
		
		String site_id = vo.getSite_id(); 
		
		model.addAttribute("site_id",site_id);
	}

	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, Model model)
    {
        logger.info("�α׾ƿ�  ����");
        session.removeAttribute("LOGIN");
		session.removeAttribute("loginyn");
        logger.info("�α׾ƿ�  ����");
        return "redirect:/user/login";
    }
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public void signUp(HttpSession session) {
		
		logger.info("signup page");
	}
	
	@ResponseBody
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public Map<String, String> join(@RequestParam Map<String, Object> map) {
		
		logger.info("유저 명 : " + map.get("user_nm").toString());
		logger.info("유저 아이디 : " + map.get("user_id").toString());
		map.put("authrt_id", "test");
		map.put("site_id", "test");
		
		MemberVO vo = new MemberVO();
		
		vo.setUser_nm(map.get("user_nm").toString());
		vo.setUser_id(map.get("user_id").toString());
		vo.setPswd(map.get("pswd").toString());
		vo.setUser_eml_addr(map.get("user_eml_addr").toString());
		vo.setAuthrt_id("test");
		vo.setSite_id("test");
		
		Map<String, String> res = new HashMap<String, String>();
		String result = joinService.join(vo);
		
		res.put("result", result);
		// 다시 로그인 화면
		return res;
	}
	
	@ResponseBody
	@RequestMapping(value="/userIdCheck", method = RequestMethod.POST)
	public Map<String, Object> userIdCheck(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info(params.toString());
		
		int count = joinService.userIdCheck(params.get("user_id"));
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("count", count);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/userEmailCheck", method = RequestMethod.GET)
	public String userEmailCheck(String email) throws Exception {
		logger.info("sending email complete!!");
		logger.info("your email is " + email);
		
		return joinService.makeCheckEmail(email);
	}

	@RequestMapping(value="/read-information", method = RequestMethod.GET)
	public String readUser(HttpSession session, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		logger.info("read-information");
		
		
		try{
			
			UserVO userVO = (UserVO) session.getAttribute("LOGIN");
			
			model.addAttribute("UserVO",adminService.read_user(userVO.getUser_id()));

			model.addAttribute("code_role",utilService.show_code("tb_authrt","authrt_id","role_name"));
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

			model.addAttribute("code_role",utilService.show_code("tb_authrt","authrt_id","authrt_nm"));
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
