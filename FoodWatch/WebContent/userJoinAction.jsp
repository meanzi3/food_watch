<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.UserBean"/>
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>																				
<head>											
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>음식점 평가 웹사이트</title>
</head>
<body>
	<%
		int userType = Integer.parseInt(request.getParameter("userType"));
		user.setUserType(userType);
		
		if (user.getUserId() == null || user.getUserPassword() == null || user.getUserName() == null || 
		user.getUserEmail() == null || user.getUserPhoneNumber() == null || user.getUserSex() == null ||
		user.getUserType() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user); // 회원가입 시도
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserId()); //회원가입 성공 시 바로 userID를 세션에 할당해줌
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입에 성공하였습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>