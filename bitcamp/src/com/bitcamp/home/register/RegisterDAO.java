package com.bitcamp.home.register;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBConnection;

public class RegisterDAO extends DBConnection implements RegisterInterface {


	@Override
	public void registerSelect(RegisterVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int idSearch(String userid) {
		int cnt = 0 ;
		
		try {
			getConn();
			String sql = "select count(userid) from register where userid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("아이디중복검사 에러"+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}
	


	@Override
	public void loginChk(RegisterVO vo) {
		
		try {
			getConn();
			String sql="select username from register where userid=? and userpwd=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,vo.getUserid());
			pstmt.setString(2,vo.getUserpwd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUsername(rs.getString(1));
				vo.setLogStatus("Y");
			}
		}catch(Exception e) {
			System.out.println("로그인 에러발생"+e.getMessage());

		}finally {
			getClose();
		}
		
	}

	@Override
	public int registerInsert(RegisterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
