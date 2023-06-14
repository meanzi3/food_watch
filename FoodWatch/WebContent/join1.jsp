<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html>
<head>
	<meta charset="charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="./style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/3db4768b1c.js" crossorigin="anonymous"></script>
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
		script.println("alert('로그아웃 후 회원가입이 가능합니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}
%>
	<nav class="navbar">
	
		<div>    </div>	
        <div class="navbar_logo">
            <i class="fas fa-utensils"></i>
            <a href="index.jsp">FoodWatch</a>
        </div>

        <ul class="navbar_member">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="join1.jsp">Join</a></li>          
        </ul>
        
    </nav>
    
    <div class ="container" style="display:flex; flex-direction:column; justify-content:center; height:90%">
    	<div style="display:flex; flex-direction:column ">
    		<p style="text-align:center; font-size:32px; font-weight:bold;">회원가입</p>
    		<p style="text-align:center; font-size:16px; margin-top:0px">Step1. 회원 유형을 선택해주세요.</p>
    	</div>
		
		<div style="display:flex; flex-direction:row; justify-content:center; justify-content: space-around; flex-wrap:wrap; align-content: space-around; border-top: 5px solid black; width:800px; height:350px; margin: 0 auto; margin-bottom:10px; background-color:white;">
			<a href="join2.jsp?userType=0">
				<div class = "memberTypeBtn" style="display:flex; flex-direction:column; align-items:center; justify-content: space-around; width:250px; height:250px; background-color:#2D4086; border-radius:10px">
    				<i class="fa-solid fa-user" style="display:flex; justify-content:center; width:130px; height:130px; font-size:150px; align-text:center;"></i>
    				<p style="text-align:center; font-size:24px; color:white">개인회원</p>
    			</div>
			</a>
    		<a href="join2.jsp?userType=1">
    			<div class = "memberTypeBtn" style="display:flex; flex-direction:column; align-items:center; justify-content: space-around; width:250px; height:250px; background-color:#505772; border-radius:10px">
    				<i class="fa-solid fa-user-tie" style="display:flex; justify-content:center; width:130px; height:130px; font-size:150px; aligne-text:center;"></i>
    				<p style="text-align:center; font-size:24px; color:white">기업회원</p>
    			</div>
    		</a>
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