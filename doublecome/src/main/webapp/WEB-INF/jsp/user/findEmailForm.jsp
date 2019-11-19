<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/findEmail.css"/>"> 
    </head>
    <body>
       <div class="ForgotPassword">
			<a class="ForgotEmail__title">
			
				이메일 찾기
			
			</a>
			<a class="ForgotPassword__title" href="<c:url value="/user/findPassForm.do" />">
			
				비밀번호 찾기
			
			</a>
			<form method="post" action="<c:url value="/user/findEmailForm.do" />">
			<div class="ForgotPassword__inputWrapper">
				<input name="userPhnum" type="text" placeholder="번호" class="ForgotPassword__inputWrapper__input ForgotPassword__inputWrapper__input--error">
			</div>
			<div id="emailCheck" class="ForgotPassword__error" style="visibility:hidden;">알맞은 번호를 입력하세요</div>
			<div class="ForgotPassword__inputWrapper">
				<!-- <input type="text" placeholder="johnsmith@rapid.com" class="ForgotPassword__inputWrapper__input ForgotPassword__inputWrapper__input--error"> -->
				<div class="ForgotPassword__inputWrapper__input ForgotPassword__inputWrapper__input--error">${user.userEmail}</div>
			</div>
			<div id="numberCheck" class="ForgotPassword__upperError" style="visibility:hidden;">번호와 일치하는 메일이 없습니다.</div>
			<button class="ForgotPassword__button">조회</button>
			<div class="ForgotPassword__cancel">
			<a href="<c:url value="/main.do" />">취소</a>
			</div>
			</form>
		</div>
    </body>
    </html>