<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="img/fav.png">
<meta name="author" content="codepixer">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>Art Museum</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!-- CSS ============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
<script src="https://kit.fontawesome.com/8ae463e53a.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">FREE BOARD</h1>
					<p class="text-white link-nav">
						<i class="fa-solid fa-house"></i> <a href="boardList.do">LIST
						</a> &nbsp&nbsp<i class="fa-solid fa-circle-user"></i> <a
							href="myBoardList.do"> MY BOARD</a>
						<c:if test="${not empty id}">&nbsp							
							<i class="fa-solid fa-pen"></i>
							<a href="boardJoinForm.do"> WRITE </a>
						</c:if>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start blog-posts Area -->
	<section class="blog-posts-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 post-list blog-post-list">
					<div class="single-post">
						<div class="single-widget category-widget">
							<h4 class="title">MY BOARD</h4>
							<ul>
								<li><a
									class="justify-content-between align-items-center d-flex"><span>NUMBER</span><span>TITLE</span><span>VIEW</span></a></li>
								<c:forEach items="${boards}" var="b">
									<li><a
										href="boardSelectSession.do?userid=${b.userId}&date=${b.createDate}&number=${b.boardNumber}&title=${b.boardTitle}&content=${b.boardContent}&writer=${b.boardWriter}&cnt=${b.viewCnt}"
										class="justify-content-between align-items-center d-flex">
											<span>${b.boardNumber}</span>
											<h6>${b.boardTitle}</h6>
											<span>${b.viewCnt }</span>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-4 sidebar">
					<div class="single-widget search-widget">
						<form class="example" action="boardDetailList.do">
							<select id="search" name="search"
								style="width: 5cm; margin: 10px;">
								<option>SELECT</option>
								<option>글제목</option>
								<option>글내용</option>
							</select> <br> <input type="text" placeholder="Search Board"
								id="searchcontent" name="searchcontent">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- End blog-posts Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous">
		
	</script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/justified.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>