<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${logStatus==null || logStatus!='Y' }">
	<script>
		location.href="/webMVC/login.do";
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
<style>
	#title {width:100%}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		//데이터 존재유무 확인
		$("#dataForm").submit(function(){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("내용을 입력하세요");
				return false;
			}
			// 첨부파일의 수를 구한다
			var fileCount=0;
			if($("#filename1").val()!=""){
				fileCount++;
			}
			if($("#filename2").val()!=""){
				fileCount++;
			}
			if(fileCount<1){
				alert("첨부파일은 1개이상 등록되어야합니다.");
				return false;
			}
			return true;
		});			
	})
</script>
</head>
<body>
<div class="container">
	<%@ include file="../inc/top.jspf" %>
	<div>																								<!--  파일첨부시 필수기재 -->
		<form id="dataForm" method="post" action="<%=request.getContextPath()%>/data/dataWriteOk.do" enctype="multipart/form-data">
			<ul>
				<li>제목</li>
				<li><input type="text" name="title" id="title"/></li>
				<li><textarea name="content" id="content"></textarea></li>
				<li>첨부파일1 : <input type ="file" name="filename1" id="filename1"/></li>
				<li>첨부파일2 : <input type ="file" name="filename2" id="filename2"/></li>
				<li><input type="submit" value="자료올리기"/>
					<input type="reset" value="다시쓰기"/>
				</li>
			</ul>
		</form>
	</div>
</div>
</body>
</html>