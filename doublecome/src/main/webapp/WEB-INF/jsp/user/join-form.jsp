<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/joinform.css"/>"> 
<style>


</style>
</head>
<body>
	<div id="bg">
	<div id="registBox">
		<span id="registTitle">회원 가입</span>
		<span id="pfimgbox"> 
		<img src="<c:url value="/src/main/webapp/resources/css/user/defaultpfimg.jpeg"/>" id="pfimg"/>
		<button>사진 등록</button>
		</span>
		
		
		<form method="post" action="<c:url value="/user/insert.do"/>">
		<div id="registInputBox1">
				<i class="far fa-envelope fa-3x" id="icon"></i>
				<div id="registInput">
				<input id="registInput" name="userEmail" type="text" placeholder="이메일 ">
				</div>
				<div id="alert"></div>
		</div>
		<div id="registInputBox2">
				<i class="fas fa-unlock-alt fa-3x" id="icon"></i>
				<div id="registInput">
				<input id="registInput" name="userPass" type="password" placeholder="비밀번호">
				</div>
				<div id="alert"></div>
				<div id="registInput">
				<input id="registInput" name="userPassConfirm" type="password" placeholder="비밀번호 확인">
				</div>
		</div>
		<div id="registInputBox3">
				<i class="fas fa-mobile-alt fa-3x" id="icon"></i>
				<div id="registInput">
				<input id="registInput" name="userPhnum" type="text" placeholder="핸드폰 번호">
				</div>
				<div id="alert"></div>
		</div>
		<div id="registInputBox4">
				<i class="fas fa-user fa-3x" id="icon"></i>
				<div id="registInput">
				<input id="registInput" name="userNickname" type="text" placeholder="별명"></div>
				<div id="alert"></div>
		</div>
			<button id="registDoBtn" type="submit">가입</button>
		</form>
		
	</div>
	</div>
</body>
</html>