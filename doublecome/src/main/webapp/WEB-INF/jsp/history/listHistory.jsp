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
	href="<c:url value="/resources/css/history/listHistory.css"/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="historycontent">
		<ul id="navbar">
			<li><a data-location="purchasehead" class="navlist navchoice">구매내역</a></li>
			<li><a data-location="saleshead" class="navlist">판매내역</a></li>
			<li><a data-location="reviewhead" class="navlist">후기</a></li>
		</ul>
		<span id="tothetop">top</span>
		<div id="innercontent">
			<div id="purchasehead">구매내역</div>
			<ul class="tabhead">
				<li><a class="purchasetablist">입찰</a></li>
				<li><a class="purchasetablist tabchoice">거래 진행</a></li>
				<li><a class="purchasetablist">거래 완료</a></li>
			</ul>

			<div class="listcon">
				<div class="listhead">
					<span class="listdate"> <span class="datetitle">마감 날짜
					</span> <span class="datecontent">2019-11-20</span>
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
								<a class="reportbtn"><strong>신고</strong></a> <a
									class="reviewbtn"><strong>후기 등록</strong></a>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div id="saleshead">판매내역</div>
			<ul class="tabhead">
				<li><a class="salestablist">입찰</a></li>
				<li><a class="salestablist tabchoice">거래 진행</a></li>
				<li><a class="salestablist">거래 완료</a></li>
			</ul>
			<div class="listcon">
				<div class="listhead">
					<span class="listdate"> <span class="datetitle">마감 날짜
					</span> <span class="datecontent">2019-11-20</span>
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
								<a class="reportbtn"><strong>신고</strong></a> <a
									class="reviewbtn"><strong>후기 등록</strong></a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div>
				<div id="reviewhead">후기</div>
				<ul class="tabhead">
					<li><span class="reviewtablist tabchoice">받은 후기</span></li>
					<li><span class="reviewtablist">작성 후기</span></li>
				</ul>

				<div id="review">
					<div id="searchtype">
						<div>
							<ul>
								<li>•최신순</li>
								<li>•평점순</li>
							</ul>
						</div>
					</div>
					<div id="reviewcon">
						<ul>
							<li class="preview">
								<div class="scorearea">
									<div class="score">8</div>
									<div class="scoreform">점</div>
								</div>
								<div class="contentarea">
									<div class="auctiontitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewtitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdate">2019.11.15</div>
								</div>
								<div class="writerarea">
									<a class="reviewer">채채채미니</a>
									<div class="reviewerscore">6.5점</div>
								</div>
								<div class="editdel">
									<a class="editreview">수정</a> / <a class="delreview">삭제</a>
								</div>
							</li>
							<li class="reviewdetail">
								<div class="reviewcontent">
									<div class="profilediv">
										<img class="profileimg"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
									<div class="scorezone">8점</div>
									<div class="conclose">&times;</div>
									<div class="nicknamediv">채채채채미니</div>
									<div class="regdatediv">2019.11.15</div>
									<div class="onelinediv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
									<div class="reviewimg">
										<img style="width: 300px; height: 300px;"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
								</div>
							</li>
							<li class="preview">
								<div class="scorearea">
									<div class="score">1</div>
									<div class="scoreform">점</div>
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
								<div class="editdel">
									<a class="editreview">수정</a> / <a>삭제</a>
								</div>
							</li>
							<li class="reviewdetail">
								<div class="reviewcontent">
									<div class="profilediv">
										<img class="profileimg"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
									<div class="scorezone">8점</div>
									<div class="conclose">&times;</div>
									<div class="nicknamediv">채채채채미니</div>
									<div class="regdatediv">2019.11.15</div>
									<div class="onelinediv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
									<div class="reviewimg">
										<img style="width: 300px; height: 300px;"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
								</div>
							</li>
							<li class="preview">
								<div class="scorearea">
									<div class="score">8</div>
									<div class="scoreform">점</div>
								</div>
								<div class="contentarea">
									<div class="auctiontitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewtitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdate">2019.11.15</div>
								</div>
								<div class="writerarea">
									<a class="reviewer">채채채미니</a>
									<div class="reviewerscore">6.5점</div>
								</div>
							</li>
							<li class="reviewdetail">
								<div class="reviewcontent">
									<div class="profilediv">
										<img class="profileimg"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
									<div class="scorezone">8점</div>
									<div class="conclose">&times;</div>
									<div class="nicknamediv">채채채채미니</div>
									<div class="regdatediv">2019.11.15</div>
									<div class="onelinediv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
									<div class="reviewimg">
										<img style="width: 300px; height: 300px;"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
								</div>
							</li>
							<li class="preview">
								<div class="scorearea">
									<div class="score">1</div>
									<div class="scoreform">점</div>
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
								<div class="editdel">
									<a class="editreview">수정</a> / <a>삭제</a>
								</div>
							</li>
							<li class="reviewdetail">
								<div class="reviewcontent">
									<div class="profilediv">
										<img class="profileimg"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
									<div class="scorezone">8점</div>
									<div class="conclose">&times;</div>
									<div class="nicknamediv">채채채채미니</div>
									<div class="regdatediv">2019.11.15</div>
									<div class="onelinediv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
									<div class="reviewimg">
										<img style="width: 300px; height: 300px;"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
								</div>
							</li>
														<li class="preview">
								<div class="scorearea">
									<div class="score">8</div>
									<div class="scoreform">점</div>
								</div>
								<div class="contentarea">
									<div class="auctiontitle">실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</div>
									<div class="reviewtitle">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdate">2019.11.15</div>
								</div>
								<div class="writerarea">
									<a class="reviewer">채채채미니</a>
									<div class="reviewerscore">6.5점</div>
								</div>
							</li>
							<li class="reviewdetail">
								<div class="reviewcontent">
									<div class="profilediv">
										<img class="profileimg"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
									<div class="scorezone">8점</div>
									<div class="conclose">&times;</div>
									<div class="nicknamediv">채채채채미니</div>
									<div class="regdatediv">2019.11.15</div>
									<div class="onelinediv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
									<div class="reviewdiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
										돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
										되시면 연락은 바로바로 받으셨으면 합니다.</div>
									<div class="reviewimg">
										<img style="width: 300px; height: 300px;"
											src="<c:url value="/resources/images/profileimg.png"/>" />
									</div>
								</div>
							</li>
						</ul>
						<button id="morebtn" type="button">더 보기</button>
					</div>
				</div>
			</div>
			<!-- The Modal -->
			<div id="myModal" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<span class="close">&times;</span>
					<div id="reviewform">
						<form id="rform">
							<div class="scorediv">
								<div class="scorelibel">신뢰도</div>
								<div class="scorecon">
									<div class="scorebar">
										<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
										<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
									</div>
								</div>
							</div>
							<div class="reviewcondiv">
								<div>구매후기</div>
								<div>
									<textarea></textarea>
								</div>
							</div>
							<div class="photodiv">
								<div>사진첨부</div>
								<div>
									<input type="file" /> 사진사진은 최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지
									첨부 가능합니다.
								</div>
							</div>
							<div class="reviewtitlediv">
								<div>한줄요약</div>
								<div>
									<input type="text" />
								</div>
							</div>
							<div class="regitbtn">
								<button type="submit">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="editModal" class="emodal">
				<div class="editmodal">
					<span class="eclose">&times;</span>
					<div id="editreviewform">
						<form id="eform">
							<div class="scorediv">
								<div class="scorelibel">신뢰도</div>
								<div class="scorecon">
									<div class="scorebar">
										<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
										<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
									</div>
								</div>
							</div>
							<div class="reviewcondiv">
								<div>구매후기</div>
								<div>
									<textarea></textarea>
								</div>
							</div>
							<div class="photodiv">
								<div>사진첨부</div>
								<div>
									<input type="file" /> 사진사진은 최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지
									첨부 가능합니다.
								</div>
							</div>
							<div class="reviewtitlediv">
								<div>한줄요약</div>
								<div>
									<input type="text" />
								</div>
							</div>
							<div class="editbtn">
								<button type="submit">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- 	<c:import url="/WEB-INF/jsp/include/footer.jsp" /> --%>
	<script src="<c:url value="/resources/js/history/listHistory.js"/>"></script>
</body>
</html>