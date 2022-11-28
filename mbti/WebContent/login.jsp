<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>로그인 하기</h1>
	<form action="loginProc.jsp" method="post">
		<p>아이디 : <input name="id"></p>
		<p>비밀번호 : <input type="password" name="pwd"></p>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
</body>
</html>