<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<style>
	#content li{float:left; width:10%; border-bottom:1px solid gray; line-height:40px;}
	#content li:nth-of-type(6n+2){width:50%;}
</style>
	<script>
		$(function(){
			$("#content img").click(function(){
				var url = "/webMVC/data/downloadCount.do";
				//레코드번호 알아내기
				
				var params = "no="+$(this).attr("alt");
				var owner = $(this).parent().parent().next();
				
				console.log(params);
				$.ajax({
					url: url,
					data: params,
					success: function(result){
						
						owner.text(result.trim());
						
					} ,error:function(e){
						console.log(e.responseText);
					}
				});
			});
		});
	
	</script>

</head>
<body>
	<div class="container">
		<%@ include file="../inc/top.jspf" %>
		<h1>자료실 목록</h1>
		<div id="content">
			<ul>
				<li>번호</li>
				<li>제목</li>
				<li>작성자</li>
				<li>첨부파일</li>
				<li>다운로드횟수</li>
				<li>등록일</li>
				<c:forEach var="vo" items="${list }">
					<li>${vo.no }</li>
					<li><a href="<%=request.getContextPath()%>/data/dataView.do?no=${vo.no}">${vo.title }</a></li>
					<li>${vo.userid }</li>
					<li>
						<!-- 첨부파일 -->
						<c:forEach var="f" items="${vo.filename }">
						<c:if test="${f!=null }">
						<a href="<%=request.getContextPath()%>/upload/${f}" download><img src="<%=request.getContextPath()%>/img/disk.png" title="${f}" alt="${vo.no }"/></a>
						</c:if>
						</c:forEach>		
					</li>
					<li>${vo.downcount }</li>
					<li>${vo.writedate }</li>		
				</c:forEach>			
			</ul>	
		</div>	<!-- #content -->
		<div>
		<br/>
		<c:if test="${logStatus != null && logStatus=='Y' }"> 
		<a href="<%=request.getContextPath()%>/data/dataWriteForm.do">자료올리기</a>
		</c:if>
		</div>
	</div>
</body>
</html>

<!-- 
	파일업로드를 가능하게 하는 프레임워크 
	
	servlets.com >> COS File Upload Library 클릭 >>
	cos-20.08.zip 다운로드 >> cos.jar 파일 >> WEB-INF / lib 안에 복사한다.
	
 -->