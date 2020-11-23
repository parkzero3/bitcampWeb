<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result>0 }">
	<script>
		alert("회원탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
		location.href ="<%=request.getContextPath()%>/index.do";
	</script>
</c:if>

<c:if test="${result<=0 }">
	<script>
		alert("회원탈퇴가 실패하였습니다. 비밀번호를 다시 확인해주세요");
		history.back();
	</script>
</c:if>