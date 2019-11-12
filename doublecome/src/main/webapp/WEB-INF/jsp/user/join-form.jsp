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
		<form action="<c:url value="/user/insert.do"/>" method="post">
			<h2>Please sign in</h2>
			<div>
				<input name="userEmail" type="text" placeholder="Email Address">
			</div>
			<div>
				<input name="userPass" type="password" placeholder="Password">
			</div>
			<div>
				<input name="userPhnum" type="text" placeholder="Phone number">
			</div>
			<div>
				<input name="userNickname" type="text" placeholder="Nick name">
			</div>
			<div>
				<button>Sign in</button>
			</div>
		</form>
		</div>
	</div>
</body>
</html>