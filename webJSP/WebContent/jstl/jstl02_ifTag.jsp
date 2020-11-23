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
<h1>if Tag 사용하기</h1>

<c:set var="data1" value="${1234}"/>
<c:set var="num" value="${1000}"/>

<!-- 조건식 세우기 -->
<c:if test="${true}">
	<b style="color:green"> 무조건 실행됨 HTML 태그 사용가능</b>
</c:if>

<c:if test="${data1>num}">
	<h2>data1 이 num 보다 큰값이다.</h2>
</c:if>

<hr/>
<!-- 이전페이지에서 보낸 데이터를 가져올때 : request.getParameter("변수명") = ${param.username } -->

<!-- JSTL 로 request 하는법 -->
이름 : ${param.username } <br/>
나이 : ${param.age+10 } <br/>
아이디 : ${param.userid } <br/>

</body>
</html>













