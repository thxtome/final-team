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
<link rel="stylesheet"
	href="<c:url value="/resources/summernote/summernote.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/history/listHistory.css"/>">
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
					<li><span class="purchaseTabList">입찰</span></li>
					<li><span class="purchaseTabList tabChoice">거래 진행</span></li>
					<li><span class="purchaseTabList">거래 완료</span></li>
				</ul>
				<c:choose>
					<c:when test="${empty buyHistory}">
						<div class="emptyBox">구매한 내역이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="b" items="${buyHistory}">
							<div class="listCon">
								<div class="listHead">
									<span class="listDate"> <span class="dateTitle">마감
											날짜 </span> <span class="dateContent">${b.auctionLimitDate}</span>
									</span> <span class="detailCon"> <a>입찰금 <strong>${b.bidPrice}</strong>원
									</a>
									</span>
								</div>
								<div class="listBody">
									<ul>
										<li>
											<div class="productImg">
												<img class="imgCon"
													src="<c:url value="/resources/images/profileImg.png"/>">
											</div>
										</li>
										<li>
											<div class="productInfo">
												<a class="listTitle">${b.auctionTitle}</a>
												<div class="listRegDate">${b.auctionRegDate}</div>
											</div>
										</li>
										<li>
											<div class="writerInfo">
												<a class="auctionWriter">${b.userNickname}</a>
												<div>${s.score}점</div>
												<a class="reportBtn"><strong>신고</strong></a>
												<c:if test="${empty b.reviewSender}">
													<a data-no="${b.auctionNo}" class="reviewBtn"><strong>후기등록</strong></a>
												</c:if> 
											</div>
										</li>
									</ul>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<div id="salesHead">판매내역</div>
				<ul class="tabHead">
					<li><span class="salesTabList">입찰</span></li>
					<li><span class="salesTabList tabChoice">거래 진행</span></li>
					<li><span class="salesTabList">거래 완료</span></li>
				</ul>
				<c:choose>
					<c:when test="${empty saleHistory}">
						<div class="emptyBox">판매한 내역이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="s" items="${saleHistory}">
							<div class="listCon">
								<div class="listHead">
									<span class="listDate"> <span class="dateTitle">마감
											날짜 </span> <span class="dateContent">${s.auctionLimitDate}</span>
									</span> <span class="detailCon"> <a>입찰금 <strong>${s.maxPrice}</strong>원
									</a>
									</span>
								</div>
								<div class="listBody">
									<ul>
										<li>
											<div class="productImg">
												<img class="imgCon"
													src="<c:url value="/resources/images/profileImg.png"/>">
											</div>
										</li>
										<li>
											<div class="productInfo">
												<a class="listTitle">${s.auctionTitle}</a>
												<div class="listRegDate">${s.auctionRegDate}</div>
											</div>
										</li>
										<li>
											<div class="writerInfo">
												<a class="auctionWriter">${s.userNickname}</a>
												<div>${s.score}점</div>
												<a class="reportBtn"><strong>신고</strong></a>
												<c:if test="${empty s.reviewSender}">
													<a data-no="${s.auctionNo}" class="reviewBtn"><strong>후기등록</strong></a>
												</c:if> 
											</div>
										</li>
									</ul>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<div id="reviewHead">후기</div>
				<ul class="tabHead">
					<li><span class="reviewTabList tabChoice"
						data-name="receiveReview">받은 후기</span></li>
					<li><span class="reviewTabList" data-name="sendReview">작성
							후기</span></li>
				</ul>
				<c:choose>
					<c:when test="${empty receiveReview}">
						<div id="receiveReview">
							<div class="emptyBox">받은 후기가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="receiveReview">
							<div id="searchType">
								<div>
									<ul>
										<li>•최신순</li>
										<li>•평점순</li>
									</ul>
								</div>
							</div>
							<div id="reviewCon">
								<ul>
									<c:forEach var="rList" items="${receiveReview}">
										<li class="preView">
											<div class="scoreArea">
												<div class="score">${rList.reviewScore}</div>
												<div class="scoreForm">점</div>
											</div>
											<div class="contentArea">
												<div class="auctionTitle">${rList.auctionTitle}</div>
												<div class="reviewTitle">${rList.reviewTitle}</div>
												<div class="reviewDate">${rList.reviewRegDate}</div>
											</div>
											<div class="writerArea noBtn">
												<a class="reviewer">${rList.senderNickname}</a>
											</div>
										</li>
										<li class="reviewDetail">
											<div class="reviewContent">
												<div class="profileDiv">
													<img class="profileImg"
														src="<c:url value="/resources/images/profileImg.png"/>" />
												</div>
												<div class="nicknameDiv">${rList.senderNickname}</div>
												<div class="regdateDiv">${rList.reviewRegDate}</div>
												<div class="onelineDiv">${rList.reviewTitle}</div>
												<div class="reviewDiv">${rList.reviewContent}</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						<button class="moreBtn" type="button">더 보기</button>
						</div>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${empty sendReview}">
						<div id="sendReview">
							<div class="emptyBox">받은 후기가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="sendReview">
							<div id="searchType">
								<div>
									<ul>
										<li>•최신순</li>
										<li>•평점순</li>
									</ul>
								</div>
							</div>
							<c:forEach var="sList" items="${sendReview}">
								<div id="reviewCon">
									<ul>
										<li class="preView">
											<div class="scoreArea">
												<div class="score">${sList.reviewScore}</div>
												<div class="scoreForm">점</div>
											</div>
											<div class="contentArea">
												<div class="auctionTitle">${sList.auctionTitle}</div>
												<div class="reviewTitle">${sList.reviewTitle}</div>
												<div class="reviewDate">${sList.reviewRegDate}</div>
											</div>
											<div class="writerArea">
												<a class="reviewer">${sList.senderNickname}</a>
											</div>
											<div class="editdel">
												<a href="editReview.do" class="editreview">수정</a> / <a
													class="delreview">삭제</a>
											</div>
										</li>
										<li class="reviewDetail">
											<div class="reviewContent">
												<div class="profileDiv">
													<img class="profileImg"
														src="<c:url value="/resources/images/profileImg.png"/>" />
												</div>
												<div class="nicknameDiv">${sList.senderNickname}</div>
												<div class="regdateDiv">${sList.reviewRegDate}</div>
												<div class="onelineDiv">${sList.reviewTitle}</div>
												<div class="reviewDiv">${sList.reviewContent}</div>
											</div>
										</li>
									</ul>
								</div>
							</c:forEach>
						<button class="moreBtn" type="button">더 보기</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
		<div id="addReviewModal" class="reviewModal">
			<div class="reviewModalContent">
				<span class="reviewModalClose">&times;</span>
				<div class="addReviewContent" data-value="헤이">
					<div id="reviewForm">
						<form action="addReview.do" id="rform" method="post">
							<div class="auctionTitleDiv">
								<div>경매글</div>
								<div id="auctionTitle">날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용 1회입니다~ 마이크 커버
									팝니다.</div>
							</div>
							<div class="scoreDiv">
								<div class="scoreLibel">신뢰도</div>
								<div class="scoreCon">
									<input style="width: 500px; height: 30px" type="text" name="reviewScore" class="scoreBar" />
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
							<input id="auctionNo" type="hidden" name="auctionNo"/>
							<div class="regitbtn">
								<button type="button">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script
		src="<c:url value="/resources/js/common/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
	<script src="<c:url value="/resources/js/history/listHistory.js"/>"></script>
	<c:import url="/WEB-INF/jsp/admin/reportModal.jsp" />
</body>
</html>