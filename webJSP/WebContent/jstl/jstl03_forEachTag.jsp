<%@page import="java.util.HashMap"%>
<%@page import="com.bitcamp.freeboard.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

<h1>forEach : 반복문 </h1>

<c:set var="dan" value ="${7 }"></c:set>

<!-- for(int i =0; i<10; i++) 

			변수	초기값	 최종값	  증가값(1씩 증가시 step 생략가능)-->
<c:forEach var="i" begin="1" end="9" step="1">
	${dan } * ${i } = ${dan*i } <br/>
</c:forEach>

<h1>배열을 이용한 반복문</h1>
<c:set var="arr" value="<%= new int[]{12,12,66,77,32,6,7,88,33,11} %>"></c:set>
<c:forEach var="data" items="${arr }">
	[${data}]
</c:forEach>
<h1>컬렉션의 데이터를 이용한 반복문</h1>

<%
	List<String> list = new ArrayList<String>();
	list.add("홍길동");
	list.add("김길동");
	list.add("박길동");
	list.add("이길동");
	list.add("최길동");
	list.add("윤길동");
	list.add("신길동");
%>
<c:set var ="data2" value="<%=list %>"></c:set>
<ul>
	<c:forEach var="name" items="${data2}">
		<li>${name }</li>
	</c:forEach>	
</ul>
<%
	List<FreeboardVO> freeList = new ArrayList<FreeboardVO>();
	freeList.add(new FreeboardVO(1,"글제목","kim1234"));
	freeList.add(new FreeboardVO(23,"바람","hong1234"));
	freeList.add(new FreeboardVO(15,"겨울","hong1234"));
%>
<ol>
	<c:forEach var="i" items="<%=freeList %>">
		<li>${i.no},${i.subject},${i.userid}</li>
	</c:forEach>
</ol>

<h1>hashMap의 데이터를 이용한 반복문</h1>

<%
	HashMap<String,String> hm = new HashMap<String,String>();
	hm.put("name","홍길동");
	hm.put("tel","010-1234-1234");
	hm.put("addr","서울시 마포구 백범로 23");
%>

<c:forEach var="mapData" items="<%=hm %>">
	<li>${mapData.key}:${mapData.value }</li>
</c:forEach>
</body>
</html>















