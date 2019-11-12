<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메인페이지</h2>
	<!--인증이 안 됐을 때  -->
	
	<sec:authorize access="isAnonymous()">
		<a href="<c:url value="/user/login-form.do" />">로그인</a>
		<a href="<c:url value="/user/join-form.do" />">회원가입</a>
	</sec:authorize>

	<!--인증이 됐을 때  -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.user" var="u" />
		<div>${u.userEmail}</div>
		<div>${u.userType}</div>
		<a href="<c:url value="/user/logout.do" />">로그아웃</a>
	</sec:authorize>
</body>
</html>