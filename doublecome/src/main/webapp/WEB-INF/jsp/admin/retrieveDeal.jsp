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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/sideBar.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/content.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/retrieveDeal.css"/>">
</head>

<body>
	<div class="adminPage">
		<div class="adminSideBar">
			<input type="hidden" id="innerIndex" value="7">
			<c:import url="/WEB-INF/jsp/admin/sideBar.jsp" />
		</div>

		<div class="adminContent">
			<div>
				<h2>전체 거래 조회</h2>
			</div>

			<div id="searchBar">
				<form action="">
					<table class="dataSearch">
						<tr>
							<td>검색항목</td>
							<td><select>
									<option value="userEmail">구매자</option>
									<option value="userNickname">판매자</option>
									<option value="userNickname">경매 제목</option>
							</select> <input type="text" class="searchWord"></input></td>
							<td>거래 번호</td>
							<td>
								<p class="labels">번</p> <input type="text"> <span>~</span>
								<p class="labels">번</p> <input type="text">
							</td>
						</tr>

						<tr>
							<td>거래 상태</td>
							<td>
								<div class="categoryBox">

									<div>
										<label for="conditionAll" id="conditionAllLabel">전체</label> <input
											type="checkbox" id="conditionAll">
									</div>
									<div>
										<label for="condition1" class="conditionLable">거래중</label> <input
											type="checkbox" name="condition" value="" id="condition1">
									</div>
									<div>
										<label for="category2" class="conditionLable">거래완료</label> <input
											type="checkbox" name="condition" id="category2">
									</div>
									<div>
										<label for="category3" class="conditionLable">거래실패</label> <input
											type="checkbox" name="condition" id="category3">
									</div>
								</div>
							</td>
						</tr>

						<tfoot>
							<tr>
								<td colspan="4">
									<button>검색</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
			<div class="dataFilters">
				<div></div>
				<div>
					<select>
						<option value="10">10개씩 보기</option>
						<option value="25">25개씩 보기</option>
						<option value="50">50개씩 보기</option>
					</select> <span>검색결과 : </span> <span id="dataCount">10</span> <span>개</span>
				</div>
			</div>






			<table class="dataContent">
				<thead>
					<tr>
						<th>거래 번호</th>
						<th>경매 제목</th>
						<th>구매자</th>
						<th>판매자</th>
						<th>거래 상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>아이폰 11 싸게 팝니다</td>
						<td>p@p</td>
						<td>c@c</td>
						<td>완료</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script src="<c:url value="/resources/js/admin/sideBar.js"/>"></script>
	<script src="<c:url value="/resources/js/admin/retrieveDeal.js"/>"></script>

</body>

</html>