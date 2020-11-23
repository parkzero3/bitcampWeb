<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${pVo.searchWord!=null }">
	<c:set var="url">&searchKey=${pVo.searchKey }&searchWord=${pVo.searchWord }</c:set>
</c:if>

<c:if test="${result<=0 }">
	<script>
		alert("글 삭제가 실패하였습니다.")
		history.back();
	</script>
</c:if>

<c:if test="${result>0 }">
	<script>
		alert("해당 글이 삭제되었습니다.");
		location.href="<%=request.getContextPath()%>/board/boardList.do?nowPage=${pVo.nowPage}${url}"
	</script>
</c:if>