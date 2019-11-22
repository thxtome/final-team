<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<div id="top">
				<div id="slide">
					<div class="swiper-container gallery-top">
						<div class="swiper-wrapper">
						<c:forEach items="${file}" var="f">
							<div class="swiper-slide"
								style="background-image: url('<c:url value="/file/imgLoad.do?filePath=${f.filePath}&fileSystemName=${f.fileSystemName}" />')"></div>
						</c:forEach>
						</div>
						<div class="swiper-button-next swiper-button-white"
							style="position: absolute; color: black; right: -51px;"></div>
						<div class="swiper-button-prev swiper-button-white"
							style="position: absolute; color: black; left: -51px;"></div>
						<div class="swiper-container gallery-thumbs">
							<div class="swiper-wrapper">
							<c:forEach items="${file}" var="f">
								<div class="swiper-slide"
									style="background-image: url('<c:url value="/file/imgLoad.do?filePath=${f.filePath}&fileSystemName=${f.fileSystemName}" />')"></div>
							</c:forEach>
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
																	data-date="<fmt:formatDate value="${auction.auctionLimitDate}" pattern="yyyy-MM-dd HH:mm:dd"/>">
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
											<dt class="Price__title">현재 최고가</dt>
											<dd class="Price__value"><span class="nowprice">${auction.maxPrice}</span><span>원</span></dd>
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
											<dd class="Price__value"><span class="buyprice">${auction.auctionBuyNow}</span><span>원</span></dd>
										</dl>
										<div class="Price__buttonArea">

											<a href="#"
												class="Button Button--buynow js-modal-show rapidnofollow"
												rel="nofollow" data-modal-name="error"
												data-ylk="rsec:byitnw;pos:1" data-rapid_p="9">즉시 구매하기</a>

										</div>
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
												닉네임 : <span>${user.userNickname}</span>
											</p>
										</dl>
										<dd class="Seller__subCard cvr273">
											<!--<a href="#" class="Seller__followButton">フォロー</a>-->
											<dl class="Seller__rating">
												<dd class="Seller__ratingTitle">
													거래횟수：<span class="Seller__ratingSum">${user.sellCnt}</span> 회
												</dd>
												<dd class="Seller__ratingCount">
													<span class="Seller__ratingGood">평가점수 : <span>${user.userScore}</span>점
													</span>
													<div>
														(<span>${user.userCnt}</span>회)
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
</body>
</html>