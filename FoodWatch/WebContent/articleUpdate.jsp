<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="article.ArticleDAO" %>
<%@ page import="article.ArticleBean" %>
<%@ page import="user.UserBean" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="./style.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<title>FoodWatch</title>
	<style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('./background.png');
            background-size: cover;
            background-position: center;
            color: #333333;
            margin: 0;
            padding: 0;
        }   
              
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: transparent; /* 배경을 투명으로 설정하여 회색 박스를 없앰 */
            margin: 0px 0px;
            padding: 0px 0px;
        }

        .info_box {
            text-align: center;
        }

        .info_box h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .info_box p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .goListBtn,
        .goWriteBtn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #FFC107;
            color: #333333;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .goListBtn:hover,
        .goWriteBtn:hover {
            background-color: #FFA000;
        }

        .navbar {
            background-color: #333333;
            color: #FFFFFF;
            display: flex;
            align-items: center;
            padding: 10px;
        }

        .navbar_logo {
            display: flex;
            align-items: center;
            margin-right: auto;
            font-size: 24px;
            color: #FFFFFF;
        }

        .navbar_logo i {
            margin-right: 5px;
        }

        .navbar_logo a {
            color: #FFFFFF;
            text-decoration: none;
        }

        .navbar_member {
            list-style: none;
            display: flex;
            align-items: center;
            margin: 0;
            padding: 0;
        }

        .navbar_member li {
            margin-left: 10px;
        }

        .navbar_member a {
            color: #FFFFFF;
            text-decoration: none;
        }
        .navbar_member a:hover{
        	color: black;
        }

        .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: #333333;
        color: #FFFFFF;
        display: flex;
        align-items: center;
        padding: 10px;
    }

        .footer img {
            margin-right: 10px;
        }

        .footer span {
            text-align: left;
        }
    </style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); //로그인을 한 상태라면 해당 세션의 값을 userID에 넣어줌.
	}
	UserBean userBean = new UserDAO().getUser(userID); // 세션에 저장된 정보로 회원 정보 찾기
	
	int articleId = 0;
	if(request.getParameter("articleId") != null){
		articleId = Integer.parseInt(request.getParameter("articleId"));
	}
	ArticleBean articleBean = new ArticleDAO().getArticle(articleId);
	if(!userID.equals(articleBean.getOwnerId())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='articleView.jsp'");
		script.println("</script>");
	}
	
	%>

	<nav class="navbar">

		<div></div>
		<div class="navbar_logo">
			<i class="fas fa-utensils"></i> <a href="index.jsp">FoodWatch</a>
		</div>

		<ul class="navbar_member">
<%
			if(userBean.getUserType() == 1){
				// 기업회원이라면
%>
				<li><a href="#"><%= userID %>님 (기업)</a></li>
<%
			}else{
				// 개인회원이라면
%>
				<li><a href="#"><%= userID %>님 (개인)</a></li>
<%				
			}
%>
			<li><a onclick="return confirm('로그아웃 하시겠습니까?')" href="logout.jsp">Logout</a></li>
		</ul>

	</nav>
	
	<div class="board_wrap">
		<div class="board_title">
			<strong>재고 알림 수정하기</strong>
			<p>세일 판매 할 음식을 적어주세요.</p>
		</div>
		<form action="./articleUpdateAction.jsp?articleId=<%=articleId %>" method="post"> <!--  articleUpdateAction 에서 처리 -->
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>분류</dt>
							<dd>
								<select name="category" style="width:320px;height:35px">
									<option value="편의점" selected>[ 편의점 ]</option>
									<option value="마트">[ 마트 ]</option>
									<option value="빵집">[ 빵집 ]</option>
								</select>
							</dd>
						</dl>
						<dl>
							<dt>상호명</dt>
							<dd>
								<input type="text" name="storeName" placeholder="상호명 입력" value="<%= articleBean.getStoreName() %>">
							</dd>
						</dl>
						<dl>
							<dt>주소</dt>
							<dd>
								<input type="text" name="storeAddress" placeholder="주소 입력" value="<%= articleBean.getStoreAddress()%>">
							</dd>
						</dl>
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="articleTitle" placeholder="유효기한/분류/상품명" value="<%= articleBean.getArticleTitle() %>">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>정가</dt>
							<dd>
								<input type="text" name="price" placeholder="정가 입력" value="<%= articleBean.getPrice()%>">
							</dd>
						</dl>
						<dl>
							<dt>할인 금액</dt>
							<dd>
								<input type="text" name="newPrice" placeholder="할인 금액" value="<%= articleBean.getNewPrice()%>">
							</dd>
						</dl>
						<dl>
							<dt>판매 상태</dt>
							<dd>
								<select name="sold">
									<%
									if(articleBean.getSold() == 0){
									%>
									<option value="0" selected>판매중</option>
									<option value="1">판매완료</option>
									<%
									} else{
									%>
									<option value="0">판매중</option>
									<option value="1" selected>판매완료</option>
									<%	
									}
									%>
								</select>
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="articleContent" placeholder="상품 소개"><%= articleBean.getArticleContent() %></textarea>
					</div>
					<div class="reviewBtn">
						<button type="submit" class="registerBtn">수정</button>
						<button type="reset" class="cancelBtn">취소</button>
					</div>
				</div>
			</div>
			<div class="bt_wrap"></div>
		</form>
	</div>
	<!-- 
	<footer class="footer">
        <img src="./email.png" alt="email image" width="30" height="auto">
        <span>Contact us: abcd@pknu.ac.kr</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img src="./call.png" alt="call image" width="30" height="auto">
        <span>010-1234-5678</span>
    </footer> -->
</body>
</html>