package com.api.reporting.cmn.service;

import java.util.List;

import com.api.reporting.cmn.dto.BoardVO;
import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.SearchCriteria;


public interface BoardService {
	
	public void writeBoardService(BoardVO vo) throws Exception;
	
	public BoardVO readBoardService(Integer bno) throws Exception;
	
	public void updateBoardService(BoardVO vo) throws Exception;
	
	public void deleteBoardService(Integer bno) throws Exception;
	
	public List<BoardVO> basicListBoardService() throws Exception;
	
	public List<BoardVO> criteriaListBoardService(Criteria cri) throws Exception;
	
	public int countCriteriaService(Criteria cri) throws Exception;
	
	public List<BoardVO> searchCriteriaBoardService(SearchCriteria cri) throws Exception;
	
	public int searchCountCriteriaService(SearchCriteria cri) throws Exception;
}
