package com.api.reporting.controller;

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

import com.api.reporting.dto.BoardVO;
import com.api.reporting.dto.PageMaker;
import com.api.reporting.dto.SearchCriteria;
import com.api.reporting.dto.UserVO;
import com.api.reporting.interceptor.Auth;
import com.api.reporting.service.BoardService;
import com.api.reporting.service.ReplyService;



@Controller
public class MainBoardController {

	private static final Logger logger = LoggerFactory.getLogger(MainBoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private ReplyService replyService;
	
	@Auth
	@RequestMapping("/")
	public String main(Model model){
		logger.info("show home");
		
		return "/home";
	}
	
	@RequestMapping("/write")
	public String getWriteBoardPage(){
		return "write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeArticle(BoardVO vo, RedirectAttributes rttr,HttpSession session){
		
		UserVO userVO = (UserVO) session.getAttribute("LOGIN");
		
		vo.setUser_id(userVO.getUser_id());
		
		logger.info("writeArticle");
		
		try{
			boardService.writeBoardService(vo);
			rttr.addFlashAttribute("result", "SUCCESS");
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public String readArticle(@RequestParam("bno") Integer bno, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		
		logger.info("readArticle");
		
		try{
			model.addAttribute(boardService.readBoardService(bno));
			
			int rcount = replyService.replyAllCountService(bno);
			
			if(rcount == 0){
				model.addAttribute("rcount",0);
			} else {
				model.addAttribute("rcount",rcount);
			}
		} catch (Exception e){
			
		}
		
		return "read";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String deleteArticle(@RequestParam("bno") Integer bno, SearchCriteria cri,RedirectAttributes rttr){
		
		logger.info("deleteArticle");
		
		try{
			boardService.deleteBoardService(bno);
			rttr.addFlashAttribute("result", "SUCCESS");
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModifyPage(@RequestParam("bno") Integer bno, @ModelAttribute("cri") SearchCriteria cri,Model model){
		
		logger.info("getModifyPage");
		
		try{
			model.addAttribute(boardService.readBoardService(bno));
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "modify";
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyArticle(BoardVO vo, RedirectAttributes rttr, SearchCriteria cri){
		
		logger.info("modifyArticle");
		
		try{
			boardService.updateBoardService(vo);
			rttr.addFlashAttribute("result","SUCCESS");
			
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
		} catch (Exception e){
			logger.info(e.getMessage());
		}
		
		return "redirect:/";
	}
}
