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
	href="<c:url value="/resources/css/admin/retrieveAuction.css"/>">
</head>

<body>
	<div class="adminPage">
		<div class="adminSideBar">
			<input type="hidden" id="innerIndex" value="3">
			<c:import url="/WEB-INF/jsp/admin/sideBar.jsp" />
		</div>

		<div class="adminContent">
			<div>
				<h2>전체 경매 조회</h2>
			</div>

			<div id="searchBar">
				<form action="" name="searchForm">
					<table class="dataSearch">
						<tr>
							<td>검색항목</td>
							<td><select>
									<option value="auctionNo">경매 번호</option>
									<option value="auctionTitle">경매 제목</option>
									<option value="userEmail">판매자 이메일</option>
							</select> <input type="text" class="searchWord"></input></td>
							<td>입찰가</td>
							<td>
								<p class="labels">원</p> <input type="text"> <span>~</span>
								<p class="labels">원</p> <input type="text">
							</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td colspan="3">
								<div class="categoryBox">
									<div>
										<label for="category1">마취침</label> <input type="checkbox"
											id="category1">
									</div>
									<div>
										<label for="category2">메스</label> <input type="checkbox"
											id="category2">
									</div>
									<div>
										<label for="category3">니퍼</label> <input type="checkbox"
											id="category3">
									</div>
									<div>
										<label for="category4">몽키스페너</label> <input type="checkbox"
											id="category4">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>마감날짜</td>
							<td><input type="date" name="" id=""> <span>~</span>
								<input type="date" name="" id=""></td>
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
				<div>
					<ul>
						<li>&#149;경매번호순</li>
						<li>&#149;이메일순</li>
						<li>&#149;높은 입찰가순</li>
						<li>&#149;마감날짜순</li>
					</ul>
				</div>
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
						<th>번호</th>
						<th>제목</th>
						<th>판매자</th>
						<th>입찰가</th>
						<th>카테고리</th>
						<th>마감날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>아이폰 사세요 싸게 드립니다</td>
						<td>park</td>
						<td>180,000</td>
						<td>전자기기</td>
						<td>2019-11-15</td>
					</tr>
					<tr>
						<td>1</td>
						<td>아이폰 사세요 싸게 드립니다</td>
						<td>park</td>
						<td>180,000</td>
						<td>전자기기</td>
						<td>2019-11-15</td>
					</tr>
					<tr>
						<td>1</td>
						<td>아이폰 사세요 싸게 드립니다</td>
						<td>park</td>
						<td>180,000</td>
						<td>전자기기</td>
						<td>2019-11-15</td>
					</tr>
					<tr>
						<td>1</td>
						<td>아이폰 사세요 싸게 드립니다</td>
						<td>park</td>
						<td>180,000</td>
						<td>전자기기</td>
						<td>2019-11-15</td>
					</tr>
					<tr>
						<td>1</td>
						<td>아이폰 사세요 싸게 드립니다</td>
						<td>park</td>
						<td>180,000</td>
						<td>전자기기</td>
						<td>2019-11-15</td>
					</tr>
					<tr>
						<td>1</td>
						<td>아이폰 사세요 싸게 드립니다</td>
						<td>park</td>
						<td>180,000</td>
						<td>전자기기</td>
						<td>2019-11-15</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script src="<c:url value="/resources/js/admin/sideBar.js"/>"></script>
	<script src="<c:url value="/resources/js/admin/retrieveAuction.js"/>"></script>

</body>

</html>