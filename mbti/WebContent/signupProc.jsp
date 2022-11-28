<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="login.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="login.RegisterDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%=dto%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	RegisterDAO dao = new RegisterDAO();
	//중복 체크
	boolean ok1 = dao.checkId(dto);
	if(ok1 == false){
%>
	<script> 
		alert("아이디가 중복되어 회원가입에 실패했습니다.");
		history.back(); //웹브라우저에서 뒤로가기
	</script>
<%
	}
	else{
		int ok = dao.insertId(dto);
		if(ok == 1) {
	%>
		<script> alert("회원가입이 완료되었습니다. 로그인을 다시 해주세요."); location.href = "index.jsp";</script>
	<%		
		} else {	
	%>
		<script> 
			alert("회원가입에 실패했습니다.");
			history.back(); //웹브라우저에서 뒤로가기
		</script>
	<%
		}
	}
%>
	