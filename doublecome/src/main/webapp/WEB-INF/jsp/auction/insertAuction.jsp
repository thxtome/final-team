<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 페이지</title>
</head>
<link rel="stylesheet" href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/insert.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/summernote/summernote.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/datetimepicker/datetimepicker.css"/>">
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="wrapper">
		<div class="contents">
			<form id="insertForm">
				<div class="formbox">
					<dl class="row">
						<dt class="col-xs-3 menu">제목</dt>
						<dd class="col-xs-9">
							<input type="text" id="auctiontitle" placeholder="글 제목을 입력해주세요" />
						</dd>

						<dt class="col-xs-3 menu">카테고리</dt>
						<dd class="col-xs-9">
							<select class="category">
								<option>카테고리1</option>
								<option>카테고리2</option>
								<option>카테고리3</option>
								<option>카테고리4</option>
								<option>카테고리5</option>
							</select>
						</dd>

						<dt class="col-xs-3 menu">입찰 기한</dt>
						<dd class="col-xs-9">
							<div class='input-group date' id='datetimepicker'>
								<input type='text' class="form-control" /> 
								<span class="input-group-addon"> 
								<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</dd>
						
						 <dt class="col-xs-3 menu">경매 시작가</dt>
            <dd class="col-xs-9 line_height_clean">
              <dl class="row">
                <dd class="col-xs-4 line_clean">
					<p class="won">원</p><input type="text" class="start inputwon"/>
                </dd>
                <dt class="col-xs-2 menu">즉시 구매가</dt>
                <dd class="col-xs-4">
                	<p class="won">원</p><input type="text" class="buy inputwon"/>
                </dd>
              </dl>
            </dd> 
						<dt class="col-xs-2 menu">파일첨부</dt>
						<dd class="col-xs-2 attach">
							<a class="attach glyphicon glyphicon-picture">사진</a>
						</dd>

					</dl>
				</div>
				<div id="summernote"></div>
				<div class="submit">
					<button class="button">확인</button>
				</div>
			</form>
		</div>
	</div>
	<script src="<c:url value="/resources/js/common/jquery-3.4.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/datetimepicker/moment.js" />"></script>
	<script src="<c:url value="/resources/js/datetimepicker/momentlocales.js" />"></script>
	<script src="<c:url value="/resources/js/datetimepicker/localeko.js" />"></script>
	<script src="<c:url value="/resources/js/datetimepicker/datetimepicker.js" />"></script>
	<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
	<script src="<c:url value="/resources/js/auction/insert.js" />"></script>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>