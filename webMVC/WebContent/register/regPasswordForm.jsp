<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${logStatus==null == logstatus!='Y' }">
	<script>
		location.href="<%=request.getContextPath()%>/login.do"
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, inial-scale=1"/>

<link rel="stylesheet" href="/webMVC/library/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webMVC/library/bootstrap.js"></script> 
<script src="/webMVC/library/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		$("#leaveFrm").submit(function(){
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
<div class="container">
	<%@ include file = "../inc/top.jspf" %>
	<div>
		<form method="post" id="leaveFrm" action="<%=request.getContextPath()%>/register/regLeaveFormOk.do">
		비밀번호 입력 : <input type="password" name="userpwd" id="userpwd"/>
						<input type="submit" value="회원탈퇴하기"/>
		</form>
	</div>
</div>
</body>
</html>
