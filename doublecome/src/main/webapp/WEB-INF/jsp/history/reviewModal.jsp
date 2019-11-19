<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/summernote/summernote.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/history/reviewModal.css"/>">
</head>
<body>
	<div id="addReviewModal" class="reviewModal">
		<div class="reviewModalContent">
			<span class="reviewModalClose">&times;</span>
			<div class="addReviewContent" data-value="헤이">
				<div id="reviewForm">
					<form id="rform">
						<div class="auctionTitleDiv">
							<div>경매글</div>
							<div>날이면 날마다 오는 기회가 아닙니다. 싸게싸게 입찰하세요. 실사용 1회입니다~ 마이크 커버
								팝니다.</div>
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
						<div class="regitbtn">
							<button type="submit">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/common/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
	<script src="<c:url value="/resources/js/history/reviewModal.js"/>"></script>
</body>
</html>