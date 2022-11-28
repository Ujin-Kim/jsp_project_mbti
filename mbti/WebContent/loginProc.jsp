<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="login.*"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	RegisterDAO dao = new RegisterDAO();

	boolean check = dao.loginCheck(id, pwd);
	if(check) {
		session.setAttribute("id", id);
%>
	<script> alert("로그인 되었습니다."); location.href = "start.jsp";</script>
<%		
	} else {	
%>
	<script> 
		alert("아이디나 비밀번호가 틀렸습니다. 되돌아갑니다.");
		history.back(); //웹브라우저에서 뒤로가기
	</script>
<%
	}
%>
    