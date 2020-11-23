package com.bitcamp.home;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConn{
	public List<BoardVO> getAllSelect(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			dbConn();
			sql = "select no, userid, subject, content from freeboard order by no desc";
			pstmt = con.prepareStatement(sql);
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				
				vo.setNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setContent(rs.getString(4));
				
				list.add(vo);			
			}
					
		}catch(Exception e) {
			System.out.println("레코드선택 에러발생"+e.getMessage());
		}finally {
			dbClose();
		}
		return list;
	}
}
