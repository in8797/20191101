<%@page import="co.micol.dto.MemberDto"%>
<%@page import="co.micol.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify.jsp</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = new MemberDto();

		dto = dao.select(id);
	%>
	<div align="center">
		<div>
			<h1>회원 개인 정보</h1>
		</div>

		<div>
			<form id="frm" name="frm" action="modifyOk.jsp" method="post">
				<table border="1">
					<tr>
						<th width="100">아이디</th>
						<td><%=dto.getId()%></td>
					</tr>
					<tr>
						<th>이 름</th>
						<td><input type="text" id="name" name="name" value=<%=dto.getName()%>></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><%=dto.getDate()%></td>
					</tr>
					<tr>
						<th>주 소</th>
						<td><input type="text" id="addr" name="addr" value=<%=dto.getAddr()%> size="70"></td>
					</tr>
				</table>
				<br>
				<div>
				<button type="submit">변 경</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='main.jsp'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>