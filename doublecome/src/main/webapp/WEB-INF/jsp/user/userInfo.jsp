
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/userinfo.css"/>"> 


<style>


</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	</header>
	<span id="bg">
		<div id="registBox">
	    <span id=title >마이 페이지</span>
		
					  
		
				
		<form id="infoBox" method="post" action="/doublecome/user/insert.do" class="uploader" enctype="multipart/form-data">
			<span id="pfimgbox"> 
						<span class="uploader__input" id="file-upload" type="file" name="fileGroupCode" accept="image/*" ></span>
						
						<div class="uploader__label" for="file-upload">
							
								<img  src="<c:url value="/resources/css/user/defaultpfimg.jpeg" />" alt="">
								<!-- <svg class="uploader__svg" xmlns="http://www.w3.org/2000/svg" width="98px" height="90px" viewBox="0 0 98 90">
									<path class="uploader__clipalt" d="M47.559,12.453L9.966,50.05 c0,0-16.188,15.611-0.892,30.908c15.297,15.301,30.995-0.804,30.995-0.804l50.666-50.669c0,0,10.814-10.891-0.268-21.981 c-11.087-11.088-21.97-0.288-21.97-0.288L24.221,51.486c0,0-10.736,8.541-2.432,16.921c8.307,8.384,16.832-2.521,16.832-2.521 l32.535-32.531"/>
								  <path class="uploader__clip" d="M47.559,12.453L9.966,50.05 c0,0-16.188,15.611-0.892,30.908c15.297,15.301,30.995-0.804,30.995-0.804l50.666-50.669c0,0,10.814-10.891-0.268-21.981 c-11.087-11.088-21.97-0.288-21.97-0.288L24.221,51.486c0,0-10.736,8.541-2.432,16.921c8.307,8.384,16.832-2.521,16.832-2.521 l32.535-32.531"/>
								</svg> -->
							 
						</div> 
	        </span>
        
			<p><a id="updateFormBtn" href="<c:url value="/user/userInfoUpdate.do"/>">개인정보 수정</a></p>
		    <p><a id="historyGoBtn" href="<c:url value="/history/listHistory.do" />">거래/후기 내역</a></p>
			
		
			<span id="registInputBox">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.user" var="user" /> 
				<div id="registInputBox1" class="registInputBox">
						<i class="far fa-envelope fa-1x" id="icon"></i>
						
						<span id="registInput" >${user.userEmail}</span>
						
						<div id="alert"></div>
				</div>
				<div id="registInputBox2" class="registInputBox">
						<i class="fas fa-unlock-alt fa-1x" id="icon"></i>
						<div id="pass" style="display:none;">${user.userPass}</div>
						<input id="registInput" name="userPass" type="password" placeholder="비밀번호">
						
						<div id="alert"></div>
						
						<!-- <input id="registInput" name="userPassConfirm" type="password" placeholder="비밀번호 확인"> -->
						
				</div>
				
				<div id="registInputBox3" class="registInputBox">
						<i class="fas fa-mobile-alt fa-1x" id="icon"></i>
						<span id="registInput" >${user.userPhnum}</span>
						
						<div id="alert"></div>
				</div>
				<div id="registInputBox4" class="registInputBox">
						<i class="fas fa-user fa-1x" id="icon"></i>
						
						<span id="registInput" >${user.userNickname}</span>
						<div id="alert"></div>
				</div>
				</sec:authorize> 
			</span>
		</form>
	</div>
		<span id="title" style="left: 420px; 
								top: -10px;">입찰 중인 경매</span>
		
		<div id="bidList">
		<%-- <c:forEach  items="${auction}" var="a">
		<a id="aution" href="#">
		<div class="card_container">
		  <img src="<c:url value="/resources/css/user/defaultpfimg.jpeg" />" alt="Avatar" class="card_imag">
		  <div class="vertical-line" style="height: 120px;" /></div>
		  <p><span>${a.auctionTitle}</span></p>
		  <p>
		  </p>
		  <span>
			현재 입찰가		
		  </span>
		  <span>
			${a.auctionLimitDate}	  		  
		  </span>
		</div>
		</a>
		</c:forEach> --%>
		</div>
	</span>
	<script src="<c:url value="/resources/js/user/userInfo.js" />" ></script>
</body>
</html>