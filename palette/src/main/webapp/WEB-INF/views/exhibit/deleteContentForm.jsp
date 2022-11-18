<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
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
		<br><br>
		<img src="image//error.png" style="width:100px;height:100px;">
		<br><br>
		<h1>정말 삭제하시겠습니까?</h1>
		<div class="button-group-area mt-40" style="display:inline-block;align:center;width: 270px;">
			<form id="frm" action="deleteContent.do" method="post">
				<button type="submit" class="genric-btn danger circle">삭제</button>
				<button type="button" id="backBtn" class="genric-btn default circle" onclick="location.href='exhibitList.do'">취소</button>
				<input type="hidden" name="exhibitNum" value="${exhibit.exhibitNum }">
			</form>
		</div>
	</div>
</body>
</html>