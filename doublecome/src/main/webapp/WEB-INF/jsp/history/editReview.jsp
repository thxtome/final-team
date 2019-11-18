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
	href="<c:url value="/resources/css/history/editReview.css"/>">
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="#reviewContent">
		<div id="editReviewHead">후기 수정</div>
		<div class="editReviewContent">
			<div id="reviewForm">
				<form id="eform">
					<div class="auctionTitle">
						<div>경매글</div>
						<div>날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용 1회입니다~ 마이크 커버 팝니다.</div>
					</div>
					<div class="scoreDiv">
						<div class="scoreLibel">신뢰도</div>
						<div class="scoreCon">
							<div class="scoreBar">
								<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
								<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
							</div>
						</div>
					</div>
					<div class="reviewTitleDiv">
						<div>한줄요약</div>
						<div>
							<input type="text" />
						</div>
					</div>
					<div class="reviewCondiv">
						<div>구매후기</div>
						<div>
							<div id="summernote"></div>
						</div>
					</div>
					<!-- 
					<div class="photoDiv">
						<div>사진첨부</div>
						<div>
							<input type="file" /> 사진사진은 최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지
							첨부 가능합니다.
						</div>
					</div>
						 -->
					<div class="editBtn">
						<button type="submit">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="<c:url value="/resources/js/common/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
	<script src="<c:url value="/resources/js/history/editReview.js"/>"></script>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>