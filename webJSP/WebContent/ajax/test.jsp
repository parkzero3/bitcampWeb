<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String tel = request.getParameter("tel");
%>
	<h1> 서버에서 ajax 받은 데이터</h1>
	이름 : <%=username %><br/>
	연락처 : <%=tel %><br/>
	주소 : 서울시 마포구 백범로<br/>
	
</body>
</html>