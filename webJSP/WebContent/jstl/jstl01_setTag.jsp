<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 라이브러리를  사용하기 위해서는 지시부에 taglib를 표기해야함 -->
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
<h1>set태그 : 변수를 선언 한다.</h1>
<%
//JSP 변수 선언방식
	int a = 1000;
%>
<!-- jstl 변수 선언방식 -->
<c:set var="num" value="${1234}"></c:set>
<c:set var="age" value="${25}"></c:set>
<c:set var="name">세종대왕</c:set>
<c:set var="today" value="<%=new Date() %>"></c:set>
<hr/>
<h1> 변수 사용하기</h1>
num : ${num } <br/>
age : ${age } <br/>
name : ${name } <br/>
today : ${today } <br/>

<h1> 변수 삭제</h1>
<c:remove var="num" scope="page"/>
	num: ${num }
</body>
</html>
















