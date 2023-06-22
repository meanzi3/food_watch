<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html>
<head>
    <meta charset="charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
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
            min-height: 100vh;
            background: transparent; /* 배경을 투명으로 설정하여 회색 박스를 없앰 */
            margin: 0;
            padding: 0;
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
        
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인되어있습니다.')");
        script.println("location.href='index.jsp'");
        script.println("</script>");
    }
%>
    <nav class="navbar">
        <div class="navbar_logo">
            <i class="fas fa-utensils"></i>
            <a href="index.jsp">FoodWatch</a>
        </div>

        <ul class="navbar_member">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="join1.jsp">Join</a></li>          
        </ul>
    </nav>
    
    <section>
        <form method="post" action="./userLoginAction.jsp" class="loginForm">
            <h2>Login</h2>
            <div class="loginID">
                <input type="text" class="id" name="userId" placeholder="아이디를 입력하세요">
            </div>
            <div class="loginPW">
                <input type="password" class="pw" name="userPassword" placeholder="비밀번호를 입력하세요">
            </div>
            <button type="submit" class="loginBtn">
                LOGIN
            </button>
            <div class="joinText">
                계정이 없으십니까? <a href="join1.jsp">회원가입하기</a>
            </div>
        </form>
    </section>
    
    <footer class="footer">
        <img src="./email.png" alt="email image" width="30" height="auto">
        <span>Contact us: abcd@pknu.ac.kr</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img src="./call.png" alt="call image" width="30" height="auto">
        <span>010-1234-5678</span>
    </footer>
    
</body>
</html>
