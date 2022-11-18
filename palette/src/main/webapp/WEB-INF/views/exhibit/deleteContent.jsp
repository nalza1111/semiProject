<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 완료</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/jhkcss/linearicons.css">
<link rel="stylesheet" href="css/jhkcss/font-awesome.min.css">
<link rel="stylesheet" href="css/jhkcss/bootstrap.css">
<link rel="stylesheet" href="css/jhkcss/magnific-popup.css">
<link rel="stylesheet" href="css/jhkcss/nice-select.css">
<link rel="stylesheet" href="css/jhkcss/animate.min.css">
<link rel="stylesheet" href="css/jhkcss/owl.carousel.css">
<link rel="stylesheet" href="css/jhkcss/main.css">
</head>
<body>
	<div align="center">
		<br>
		<br> <img src="image//submitSign.png"
			style="width: 100px; height: 100px;"> <br>
		<br>
		<div>
			<h1>${message }</h1>
		</div>
		<br>
		<div class="button-group-area mt-40">
			<button type="button" id="goListBtn"
				class="genric-btn default circle"
				style="font-weight: bold; font-size: 15px;"
				onclick="location.href='exhibitList.do'">OK</button>
		</div>
	</div>
</body>
</html>