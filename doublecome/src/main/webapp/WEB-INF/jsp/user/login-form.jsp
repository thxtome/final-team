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
	<div class="loginContent">
		<div>
		<form action="<c:url value="/user/login.do"/>" method="post">
			<h2>Please login</h2>
			<div>
				<input name="userEmail" type="text" placeholder="Email Address">
			</div>
			<div>
				<input name="userPass" type="password" placeholder="Password">
			</div>
			<div>
				<button>Login</button>
			</div>
				<c:if test="${result == 'false'}" >
					<div>
						<h5>아이디 비밀번호를 확인해주세요</h5>
					</div>
				</c:if>
				<c:if test="${result == 'true'}" >
					<div>
						<h5>로그인 성공</h5>
					</div>
				</c:if>
		</form>
		</div>
	</div>
</body>
</html>