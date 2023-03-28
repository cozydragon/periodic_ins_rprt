package com.api.reporting.cmn.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.api.reporting.cmn.dao.BoardDAO;
import com.api.reporting.cmn.dto.BoardVO;
import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.SearchCriteria;



@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void writeBoardService(BoardVO vo) throws Exception {
		boardDAO.writeBoardDAO(vo);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO readBoardService(Integer bno) throws Exception {
		boardDAO.updateViewCnt(bno);
		return boardDAO.readBoardDAO(bno);
	}

	@Override
	public void updateBoardService(BoardVO vo) throws Exception {
		boardDAO.updateBoardDAO(vo);
	}

	@Override
	public void deleteBoardService(Integer bno) throws Exception {
		boardDAO.deleteBoardDAO(bno);
	}

	@Override
	public List<BoardVO> basicListBoardService() throws Exception {
		return boardDAO.listBoardDAO();
	}

	@Override
	public List<BoardVO> criteriaListBoardService(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.listCriteriaDAO(cri);
	}

	@Override
	public int countCriteriaService(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.countPaging(cri);
	}

	@Override
	public List<BoardVO> searchCriteriaBoardService(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.listSearchCriteriaDAO(cri);
	}

	@Override
	public int searchCountCriteriaService(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.searchCountPaging(cri);
	}

}
