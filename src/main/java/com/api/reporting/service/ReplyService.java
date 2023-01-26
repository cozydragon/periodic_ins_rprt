package com.api.reporting.service;

import java.util.List;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.ReplyVO;

public interface ReplyService {

	public void createReplyService(ReplyVO vo) throws Exception;
	
	public ReplyVO readReplyService(int rno) throws Exception;
	
	public void updateReplyService(ReplyVO vo) throws Exception;
	
	public void deleteReplyService(int rno) throws Exception;
	
	// 其捞隆 贸府 傈
	public List<ReplyVO> noPageListService(int bno) throws Exception;
	
	// 醚 瘩臂 墨款飘
	public int replyAllCountService(int bno) throws Exception;
	
	// 其捞隆 贸府
	public List<ReplyVO> replyPageListService(int bno, Criteria cri) throws Exception;
}
