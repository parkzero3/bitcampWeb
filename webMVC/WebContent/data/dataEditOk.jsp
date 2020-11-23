<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0 }">
	<script>
		//글내용으로 이동시키기
		alert("해당 글이 수정되었습니다.");
		location.href="/webMVC/data/dataView.do?no=${no}";
	</script>
</c:if>

<c:if test="${cnt<=0 }">
	<script>
		//수정 실패
		alert("해당 글의 수정이 실패하였습니다.");
		history.back();
	</script>
</c:if>