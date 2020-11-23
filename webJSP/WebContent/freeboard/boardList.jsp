<%@page import="com.bitcamp.freeboard.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitcamp.freeboard.FreeboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<meta name="viewport" content="width=device, initial-scale=1"/> 
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webJSP/etc/bootstrap.js"></script>
<script src="/webJSP/etc/ckeditor/ckeditor.js"></script>
<style>
	ul, li {margin:0;padding:0;list-style-type:none;}
	#lst>li{
		float:left; line-height:35px; height:35px; border-bottom:1px solid gray;
		width:10%;
	}
	#lst>li:nth-of-type(5n+2){width:60%;}
	
	/* wordCut 초과되는 글자를 ... 처리 */
	.wordCut{
		white-space:nowrap; /* 줄바꿈 안함 */
		overflow : hidden; /* 글 초과시 숨기기 */
		text-overflow:ellipsis;/* 초과된 부분을 ... 처리 */
	}
	/* 페이지 매기기 */
	#paging ul{
		height:40px; text-align:center; width:100%; overflow:auto;
	}
	#paging li{
		float:left; width:60px; height:40px; text-align:center; font-size:1.3em;
	}
	
</style>
</head>
<body>
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
<div class="container">
	<h1>게시판</h1>
	<div>총 레코드수 : <%=totalRecord %>개 </div>
	<div>page : <%=nowPage %>/<%=totalPage %> </div>
	<ul id="lst">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<% for(int i=0; i<list.size(); i++){ 
			FreeboardVO vo = list.get(i);
		%>
			<li><%=vo.getNo() %></li>
			<li class="wordCut"><a href="/webJSP/freeboard/boardView.jsp?no=<%=vo.getNo()%>&nowPage=<%=nowPage%>"><%=vo.getSubject() %></a></li>
			<li><%=vo.getUserid() %></li>
			<li><%=vo.getWritedate() %></li>
			<li><%=vo.getHit() %></li>
		<%} %>
	</ul>
	<div id="paging">
		<ul>
			<!-- 이전페이지 -->
			<li>
			<% if(nowPage==1){ %>
				Prev
			<%}else{ %>
			<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=nowPage-1%>">Prev</a>
			<%} %>
			</li>
			<!-- 페이지 넘버 매기기 -->
			<% for(int p=startPage; p<startPage+onePageNum;p++){ 
				if(p<=totalPage){
					if(p==nowPage){
			%>
			<li>
				<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=p%>" style="color:red"><%=p %></a>
			</li>
			<% 		}else{		%>
				<li>
				<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=p%>"><%=p %></a>
				</li>
			<% 		
					}
				} //if 
			}// for %>
			<!-- 다음 페이지 -->
				<li>
				<%	if(nowPage!=totalPage){ //다음페이지가 없을 경우
				%>
					<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=nowPage+1%>">Next</a>
				<% } %>
				
				</li>
		</ul>
	</div>
	<div>
		<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
		<a href="<%=request.getContextPath()%>/freeboard/boardWrite.jsp">글쓰기</a>
	</div>
</div>
</body>
</html>