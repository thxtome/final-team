<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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
  <div><a href="<c:url value="/main.do" />">누구나 쉬운 경매!</a></div>
		<div><a class="titleToMain" href="<c:url value="/main.do" />">더블</a></div>
		<div><a class="titleToMain" href="<c:url value="/main.do" />">로와</a></div>
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
      <div id="naver_id_login"><a href="${url}">
      <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
      </a>
      </div>
      <a >kakao</a>
    </form>
  </div>
  
  <div class="cta"><a href="<c:url value="/user/findEmailForm.do" />">아이디/비밀번호 찾기</a></div>
</div>
        
</body>
<!--  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("TOpvHOSeiE05F9UnTU0P", "http://localhost:8001/doublecome/main.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8001/doublecome/main.do");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> -->
<script src="<c:url value="/resources/js/user/loginForm.js" />"></script>
</html>
