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
	// �α��� �õ�

	if (result == 1) {
		session.setAttribute("userID", user.getUserId()); //�α��� ���� �� userID�� ���ǿ� �Ҵ�����.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α��ο� �����Ͽ����ϴ�.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��й�ȣ�� Ʋ���ϴ�.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�������� �ʴ� ���̵� �Դϴ�.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�����ͺ��̽� ������ �߻��߽��ϴ�.');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>
</body>
</html>