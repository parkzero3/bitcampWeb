<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${logStatus=='Y' }">
	<script>
		alert("환영합니다.");
		location.href ="<%=request.getContextPath()%>/index.do";
	</script>
</c:if>
<c:if test="${logStatus == null || logStatus!='Y'}">
	<script>
		alert("로그인 실패");
		history.go(-1);
	</script>

</c:if>