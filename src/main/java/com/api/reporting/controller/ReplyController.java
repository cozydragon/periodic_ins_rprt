package com.api.reporting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.PageMaker;
import com.api.reporting.dto.ReplyVO;
import com.api.reporting.service.ReplyService;

@Controller
@RequestMapping(value="/reply")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> registReply(@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		try{
			replyService.createReplyService(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try{
			entity = new ResponseEntity<List<ReplyVO>>(replyService.noPageListService(bno), HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	@RequestMapping(value="/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> pageList(@PathVariable("bno") Integer bno, @PathVariable("page") Integer page){
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		try{
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			int replyCount = replyService.replyAllCountService(bno);
			
			pageMaker.setTotalCount(replyCount);
			
			List<ReplyVO> list = replyService.replyPageListService(bno, cri);
			
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	@RequestMapping(value="/{rno}", method = RequestMethod.POST)
	public ResponseEntity<String> updateReply(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		try{
			vo.setRno(rno);
			replyService.updateReplyService(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public ResponseEntity<String> removeReply(@RequestBody ReplyVO vo){
		
		logger.info("remove rno : " + vo.getRno());
		
		ResponseEntity<String> entity;
		
		try{
			replyService.deleteReplyService(vo.getRno());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
