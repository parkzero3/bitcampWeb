<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h1>url태그: url주소와 파라미터의 값을 가지는 태그</h1>
<c:url var="nate" value="http://www.nate.com"/>
<c:url var="index" value="/index.jsp"/>
<!-- 파라메터를 넣어서 보내기 -->
<c:url var="board" value="/freeboard/boardList.jsp">
	<c:param name="nowPage" value="3"/>
	<c:param name="searchWord" value="손흥민"/>
</c:url>
<c:url var="login" value="/response/login.jsp"/>

${nate}<br/>
${index }<br/>
${board }<br/>
${login }<br/> 
<a href="${index }">홈</a>
<a href="${nate }">네이트</a>
<a href="${board }">게시판리스트</a>
<a href="${login }">로그인</a>
</body>
</html>