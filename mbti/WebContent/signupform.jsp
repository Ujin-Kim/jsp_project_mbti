<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function inputCheck(){
		if(document.regForm.id.value == ""){
			alert("아이디를 입력해주세요.");
			regForm.id.focus();
			return;
		}
		if(regForm.pwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			regForm.pwd.focus();
			return;
		}
		if(regForm.pwd2.value == ""){
			alert("비밀번호 확인을 입력해주세요.");
			regForm.pwd2.focus();
			return;
		}
		if(regForm.pwd.value != regForm.pwd2.value){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			regForm.pwd2.value = "";
			regForm.pwd2.focus();
			return;
		}
		regForm.submit();
	}
</script>
</head>
<body>
<h1>회원가입 페이지</h1>
<form action="signupProc.jsp" method="post" name="regForm">
		<table border="1" style="width: 400px">
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwd2"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="가입" onclick="inputCheck()">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>