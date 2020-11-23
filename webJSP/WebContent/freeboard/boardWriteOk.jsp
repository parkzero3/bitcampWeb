<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bitcamp.freeboard.FreeboardVO" %>
<%@ page import="com.bitcamp.freeboard.FreeboardDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	//1. request
	FreeboardVO vo = new FreeboardVO();
	
	vo.setSubject(request.getParameter("subject"));
	vo.setContent(request.getParameter("content"));
	
	vo.setUserid((String)session.getAttribute("userid"));
	vo.setIp(request.getRemoteAddr());
	
	//2.DB작업
	FreeboardDAO dao = new FreeboardDAO();
	int cnt = dao.boardInsertRecord(vo);
	if(cnt>0){	//등록이 됨 ... ->게시판 목록
		%>
		<script>
			alert("글이 등록되었습니다.");
			location.href="<%=request.getContextPath()%>/freeboard/boardList.jsp";
		</script>
		<%
	}else{	// 등록이 실패함 -> 글쓰기 폼으로(이전페이지)
		%>
		<script>
			alert("글 등록 실패하였습니다.");
			history.back();
		</script>
		<%
	}
	
%>
	