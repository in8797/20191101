<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script>
	function formCheck() {
		if (frm.id.value == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}
		if (frm.pw.value == "") {
			alert("패스워드를 입력하세요.");
			frm.pw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">
		<c:if test="${id ==null}">

			<div>
				<h1>로 그 인</h1>
			</div>
			<div>
				<form id="frm" name="frm" action="loginOk.jsp" method="post"
					onsubmit="return formCheck()">
					<table border="1">
						<tr align="center">
							<td width="70">아이디</td>
							<td><input type="text" id="id" name="id" size="25"></td>
						</tr>
						<tr align="center">
							<td width="70">비밀번호</td>
							<td><input type="password" id="pw" name="pw" size="25"></td>
						</tr>
					</table>
					<br>
					<div>
						<button type="submit">로그인</button>
						&nbsp;&nbsp;&nbsp;
						<button type="reset">취 소</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="location.href='join.jsp'">회원가입</button>
					</div>
				</form>
			</div>
		</c:if>
		<c:if test="${id != null }">
			<h1>${id }는이미 로그인 중입니다.</h1>
			<button type="button" onclick="location.href='logOut.jsp'">로그아웃</button>
		</c:if>
		<div><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>