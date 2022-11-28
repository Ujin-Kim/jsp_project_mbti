<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mbti.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="mbti.MbtiDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	MbtiDAO dao = new MbtiDAO();
	int ok = dao.insertMbti(dto);
	String mbti = dto.getMbti().toUpperCase();
%>
<c:set var="dto" value="<%=dto %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="mbti.js"></script> -->
<title>결과 페이지</title>
</head>
<body>
${dto.id}님!
<h1> 당신의 MBTI는 </h1>
<div id="resultdiv" style="font-size: large;">${dto.mbti}입니다.</div>
<%
	if(mbti.equals("ENFP")){
		%>
		<img src="./img/ENFP.jpg"/>
		<%
	} else if(mbti.equals("ENFJ")){
		%>
		<img src="./img/ENFJ.png"/>
		<%
	} else if(mbti.equals("ENTJ")){
		%>
		<img src="./img/ENTJ.jpg"/>
		<%
	} else if(mbti.equals("ENTP")){
		%>
		<img src="./img/ENTP.jpg"/>
		<%
	} else if(mbti.equals("ESFJ")){
		%>
		<img src="./img/ESFJ.jpg"/>
		<%
	} else if(mbti.equals("ESFP")){
		%>
		<img src="./img/ESFP.jpg"/>
		<%
	} else if(mbti.equals("ESTJ")){
		%>
		<img src="./img/ESTJ.jpg"/>
		<%
	} else if(mbti.equals("ESTP")){
		%>
		<img src="./img/ESTP.jpg"/>
		<%
	} else if(mbti.equals("INFJ")){
		%>
		<img src="./img/INFJ.jpeg"/>
		<%
	} else if(mbti.equals("INFP")){
		%>
		<img src="./img/INFP.jpg"/>
		<%
	} else if(mbti.equals("INTJ")){
		%>
		<img src="./img/INTJ.jpg"/>
		<%
	} else if(mbti.equals("INTP")){
		%>
		<img src="./img/INTP.jpg"/>
		<%
	} else if(mbti.equals("ISFJ")){
		%>
		<img src="./img/ISFJ.jpg"/>
		<%
	} else if(mbti.equals("ISFP")){
		%>
		<img src="./img/ISFP.jpg"/>
		<%
	} else if(mbti.equals("ISTJ")){
		%>
		<img src="./img/ISTJ.jpg"/>
		<%
	} else if(mbti.equals("ISTP")){
		%>
		<img src="./img/ISTP.jpg"/>
		<%
	}

%>

<br>
<br>
<a href="start.jsp">다시 해볼래요!</a> 
<a href="history.jsp">이전 기록들 확인하기</a>
<a href="logout.jsp">로그아웃</a>

</body>
</html>