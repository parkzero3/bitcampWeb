<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bitcamp.home.BoardDAO"%>
<%@page import="com.bitcamp.home.BoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, inial-scale=1"/>

<link rel="stylesheet" href="/webJSP/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webJSP/etc/bootstrap.js"></script> 
<script src="/webJSP/etc/ckeditor/ckeditor.js"></script>
</head>
<body>
	<h1> DBCP(커넥션풀 : DataBase Connection pool)</h1>
	<div>
		<ol>
		<%
			BoardDAO dao = new BoardDAO();
			List<BoardVO> list = dao.getAllSelect();
			
			for(int i =0; i<list.size(); i++){
				BoardVO vo = list.get(i);
				%>
					<li> <%=vo.getNo() %> ,<%=vo.getUserid() %>,<%=vo.getSubject() %>,<%=vo.getContent() %></li>
				<%
			}
		%>
		</ol>
	</div>
</body>
</html>

<!-- 
DBCP 설정하기
1. Framework 준비하기
	http://commons.apache.org 에서 다운로드 한다.
	DBCP 클릭 다운로드  > commons-dbcp2-2.8.0-bin.zip  -- commons-dbcp2-2.8.0.jar 파일 
	Collections 클릭 다운로드 > commons-collections4-4.4-bin.zip -- commons-collections4-4.4.jar 파일
	Pool 클릭 다운로드 > commons-pool2-2.9.0-bin.zip	-- commons-pool2-2.9.0.jar 파일 
2. 오라클 드라이버 다운로드
	http://oracle.com 에서 
	ojdbc6.jar
	
3. 이클립스의 WEB-INF/lib , 톰캣 /lib  (서버위치확인) 복사하기	
	ojdbc6.jar
	commons-dbcp2-2.8.0.jar
	commons-collections4-4.4.jar
	commons-pool2-2.9.0.jar
4. CLASSPATH 설정

	내피씨 고급설정 환경변수 새로만들기
	CLASSPATH
	.;%CATALINA_HOME%\lib\commons-dbcp2-2.8.0.jar;%CATALINA_HOME%\lib\commons-collections4-4.4.jar;%CATALINA_HOME%\lib\commons-pool2-2.9.0.jar;%CATALINA_HOME%\lib\ojdbc6.jar
	CATALINA_HOME
	톰캣위치경로
	
5. 톰캣서버의 config폴더 > server.xml의  <GlobalNamingResources> 태그 사이에 추가
		<Resource
		name="jdbc/myoracle" 
		auth="container"
		type="javax.sql.DataSource"
		driverClassName="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		username="scott"
		password="tiger"
		maxActive="20"
		maxIdle="10"
		maxWait="-1"/>

6. 톰캣서버의 config폴더 > context.xml 의 <Context reloadable="true"> 태그 넣은후 리소스링크 입력
		
		<ResourceLink
		global="jdbc/myoracle"
		name="jdbc/myoracle"
		type="oracle.jdbc.pool.OracleDataSource"/>

7. 이클립스의 WEB-INF / web.xml의 <web-app> 태그에 추가  </description> 밑에 생성하면됨

	<resource-ref>
		<description>Oracle Datasource example</description>
		<res-ref-name>jdbc/myoracle</res-ref-name>
		<res-type>javax.sql.DataSource</res-type>
		<res-auth>Container</res-auth>
	</resource-ref>
	
8. 톰캣의 config 폴더 > context.xml 을 이클립스의 META-INF에 복사하기	
	
	
	복사후  폴더를 연다 > 5번의 리소스 내용을 복사한후   
			6번내용앞 에 붙혀넣기한다.
	 -->