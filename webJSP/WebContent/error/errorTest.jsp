<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form action="errorTest.jsp">
	수 1 : <input type="text" name="su1"/>
	수 2 : <input type="text" name="su2"/>
	<input type="submit" value="계산"/>
</form>
<div>
	<%
		String su1 = request.getParameter("su1");
		String su2 = request.getParameter("su2");
		if(su1 != null && su2 != null){	
			int su1Int = Integer.parseInt(su1);
			int su2Int = Integer.parseInt(su2);
			
			int add = su1Int + su2Int ;
			int minus = su1Int - su2Int ;
		%>
			<h2><%=su1%>+<%=su2%>=<%=add%></h2>
			<h2><%=su1%>-<%=su2%>=<%=minus%></h2>
		<%}%>
</div>
</body>
</html>