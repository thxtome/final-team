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
	href="<c:url value="/resources/css/admin/retrieveCategory.css"/>">
</head>

<body>
	<div class="adminPage">
		<div class="adminSideBar">
			<input type="hidden" id="innerIndex" value="9">
			<c:import url="/WEB-INF/jsp/admin/sideBar.jsp" />
		</div>

		<div class="adminContent">
			<div>
				<h2>카테고리 항목</h2>
			</div>



			<table class="dataContent">
				<thead>
					<tr>
						<th>카테고리 순서</th>
						<th>카테고리 제목</th>
						<th>경매 수</th>
						<th>등록 날짜</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>전자기기</td>
						<td>13</td>
						<td>2019-07-19</td>
						<td>
							<button class="editBtn">관리</button>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>생활용품</td>
						<td>16</td>
						<td>2019-08-11</td>
						<td>
							<button class="editBtn">관리</button>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>의류</td>
						<td>152</td>
						<td>2019-01-14</td>
						<td>
							<button class="editBtn">관리</button>
						</td>
					</tr>
					<tr>
						<td>4</td>
						<td>식품</td>
						<td>123</td>
						<td>2019-02-13</td>
						<td>
							<button class="editBtn">관리</button>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td>휴대기기</td>
						<td>97</td>
						<td>2019-03-29</td>
						<td>
							<button class="editBtn">관리</button>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="addCategoryBtn">
				<button>등록</button>
			</div>



		</div>

		<div class="adminModal">
			<div class="adminMoadalBack">
				<div>
					<h2>카테고리 관리</h2>
					<hr style="width: 90%" />
					<div>
						<span>카테고리 순서</span> <input type="text">
					</div>

					<div>
						<span>카테고리 제목</span> <input type="text">
					</div>

					<div>
						<button id="eventBtn">수정</button>
						<button id="cancelBtn">취소</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="<c:url value="/resources/js/admin/sideBar.js"/>"></script>
	<script src="<c:url value="/resources/js/admin/retrieveCategory.js"/>"></script>

</body>

</html>