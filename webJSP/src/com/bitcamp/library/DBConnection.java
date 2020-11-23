package com.bitcamp.library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			System.out.println("드라이브로딩 에러 발생...."+e.getMessage());
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
			System.out.println("DB연결 에러발생..."+e.getMessage());
		}
	}
	public void getClose() {
		try {
			if(conn != null)conn.close();
			if(pstmt !=null)pstmt.close();
			if(rs != null)rs.close();
			
		}catch(Exception e) {
			System.out.println("DB종료 에러발생..."+e.getMessage());
		}
	}
	public void getPstmt(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
		System.out.println("Pstmt생성 에러"+ e.getMessage());
		}
	}

}
