<%@page import="co.micol.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String grant;

		MemberDao dao = new MemberDao();
		grant = dao.isLoginCheck(id, pw);
		if (grant.equals(null)) {
			//자바스크립트를 이용하여 메세지를 전달할 수 있도록 한다.

		} else {
			session.setAttribute("id", id); //session 은 브라우저종료시, 30분동안 동작없을시
			session.setAttribute("pw", pw);
			session.setAttribute("grant", grant);
			response.sendRedirect("main.jsp");
		}
	%>
</body>
</html>