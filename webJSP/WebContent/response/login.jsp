<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement, java.sql.ResultSet"%>


<%!
	//JDBC 드라이드 로딩 , DB연결 동시에 구현
	public Connection getConnection(){
		Connection conn = null;	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@192.168.0.208:1521:xe";
			conn = DriverManager.getConnection(url,"scott","tiger");
		}catch(Exception e){
			System.out.println("DB연결에러"+e.getMessage());
		}
		return conn;
	}
%>

<%
	//1. 클라이언트 폼에있는 데이터를 서버로 가져온다 : request
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	//아이디와 비밀번호 일치 확인하기
	//1.드라이브 로딩
	//2. DB연결
	//선언부로 선언하여 사용
	Connection conn = getConnection();
		
	//3. statement 생성 (sql) 로그인은 select문
	// 입력한 아이디와 비밀번호가 같은 아이디가 몇개있는지 체크하는 sql 답은 0 or 1
	// 0 은 실패 1 은 성공  값이 무조건 존재하는 sql임
	//String sql ="select count(userid) cnt from register where userid=? and userpwd=?";
	String sql ="select userid,username from register where userid=? and userpwd=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,userid);
	pstmt.setString(2,userpwd);
	//4.실행 :  ResultSet
	ResultSet rs = pstmt.executeQuery();
	
	
	/*	if(rs.getInt(1)==0){ //0일시 로그인실패
		//로그인 폼으로 보내기
		//서버에서 다른페이지로 이동시키기
		response.sendRedirect(request.getContextPath()+"/response/login.html");

	}else if(rs.getInt(1)==1){//1일시 로그인성공
		//서버에서 다른페이지로 이동시키기
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
	*/
	
	if(!rs.next()){ //로그인실패
%>
	<script>
		alert("로그인 실패하였습니다. 다시입력해주세요");
		location.href="<%=request.getContextPath()%>/response/login.html";
		//history.back();
	</script>
<%	
	}else{ //로그인성공
		
		//로그인 성공여부를 세션에 기록한다.
		session.setAttribute("logStatus","Y");
		session.setAttribute("userid", rs.getString(1));
		session.setAttribute("username", rs.getString(2));
%>
	<script>
		alert("로그인 성공 \n홈페이지로 이동합니다.");
		location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
<%		
	}
%>
