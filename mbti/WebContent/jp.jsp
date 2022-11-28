<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8"); //한글깨짐방지
	String first = request.getParameter("first");
	String second = request.getParameter("second");
	String third = request.getParameter("third");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마지막 질문!</title>
</head>
<body>
<%=id %>
<h1>당신의 과제하는 스타일은?</h1>
<form action="resultform.jsp" method="post">
	<input type="hidden" name="first" value=<%=first %>>
	<input type="hidden" name="second" value=<%=second %>>
	<input type="hidden" name="third" value=<%=third %>>
	<button value="j" name="fourth" onclick="location='resultform.jsp'">과제부터 다하고 놀자!</button>
	<button value="p" name="fourth" onclick="location='resultform.jsp'">과제는 이따 할래, 먼저 놀자!</button>
</form>
</body>
</html>