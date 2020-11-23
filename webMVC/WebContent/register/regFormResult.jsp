<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result==0}">
	<script>
		alert("회원가입실패 하였습니다.");
		history.back();//이전 내용 담고있슴.
	</script>
</c:if>

<c:if test="${result>0}">
	<script>
		alert("회원가입성공 하였습니다.");
		location.href ="<%=request.getContextPath()%>/index.do";
	</script>
</c:if>