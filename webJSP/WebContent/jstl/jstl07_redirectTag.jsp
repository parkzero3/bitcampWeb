<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 자동으로 다른페이지 이동 -->
<c:redirect url="/freeboard/boardList.jsp">
	<c:param name="nowPage" value="4"/>
</c:redirect>