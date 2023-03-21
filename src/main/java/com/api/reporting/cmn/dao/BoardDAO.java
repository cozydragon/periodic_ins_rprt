package com.api.reporting.cmn.dao;

import java.util.List;

import com.api.reporting.cmn.dto.BoardVO;
import com.api.reporting.cmn.dto.Criteria;
import com.api.reporting.cmn.dto.SearchCriteria;

public interface BoardDAO {

	public String testTime();
	
	public void writeBoardDAO(BoardVO vo) throws Exception;
	
	public BoardVO readBoardDAO(Integer bno) throws Exception;
	
	public void updateBoardDAO(BoardVO vo) throws Exception;
	
	public void deleteBoardDAO(Integer bno) throws Exception;
	
	//��� ������ �ҷ�����
	public List<BoardVO> listBoardDAO() throws Exception;
	
	//ȣ�� ������ ����Ʈ �ҷ�����
	public List<BoardVO> listPageBoardDAO(Integer page) throws Exception;
	
	//���� ���ϰ� �����ϱ� ���� ������ ��ü �̿�
	public List<BoardVO> listCriteriaDAO(Criteria cri) throws Exception;
	
	//�Խù� �� ī��Ʈ
	public int countPaging(Criteria cri) throws Exception;
	
	//�˻�&����¡
	public List<BoardVO> listSearchCriteriaDAO(SearchCriteria cri) throws Exception;
	
	//�˻�&����¡ �� �Խù� ī��Ʈ
	public int searchCountPaging(SearchCriteria cri) throws Exception;
	
	//��ȸ��
	public void updateViewCnt(Integer bno) throws Exception;
	
}
