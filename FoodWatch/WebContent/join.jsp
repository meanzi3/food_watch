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
	<title>음식점 평가 웹사이트</title>
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
            <a href="index.jsp">부산 맛집</a>
        </div>

        <ul class="navbar_member">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="join.jsp">Join</a></li>          
        </ul>
        
    </nav>
    
    <section>
    	<form method="post" action="./userJoinAction.jsp" class="JoinForm">
    		<h2>Join</h2>
      		<div class="joinDiv">
        		<input type="text" class = "joinInput" name="userId" placeholder="아이디를 입력하세요">
      		</div>
      		<div class="joinDiv">
        		<input type="password" class = "joinInput" name="userPassword" placeholder="비밀번호를 입력하세요">
      		</div>
      		<div class="joinDiv">
        		<input type="text" class = "joinInput" name="userName" placeholder="이름을 입력하세요">
      		</div>
      		<div class="joinDiv">
        		<input type="email" class = "joinInput" name="userEmail" placeholder="이메일을 입력하세요">
      		</div>
      		<div class="joinDiv">
        		<input type="tel" class = "joinInput" name="userPhoneNumber" placeholder="전화번호을 입력하세요">
      		</div>
      		<div class="joinDiv">
        		<label><input type="radio" name="userSex" value="남" />남</label>
        		<label><input type="radio" name="userSex" value="여" />여</label>
      		</div>
      		<button type="submit" class="joinBtn">
        	JOIN</button>
      		<div class="loginText">
       			계정이 이미 있으십니까? <a href="login.jsp">로그인하기</a>
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