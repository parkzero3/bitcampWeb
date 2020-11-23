<!-- 지시부  import-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar , java.util.Scanner" %>
<%@ page import="java.io.InputStream" %>
<%@ page trimDirectiveWhitespaces="true" %><!-- jsp코드 빈자리 제거 -->


<!-- 선언부 생성 메소드 또는 변수를 선언하는곳 -->
<%!
	public String gugudan(int dan){
		String guguDan = "<ul>";
		for(int i =1 ; i <=9 ; i++){
			guguDan +="<li>"+dan+"*"+i+"="+(dan*i)+"</li>";
		}
		guguDan +="</ul>";
		return guguDan;
	}
	public int multiple(int a, int b){
		return a*b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{width : 200px ; height :200px;}
</style>
<script>
	document.write("<h2> JAVASCRIPT </h2>");
</script>
</head>
<body>
<h1> JSP HOME : <%=session.getId() %></h1>
<% 
// 오브젝트로 반환하기때문에 스트링으로 형변환 시켜야함
String logStatus = (String)session.getAttribute("logStatus");
if(logStatus == null || logStatus.equals("")){ %>
<a href="<%=request.getContextPath()%>/response/login.html">로그인</a>
<a href="<%=request.getContextPath()%>/register/regForm.jsp">회원가입</a>
<% }else if(logStatus != null && logStatus.equals("Y")){ %>
	<%=session.getAttribute("username") %><a href="<%=request.getContextPath()%>/response/logout.jsp">로그아웃</a>
<%}%>
<hr/>
<ul>
	<li><a href="<%=request.getContextPath() %>/freeboard/boardList.jsp">게시판</a></li>
</ul>
<hr/>
	<!---------------------------------------------------------
	JSTL (JSP Standard Tag Library)
	https://tomcat.apache.org/taglibs/standard/ 에서
	1.1
	binaries/ 
	jakarta-taglibs-standard-1.1.2.zip  다운
	압축 풀고 lib 폴더이동  
	jar 파일(2개) WEB-INF /lib 폴더안에 복사
	
	사용할 페이지 지시부에 작성
	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
	 ---------------------------------------------------------->
	<ul>
		<li><a href="/webJSP/jstl/jstl01_setTag.jsp">set Tag </a>: 변수를 선언하고 값을 보관또는 삭제</li>
		<li><a href="/webJSP/jstl/jstl02_ifTag.jsp?username=홍길동&age=30&userid=kamja">if Tag</a> : 조건문</li>
		<li><a href="/webJSP/jstl/jstl03_forEachTag.jsp">forEach Tag</a>: 반복문 </li>
		<li><a href="/webJSP/jstl/jstl04_forTokensTag.jsp">forTokens Tag</a> : 문자열을 특정기호로 자른다 </li>
		<li><a href="/webJSP/jstl/jstl05_urlTag.jsp">url Tag</a> :url 주소와 파라미터의 정보를 가진다. </li>
		<li><a href="/webJSP/jstl/jstl06_chooseTag.jsp?username=홍길동1&age=14">choose Tag</a>: 다중if문 , switch문 </li>
		<li><a href="/webJSP/jstl/jstl07_redirectTag.jsp">redirect Tag</a> : 페이지 이동 </li>
	</ul>

<!-- 스크립트릿  -->
<%
	int a = 200;
%>
<!--  				/webJSP   		-->
<img src ="<%=request.getContextPath() %>/img/01.jpg"/>

<%
	int result = a*1000;
//	JSP 에서 output 내장객체는 클라이언트에게 response 한다.
	out.println("<div style='background-color:pink'>result="+result+"</div>");

// 오늘날짜

	Calendar now = Calendar.getInstance();//날짜와 시간정보
	
	int month = now.get(Calendar.MONTH)+1;
	int day = now.get(Calendar.DAY_OF_MONTH);
	out.println("<h1>오늘은"+month+"월"+day+"일 입니다.</h1>");
%>
<hr/>
<%
	// 선언부에 생성되있는 메소드 호출하기
	out.println(gugudan(7));
	out.println("곱한값="+multiple(1234,5678));
	System.out.println("gob="+multiple(500,400));
%>
</body>
</html>