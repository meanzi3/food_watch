<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="article.ArticleDAO" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="article" class="article.ArticleBean" />
<%-- <jsp:setProperty property="*" name="article"/> --%>
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
		
		article.setCategory(category);
		article.setStoreName(storeName);
		article.setStoreAddress(storeAddress);
		article.setPrice(Integer.parseInt(price));
		article.setNewPrice(Integer.parseInt(newPrice));
		article.setArticleTitle(articleTitle);
		article.setArticleContent(articleContent);
		article.setFileName(fileName);
				
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
			if (category == null || storeName == null || storeAddress == null || price == null 
					|| newPrice == null || articleTitle == null || articleContent == null  || fileName == null) {
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
					if(fileName != null){
						/* File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+articleTitle+"사진.jpg");
						oldFile.renameTo(newFile); */
					}
				}
			}
		}
	%>
</body>
</html>