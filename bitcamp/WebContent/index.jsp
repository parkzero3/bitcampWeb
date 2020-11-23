<%@page import="com.bitcamp.freeboard.FreeboardDAO"%>
<%@page import="com.bitcamp.freeboard.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>서울 특별시 </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device, inial-scale=1"/>
<link rel="stylesheet" href="api/jquery.bxslider.css" type="text/css"/>
<link rel="stylesheet" href="api/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="api/jquery.bxslider.js"></script>
<script src="api/bootstrap.min.js"></script>

<style>
#A {
	width: 800px;
	margin: 0 auto;
	padding: 0px;
}

#loginFrm {
	float: right;
}

#menu>li a {
	color: white;
}

#menu>li a:hover {
	text-decoration: none;
	color: red;
}

#logo, #menu {
	text-align: center;
}

#logo {
	padding: 50px 50px 35px 50px;
}

ul, li {
	margin: 0px auto;
	padding: 0px;
	list-style-type: none;
}

#menuchk li {
	width: 160px;
	line-height: 50px;
}

.submenu li {
	line-height: 10px;
	background-color: #48679C;
}

#menuchk, #menu {
	background-color: #48679C;
	height: 50px;
	width: 800px;
	font-size: 20px;
}

#menuchk {
	z-index: 1000;
	position: relative;
}

#menu>li {
	float: left;
	line-height: 50px;
}

#menu
	.submenu {
	position: absolute;
	opacity: 0;
	visibility: hidden;
}

#menu>li:hover .submenu {
	opacity: 1;
	visibility: visible;
}

#content {
	width: 800px;
}

#bxslider img {
	width: 800px;
	height: 450px;
}

.log {
	color: gray;
}

#lst>li {
	float: left;
	line-height: 35px;
	height: 35px;
	border-bottom: 1px solid gray;
	width: 10%;
}

#lst>li a {
	color: black;
}

#lst>li:nth-of-type(5n+2) {
	width: 55%;
}

#lst>li:nth-of-type(5n+4) {
	width: 15%;
}

/* wordCut 초과되는 글자를 ... 처리 */
.wordCut {
	white-space: nowrap; /* 줄바꿈 안함 */
	overflow: hidden; /* 글 초과시 숨기기 */
	text-overflow: ellipsis; /* 초과된 부분을 ... 처리 */
}
/* 페이지 매기기 */
#paging ul {
	height: 40px;
	text-align: center;
	width: 100%;
	overflow: auto;
}

#paging li {
	display: inline-block;
	width: 30px;
	height: 20px;
	font-size: 12px;
	text-align: center;
	border: 1px solid gray;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#bxslider").bxSlider({
			mode : "horizontal", //화면전환방법 'horizontal' 'vertical' 'fade'
			slideWidth : 800,
			slideHeight : 500,
			speed : 2000, //전환속도
			auto : true, //(true,false)
			pager : true, //페이징 
			randomStart : true, //시작슬라이드를 랜덤(true,false)
			captions : true, //title 속성의 값을 설명으로 표시한다.(true,false)
			infiniteLoop : true, //반복여부
			hideControlOnEnd : true, //처음과 마지막에 컨트롤러 표시여부 설정(true,false)
			useCSS : false, //easing사용여부 설정(true,false)

		});
		$('#chk').on("change", function() {
			$('#lst input').prop("checked", $("#chk").prop("checked"));
		});

		$(function() {
			$("#frm").submit(function() {
				if ($("#userid").val() == "") {
					alert("아이디를 입력하세요");
					return false;
				}
				if ($("#userpwd").val() == "") {
					alert("비밀번호를 입력하세요");
					return false;
				}
				return true;
			});
		});

	});
