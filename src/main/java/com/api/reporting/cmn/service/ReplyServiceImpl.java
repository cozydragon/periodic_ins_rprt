package com.api.reporting.cmn.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.api.reporting.cmn.dao.ReplyDAO;
import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDAO;
	
	@Override
	public void createReplyService(ReplyVO vo) throws Exception {
		replyDAO.createReplyDAO(vo);
	}

	@Override
	public ReplyVO readReplyService(int rno) throws Exception {
		return replyDAO.readReplyDAO(rno);
	}

	@Override
	public void updateReplyService(ReplyVO vo) throws Exception {
		replyDAO.updateReplyDAO(vo);
	}

	@Override
	public void deleteReplyService(int rno) throws Exception {
		replyDAO.deleteReplyDAO(rno);
	}

	@Override
	public List<ReplyVO> noPageListService(int bno) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.noPageListDAO(bno);
	}

	@Override
	public int replyAllCountService(int bno) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.replyAllCountDAO(bno);
	}

	@Override
	public List<ReplyVO> replyPageListService(int bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.replyPageListDAO(bno, cri);
	}

}
