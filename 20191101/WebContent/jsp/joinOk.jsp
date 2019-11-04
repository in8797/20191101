<%@page import="co.micol.dto.MemberDto"%>
<%@page import="co.micol.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinOk.jsp</title>
<%!int n;%>
<%
	//response.setCharacterEncoding("utf-8");
	//response.setContentType("text/html; charset=UTF-8"); 
	request.setCharacterEncoding("utf-8");  // 전송된 한글깨짐 방지
	String id = request.getParameter("id"); // join.jsp 에 있는 name 속성값
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

	MemberDto dto = new MemberDto(id, name, pw, addr);
	MemberDao dao = new MemberDao();

	n = dao.insert(dto);
%>
</head>
<body>
	<%
		if (n != 0) {
			out.print("회원가입이 성공 했습니다.");
		} else {
			out.print("회원가입이 실패 했습니다.");
		}
	%>
	
</body>
</html>