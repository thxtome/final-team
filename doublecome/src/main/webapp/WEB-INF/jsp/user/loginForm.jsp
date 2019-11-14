<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/loginform.css"/>">
</head>
<body>


<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="topContent">
<div class="pen-title">
  <div>누구나 쉬운 경매!</div>
		<div>더블</div>
		<div>로와</div>
</div>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div >
    <div ></div>
  </div>
  <div class="form">
    <h2>Login to your account</h2>
    <form>
      <input type="text" placeholder="Username"/>
      <input type="password" placeholder="Password"/>
      <button>Login</button>
      <a ></a>
      <a ></a>
    </form>
  </div>
  
  <div class="cta"><a href="http://andytran.me">Forgot your password?</a></div>
</div>
        
</body>
<script src="<c:url value="/resources/js/user/loginForm.js" />"></script>
</html>
<!-- 

	 <div id="background" class="hidelogin">
         <div id="loginForm">
             <p id="login">로그인</p>
             <form action="<c:url value="/user/login.do"/>" method="post">
             <div id="loginId">
                 <input name="userEmail" type="text" placeholder="Email Address">
                </div>
            <div id="loginPass">
                <input name="userPass" type="password" placeholder="Password">
            </div>
            <button id="loginDo">로그인</button>
        </form>
        
        <a id="naverLogin"></a >
        <a id="kakaoLogin"></a >
          	
            <a id="findId">아이디 찾기</a>
            <a id="findPass">비밀번호 찾기</a>
        </div>
    </div>
<c:import url="/WEB-INF/jsp/user/findIdForm.jsp" />
<c:import url="/WEB-INF/jsp/user/findPassForm.jsp" /> 
 -->