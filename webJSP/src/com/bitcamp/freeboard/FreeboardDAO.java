package com.bitcamp.freeboard;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.library.DBConnection;

public class FreeboardDAO extends DBConnection{
	//글쓰기
	public int boardInsertRecord(FreeboardVO vo) {
		int cnt= 0;
		try {
			//1. db연결
			getConn();
			//2. sql ->  preparedStatement
			String sql = "insert into freeboard(no, subject, content , userid, hit, writedate, ip)"
					+ "values(a_sq.nextval,?,?,?,0,sysdate,?)";
					getPstmt(sql);
			
				pstmt.setString(1, vo.getSubject());
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getUserid());
				pstmt.setString(4, vo.getIp());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
				System.out.println("게시판 글 등록 에러"+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}
	//글수정
	public int getUpdateRecord(int no, String subject, String content) {
		int result = 0;
		
		try {
			getConn();
			String sql = "update freeboard set subject=? ,content=? where no=?";
			getPstmt(sql);
			
			pstmt.setString(1,subject);
			pstmt.setString(2,content);
			pstmt.setInt(3,no);
			
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("글수정 에러"+e.getMessage());
		}finally {
			getClose();
		}
		return result;
	}
	
	
	//글목록								현재페이지,페이지당 표시할 레코드 수
	public List<FreeboardVO> getAllRecord(int nowPage, int onePageRecord,int totalPage, int totalRecord) {
		List<FreeboardVO> list = new ArrayList<FreeboardVO>();	
		
		try {
			getConn();
			String sql = "select * from"
					+ " (select * from"
					+ " (select no,subject,userid,hit,to_char(writedate,'MM-DD HH:MI') writedate "
					+ " from freeboard order by no desc)"
					+ " where rownum <=? order by no asc)"
					+ " where rownum <=? order by no desc";
			getPstmt(sql);
			
			pstmt.setInt(1,nowPage*onePageRecord);
			
			if(nowPage!=totalPage) { //마지막 페이지가 아닐경우
				pstmt.setInt(2,onePageRecord);
			}else {//마지막 페이지일 경우
				int mod = totalRecord%onePageRecord;
				if(mod==0) {
					pstmt.setInt(2,onePageRecord);
				}else {
				pstmt.setInt(2,mod);
				}
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FreeboardVO vo = new FreeboardVO();//레코드 1개를 담는다 = VO
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setUserid(rs.getString(3));
				vo.setHit(rs.getInt(4));
				vo.setWritedate(rs.getString(5));
			
				list.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("전체레코드 선택에러"+e.getMessage());
		}finally {
			getClose();	
		}
		return list;
	}
	//레코드 1개 선택
	public FreeboardVO getOneRecordSelect(int no , int part) {
		FreeboardVO vo = new FreeboardVO();			
		try {
			//조회수 증가
			if(part==1) {
			hitCount(no);
			}
			getConn();
			String sql ="select no, subject, content , userid, hit, writedate "
					+ " from freeboard where no = ? ";
			getPstmt(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserid(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setWritedate(rs.getString(6));
			}
			
		}catch(Exception e){
			System.out.println("레코드선택 에러"+e.getMessage());
		}finally {
			getClose();
		}
		return vo;
	}
	//글삭제
	public int getDeleteRecord(int no) {
		int result =0;
		
		try {
			getConn();
			String sql ="delete from freeboard where no=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1,no);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("글삭제 에러"+e.getMessage());
		}finally {
			getClose();
		}
		return result;
	}
	
	//조회수 증가
	public void hitCount(int no) {
		
		try {
			getConn();
			String sql = "update freeboard set hit=hit+1 where no=?";
			getPstmt(sql);
			
			pstmt.setInt(1,no);
			
			pstmt.executeUpdate();	
		}catch(Exception e) {
			System.out.println("조회수증가 에러"+e.getMessage());
		}finally {
			getClose();
		}
	}
	
	//총레코드수
	public int getTotalRecord() {
		int totalRecord = 0;
		
		try {
			getConn();
			String sql = "select count(no) from freeboard";
			getPstmt(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
				
			}
		}catch(Exception e) {
			System.out.println("총 레코드수 에러"+e.getMessage());
		}finally {
			getClose();
		}return totalRecord;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
