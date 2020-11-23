<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${pVo.searchWord != null }">
	<c:set var="paramData">&searchKey=${pVo.searchKey }&searchWord=${pVo.searchWord }</c:set>
</c:if>

<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webMVC/library/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webMVC/library/bootstrap.js"></script> 
<meta charset="UTF-8">

<script>
	function delCheck(){
		if(confirm("글을 삭제하시겠습니까")){
			location.href="/webMVC/board/boardDelete.do?no=${vo.no}&nowPage=${pVo.nowPage}${paramData}";
		}
	}

</script>
</head>
<body>
<div class="container">
<%@ include file ="../inc/top.jspf" %>
<h1>글내용보기	</h1>
<ul>
	<li>번호</li>
	<li>${vo.no }</li>
	<li>작성자</li>
	<li>${vo.userid }</li>
	<li>조회수</li>
	<li>${vo.hit }</li>
	<li>등록일</li>
	<li>${vo.writedate }</li>
	<li>제목</li>
	<li>${vo.subject }
	<li>글내용</li>
	<li>${vo.content }</li>
	
</ul>
<a href="/webMVC/index.do">홈</a>
<a href="<%=request.getContextPath() %>/board/boardList.do?nowPage=${pVo.nowPage}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">목록</a>

<c:if test="${logStatus!=null && logStatus=='Y'&& vo.userid==logId}">
	<a href="<%=request.getContextPath()%>/board/boardEdit.do?no=${vo.no}&nowPage=${pVo.nowPage}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">수정</a>
	<!--  <a href="<%=request.getContextPath()%>/board/boardDelete.do?no=${vo.no}&nowPage=${pVo.nowPage}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">삭제</a> -->
	<a href="javascript:delCheck()">삭제</a>
</c:if>
</div>
</body>
</html>