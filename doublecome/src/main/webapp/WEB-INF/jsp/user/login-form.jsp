<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/loginform.css"/>">
</head>
<body>

	 <div id="background">
    </div>
        <div id="loginForm">
            <p id="login">로그인</p>
            <div id="loginId"></div>
            <div id="loginPass"></div>
            <div id="loginDo">로그인</div>
        <a id="naverLogin"></a >
            <a id="kakaoLogin"></a >
        <a id="cancel"></a>
        <a id="findId">아이디 찾기</a>
        <a id="findPass">비밀번호 찾기</a>
    </div>
    
</body>
</html>