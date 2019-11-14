<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/loginform.css"/>">
</head>
<body>

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
          	<%-- <a id="cancel" href="<c:url value="/main.do" />">
                <i class="far fa-window-close fa-5x" ></i>
            </a> --%>
            <a id="findId">아이디 찾기</a>
            <a id="findPass">비밀번호 찾기</a>
        </div>
    </div>

        
</body>
<script src="<c:url value="/resources/js/user/loginForm.js" />"></script>
</html>