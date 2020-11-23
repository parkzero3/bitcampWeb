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
<h1> forTokensTag : 문자열을 이용한 반복문 처리하기 </h1>
<!-- delims : 자를기호 입력 (여러글자 적용가능) -->
<c:forTokens var="i" items="빨강색,노랑색,^^^파랑색,검정색" delims=",.^">
[${i}]<br/>
</c:forTokens>
</body>
</html>