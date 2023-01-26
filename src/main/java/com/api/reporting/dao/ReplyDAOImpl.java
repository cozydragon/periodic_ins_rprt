package com.api.reporting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static final String namespace = "com.api.reporting.mapper.replyMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void createReplyDAO(ReplyVO vo) throws Exception {
		session.insert(namespace+".insertReply", vo);
	}

	@Override
	public ReplyVO readReplyDAO(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".readReply", rno);
	}

	@Override
	public void updateReplyDAO(ReplyVO vo) throws Exception {
		session.update(namespace+".updateReply", vo);
	}

	@Override
	public void deleteReplyDAO(int rno) throws Exception {
		session.delete(namespace+".deleteReply", rno);
	}

	@Override
	public List<ReplyVO> noPageListDAO(int bno) throws Exception {
		return session.selectList(namespace+".replyList", bno);
	}

	@Override
	public int replyAllCountDAO(int bno) throws Exception {
		return session.selectOne(namespace+".count", bno);
	}

	@Override
	public List<ReplyVO> replyPageListDAO(int bno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".replyPageList", paramMap);
	}

}
