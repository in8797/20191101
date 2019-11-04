<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	<div align="center">
		<c:if test="${id != null }">
		${id }님 환영합니다.<br>
			<c:if test="${grant == 'U' }">
		일반유저입니다.
			</c:if>
			<c:if test="${grant == 'S' }">
		관리자입니다.
			<br>
				<br>
				<button type="button" onclick="location.href='mlist.jsp'">회원목록보기</button>
				<br>
			</c:if>
			&nbsp;&nbsp;
			<button type="button" onclick="location.href='modify.jsp'">회원정보수정</button>
				&nbsp;&nbsp;
				<button type="button" onclick="location.href='logOut.jsp'">로그아웃</button>
		</c:if>
		<c:if test="${id ==null }">
			<h1>로그인 사용자만 이용할수 있습니다.</h1>
			<button type="button" onclick="location.href='login.jsp'">로그인</button>
		</c:if>
	</div>
</body>
</html>