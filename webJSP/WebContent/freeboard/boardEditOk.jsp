<%@page import="com.bitcamp.freeboard.FreeboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //get 방식은 상관없지만 post 는 작성해야함

	int no = Integer.parseInt(request.getParameter("no"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));

	FreeboardDAO dao = new FreeboardDAO();
	int result = dao.getUpdateRecord(no, subject, content);
	
	if(result>0){
		%>
		<script>
			alert("글이 수정되었습니다.");
			location.href="<%=request.getContextPath()%>/freeboard/boardView.jsp?no=<%=no%>&nowPage=<%=nowPage%>";
		</script>
		<%
	}else{
		%>
		<script>
			alert("글 수정이 실패 하였습니다.");
			history.back();
		</script>
		<%
	}
%>