<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8"); //한글깨짐방지
	String first = request.getParameter("first");
	String second = request.getParameter("second");
	String third = request.getParameter("third");
	String fourth = request.getParameter("fourth");
	
	String mbti = first + second + third + fourth;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 전송</title>
</head>
<body>
<h1>테스트가 완료되었습니다.</h1>
<form action="result.jsp" method="post">
	<input type="hidden" name="id" id="id" value=<%=id %>>
	<input type="hidden" name="mbti" id="mbti" value=<%=mbti %>>
	<input type="submit" value="결과보기">
</form>
</body>
</html>



