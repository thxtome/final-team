
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/userinfoUpdate.css"/>"> 

</head>
<body>
<header>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
</header>
<section id="bg">
<div id="pageBox">
		
					  
		
				
<form id="infoBox" method="post" action="/doublecome/user/userUpdate.do" class="uploader" enctype="multipart/form-data">
<div id="pfimgbox"> 
			<input class="uploader__input" id="file-upload" type="file" name="fileGroupCode" accept="image/*" />
			
			<label class="uploader__label" for="file-upload">
				<span class="uploader__wrapper">
					<img class="uploader__file hidden" src="#" alt="">
					<svg class="uploader__svg" xmlns="http://www.w3.org/2000/svg" width="98px" height="90px" viewBox="0 0 98 90">
						<path class="uploader__clipalt" d="M47.559,12.453L9.966,50.05 c0,0-16.188,15.611-0.892,30.908c15.297,15.301,30.995-0.804,30.995-0.804l50.666-50.669c0,0,10.814-10.891-0.268-21.981 c-11.087-11.088-21.97-0.288-21.97-0.288L24.221,51.486c0,0-10.736,8.541-2.432,16.921c8.307,8.384,16.832-2.521,16.832-2.521 l32.535-32.531"/>
					  <path class="uploader__clip" d="M47.559,12.453L9.966,50.05 c0,0-16.188,15.611-0.892,30.908c15.297,15.301,30.995-0.804,30.995-0.804l50.666-50.669c0,0,10.814-10.891-0.268-21.981 c-11.087-11.088-21.97-0.288-21.97-0.288L24.221,51.486c0,0-10.736,8.541-2.432,16.921c8.307,8.384,16.832-2.521,16.832-2.521 l32.535-32.531"/>
					</svg>
				</span>
			</label>
 </div>
        
	<%-- <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user" var="user" /> --%>
			
	<!-- 버튼 -->
	<button id="updateFormBtn" >수정</button>
	<a id="updateFormCancel" href="<c:url value="/user/userInfo.do"/>">취소</a>
			
			<div id="infoContainer">
	    	<h1 id="userInfoTitle" >회원 정보 수정</h1>
	    	<table>
	    	<tbody>
	    	<tr>
	    		<th>이메일</th>
	    		<td>
	    		<i class="far fa-envelope fa-1x" id="icon"></i>
				<input id="userEmail" name="userEmail" type="text" value="${user.userEmail}" class="registInput"
						placeholder="${user.userEmail}" readonly/>
						<div id="alert"></div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>핸드폰 번호</th>
	    		<td>
	    		 <i class="fas fa-mobile-alt fa-1x" id="icon"></i>
	    		<input id="userPhnum" name="userPhnum" type="text" class="registInput" value="${user.userPhnum}"
	    				placeholder="${user.userPhnum}" readonly/>
						<div id="alert"></div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>별명</th>
	    		<td>
	    		<i class="fas fa-user fa-1x" id="icon"></i>
	    		<input id="userNickname" name="userNickname" type="text" value="${user.userNickname}" placeholder="${user.userNickname}"  class="registInput">
						<div id="alert"></div>
	    		</td>
	    	</tr>
			<tr>
	    		<th>비밀번호</th>
	    		<td>
	    		<i class="fas fa-unlock-alt fa-1x" id="icon"></i>
	    		<input id="userPass" name="userPass" type="password" value="" placeholder="비밀번호 확인"  class="registInput">
	    		<input id="userPassConfirm" name="userPassConfirm" type="password" placeholder="비밀번호 확인" class="registInput">
				<div id="alert"></div>
	    		</td>
			</tr>
	    	</tbody>
	    	</table>
	    	
	    	<%-- 
			<div id="registInputBox">
				<div id="registInputBox1" class="registInputBox">
						<i class="far fa-envelope fa-1x" id="icon"></i>
						<span id="email"  class="registInput">${user.userEmail}</span>
						<div id="alert"></div>
				</div>
				<div id="registInputBox2" class="registInputBox">
						<i class="fas fa-unlock-alt fa-1x" id="icon"></i>
						<div id="pass" style="display:none;">${user.userPass}</div>
						<input id="registInput" class="registInput" name="userPass" type="password" placeholder="비밀번호">
						
						<div id="alert"></div>
				</div>
				
				<div id="registInputBox3" class="registInputBox">
						<i class="fas fa-mobile-alt fa-1x" id="icon"></i>
						<span id="phnum" class="registInput">${user.userPhnum}</span>
						
						<div id="alert"></div>
				</div>
				<div id="registInputBox4" class="registInputBox">
						<i class="fas fa-user fa-1x" id="icon"></i>
						
						<span id="nickname"  class="registInput">${user.userNickname}</span>
						<div id="alert"></div>
				</div>
				 --%>
			</div>
			<%-- </sec:authorize> --%>
</form>
		
		
<div id="bidList">
</div>
</div> 
</section>
	<script src="<c:url value="/resources/js/user/userInfoUpdate.js" />" ></script>
</body>
</html>