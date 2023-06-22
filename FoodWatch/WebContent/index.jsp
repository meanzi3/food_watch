<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="user.UserBean"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <title>FoodWatch</title>
    <style>
        body {
        background-repeat: no-repeat;
        font-family: 'Arial', sans-serif;
        background-image: url('./background.png');
        background-size: cover;
        background-position: center;
        color: #333333;
        margin: 0;
        padding: 0;
        position: relative; /* body 요소에 position 속성 추가 */
        min-height: 100vh; /* 전체 화면 높이를 최소한으로 유지 */
    } 
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            background: transparent; /* 배경을 투명으로 설정하여 회색 박스를 없앰 */
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
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID"); //로그인을 한 상태라면 해당 세션의 값을 userID에 넣어줌.
    }
    UserBean userBean = new UserDAO().getUser(userID); // 세션에 저장된 정보로 회원 정보 찾기
%>
<nav class="navbar">
    <div class="navbar_logo">
        <i class="fas fa-utensils"></i>
        <a href="index.jsp">FoodWatch</a>
    </div>
    
    <ul class="navbar_member">
<%
    if(userID == null) { //아직 로그인 하지 않은 상태라면 login과 join메뉴가 뜨도록
%>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="join1.jsp">Join</a></li>
<% 
    } else{ //로그인을 한 상태라면 logout 메뉴가 뜨도록
%>           
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
<%
    }
%>            
</nav>

   <div class="container">
    <div class="info_box">
        <h1>식품 할인 알림 서비스</h1>
        <p>유효기간이 얼마 남지 않은 음식을 싸게 구매하세요!</p>
        <a class="goListBtn" href="./articleWrite.jsp" role="button">게시글 쓰기</a>
        <a class="goWriteBtn" href="./articleList.jsp" role="button">게시글 목록</a>
    </div>
   </div>

   <footer class="footer">
        <img src="./email.png" alt="email image" width="30" height="auto">
        <span>Contact us: abcd@pknu.ac.kr</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img src="./call.png" alt="call image" width="30" height="auto">
        <span>010-1234-5678</span>
    </footer>

</body>
</html>