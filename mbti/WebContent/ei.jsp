<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8"); //한글깨짐방지
	String first = request.getParameter("first");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫번째 질문!</title>
</head>
<body>
<%=id %>
<h1>처음보는 사람과 어색한 상황에서 당신은?</h1>
<form action="sn.jsp" method="post">
	<button value="e" name="first" onclick="location='sn.jsp'">반가워! 먼저 말을 건다!</button>
	<button value="i" name="first" onclick="location='sn.jsp'">어색해,, 먼저 말을 걸어줄 때까지 기다린다..</button>
</form>
</body>
</html>