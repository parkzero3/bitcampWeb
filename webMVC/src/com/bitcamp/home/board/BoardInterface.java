package com.bitcamp.home.board;

import java.util.List;

public interface BoardInterface {
	//�ۼ���
	public void getSelect(BoardVO vo);
	//�ѷ��ڵ�
	public int getAllRecordCount();
	//��ȸ����
	public void hitCount(int no);
	//�ۼ���
	public int boardUpdate(BoardVO vo);
	//�ۻ���
	public int boardDelete(int no);
	//�ش��������� ���ڵ带 ����
	
	public int boardInsert(BoardVO vo);
	
	public int getAllRecordCount(PagingVO pageVO);
	
	public List<BoardVO> getListRecord(PagingVO pVO);
}
