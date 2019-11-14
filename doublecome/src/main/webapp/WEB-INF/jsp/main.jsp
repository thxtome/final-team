<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<header>
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	</header>
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
				<div class="col-md-12" style="">
					<div class="card-body" style="">
						<h5 class="card-title m-0" style="text-shadow: 0px 0px 1px black;">Best
							Auction</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="container w-75">
			<div class="row">
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4 p-2" style="">
					<a href="<c:url value="/auction/detailAuction.do" />">
						<div class="card box-shadow">
							<img class="card-img-top w-100"
								src="<c:url value="/resources/images/macbook.jpg"/>"
								style="height: 250px;">
							<p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
							<p class="card-text m-1">50,000원</p>
							<div class="auction-condition">
								<span class="text-left">입찰 1건</span> <small
									class="text-muted m-1">3 days ago</small>
							</div>
						</div>
					</a>
				</div>
			</div>

		</div>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous" style=""></script>
</body>
</html>