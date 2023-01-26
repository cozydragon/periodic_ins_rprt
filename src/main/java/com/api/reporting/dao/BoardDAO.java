package com.api.reporting.dao;

import java.util.List;

import com.api.reporting.dto.BoardVO;
import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.SearchCriteria;

public interface BoardDAO {

	public String testTime();
	
	public void writeBoardDAO(BoardVO vo) throws Exception;
	
	public BoardVO readBoardDAO(Integer bno) throws Exception;
	
	public void updateBoardDAO(BoardVO vo) throws Exception;
	
	public void deleteBoardDAO(Integer bno) throws Exception;
	
	//모든 데이터 불러오기
	public List<BoardVO> listBoardDAO() throws Exception;
	
	//호출 페이지 리스트 불러오기
	public List<BoardVO> listPageBoardDAO(Integer page) throws Exception;
	
	//좀더 편하게 개발하기 위한 페이지 객체 이용
	public List<BoardVO> listCriteriaDAO(Criteria cri) throws Exception;
	
	//게시물 총 카운트
	public int countPaging(Criteria cri) throws Exception;
	
	//검색&페이징
	public List<BoardVO> listSearchCriteriaDAO(SearchCriteria cri) throws Exception;
	
	//검색&페이징 총 게시물 카운트
	public int searchCountPaging(SearchCriteria cri) throws Exception;
	
	//조회수
	public void updateViewCnt(Integer bno) throws Exception;
	
}
