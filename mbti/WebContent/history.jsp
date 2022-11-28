<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mbti.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

	String id = (String) session.getAttribute("id");

	int pg = 1; //기본값 1페이지로 세팅
	String strPg = request.getParameter("pg"); //history.jsp?pg=3, "3"
	if (strPg != null){
		pg = Integer.parseInt(strPg); //3
	}
	int size = 10; //한 페이지에 글목록 몇개 보여줄건지
	int begin = (pg - 1) * size; //현재 페이지에서 첫번째 글, (3-1) * 10 => 20
 	/* mysql 은 0부터 시작한다.
		select * from board order by num desc limit 10, 10; //limit 인덱스, 개수 : 10번 인덱스부터 10개를 가져온다.
	*/
	int end = begin + (size - 1); //20+(10-1);
	
	MbtiDAO dao = new MbtiDAO();
	ArrayList<MbtiDTO> list = dao.listMbti(begin, size);
	int cnt = dao.countList(id); //전체 글의 수 얻기 16
	int linkSize = 10; //링크 갯수 10개, [11] [12] [13] [14] [15] [16] [17] [18] [19] [20]
	int totalPage = (cnt/size) + (cnt % size==0 ? 0 : 1); //전체 페이지 수 1 + 16
	int startLink = ((pg-1) / linkSize * linkSize) + 1; //((20-1)/10*10)+1 ==> 11
	int endLink = startLink + (linkSize-1); //11 + (10-1) => 20
	if(endLink > totalPage){
		endLink = totalPage;
	}
	int max = cnt - ((pg-1) * size); //현재페이지의 최대글 번호, 107 - ((1-1) * 10) ==> 107
%> 

<c:set var="list" value="<%=list %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 기록 보기</title>
</head>
<body>
<c:set var="list" value="<%=list %>" />
<c:set var="pg" value="<%=pg %>" />
<c:set var="linkSize" value="<%=linkSize %>" />
<c:set var="totalPage" value="<%=totalPage %>" />
<c:set var="startLink" value="<%=startLink %>" />
<c:set var="endLink" value="<%=endLink %>" />
<c:set var="max" value="<%=max %>" />

<h1>역대 <%=id %>님의 MBTI는?</h1>

<table border="1" style="width: 660px">
	<tr>
		<th>글번호</th>
		<th>MBTI</th>
		<th>날짜</th>
	</tr>
	<c:forEach var="b" items="${list}" varStatus="status"> <!-- var에 적힌 변수 list를 사용하는거 : $ , for(BoardDTO d : list)와 같다고 생각하면 됨-->
		<tr>
			<td>${max - status.index}</td>
			<td>${b.mbti}</td>
			<td><fmt:formatDate value="${b.regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
		</tr>
	</c:forEach>
</table>
<div style="width: 660px" align="left">
	<c:if test="${pg <= linkSize}">
		[<span style="color: silver;">◀◀</span>]
		[<span style="color: silver;">◀</span>]
	</c:if>
	<c:if test="${pg > linkSize}">
		[<a href="history.jsp?pg=1">◀◀</a>]
		[<a href="history.jsp?pg=${startLink-1}">◀</a>]
	</c:if>
	<c:forEach var="i" begin="${startLink}" end="${endLink}">
		<c:if test="${pg == i}">
			[ ${i} ]
		</c:if>
		<c:if test="${pg != i}">
			[ <a href="history.jsp?pg=${i}">${i}</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${endLink < totalPage}">
		[ <a href="history.jsp?pg=${endLink+1}">▶</a> ]
		[ <a href="history.jsp?pg=${totalPage}">▶▶</a> ]
	</c:if>
	<c:if test="${endLink >= totalPage}">
		[ <span style="color: silver;">▶</span> ]
		[ <span style="color: silver;">▶▶</span> ]
	</c:if>
</div>

<a href="start.jsp">다시 해볼래요!</a>
<a href="logout.jsp">로그아웃</a>
</body>
</html>