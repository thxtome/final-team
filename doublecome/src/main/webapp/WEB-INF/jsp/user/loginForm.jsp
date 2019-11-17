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
    <h2>로그인</h2>
    <form action="<c:url value="/user/login.do"/>" method="post">
      <input type="text" placeholder="이메일" name="userEmail"/>
      <input type="password" placeholder="비밀번호" name="userPass"/>
      <button>로그인</button>
      <a class="rg" href="/doublecome/user/joinForm.do">회원 가입</a>
      <a >naver</a>
      <a >kakao</a>
    </form>
  </div>
  
  <div class="cta"><a href="<c:url value="/user/findEmailForm.do" />">아이디/비밀번호 찾기</a></div>
</div>
        
</body>
<script src="<c:url value="/resources/js/user/loginForm.js" />"></script>
</html>
