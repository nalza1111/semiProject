<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>feedList</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Jua&display=swap"
	rel="stylesheet">
<style>
#fontAll {
	font-family: 'East Sea Dokdo', cursive;
}

.myFeed {
	font-size: 25px;
	text-decoration: none;
}

summary {
	color: #333333;
	padding: 20px;
	font-size: 30px;
	background-color: rgb(218, 212, 212, 0.3);
	height: 100px;
}

.myFeed a:link, .myFeed a:visited {
	background-color: rgb(228, 225, 225);
	color: black;
	padding: 15px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius:18px;
	border:0.5px solid grey;
}

.myFeed a:hover, .myFeed a:active {
	background-color: rgb(175, 209, 247);
}

.artist-body {
	align-items: center;
	width: 80%;
	position:relative;
}

.artist text {
	font-size: 20px;
}

.artist {
	cursor: pointer;
	border-radius: 20px;
	border: 1px solid gray;
	font-weight: 100px;
}


.artist-card {
	margin: 30px 33px;
	float: left;
	width: 314px;
	border-radius: 20px;
	border: #808080 solid 1px;
	box-shadow: 2px 2px 2px #888;
	padding-top: 20px;
	transition: background 0.35s ease-in-out;
	color:#343434;
}

.artist-card:hover {
	opacity: 1;
	background-color: #777;
	color: white;
}

.artist-body-footer {
	clear: both;
}

.myFeed {
	position: fixed;
	top: 10%;
	right: 4%;
}

.dsc li, .dsc li p {
	font-family: 'Jua', sans-serif;
}

</style>
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
	<div id="fontAll">
		<!-- 배너 -->
		<!-- start banner Area -->
		<section class="banner-area relative" id="home">
			<div class="overlay overlay-bg"
				style="background: url(image//feedBackground.jpg); background-repeat: no-repeat; background-size: cover;">
				
			</div>
			<div class="container" align="center">
				<div class="row d-flex align-items-center justify-content-center">
					<div class="about-content col-lg-12">
							<h1 class="text-white">Contemporary Artist</h1>

					</div>
				</div>
			</div>
		</section>

		<div align="right" style="z-index: 5">
			<span class="myFeed"><a href="myFeed.do">My Feed</a></span>
		</div>

		<div class="artist-body">
			<c:forEach items="${account}" var="a">
				<div onclick="showList(this)" id="${a.id}" class="artist-card">
					<img class="artist" src="${a.image}" width="280" height="280" /> <br>
					<span style="font-size: 40px;line-height:1em;">Artist ${a.name}</span> <br> <span
						style="font-size: 35px;"><i class="fa-solid fa-user-group"></i>
						${a.follower}</span>

				</div>
			</c:forEach>
		</div>
		<div class="artist-body-footer"></div>

		<script src="https://kit.fontawesome.com/d3060d9c8b.js"
			crossorigin="anonymous"></script>

		<script>
			function showList(tagId) {
				//작가 상세보기
				console.log(tagId.id);
				let id = tagId.id;
				let url = "feedSelect.do";
				location.href = url + "?id=" + id;
			}
		</script>
	</div>
</body>

</html>