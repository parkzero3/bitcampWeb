<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<h1>Choose Tag : 다중 if문  switch문과 동일 </h1>

<c:choose>
	<c:when test="${param.username=='홍길동' }">
		당신의 이름은 ${param.username }입니다.<br/>
	</c:when>
	<c:when test="${param.age>=20 }">
		당신의 나이는 20세 이상입니다.<br/>
	</c:when>
	<c:otherwise>
	<!-- 만족하는 조건이 없을 때 -->
		당신의 이름은 홍길동이 아니며, 나이는 20세 이하입니다.<br/>
	</c:otherwise>
</c:choose>
</body>
</html>