<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8"); //한글깨짐방지
	String first = request.getParameter("first");
	String second = request.getParameter("second");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세번째 질문!</title>
</head>
<body>
<%=id %>
<h1>친구가 약속시간에 늦었다면?</h1>
<form action="jp.jsp" method="post">
	<input type="hidden" name="first" value=<%=first %>>
	<input type="hidden" name="second" value=<%=second %>>
	<button value="t" name="third" onclick="location='jp.jsp'">왜 늦었는지 궁금해!</button>
	<button value="f" name="third" onclick="location='jp.jsp'">미안하다고 사과 먼저했으면 좋겠어!</button>
</form>
</body>
</html>