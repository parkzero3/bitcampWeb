<%@page import="com.bitcamp.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//request
	request.setCharacterEncoding("UTF-8");
%>
<!-- requset VO 빈즈로 사용시 

	RegisterVO 객체생성 
	RegisterVO vo = new RegisterVO();
	
	id : 변수
	class : 객체생성할 클래스 (경로를 작성)
	scope : application (서버시작과 동시에생성)
			session (접속시), page(페이지내에서사용시), request (전페이지에서 값을 가져올 시)
			
	setProperty : 이전페이지의 데이터를 request 한다.
	property = "*" : 입력시 전체를 request (name)값이 같은것만해당 / 변수명을 입력시 해당 변수만 request		
-->
<jsp:useBean id="vo" class="com.bitcamp.register.RegisterVO" scope="page"/>
<!-- request 빈즈로 사용시 -->
<jsp:setProperty name="vo" property="*"/>
<%
	RegisterDAO dao = new RegisterDAO();
	int cnt = dao.memberInsert(vo);
	
	if(cnt>0){
		%>
			<script>
				alert("회원등록이 되었습니다.");
				location.href="/webJSP/index.jsp"
			</script>
		<%
	}else{
		%>
			<script>
				alert("회원등록이 실패하였습니다.");
				history.go(-1);
			</script>
		<%
	}
%>