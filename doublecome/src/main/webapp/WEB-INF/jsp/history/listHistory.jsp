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
				<span>0</span> <span>회</span>
			</div>
			<div id="salesDeal">
				<div>판매판매</div>
				<span>0</span> <span>회</span>
			</div>
			<div id="reviewDeal">
				<div>후기</div>
				<span>0</span> <span>개</span>
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

				<div class="listCon">
					<div class="listHead">
						<span class="listDate"> <span class="dateTitle">마감
								날짜 </span> <span class="dateContent">2019-11-20</span>
						</span> <span class="detailCon"> <a>입찰금 <strong>281,000</strong>원
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
									<a class="listTitle">날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용
										1회입니다~ 마이크 커버 팝니다.</a>
									<div class="listRegDate">2019-11-01</div>
								</div>
							</li>
							<li>
								<div class="writerInfo">
									<a class="auctionWriter">박호섭이</a>
									<div>3.2점</div>
									<a class="reportBtn"><strong>신고</strong></a> <a
										href="addReview.do" class="reviewBtn"><strong>후기
											등록</strong></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div id="salesHead">판매내역</div>
				<ul class="tabHead">
					<li><span class="salesTabList">입찰</span></li>
					<li><span class="salesTabList tabChoice">거래 진행</span></li>
					<li><span class="salesTabList">거래 완료</span></li>
				</ul>
				<div class="listCon">
					<div class="listHead">
						<span class="listDate"> <span class="dateTitle">마감
								날짜 </span> <span class="dateContent">2019-11-20</span>
						</span> <span class="detailCon"> <a>최고 입찰금 <strong>281,000</strong>원
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
									<a class="listTitle">날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용
										1회입니다~ 마이크 커버 팝니다.</a>
									<div class="listRegDate">2019-11-01</div>
								</div>
							</li>
							<li>
								<div class="writerInfo">
									<a class="auctionWriter">채채채미니</a>
									<div>9.5점</div>
									<a href="reportModal.do" class="reportBtn"><strong>신고</strong></a> <a
										href="addReview.do" class="reviewBtn"><strong>후기
											등록</strong></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div id="reviewHead">후기</div>
				<ul class="tabHead">
					<li><span class="reviewTabList tabChoice"
						data-name="receiveReview">받은 후기</span></li>
					<li><span class="reviewTabList" data-name="sendReview">작성
							후기</span></li>
				</ul>

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
						<c:forEach var="list" items="${receiveReview}" >
							<li class="preView">
								<div class="scoreArea">
									<div class="score">${list.reviewScore}</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">${list.auctionTitle}</div>
									<div class="reviewTitle">${list.reviewTitle}</div>
									<div class="reviewDate">${list.reviewRegDate}</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">${list.reviewerNickname}</a>
								</div>
								<div class="editdel">
									<a href="editReview.do" class="editreview">수정</a> / <a class="delreview">삭제</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">${list.reviewerNickname}</div>
									<div class="regdateDiv">${list.reviewRegDate}</div>
									<div class="onelineDiv">${list.reviewTitle}</div>
									<div class="reviewDiv">${list.reviewContent}</div>
								</div>
							</li>
						</c:forEach>
							<!-- 
							<li class="preView">
								<div class="scoreArea">
									<div class="score">1</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
									<div class="reviewTitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
									<div class="reviewDate">2019.10.29</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
								<div class="editdel">
									<a href="editReview.do" class="editreview">수정</a> / <a>삭제</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">8</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewTitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDate">2019.11.15</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
								<div class="editdel">
									<a href="editReview.do" class="editreview">수정</a> / <a class="delreview">삭제</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">1</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
									<div class="reviewTitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
									<div class="reviewDate">2019.10.29</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
								<div class="editdel">
									<a href="editReview.do" class="editreview">수정</a> / <a>삭제</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">8</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewTitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDate">2019.11.15</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
								<div class="editdel">
									<a href="editReview.do" class="editreview">수정</a> / <a class="delreview">삭제</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
						 -->
						</ul>
					</div>
				</div>
				<div id="sendReview">
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
							<li class="preView">
								<div class="scoreArea">
									<div class="score">8</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewTitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDate">2019.11.15</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">1</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
									<div class="reviewTitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
									<div class="reviewDate">2019.10.29</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">8</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewTitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDate">2019.11.15</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">1</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
									<div class="reviewTitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
									<div class="reviewDate">2019.10.29</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
							<li class="preView">
								<div class="scoreArea">
									<div class="score">1</div>
									<div class="scoreForm">점</div>
								</div>
								<div class="contentArea">
									<div class="auctionTitle">아이폰8 싸게 팝니당. 남는거 없어요.</div>
									<div class="reviewTitle">아 정말 똥매너 다시 만나고 싶지 않네요</div>
									<div class="reviewDate">2019.10.29</div>
								</div>
								<div class="writerArea">
									<a class="reviewer">채채채미니</a>
								</div>
							</li>
							<li class="reviewDetail">
								<div class="reviewContent">
									<div class="profileDiv">
										<img class="profileImg"
											src="<c:url value="/resources/images/profileImg.png"/>" />
									</div>
									<div class="nicknameDiv">채채채채미니</div>
									<div class="regdateDiv">2019.11.15</div>
									<div class="onelineDiv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewDiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<button id="moreBtn" type="button">더 보기</button>
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/admin/reportModal.jsp" />
	</div>
	<script
		src="<c:url value="/resources/js/common/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<script src="<c:url value="/resources/js/history/listHistory.js"/>"></script>
</body>
</html>