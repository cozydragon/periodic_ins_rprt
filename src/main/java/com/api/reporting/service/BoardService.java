package com.api.reporting.service;

import java.util.List;

import com.api.reporting.dto.BoardVO;
import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.SearchCriteria;


public interface BoardService {
	
	public void writeBoardService(BoardVO vo) throws Exception;
	
	public BoardVO readBoardService(Integer bno) throws Exception;
	
	public void updateBoardService(BoardVO vo) throws Exception;
	
	public void deleteBoardService(Integer bno) throws Exception;
	
	//데이터베이스 목록 모두 보여주기
	public List<BoardVO> basicListBoardService() throws Exception;
	
	//페이지 지정 목록 보여주기
	public List<BoardVO> criteriaListBoardService(Criteria cri) throws Exception;
	
	//페이징 처리 위한 총 게시글
	public int countCriteriaService(Criteria cri) throws Exception;
	
	//검색 & 패이징 목록
	public List<BoardVO> searchCriteriaBoardService(SearchCriteria cri) throws Exception;
	
	//검색 & 페이징 총 게시글
	public int searchCountCriteriaService(SearchCriteria cri) throws Exception;
}
