<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String) session.getAttribute("id");
	if(id==null){
%>
	<script>
		alert("로그인이 되지 않아서 로그인 페이지로 이동합니다.");
		location.href = "login.jsp";
	</script>
<%
		return; //위에까지만 실행하고 밑에 html은 실행하지 않는다.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
</head>
<body>
	<%=id %>님. 어서오세요!
	
	<h1>게임 하러가기</h1>
	<a href="ei.jsp">START</a>
	<br>
	<br>
	<h1>나의 역대 MBTI 확인하기</h1>
	<a href="history.jsp">HISTORY</a>
	<br>
	<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>