<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
</head>
<link rel="stylesheet"
	href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/auction/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/auction/side button.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/auction/swiper.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/auction/detail.css"/>">

<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="wrapper">
		<div id="contents">
			<div>
				<div class="writer_btns">
					<button class="remove_btn writer_btn">삭제</button>
					<button class="edit_btn writer_btn">수정</button>
				</div>
				<h2 id="auction-title">${auction.auctionTitle}</h2>
			</div>
			<div id="top">
				<div id="slide">
					<div class="swiper-container gallery-top">
						<div class="swiper-wrapper">
							<div class="swiper-slide"
								style="background-image: url(./images/nature-1.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-2.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-3.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-4.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-5.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-6.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-7.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(./images/nature-8.jpg)"></div>
						</div>
						<div class="swiper-button-next swiper-button-white"
							style="position: absolute; color: black; right: -51px;"></div>
						<div class="swiper-button-prev swiper-button-white"
							style="position: absolute; color: black; left: -51px;"></div>
						<div class="swiper-container gallery-thumbs">
							<div class="swiper-wrapper">
								<div class="swiper-slide"
									style="background-image: url(./images/nature-1.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-2.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-3.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-4.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-5.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-6.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-7.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-8.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-9.jpg)"></div>
								<div class="swiper-slide"
									style="background-image: url(./images/nature-10.jpg)"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="l-sub" id="l-sub">
					<div class="sidebar" id="sidebar">
						<div class="ProductInformation">
							<ul class="ProductInformation__items">
								<li class="ProductInformation__item">
									<div class="Count">
										<ul class="Count__counts">
											<li class="Count__count">
												<dl class="Count_top">
													<dt class="Count__title">입찰인원</dt>
													<dd class="Count__number">
														<span id="now_bid">${auction.bidCnt}</span> 명입찰
													</dd>
												</dl>
											</li>
											<li class="Count__count Count__count--sideLine">
												<dl class="Count_top2">
													<dt class="Count__title">남은시간</dt>
													<dd class="Count__number">
														<div class="middle">
															<div class="inner">
																<div class="counter-class"
																	data-date="2019-11-24 23:58:58">
																	<div class="timer-font">
																		<span class="counter-days"></span> 일
																	</div>
																	<div class="timer-font">
																		<span class="counter-hours"></span> 시간
																	</div>
																	<div class="timer-font">
																		<span class="counter-minutes"></span> 분
																	</div>
																	<div class="timer-font">
																		<span class="counter-seconds"></span> 초
																	</div>
																</div>
															</div>
														</div>
														<span class="Count__unit"></span>
													</dd>
												</dl>
											</li>
										</ul>
									</div>
								</li>


								<li class="ProductInformation__item js-stickyNavigation-start">



									<div class="Price Price--current">
										<div class="PriceUse is-hide">
											<div class="CouponPh2 is-hide"></div>
										</div>
										<dl class="Price__body">
											<dt class="Price__title">${auction.maxPrice}</dt>
											<dd class="Price__value">${auction.bidCnt}</dd>
										</dl>
										<div class="Price__buttonArea">
											<a href="#"
												class="Button Button--bid js-modal-show rapidnofollow"
												rel="nofollow" data-modal-name="error"
												data-ylk="rsec:bds;pos:1" data-rapid_p="7">입 찰 하 기</a>
										</div>
									</div>
									<div class="Price Price--buynow">
										<div class="PriceUse is-hide"></div>
										<dl class="Price__body ">
											<dt class="Price__title">즉시 구매가</dt>
											<dd class="Price__value">${auction.auctionBuyNow}</dd>
										</dl>
										<dd class="Price__buttonArea">

											<a href="#"
												class="Button Button--buynow js-modal-show rapidnofollow"
												rel="nofollow" data-modal-name="error"
												data-ylk="rsec:byitnw;pos:1" data-rapid_p="9">즉시 구매하기</a>

										</dd>
										<div id="auc_detail_ymobile_pc"></div>
									</div>
								</li>


								<li class="ProductInformation__item side_seller_info">
									<dl class="Seller">
										<dt class="Seller__title sellerInfo">
											<p class="Seller__titleText">판매자 정보</p>
										</dt>
										<dl class="Seller__card">
											<p>
												닉네임 : <span>${user.userEmail}</span>
											</p>
										</dl>
										<dd class="Seller__subCard cvr273">
											<!--<a href="#" class="Seller__followButton">フォロー</a>-->
											<dl class="Seller__rating">
												<dd class="Seller__ratingTitle">
													거래횟수：<span class="Seller__ratingSum">12</span> 회
												</dd>
												<dd class="Seller__ratingCount">
													<span class="Seller__ratingGood">평가점수 : <span>4.4</span>점
													</span>
													<div>
														(<span>12</span>회)
													</div>
												</dd>
											</dl>
										</dd>
									</dl>
								</li>

							</ul>
						</div>
					</div>
				</div>
			</div>

			<div id="bottom">
				<div class="in_bottom">
					<ul class="nav nav-justified">
						<li class="nav-item nav1 movenav"><a href="#nav1"
							class="nav-link js-scroll-trigger" data-nav="nav1">상품 정보</a></li>
						<li class="nav-item nav2"><a href="#nav2"
							class="nav-link js-scroll-trigger" data-nav="nav2">상품 문의</a></li>
						<li class="nav-item nav3"><a href="#nav3"
							class="nav-link js-scroll-trigger" data-nav="nav3">판매자 후기</a></li>
					</ul>



					<section id="nav1">
						<div id="tab-1">
							<div id="auction-board">글작성내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
							<div>글 내용</div>
						</div>
					</section>



					<section id="nav2" class="bg-light">

						<div id="tab-2">
							<div id="inquiry_insert">
								<div class="product_inquiry">
									<h3>상품 문의</h3>
									<ul class="inquiry_guidance">
										<li>입찰을 진행했을 시 취소는 불가능합니다.</li>
										<li>본 상품과 관련되지 않은 내용이나 비방, 홍보글, 도배글, 개인정보가 포함된 글은 예고없이
											삭제될 수 있습니다.</li>
										<li>홈페이지 에레문의는 고객센터를 이용해주세요.</li>
									</ul>
								</div>
								<div class="inquiry_submit pdct_inquiry">
									<h4>문의 내용</h4>
									<form id="productInquiry">
										<textarea class="form-control" id="inquiry-contents"
											placeholder="로그인 후 작성하실 수 있습니다"></textarea>
									</form>
									<button class="button">등록</button>
								</div>
							</div>

							<div class="inquiry_container">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-xs-12 pdct_inquiry_item">
												<p class="inquiry_name col-xs-12">
													<strong>나승민아님</strong> <span class="inquiry_minute">2019-11-11</span>
												</p>
												<div class="clearfix"></div>
												<p>각각 개별포장으로 되어 있나요???</p>
												<!-- <p>
                                                    <a class="float-right btn btn-outline-primary ml-2 reply"
                                                        id="btn1">답변</a>
                                                </p> -->
												<div class="insertbox" id="insertbox1"></div>
											</div>
										</div>
										<div class="card-inner">
											<div class="card-body">
												<div class="row">
													<div class="col-xs-12 pdct_inquiry_inner_item">
														<p class="inquiry_name col-xs-12">
															<i class="fab fa-replyd"></i><strong>SM</strong> <span class="inquiry_minute">2019-11-11</span>
														</p>
														<div class="clearfix"></div>
														<p>은율 마유 폼클렌징, 150g, 3개 상품은 한 개의 제품 박스에 한 개씩 포장되어있는 점
															참고하여 이용 부탁드립니다.</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-xs-12 pdct_inquiry_item">
												<p class="inquiry_name col-xs-12">
													<strong>내가승민임</strong> <span class="inquiry_minute">2019-11-11</span>
												<div class="clearfix"></div>
												<p>남.여공용으로도쓸수있나요?남자스킨향날까봐서요</p>
												<p>
													<a class="float-right btn btn-outline-primary ml-2 reply"
														id="btn2">답변</a>
												</p>
												<div class="insertbox" id="insertbox2"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</section>
					<section id="nav3">

						<div id="tab-3">
							<div class="table-responsive">
								<table id="seller_info" class="table">
									<tbody id="seller_detail">
										<tr>
											<td id="table_col">판매자 닉네임</td>
											<td>SM</td>
										</tr>
										<tr>
											<td>평점</td>
											<td><span id="grade_point">4.4</span> (<span
												id="grade_count">12</span>)</td>
										</tr>
										<tr>
											<td>판매 횟수</td>
											<td><span id="sell_count">20</span> 회</td>
										</tr>
									</tbody>
								</table>
							</div>

							<button class="accordion">
								<div class="col-xs-12">
									<div class="col-xs-2">
										<p class="grade">
											<span class="grade_point">8</span><span>점</span>
										</p>
									</div>
									<div class="col-xs-8 text-center">
										<p class="review_title review_pdct_title">실착용 5회 HEAD
											어글리슈즈 팔아요~ 상태 좋아요. 실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</p>
										<p class="review_title review_title">거래 매너 좋으신데, 연락이 늦어서
											불편했어요.</p>
										<p class="review_title review_regdate">2019.11.15</p>
									</div>
									<div class="review_contents_writer col-xs-2">
										<p class="review_writer">JP</p>
									</div>
								</div>

							</button>
							<div class="accor">
								<div class="accor_contents">
									<div class="review_contents_top row">
										<div class="review_top col-xs-10">
											<div class="col-xs-3">
												<img src="https://image.ibb.co/jw55Ex/def_face.jpg"
													class="review_img img-rounded img-fluid" />
											</div>
											<div class="col-xs-7 review_contents_title">
												<p>
													<span class="review_writer">JP</span><span
														class="review_contents_regdate">2019.11.15</span>
												</p>
												<p>거래 매너 좋으신데, 연락이 늦어서 불편했어요.</p>
											</div>
										</div>
									</div>
									<div class="col-xs-10 review_contents_contents">
										<div class="clearfix"></div>
										<p>궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면
											되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면
											합니다.</p>
									</div>
								</div>
							</div>
							<button class="accordion">
								<div class="col-xs-12">
									<div class="col-xs-2">
										<p class="grade">
											<span class="grade_point">8</span><span>점</span>
										</p>
									</div>
									<div class="col-xs-8 text-center">
										<p class="review_title review_pdct_title">실착용 5회 HEAD
											어글리슈즈 팔아요~ 상태 좋아요. 실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</p>
										<p class="review_title review_title">거래 매너 좋으신데, 연락이 늦어서
											불편했어요.</p>
										<p class="review_title review_regdate">2019.11.15</p>
									</div>
									<div class="review_contents_writer col-xs-2">
										<p class="review_writer">JP</p>
									</div>
								</div>

							</button>
							<div class="accor">
								<div class="accor_contents">
									<div class="review_contents_top row">
										<div class="review_top col-xs-10">
											<div class="col-xs-3">
												<img src="https://image.ibb.co/jw55Ex/def_face.jpg"
													class="review_img img-rounded img-fluid" />
											</div>
											<div class="col-xs-7 review_contents_title">
												<p>
													<span class="review_writer">JP</span><span
														class="review_contents_regdate">2019.11.15</span>
												</p>
												<p>거래 매너 좋으신데, 연락이 늦어서 불편했어요.</p>
											</div>
										</div>
									</div>
									<div class="col-xs-10 review_contents_contents">
										<div class="clearfix"></div>
										<p>궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면
											되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면
											합니다.</p>
									</div>
								</div>
							</div>
							<button class="accordion">
								<div class="col-xs-12">
									<div class="col-xs-2">
										<p class="grade">
											<span class="grade_point">8</span><span>점</span>
										</p>
									</div>
									<div class="col-xs-8 text-center">
										<p class="review_title review_pdct_title">실착용 5회 HEAD
											어글리슈즈 팔아요~ 상태 좋아요. 실착용 5회 HEAD 어글리슈즈 팔아요~ 상태 좋아요.</p>
										<p class="review_title review_title">거래 매너 좋으신데, 연락이 늦어서
											불편했어요.</p>
										<p class="review_title review_regdate">2019.11.15</p>
									</div>
									<div class="review_contents_writer col-xs-2">
										<p class="review_writer">JP</p>
									</div>
								</div>

							</button>
							<div class="accor">
								<div class="accor_contents">
									<div class="review_contents_top row">
										<div class="review_top col-xs-10">
											<div class="col-xs-3">
												<img src="https://image.ibb.co/jw55Ex/def_face.jpg"
													class="review_img img-rounded img-fluid" />
											</div>
											<div class="col-xs-7 review_contents_title">
												<p>
													<span class="review_writer">JP</span><span
														class="review_contents_regdate">2019.11.15</span>
												</p>
												<p>거래 매너 좋으신데, 연락이 늦어서 불편했어요.</p>
											</div>
										</div>
									</div>
									<div class="col-xs-10 review_contents_contents">
										<div class="clearfix"></div>
										<p>궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안 돼서 좀 짜증났어요. 결과가 좋으면
											되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게 되시면 연락은 바로바로 받으셨으면
											합니다.</p>
									</div>
								</div>
							</div>
						
						</div>
					</section>
					<button class="moreBtn" type="button">더 보기 <span class="glyphicon glyphicon-menu-down"></span></button>
				</div>
			</div>
		</div>
	</div>
	<div id="inquiry_box">
		<form id="replyForm">
			<textarea class="form-control inquiry-contents"></textarea>
			<button class="reply_button">등록</button>
		</form>
	</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/loopcounter.js" />"></script>
	<script src="<c:url value="/resources/js/auction/swiper.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/sticky.js" />"></script>
	<script src="<c:url value="/resources/js/auction/detail.js" />"></script>
</body>

</html>