<%@page import="co.micol.dto.MemberDto"%>
<%@page import="co.micol.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOk.jsp</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id"); // 세션값을 가져오기
		String name = request.getParameter("name"); //form객체의 값을 가져온다.
		String addr = request.getParameter("addr");//변경될수도있고 안될수도있음

		MemberDao dao = new MemberDao();
		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setName(name);
		dto.setAddr(addr);

		int n = dao.update(dto);

		if (n != 0) {
			dto = dao.select(id);
			dto = dao.select(name);
			dto = dao.select(addr);
			//화면에 보여주는 루틴작성
			out.print("<h1>정상적으로 변경 되었습니다</h1>");
		} else {
			out.print("<h1>다시 재 수정 바랍니다.</h1>");
		}
	%>
</body>
</html>