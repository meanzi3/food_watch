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
<title>������ �� ������Ʈ</title>
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
			script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user); // ȸ������ �õ�
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�̹� �����ϴ� ���̵��Դϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserId()); //ȸ������ ���� �� �ٷ� userID�� ���ǿ� �Ҵ�����
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('ȸ�����Կ� �����Ͽ����ϴ�.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>