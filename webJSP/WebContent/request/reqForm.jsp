<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Form을 이용한 데이터 서버전송</h1>

<form action="reqFormOk.jsp" method="post">
	이름: <input type="text" name ="username" id="username/"><br/>
	아이디: <input type="text" name="userid" id="userid/"><br/>
	비밀번호: <input type="password" name="pwd" id="pwd/"><br/>
	성별: <input type="radio" name="gender" value="남"/>남
			<input type="radio" name="gender" value="여"/>여<br/>
	관심분야: <input type="checkbox" name="inter" value="농구"/>농구
			<input type="checkbox" name="inter" value="축구"/>축구
			<input type="checkbox" name="inter" value="야구"/>야구
			<input type="checkbox" name="inter" value="배구"/>배구
			<input type="checkbox" name="inter" value="탁구"/>탁구
			<input type="checkbox" name="inter" value="테니스"/>테니스
			<input type="checkbox" name="inter" value="골프"/>골프<br/>
	지역: <select name="local" id="local" >
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="대구">대구</option>
			<option value="부산">부산</option>
			<option value="광주">광주</option>
			<option value="인천">인천</option>
		</select><br/>
		<input type="submit" value="전송"/>					
	
</form>
</body>
</html>