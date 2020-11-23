package com.bitcamp.home;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			System.out.println("로그인중 에러발생...."+e.getMessage());
		}
	}
	protected Connection conn =null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "scott";
	String userpwd = "tiger";
	
	public void getConn() {
		try {
			conn = DriverManager.getConnection(url, userid, userpwd);
		}catch(Exception e) {
			System.out.println("DB연결중 에러발생.."+e.getMessage());
		}
	}
	public void getClose() {
		try {
			if(conn != null)conn.close();
			if(pstmt !=null)pstmt.close();
			if(rs != null)rs.close();
			
		}catch(Exception e) {
			System.out.println("DB연결 해제중 에러발생..."+e.getMessage());
		}
	}
	

}
