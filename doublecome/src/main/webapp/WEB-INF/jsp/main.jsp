<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PAGE settings -->
<link rel="icon"
	href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
<title>Album</title>
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="description"
	content="Wireframe design of an album page by Pingendo">
<meta name="keywords"
	content="Pingendo bootstrap example template wireframe album ">
<meta name="author" content="Pingendo">
<!-- CSS dependencies -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/main/main.css" />">
</head>
<body>
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12 w-75">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe src="https://www.youtube.com/embed/ctvlUvN6wSE?controls=0"
							allowfullscreen="" class="embed-responsive-item"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="py-4 bg-light">
		<div class="container w-75">
			<div class="row">
				<div class="col-md-12">
					<div class="card-body" >
						<h5 class="card-title m-0" style="text-shadow: 0px 0px 1px black;">
						Best Auction</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="container w-75" id="container">
			<div class="row">
				<c:choose>
					<c:when test="${empty auclist}">
						<div class="col-md-12">
							<div class="card-body" >
								<h5 class="card-title m-0" style="text-shadow: 0px 0px 1px black;">
								등록되어있는 경매가 존재하지 않습니다.</h5>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${auclist}" var="list">
							<div class="col-md-4 p-2" >
								<a class="auction_list" href="<c:url value="/auction/detailAuction.do?no=${list.auctionNo}&userEmail=${list.userEmail}" />">
									<div class="card box-shadow">
										<img class="card-img-top w-100"
											src="<c:url value="/resources/images/macbook.jpg"/>"
											style="height: 250px;">
										<p class="mb-1 m-1">${list.auctionTitle}</p>
										<c:choose>
											<c:when test="${empty list.maxPrice}">
												<p class="card-text m-1"><fmt:formatNumber value="${list.auctionMinPrice}" pattern="#,###"/>원</p>											
											</c:when>
											<c:otherwise>
												<p class="card-text m-1"><fmt:formatNumber value="${list.maxPrice}" pattern="#,###"/>원</p>		
											</c:otherwise>
										</c:choose>
										<div class="auction-condition">
											<span class="text-left">입찰 ${list.bidCnt}건</span>
											<small class="countdown text-muted m-1" onload="auctionCount(this,${list.auctionLimitDate})"></small>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>

		<script src="<c:url value="/resources/js/common/countdown.js" />"></script>
		<!-- <script type="text/javascript">
		  var naver_id_login = new naver_id_login("TOpvHOSeiE05F9UnTU0P", "http://localhost:8001/doublecome/main.do");
		  // 접근 토큰 값 출력
		  console.log(naver_id_login.oauthParams.access_token);
		  // 네이버 사용자 프로필 조회
		  naver_id_login.get_naver_userprofile("naverSignInCallback()");
		  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  function naverSignInCallback() {
		    console.log(naver_id_login.getProfileData('email'));
		    console.log(naver_id_login.getProfileData('nickname'));
		    console.log(naver_id_login.getProfileData('profile'));
		  }
		</script> -->
		
</body>
</html>