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
<link rel="stylesheet" href="../css/normalize.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" type="text/css" href="/css/admincontent.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>

<body>
	<div class="adminPage">

		<div class="adminSideBar">
			<c:import url="/WEB-INF/jsp/admin/sideBar.jsp" />
		</div>


		<div class="adminContent">
			<div>
				<h2>기본정보</h2>
			</div>
		</div>
	</div>
	<script src="../js/admin.js"></script>
</body>

</html>