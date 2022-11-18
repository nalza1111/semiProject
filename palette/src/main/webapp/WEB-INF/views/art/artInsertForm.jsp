<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<style>
#artInsertFormContainer{
background:url(https://cdn.pixabay.com/photo/2018/05/28/05/59/whitespace-3435341_960_720.jpg);
background-size: 100% 100%;

}
#artInsertBtn, #artResetBtn {
	cursor: pointer;
	border-radius: 100px;
	padding: 10px;
	font-weight: bold;
	border:1px solid black;
}

#artInsertForm {
	position: absolute;
	transform: scale(1.3);
	top: 25%;
	left: 40%;
	padding:20px;
	background-color: rgba(255,255,255, 0.7);
	border-radius: 30px;
}

</style>
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
<body id="artInsertFormContainer">
	<div>
		<form action="artInsert.do" enctype="multipart/form-data"
			method="post" id="artInsertForm">
			<table>
				<thead></thead>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" id="artId" name="artId" value="${id }"
							disabled></td>
					</tr>
					<tr>
						<th>작품제목</th>
						<td><input type="text" id="artTitle" name="artTitle"
							style="width: 200px"></td>
					</tr>
					<tr>
						<th>작품내용</th>
						<td><textarea id="artContent" name="artContent"
								style="width: 200px"></textarea>
					</tr>
					<tr>
						<th>사진 업로드</th>
						<td><input type="file" id="artImage" name="artImage"></td>
					</tr>
				</tbody>
			</table>
			<div id="BtnCon">
				<button type="submit" id="artInsertBtn" style="margin-bottom:10px;">업로드</button>
				<button type="reset" id="artResetBtn">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>