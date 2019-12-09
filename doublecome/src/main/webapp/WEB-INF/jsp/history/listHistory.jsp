<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/auction/bootstrap.min.css"/>">
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/auction/swiper.min.css"/>">	 --%>
<link rel="stylesheet"
	href="<c:url value="/resources/summernote/summernote.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/history/listHistory.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/pagination.css"/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="historyContent">
		<div id="myInfo">
			<div id="myDeal">MY거래</div>
			<div id="purchaseDeal">
				<div>구매내역</div>
				<span>${userHistory.buyCnt}</span> <span>회</span>
			</div>
			<div id="salesDeal">
				<div>판매내역</div>
				<span>${userHistory.sellCnt}</span> <span>회</span>
			</div>
			<div id="reviewDeal">
				<div>후기</div>
				<span>${userHistory.userCnt}</span> <span>개</span>
			</div>
		</div>
		<div>
			<ul id="navBar">
				<li><a data-location="purchaseHead" class="navList navChoice">구매내역</a></li>
				<li><a data-location="salesHead" class="navList">판매내역</a></li>
				<li><a data-location="reviewHead" class="navList">후기</a></li>
			</ul>
		</div>
		<span id="toTheTop">top</span>
		<div id="innerContent">
			<div>
				<div id="purchaseHead">구매내역</div>
				<ul class="tabHead">
					<li><span data-type="dealBid" class="purchaseTabList tabChoice">입찰 진행</span></li>
					<li><span data-type="dealProgress" class="purchaseTabList">거래 진행</span></li>
					<li><span data-type="dealComplete" class="purchaseTabList">거래 종료</span></li>
				</ul>
				<div id="purchaseAjax"></div>
			</div>
			<div>
				<div id="salesHead">판매내역</div>
				<ul class="tabHead">
					<li><span data-type="dealBid" class="salesTabList tabChoice">입찰 진행</span></li>
					<li><span data-type="dealProgress" class="salesTabList">거래 진행</span></li>
					<li><span data-type="dealComplete" class="salesTabList">거래 종료</span></li>
				</ul>
				<div id="salesAjax"></div>
			</div>
			<div>
				<div id="reviewHead">후기</div>
				<ul class="tabHead">
					<li><span class="reviewTabList tabChoice"
						data-name="ReceiveReview">받은 후기</span></li>
					<li><span class="reviewTabList" data-name="SendReview">작성
							후기</span></li>
				</ul>
				<div data-name="ReceiveReview" class="ReceiveReview sortFind">
					<div class="sortType">
						<div>
							<ul>
								<li class="sortTypeTab sortTypeChoice" data-sort="recency">•최신순</li>
								<li class="sortTypeTab" data-sort="grade">•평점순</li>
							</ul>
						</div>
					</div>
					<div id="reviewCon">
						<ul>
						</ul>
					</div>
				</div>
				<div data-name="SendReview" class="SendReview sortFind">
					<div class="sortType">
						<div>
							<ul>
								<li class="sortTypeTab sortTypeChoice" data-sort="recency">•최신순</li>
								<li class="sortTypeTab" data-sort="grade">•평점순</li>
							</ul>
						</div>
					</div>
					<div id="reviewCon">
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="addReviewModal" class="reviewModal">
			<div class="reviewModalContent">
				<span class="reviewModalClose">&times;</span>
				<div class="addReviewContent" data-value="헤이">
					<div id="reviewForm">
						<form action="" id="rform" method="post">
							<div class="auctionTitleDiv">
								<div>경매글</div>
								<div id="auctionTitle"></div>
							</div>
							<div class="scoreDiv">
								<div class="scoreLibel">신뢰도</div>
								<div class="scoreCon">
									<c:forEach var="r" begin="1" end="10">
									<span class="scoreSpan">
										<input type="radio" id="reviewScore${r}" name="reviewScore" value="${r}">
										<label class="scoreLabel" for="reviewScore${r}">
										<i class='fas fa-star regitStar'></i>${r}
										</label>
									</span>
									</c:forEach>
								</div>
							</div>
							<div class="reviewTitleDiv">
								<div>한줄요약</div>
								<div>
									<input type="text" name="reviewTitle" />
								</div>
							</div>
							<div class="reviewCondiv">
								<div>구매후기</div>
								<div>
									<textarea id="summernote" name="reviewContent"></textarea>
								</div>
							</div>
							<input id="reviewReceiver" type="hidden" name="reviewReceiver" value=""/>
							<input id="auctionNo" type="hidden" name="auctionNo" value="0"/>
							<input id="reviewNo" type="hidden" name="reviewNo" value="0"/>
							<div class="regitbtn">
								<button type="submit"></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		<c:import url="/WEB-INF/jsp/admin/reportModal.jsp" />
	</div>
	<script src="<c:url value="/resources/js/common/pagination.js"/>"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="<c:url value="/resources/js/common/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
	<script src="<c:url value="/resources/js/common/timeFormat.js"/>"></script>
	<script src="<c:url value="/resources/js/history/reviewHistory.js"/>"></script>
	<script src="<c:url value="/resources/js/history/purchaseHistory.js"/>"></script>
	<script src="<c:url value="/resources/js/history/sailesHistory.js"/>"></script>
</body>
</html>