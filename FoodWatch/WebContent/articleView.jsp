<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="article.ArticleDAO" %>
<%@ page import="article.ArticleBean" %>
<%@ page import="user.UserBean" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.File" %>
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
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID"); //로그인을 한 상태라면 해당 세션의 값을 userID에 넣어줌.
	}
	UserBean userBean = new UserDAO().getUser(userID); // 세션에 저장된 정보로 회원 정보 찾기
	
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='login.jsp'");
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
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	ArticleBean articleBean = new ArticleDAO().getArticle(articleId);
	// 해당 id의 article을 get 
	
%>
	<nav class="navbar">

		<div></div>
		<div class="navbar_logo">
			<i class="fas fa-utensils"></i> <a href="index.jsp">FoodWatch</a>
		</div>

		<ul class="navbar_member">
			<%
				if (userID == null) { //아직 로그인 하지 않은 상태라면 login과 join메뉴가 뜨도록
			%>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="join1.jsp">Join</a></li>
			<%
				} else { //로그인을 한 상태라면 logout 메뉴가 뜨도록
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
			<%
				}
			%>
		</ul>

	</nav>
    
    <div class="board_wrap">
    	<div class="board_title">
    		<strong>재고 할인 알림</strong>
    		<p>할인중인 음식을 확인해보세요!</p>
    	</div>
    	<div class="board_view_wrap">
    		<div class = board_view>
    			<div class="title">
    				<%= articleBean.getArticleTitle() %>
    			</div>
    			<div class="info">
    				<dl>
    					<dt>가게 이름<dt>
    					<dd><%= articleBean.getStoreName() %></dd>
    				</dl>
    				<dl>
    					<dt>주소</dt>
    					<dd><%= articleBean.getStoreAddress() %></dd>
    				</dl>
    				<dl>
    					<dt>분류<dt>
    					<dd><%= articleBean.getCategory() %></dd>
    				</dl>
    				<dl>
    					<dt>정가<dt>
    					<dd><%= articleBean.getPrice() %></dd>
    				</dl>
    				<dl>
    					<dt>할인 금액<dt>
    					<dd><%= articleBean.getNewPrice() %></dd>
    				</dl>
    				<dl>
    					<dt>할인율<dt>
    					<%
    						// 할인율 계산
    						int disCountRate = Math.round(((float)(articleBean.getPrice() - articleBean.getNewPrice()) / articleBean.getPrice()) * 100); 
    					%>
    					<dd style="color: #BF0000;"><%= disCountRate %>%</dd>
    				</dl>
    				<dl>
    					<dt>판매상태</dt>
    					<% if(articleBean.getSold() == 0){ %>
    					<dd style="color: #BF0000;">판매 중</dd>
    					<%} else {%>
    					<dd style="color: #BF0000;">판매 완료</dd>
    					<%} %>
    				</dl>
    			</div>
    			<div class="cont">
    				<%= articleBean.getArticleContent() %>
    			</div>
    			<%
    			String real = "C:\\Upload";
    			File viewFile = new File(real+"\\"+articleBean.getFileName());
    			/* if(viewFile.exists()){ */
    			%>
    			<div class="cont">
    				<img src = "ArticleUpload/<%= articleBean.getFileName()%>" border="10px" width="500px" height="500px">
    			</div>
    			<%-- <% } %> --%>
    			<!-- 지도 표시 영역 -->
    			<div id="map" style="width:100%;height:300px;"></div>
    			<!-- api 관련 스크립트 -->
    			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=633c4c8c96349c69b0554823bf4ba12b&libraries=services"></script>
				<%
					String address = articleBean.getStoreAddress();
					String storeName = articleBean.getStoreName();
				%>
				<script>
				var address = "<%= address%>";
				var storeName = "<%= storeName%>";
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    				mapOption = {
        				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        			level: 3 // 지도의 확대 레벨
    				};  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(address, function(result, status) {
	
    				// 정상적으로 검색이 완료됐으면 
     				if (status === kakao.maps.services.Status.OK) {
				
        				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
        				// 결과값으로 받은 위치를 마커로 표시합니다
        				var marker = new kakao.maps.Marker({
            				map: map,
	            			position: coords
        				});
				
        				// 인포윈도우로 장소에 대한 설명을 표시합니다
        				var infowindow = new kakao.maps.InfoWindow({
	            			content: '<div style="width:150px;text-align:center;padding:6px 0;">'+storeName+'</div>'
        				});
        				infowindow.open(map, marker);
	
        				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        	map.setCenter(coords);
	    			} 
				});    
				</script>
    		</div>	
    		<div class="bt_wrap">
					<a href="./articleList.jsp">목록보기</a>
					<%
						if(userID != null && userID.equals(articleBean.getOwnerId())){ // 세션에 등록된 user와 같은 사람이 쓴 글이라면
					%>
					<a href="./articleUpdate.jsp?articleId=<%= articleId %>" >수정하기</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="./articleDeleteAction.jsp?articleId=<%= articleId %>" style="color: #BF0000">삭제하기</a>
					<%
						}
					%>
			</div>
    	</div>	
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