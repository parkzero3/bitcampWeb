package com.bitcamp.register;

import com.bitcamp.library.DBConnection;

public class RegisterDAO extends DBConnection{

	public int memberInsert(RegisterVO vo) {
		int cnt = 0;
		
		try {
			getConn();
			String sql = "insert into register(no,userid,userpwd,username,gender,birth,tel,regdate)"
					+ " values(a_sq.nextval, ?, ?, ?, ?,to_date(?,'YYYY-MM-DD'), ?,sysdate)";
			getPstmt(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			pstmt.setString(3, vo.getUsername());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getTel());
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("회원가입에러"+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}
}
