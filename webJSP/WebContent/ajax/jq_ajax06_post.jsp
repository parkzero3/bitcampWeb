<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, inial-scale=1"/>

<link rel="stylesheet" href="/webJSP/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webJSP/etc/bootstrap.js"></script> 
<script src="/webJSP/etc/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		$("#startPost").click(function(){
			//호출할파일 ,서버로 보낼데이터
			$.post("test.jsp",{
				username:'손흥민',
				tel : '010-5555-7777'
			},function(data,status){
				if(status=='success'){
					$("#result").append(data);
				}
			});
		});
	});

</script>
</head>
<body>
<div class="container">
	<h1> POST 방식으로 서버에 비동기식으로 접속하여 정보 얻어오기</h1>
	<button id ="startPost">클릭(POST)</button>
	<div id="result"></div>
</div>
</body>
</html>