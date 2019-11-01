<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<c:if test="${grant == 'U' }">
		일반유저입니다.
	</c:if>
	<c:if test="${grant == 'S' }">
		슈퍼유저입니다.
	</c:if>
	${id }님 환영합니다.
	</div>
</body>
</html>