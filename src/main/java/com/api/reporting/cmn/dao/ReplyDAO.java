package com.api.reporting.cmn.dao;

import java.util.List;

import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.ReplyVO;

public interface ReplyDAO {

	public void createReplyDAO(ReplyVO vo) throws Exception;
	
	public ReplyVO readReplyDAO(int rno) throws Exception;
	
	public void updateReplyDAO(ReplyVO vo) throws Exception;
	
	public void deleteReplyDAO(int rno) throws Exception;
	
	// ����¡ ó�� ��
	public List<ReplyVO> noPageListDAO(int bno) throws Exception;
	
	// �� ��� ī��Ʈ
	public int replyAllCountDAO(int bno) throws Exception;
	
	// ����¡ ó��
	public List<ReplyVO> replyPageListDAO(int bno, Criteria cri) throws Exception;
}
