<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="article.ArticleDAO" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="article" class="article.ArticleBean" />
<jsp:setProperty property="*" name="article"/>
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
		article.setOwnerId(userID); //article을 쓸 ownerID를 로그인한 userID로 설정
		
		//로그인 안되어 있을 때
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 작성 가능합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		//로그인 되어있을 때
		else{
			//하나라도 입력이 안되었다면
			if (article.getCategory() == null || article.getStoreName() == null || article.getStoreAddress() == null || Integer.toString(article.getPrice()) == null 
					|| Integer.toString(article.getNewPrice()) == null || article.getArticleTitle() == null || article.getArticleContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { //다 입력이 완료되었다면
				ArticleDAO articleDAO = new ArticleDAO();
				int result = articleDAO.write(article); // 리뷰 쓰기 시도
				if (result == -1) { //데이터베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('게시글 쓰기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('게시글이 등록되었습니다.')");
					script.println("location.href = 'articleList.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>