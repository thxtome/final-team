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
	href="<c:url value="/resources/css/admin/retrieveUserStatistics.css"/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />
</head>

<body>
	<div class="adminPage">

		<div class="adminSideBar">
			<input type="hidden" id="innerIndex" value="3">
			<c:import url="/WEB-INF/jsp/admin/sideBar.jsp" />
		</div>


		<div class="adminContent">
			<div>
				<h2>회원 통계</h2>
			</div>

			<div class="chartGroup">
				<div id="pieChart1"></div>
				<div id="pieChart2"></div>
				<div id="pieChart3"></div>

			</div>

			<div class="lineChartType">
				<span class="clickedType">&#149;일자별 유저 가입수</span> <span>&#149;일자별
					총 유저 수</span>
			</div>

			<div id="lineChart"></div>

		</div>
	</div>
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
	<script src="<c:url value="/resources/js/admin/sideBar.js"/>"></script>
	<script
		src="<c:url value="/resources/js/admin/retrieveUserStatistics.js"/>"></script>
</body>

</html>