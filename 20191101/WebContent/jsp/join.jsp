<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<script>
	function formCheck() {
		if (frm.id.value == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}

		if (frm.idChk.value == "unCheck") {
			alert("아이디 중복체크를 하세요.");
			return false;
		}
		if (frm.pw.value == "") {
			alert("패스워드를 입력하세요.");
			frm.pw.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}
		frm.submit();
	}

	function idCheck() {
		window.open("idCheck.jsp?cid=" + id.value, "IdCheck",
				"width=800,height=400");
	}
</script>
</head>
<body>
	<div align="center">
		<div>
			<h1>회 원 가 입</h1>
		</div>
		<div>
			<form id="frm" name="frm" action="joinOk.jsp" method="post">
				<table border="1">
					<tr>
						<th width="100">아이디 *</th>
						<td><input type="text" id="id" name="id" size="50">
							<button type="button" name="idChk" onclick="idCheck()"
								value="unCheck">중복 체크</button></td>
					</tr>
					<tr>
						<th>패스워드 *</th>
						<td><input type="password" id="pw" name="pw" size="50"></td>
					</tr>
					<tr>
						<th>이 름 *</th>
						<td><input type="text" id="name" name="name" size="50"></td>
					</tr>
					<tr>
						<th>주 소</th>
						<td><input type="text" id="addr" name="addr" size="70"></td>
					</tr>
				</table>
				<br>
				<div>
					<button type="button" onclick="formCheck()">회원가입</button>
					&nbsp;&nbsp;
					<button type="reset">취소</button>
					&nbsp;&nbsp;
					<button type="button" onclick="location.href='login.jsp'">로그인</button>
				</div>
			</form>
		</div>
		<div><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>