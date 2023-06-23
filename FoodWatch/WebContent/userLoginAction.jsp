<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.UserBean"/>
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>																				
<head>											
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<title>FoodWatch</title>
</head>
<body>
	<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserId(), user.getUserPassword());
	// 로그인 시도

	if (result == 1) {
		session.setAttribute("userID", user.getUserId()); //로그인 성공 시 userID를 세션에 할당해줌.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공하였습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>
</body>
</html>