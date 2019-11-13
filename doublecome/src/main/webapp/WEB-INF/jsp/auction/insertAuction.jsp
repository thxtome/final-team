<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
<div id="wrapper">
<h2>글작성페이지</h2>
<div id="summernote"></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/summernote/summernote.js" />"></script>
<script>
$('#summernote').summernote({
	height: 400,
	 minHeight: 400,
	 maxHeight: 400,
	 width: 800,
	  toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ]
	});
</script>
</body>
</html>