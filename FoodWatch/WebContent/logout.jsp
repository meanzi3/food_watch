<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>음식점평가 웹사이트</title>
</head>
<body>
	<%
	session.invalidate();
	%>
	<script> 
	alert('로그아웃되었습니다.');
	location.href = 'index.jsp';</script>
</body>
</html>