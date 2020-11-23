<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(function(){
		$("#btn").click(function(){
			/*  쿠키 기록하기 (자바스크립트로 기록하기) */
			var now = new Date();
			document.cookie="food=pizza;path=/;expires="+now.setDate(now.getDate()+7);
			now = new Date();
			document.cookie="language=java;path=/;expires="+now.setDate(now.getDate()+1);
		});
	});
</script>

<% 
	//서버에서 제일먼저 jsp가 실행됨
	//쿠키 기록하기 (JSP로 기록하기)
					//			변수 	,	값	
	Cookie cook = new Cookie("username","홍길동");
	cook.setMaxAge(5*60); // 쿠키의 소멸시점 지정하기 (초단위 ex 하루 = 24*60*60)
	
	response.addCookie(cook); // 쿠키로 기록
%>
</head>
<body>
<input type="button" value="버튼을 클릭시 쿠키생성(javascript)" id="btn"/>
</body>
</html>