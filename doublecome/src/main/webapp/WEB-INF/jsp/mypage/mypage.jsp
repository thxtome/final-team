<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/common/normalize.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/mypage/mypage.css"/>">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="userinfo">회원정보란</div>
	<ui id="navbar">
	<li><a href="#purchasehaed" class="navlist navchoice">구매내역</a></li>
	<li><a href="#saleshaed" class="navlist">판매내역</a></li>
	<li><a href="#reviewhead" class="navlist">후기</a></li>
	</ui>
	<div id="purchasehaed">구매내역</div>
	<ul class="tabhead">
		<li><a class="tablist">입찰</a></li>
		<li><a class="tablist tabchoice">거래 진행</a></li>
		<li><a class="tablist">거래 완료</a></li>
	</ul>

	<div class="listcon">
		<div class="listhead">
			<span class="listdate"> <span class="datetitle">마감 날짜 </span>
				<span class="datecontent">2019-11-20</span>
			</span> <span class="detailcon"> <a>입찰금 <strong>281,000</strong>원
			</a>
			</span>
		</div>
		<div class="listbody">
			<ul>
				<li>
					<div class="productimg">
						<img class="imgcon">
					</div>
				</li>
				<li>
					<div class="productinfo">
						<a class="listtitle">날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용
							1회입니다~ 마이크 커버 팝니다.</a>
						<div class="listregdate">2019-11-01</div>
					</div>
				</li>
				<li>
					<div class="writerinfo">
						<a class="auctionwriter">박호섭이</a>
						<div>3.2점</div>
						<a class="reportbtn"><strong>신고하기</strong></a> <a
							class="reviewbtn"><strong>후기작성</strong></a>
					</div>
				</li>
		</div>
	</div>

	<div id="saleshaed">판매내역</div>
	<ul class="tabhead">
		<li><a class="tablist">입찰</a></li>
		<li><a class="tablist tabchoice">거래 진행</a></li>
		<li><a class="tablist">거래 완료</a></li>
	</ul>
	<div class="listcon">
		<div class="listhead">
			<span class="listdate"> <span class="datetitle">마감 날짜 </span>
				<span class="datecontent">2019-11-20</span>
			</span> <span class="detailcon"> <a>최고 입찰금 <strong>281,000</strong>원
			</a>
			</span>
		</div>
		<div class="listbody">
			<ul>
				<li>
					<div class="productimg">
						<img class="imgcon">
					</div>
				</li>
				<li>
					<div class="productinfo">
						<a class="listtitle">날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용
							1회입니다~ 마이크 커버 팝니다.</a>
						<div class="listregdate">2019-11-01</div>
					</div>
				</li>
				<li>
					<div class="writerinfo">
						<a class="auctionwriter">채채채미니</a>
						<div>9.5점</div>
						<a class="reportbtn"><strong>신고하기</strong></a> <a
							class="reviewbtn"><strong>후기작성</strong></a>
					</div>
				</li>
		</div>
	</div>

	<div id="reviewhead">후기</div>
	<ul class="tabhead">
		<li><span class="tablist tabchoice">받은 후기</span></li>
		<li><span class="tablist">보낸 후기</span></li>
	</ul>

	<div id="review">
		<div id="searchtype">
			<select name="searchtype">
				<option value="">최신순</option>
				<option value="">평점순</option>
			</select>
		</div>
		<div id="reviewcon">
			<ul>
				<li>
					<div class="scorearea">
						<div class="score">8</div>
						<div class="scoreform">/ 점</div>
					</div>
					<div class="contentarea">
						<div class="auctiontitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
						<div class="reviewtitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
						<div class="reviewdate">2019.11.15</div>
					</div>
					<div class="writerarea">
						<div class="reviewer">채채채미니</div>
						<div class="reviewerscore">6.5점</div>
					</div>
				</li>
				<li>
					<div class="scorearea">
						<div class="score">1</div>
						<div class="scoreform">/ 점</div>
					</div>
					<div class="contentarea">
						<div class="auctiontitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
						<div class="reviewtitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
						<div class="reviewdate">2019.10.29</div>
					</div>
					<div class="writerarea">
						<a class="reviewer">채채채미니</a>
						<div class="reviewerscore">6.5점</div>
					</div>
				</li>
				<li>
					<div class="scorearea">
						<div class="score">8</div>
						<div class="scoreform">/ 점</div>
					</div>
					<div class="contentarea">
						<div class="auctiontitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
						<div class="reviewtitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
						<div class="reviewdate">2019.11.15</div>
					</div>
					<div class="writerarea">
						<div class="reviewer">채채채미니</div>
						<div class="reviewerscore">6.5점</div>
					</div>
				</li>
				<li>
					<div class="scorearea">
						<div class="score">1</div>
						<div class="scoreform">/ 점</div>
					</div>
					<div class="contentarea">
						<div class="auctiontitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
						<div class="reviewtitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
						<div class="reviewdate">2019.10.29</div>
					</div>
					<div class="writerarea">
						<a class="reviewer">채채채미니</a>
						<div class="reviewerscore">6.5점</div>
					</div>
				</li>
				<li>
					<div class="scorearea">
						<div class="score">8</div>
						<div class="scoreform">/ 점</div>
					</div>
					<div class="contentarea">
						<div class="auctiontitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
						<div class="reviewtitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
						<div class="reviewdate">2019.11.15</div>
					</div>
					<div class="writerarea">
						<div class="reviewer">채채채미니</div>
						<div class="reviewerscore">6.5점</div>
					</div>
				</li>
				<li>
					<div class="scorearea">
						<div class="score">1</div>
						<div class="scoreform">/ 점</div>
					</div>
					<div class="contentarea">
						<div class="auctiontitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
						<div class="reviewtitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
						<div class="reviewdate">2019.10.29</div>
					</div>
					<div class="writerarea">
						<a class="reviewer">채채채미니</a>
						<div class="reviewerscore">6.5점</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="reviewform">
				<form id="rform">
					<div id="scorediv">
						<div id="scorelibel">신뢰도</div>
						<div id="scorecon"></div>
					</div>
					<div id="reviewcondiv">
						<div>구매후기</div>
						<div>
							<textarea></textarea>
						</div>
					</div>
					<div id="photodiv">
						<div>사진첨부</div>
						<div>
							<input type="file" />
						</div>
					</div>
					<div id="reviewtitlediv">
						<div>한줄요약</div>
						<div>
							<input type="text" />
						</div>
					</div>
					<div id="regitbtn">
						<button type="submit">등록하기</button>
					</div>
				</form>
			</div>
		</div>

	</div>
	<script src="<c:url value="/resources/js/mypage/mypage.js"/>"></script>
</body>
</html>