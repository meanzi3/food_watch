<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="article.ArticleDAO" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
		
		String realFolder="";
		String saveFolder = "ArticleUpload"; 
		String encType = "utf-8";
		String map="";
		int maxSize=5*1024*1024;
		
		ServletContext context = this.getServletContext();
		realFolder = context.getRealPath(saveFolder); 		
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());		
		String fileName = multi.getFilesystemName("fileName");
		String category = multi.getParameter("category");
		String storeName = multi.getParameter("storeName");
		String storeAddress = multi.getParameter("storeAddress");
		String price = multi.getParameter("price");
		String newPrice = multi.getParameter("newPrice");
		String articleTitle = multi.getParameter("articleTitle");
		String articleContent = multi.getParameter("articleContent");
		String sold = multi.getParameter("sold");
		
		article.setCategory(category);
		article.setStoreName(storeName);
		article.setStoreAddress(storeAddress);
		article.setPrice(Integer.parseInt(price));
		article.setNewPrice(Integer.parseInt(newPrice));
		article.setArticleTitle(articleTitle);
		article.setArticleContent(articleContent);
		article.setFileName(fileName);
		article.setSold(Integer.parseInt(sold));
		
		//하나라도 입력이 안되었다면            
		if (category == null || storeName == null || storeAddress == null || price == null 
				|| newPrice == null || articleTitle == null || articleContent == null || sold == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { //다 입력이 완료되었다면
			ArticleDAO articleDAO = new ArticleDAO(); // 업데이트 시도
			int result = articleDAO.update(article);
			if (result == -1) { //데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정하기에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('리뷰가 수정되었습니다.')");
				script.println("location.href = 'articleList.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>