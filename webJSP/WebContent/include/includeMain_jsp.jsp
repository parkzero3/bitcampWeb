<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#content{
		height:600px;
	}
</style>
</head>
<body>
<!-- header.jsp include -->
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content">
	<!-- .jsp include 된 경우 데이터 호환이 되지않는다. -->
		name : <%//=name %><br/>
		num : <%//=num %><br/>
		<img src="/webJSP/img/01.jpg"/>
	</div>
<!-- footer.jsp include -->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>