</script>
</head>
<body>
<div id="A" class="container">	
	<section id="loginFrm">
		<c:if test="${logStatus ne 'Y' }">
			<form method="post" action="response/loginOk.jsp" id="frm">
				<input type="text" name="userid" maxlength="20" placeholder=" 아이디입력" />
				<input type="password" name="userpwd" maxlength="20"placeholder=" 비밀번호 입력" /> 
				<input type="submit" value="로그인" /> <a href="#" style="color:gray;">회원가입</a> 
				<a href="https://eungdapso.seoul.go.kr/" style="color:gray;">고객센터</a>
			</form>
		</c:if>
		<c:if test="${logStatus eq 'Y' }">
			<input type="text" name="userid" value="${username }님 로그인 하셨습니다." style="border:none; width:150px; font-size: 11px;" readonly/>
			<input type="button" onClick="location.href='response/logout.jsp'" value="로그아웃" />
		</c:if>
	</section>	
		<section id="logo">
		<a href="https://www.seoul.go.kr/main/index.jsp"><img src="img/seoul.png"/></a>
		</section>
	<div id="menuchk">
			<ul id="menu">
				<li><a href="#">나의서울</a></li>
				<li><a href="#">전자우편</a></li>
				<li><a href="#">서울소개</a>
					<ul class="submenu">
						<li><a href="#">시청안내</a></li>
						<li><a href="#">서울의상징</a></li>
						<li><a href="#">서울의역사</a></li>
						<li><a href="#">서울정보</a></li>
					</ul>
				</li>					
				<li><a href="#">시민참여</a>
					<ul class="submenu">
						<li><a href="#">서울시민과의대화</a></li>
						<li><a href="#">시민의견</a></li>
						<li><a href="#">공모전</a></li>
						
					</ul>
				</li>
				<li><a href="#">청사안내</a>
					<ul class="submenu">
						<li><a href="#">조직도</a></li>
						<li><a href="#">시의회</a></li>
						<li><a href="#">자치구</a></li>					
					</ul>
				</li>	
			</ul>		
	</div>			
	<div id="content">      
	      <ul id="bxslider">
	         <li><a href="#"><img src="img/banner1.jpg" title="seoul music festival"></a></li>
	         <li><a href="#"><img src="img/banner2.jpg" title="SIBAC 2019"></a></li>
	         <li><a href="#"><img src="img/banner3.jpg" title="2019 서울전환도시 국제컨퍼런스"></a></li>
	         <li><a href="#"><img src="img/banner4.jpg" title="2019 다다다 발표대회"></a></li>
	         <li><a href="#"><img src="img/banner5.jpg" title="2019 서울인공지능챗본론"></a></li>
	         <li><a href="#"><img src="img/banner6.jpg" title="서울차 없는 날"></a></li>
	         <li><a href="#"><img src="img/banner7.jpg" title="Zero 제로페이 미국 캐나다 이벤트"></a></li>
	         <li><a href="#"><img src="img/banner8.jpg" title="우리여행 고고고 페스티벌"></a></li>
	      </ul>
	</div>
<!-- 게시판 -->
 <%
	
   FreeboardDAO dao = new FreeboardDAO();
   //-------------------------------------------------   
   int totalRecord = dao.getTotalRecord(); //총레코드수
   int onePageRecord = 5;//한페이지당 출력할 레코드수
   int nowPage =1;//현재 보고있는 페이지
   int totalPage = 0; //총페이지 수
   int onePageNum = 5; // 한번에 표시할 표시할 페이지 수
   int startPage = 1; // 페이지번호의 시작번호
   
   //--------------------------------------------------
   String nowPageStr = request.getParameter("nowPage");
   if(nowPageStr != null){
      nowPage = Integer.parseInt(nowPageStr);
   }
   //총페이지수  ( 총레코드수 + 페이지당 출력할 레코드 수 있으면 가능)
   totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);   
   //페이지 번호의 시작번호 구하기
   startPage = ((nowPage-1)/onePageNum*onePageNum)+1;
   
   //전체 레코드 구하기
   List<FreeboardVO> list = dao.getAllRecord(nowPage,onePageRecord,totalPage,totalRecord);
   
   
   %>
	<div id="board" style="text-decoration:none;">
		<h1 style="text-align:center; color: gray;">자유게시판</h1>
		<input type="checkbox" id="chk" name="chk">  &nbsp;전체선택
			<ul id="lst">
			
				<li>&nbsp;&nbsp;&nbsp;&nbsp;번호</li>
				<li>제목</li>
				<li>작성자</li>
				<li>작성일</li>
				<li>조회수</li>
	
			<% for(int i=0; i<list.size(); i++){ 
	         FreeboardVO vo = list.get(i);
	      	%>
	      		
				<li><input type="checkbox" name="chk">  &nbsp;<%=vo.getNo() %></li>
				<li class="wordCut"><a href="/bitcamp/freeboard/boardView.jsp?no=<%=vo.getNo()%>&nowPage=<%=nowPage%>"><%=vo.getSubject() %></a></li>
				<li><%=vo.getUsername() %></li>
				<li><%=vo.getWritedate() %></li>
				<li><%=vo.getHit() %></li>
			<%} %>
			</ul>
		<div id="paging">
			<ul>
				<!-- 이전페이지 -->
				<li>
					<% if(nowPage==1){ %> Prev <%}else{ %> <a
					href="index.jsp?nowPage=<%=nowPage-1%>">Prev</a>
					<%} %>
				</li>
				<!-- 페이지 넘버 매기기 -->
				<% for(int p=startPage; p<startPage+onePageNum;p++){ 
            if(p<=totalPage){
               if(p==nowPage){
         %>
				<li><a href="index.jsp?nowPage=<%=p%>"
					style="color: red"><%=p %></a></li>
				<%}else{%>
				<li><a href="index.jsp?nowPage=<%=p%>"><%=p %></a>
				</li>
				<%       
               }
            } //if 
         }// for %>
				<!-- 다음 페이지 -->
				<li>
					<%   if(nowPage!=totalPage){ //다음페이지가 없을 경우
            %> <a
					href="index.jsp?nowPage=<%=nowPage+1%>">Next</a>
					<% } %>
				</li>
			</ul>
		</div>
	</div>
	<footer >
      <%@ include file="inc/footer.jspf" %>
   </footer>
</div>   
</body>
</html>