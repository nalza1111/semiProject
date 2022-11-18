<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="img/fav.png">
<meta name="author" content="codepixer">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">

<title>Board List</title>
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
<style type="text/css">
.pagination {
	display: inline-block;
}
.row{
display:inherit;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: #88d200;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
.section-gap {
    padding: 40px!important;
}
.spanL{
float:left;
width:150px;
}
#MdeleteBtn{
left:-50px!important;
}
</style>
<script src="https://kit.fontawesome.com/8ae463e53a.js"crossorigin="anonymous"></script>
</head>

<body>
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">Management</h1>
					<p class="text-white link-nav"/>
						<H6 onclick="maccountShow();">ACCOUNT</H6>&nbsp;&nbsp;&nbsp;&nbsp;
						<H6 onclick="mboardShow();">BOARD</H6>&nbsp;&nbsp;&nbsp;&nbsp;
					
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<!-- Start blog-posts Area -->
	<div class="blog-posts-area section-gap" id="accountM">
		<div class="container" >
			<div class="row">
				<div class="col-lg-8 post-list blog-post-list">
					<div class="single-post">
						<div class="single-widget category-widget">
							<h4 class="title">ACCOUNT LIST</h4>
							<ul>
								
								<c:forEach items="${account}" var="a">
									<li>

										<span class="spanL">${a.id}</span>
										<span class="spanL">${a.name}</span>
										<span class="spanL">${a.ban }</span>
										<button id="MdeleteBtn" name="MdeleteBtn" onclick="location.href='accountDelete.do?id=${a.id}';">계정삭제</button>

									</li>
								</c:forEach>
							

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End blog-posts Area -->

<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script type="text/javascript">


</script>
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