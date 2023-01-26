package com.api.reporting.dao;

import java.util.List;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.ReplyVO;

public interface ReplyDAO {

	public void createReplyDAO(ReplyVO vo) throws Exception;
	
	public ReplyVO readReplyDAO(int rno) throws Exception;
	
	public void updateReplyDAO(ReplyVO vo) throws Exception;
	
	public void deleteReplyDAO(int rno) throws Exception;
	
	// 其捞隆 贸府 傈
	public List<ReplyVO> noPageListDAO(int bno) throws Exception;
	
	// 醚 瘩臂 墨款飘
	public int replyAllCountDAO(int bno) throws Exception;
	
	// 其捞隆 贸府
	public List<ReplyVO> replyPageListDAO(int bno, Criteria cri) throws Exception;
}
