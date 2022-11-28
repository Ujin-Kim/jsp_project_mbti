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
<title>두번째 질문!</title>
</head>
<body>
<%=id %>
<h1>좀비가 세상을 지배하면 어떡하지?</h1>
<form action="tf.jsp" method="post">
	<input type="hidden" name="first" value=<%=first %>>
	
	<button value="s" name="second" onclick="location='tf.jsp'">그럴 일 없어;</button>
	<button value="n" name="second" onclick="location='tf.jsp'">헉.. 그렇게 되면 나는 뭘 가장 먼저 해야하지?</button>
</form>
</body>
</html>