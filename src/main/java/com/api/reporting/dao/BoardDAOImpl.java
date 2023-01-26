package com.api.reporting.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.api.reporting.dto.BoardVO;
import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;	
	
	public static final String namespace="com.api.reporting.mapper.boardMapper";
	
	@Override
	public String testTime() {
		return session.selectOne(namespace+".time");
	}

	@Override
	public void writeBoardDAO(BoardVO vo) throws Exception {
		session.insert(namespace+".insertBoard", vo);
	}

	@Override
	public BoardVO readBoardDAO(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".readBoard", bno);
	}

	@Override
	public void updateBoardDAO(BoardVO vo) throws Exception {
		session.update(namespace+".updateBoard", vo);
	}

	@Override
	public void deleteBoardDAO(Integer bno) throws Exception {
		session.delete(namespace+".deleteBoard", bno);
	}

	@Override
	public List<BoardVO> listBoardDAO() throws Exception {
		return session.selectList(namespace+".basicList");
	}

	@Override
	public List<BoardVO> listPageBoardDAO(Integer page) throws Exception {
		// TODO Auto-generated method stub
		
		if(page < 0){
			page = 1;
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace+".pageList", page);
	}

	@Override
	public List<BoardVO> listCriteriaDAO(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".pageListCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearchCriteriaDAO(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".searchCriteria", cri);
	}

	@Override
	public int searchCountPaging(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".searchCountPaging", cri);
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace+".updateViewCnt", bno);
	}

}
