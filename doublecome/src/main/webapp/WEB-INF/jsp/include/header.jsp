<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
   <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/header.css" />">
   
<div class="topbar">
	<sec:authorize access="isAnonymous()">
		<div>
			<span><a href="<c:url value="/user/loginForm.do" />">로그인</a></span>
			<span><a href="<c:url value="/user/joinForm.do" />">회원가입</a></span>
		</div>
	</sec:authorize>

		<!--인증이 됐을 때  -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.user" var="u" />
			<div>
				<span>${u.userEmail}</span>
				<span>${u.userType}</span>
				<span><a href="<c:url value="/user/logout.do" />">로그아웃</a></span>
			</div>
	</sec:authorize>
</div>
<div class="topContent">
	<div id="movetomain">
		<div>누구나 쉬운 경매!</div>
		<div>더블</div>
		<div>로와</div>
	</div>
	<div>
		<div>
			<input type="text" placeholder="경매를 검색하세요."> <img
				src="/images/Vector.svg" alt="">
		</div>
	</div>
	<div>
		
		<div>
			<img src="/images/mypage.svg" alt=""><span><a href="<c:url value="/mypage/mypage.do" />">마이페이지</a></span>
		</div>
		<div>
			<img src="/images/mypage.svg" alt=""><span><a href="<c:url value="/auction/insertAuction.do" />">글작성 페이지로 이동</a></span>
		</div>
	</div>
	<div>
		<div>
			<img src="/images/list.svg" alt=""> <span>전체 카테고리</span>
		</div>
		<div class="categoryBar">
			<div>카테고리1</div>
			<div>카테고리2</div>
			<div>카테고리3</div>
			<div>카테고리4</div>
			<div>카테고리5</div>
			<div>카테고리6</div>
		</div>
		<div>
			<div>
				<img src="/images/mypage.svg" alt=""><span><a href="<c:url value="/auction/searchAuction.do" />">경매찾기</a></span>
			</div>
			<div>카테고리2</div>
			<div>카테고리3</div>
			<div>카테고리4</div>
			<div>카테고리5</div>
			<div>카테고리6</div>
		</div>
	</div>
</div>
<hr />
<c:import url="/WEB-INF/jsp/user/loginForm.jsp" />


<script src="<c:url value="/resources/js/common/header.js" />"></script>

