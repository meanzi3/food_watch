<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="article.ArticleDAO" %>
<%@ page import="article.ArticleBean" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter" %>
<html>																				
<head>											
<meta http-equiv="Content-Type" content="text/html"; charset= "UTF-8">
<title>FoodWatch</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		//로그인 안되어 있을 때
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int articleId = 0;
		if(request.getParameter("articleId") != null){
			articleId = Integer.parseInt(request.getParameter("articleId"));
		}
		if(articleId == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'articleList.jsp'");
			script.println("</script>");
		}
		
		ArticleBean article = new ArticleDAO().getArticle(articleId);
		if(!userID.equals(article.getOwnerId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'articleView.jsp'");
			script.println("</script>");
		}else{
			ArticleDAO articleDAO = new ArticleDAO();
			int result = articleDAO.delete(articleId); // 게시글 삭제 시도
			if(result == -1){ // 게시글 삭제에 실패한 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{ // 글 삭제에 성공했을 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 성공했습니다.')");
				script.println("location.href='articleList.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>