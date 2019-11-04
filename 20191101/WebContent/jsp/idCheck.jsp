<%@page import="co.micol.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck.jsp</title>
<%!boolean b;%>
</head>
<body>
	<div align="center">
		<%
			String id = request.getParameter("cid");
			MemberDao dao = new MemberDao();
			b = dao.isIdCheck(id);
			if (b) {
		%>
		<h1><%=id%>는 사용 가능한 ID입니다.
		</h1>
		<script>
			window.opener.document.frm.idChk.value = "Checked";
			window.opener.document.frm.pw.focus();
		</script>
		<%
			} else {
		%>
		<h1><%=id%>는 이미 사용 중인 ID입니다.
		</h1>
		<script>
			window.opener.document.frm.id.value = "";
			window.opener.document.frm.id.focus();
		</script>
		<%
			}
		%>
		<br>
		<div>
			<button type="button" onclick="window.close()">확인</button>
		</div>
	</div>
</body>
</html>