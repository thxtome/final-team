<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.user" var="log"/>
			<c:if test="${log.userEmail eq auction.userEmail}">
				<div class="writer_btns">
					<button class="remove_btn writer_btn">삭제</button>
					<button class="edit_btn writer_btn">수정</button>
				</div>
			</c:if>
			</sec:authorize>
				<h2 id="auction-title">${auction.auctionTitle}</h2>
			</div>
			<c:import url="/WEB-INF/jsp/auction/sidebar.jsp" />
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
									<form id="productInquiry" method="post" action="inquiry_add">
									<sec:authorize access="isAnonymous()">
										<textarea class="form-control inquiry_textarea logout"
											placeholder="로그인 후 작성하실 수 있습니다"></textarea>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<textarea class="form-control inquiry_textarea"
											placeholder="문의내용을 작성해주세요"></textarea>
									</sec:authorize>
									<input type="hidden" name="auctionNo" value="${auction.auctionNo}">
									<input type="hidden" name="userEmail" value="${auction.auctionNo}">
									<button class="button">등록</button>
									</form>
								</div>
							</div>

							<div class="inquiry_container">
								<div class="card">
								<c:choose>
									<c:when test="${empty inquiry}">
										<div class="inquiry_box">
											<div class="empty_inquiry">작성된 문의가 없습니다.</div>
										</div>
									</c:when>
								</c:choose>
								<c:forEach items="${inquiry}" var="inq">
									<c:choose>
									
									<c:when test="${inq.inquiryParent eq '0'}">
									<div class="card-body">
										<div class="row">
											<div class="col-xs-12 pdct_inquiry_item">
												<p class="inquiry_name col-xs-12">
													<strong>${inq.userNickname}</strong> <span class="inquiry_minute">${inq.inquiryRegDate}</span>
												</p>
												<div class="clearfix"></div>
												<p>${inq.inquiryContent}</p>
												<sec:authorize access="isAuthenticated()">
												<sec:authentication property="principal.user" var="log"/>
												<c:if test="${log.userEmail eq auction.userEmail}">
													<div id="ans${inq.inquiryNo}">
														<p>
														<a class="float-right btn btn-outline-primary ml-2 reply" id="btn1">답변</a>
                                                		</p>
													<div class="insertbox" id="insertbox${inq.inquiryNo}"></div>	
													</div>
												</c:if>
												</sec:authorize>										
											</div>
										</div>
									</div>
									</c:when>
												<c:otherwise>
													<div class="card-inner">
														<div class="card-body">
															<div class="row">
																<div class="col-xs-12 pdct_inquiry_inner_item">
																	<p class="inquiry_name col-xs-12">
																		<i class="fab fa-replyd"></i><strong>${inq.userNickname}</strong> <span class="inquiry_minute">${inq.inquiryRegDate}</span>
																	</p>
																	<div class="clearfix"></div>
																	<p>${inq.inquiryContent}</p>
																</div>
															</div>
														</div>
													</div>
													<script type="text/javascript">
														$("#ans${inq.inquiryParent}").remove()
													</script>
												</c:otherwise>
									</c:choose>
								</c:forEach>

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
											<td>${user.userNickname}</td>
										</tr>
										<tr>
											<td>평점</td>
											<td><span id="grade_point">${user.userScore}</span> (<span
												id="grade_count">${user.userCnt}</span>)</td>
										</tr>
										<tr>
											<td>판매 횟수</td>
											<td><span id="sell_count">${user.sellCnt}</span> 회</td>
										</tr>
									</tbody>
								</table>
							</div>
							<c:choose>
							<c:when test="${empty review}">
								<div class="review_box">
									<div class="empty_review">작성된 리뷰가 없습니다.</div>
								</div>
							</c:when>
							</c:choose>
							<c:forEach items="${review}" var="review">
							<button class="accordion">
								<div class="col-xs-12">
									<div class="col-xs-2">
										<p class="grade">
											<span class="grade_point">${review.reviewScore}</span><span>점</span>
										</p>
									</div>
									<div class="col-xs-8 text-center">
										<p class="review_title review_pdct_title">${review.auctionTitle}</p>
										<p class="review_title review_title">${review.reviewTitle}</p>
										<p class="review_title review_regdate">${review.reviewRegDate}</p>
									</div>
									<div class="review_contents_writer col-xs-2">
										<p class="review_writer">${review.reviewerNickname}</p>
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
													<span class="review_writer">${review.reviewerNickname}</span><span
														class="review_contents_regdate">${review.reviewRegDate}</span>
												</p>
												<p>${review.reviewTitle}</p>
											</div>
										</div>
									</div>
									<div class="col-xs-10 review_contents_contents">
										<div class="clearfix"></div>
										<p>${review.reviewContent}</p>
									</div>
								</div>
							</div>
							</c:forEach>
					<c:choose>
					<c:when test="${not empty review}">
					<button class="moreBtn" type="button">더 보기 <span class="glyphicon glyphicon-menu-down"></span></button>
					</c:when>
					</c:choose>
				</div>
				</section>
			</div>
		</div>
	</div>
	<div id="inquiry_box">
		<form id="replyForm">
			<textarea class="form-control inquiry-contents"></textarea>
			<button class="reply_button">등록</button>
		</form>
	</div>
	</div>
	<footer>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</footer>
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