<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#content{
		height:500px;
	}
</style>
</head>
<body>

<!-- header include -->
<%@ include file="header.jspf" %>
<div id="content">
<h1>.jspf 조각파일의 데이터는 호환된다.</h1>
	username : <%=username %><br/>
	addr : <%=addr %><br/>
	<img src="/webJSP/img/01.jpg"/>
</div>

<!-- footer include -->
<%@ include file="footer.jspf" %>
</body>
</html>