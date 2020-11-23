<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h2>에러가 발생하였습니다.</h2>
<div>
	에러 메세지 : <%=exception.getMessage()%>
</div>
<img src="<%=request.getContextPath()%>/img/error2.jpg"/>
</body>
</html>