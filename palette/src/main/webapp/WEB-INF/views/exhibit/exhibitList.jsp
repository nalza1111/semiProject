<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 날짜 포맷 변경 -->
<!-- footer따라오는거 고치기-->
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>전시회</title>
<style>
li {
	list-style: none;
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
	<div>
		<!-- 배너 -->
		<!-- start banner Area -->
		<section class="banner-area relative" id="home">
			<div class="overlay overlay-bg" style="background : url(image//art2.jpg);">
				<div class="overlay overlay-bg"></div>
			</div>
			<div class="container" >
				<div class="row d-flex align-items-center justify-content-center">
					<div class="about-content col-lg-12">
						<h1 class="text-white">PALETTE</h1>
						<p class="text-white link-nav">
							<a href="main.do">Home </a> ➮
							<a href="#"> Exhibition</a>
						</p>
					</div>
				</div>
			</div>
		</section>
		<!-- End banner Area -->

		

		<!-- 리스트 -->
		<!-- Start upcoming-exibition Area -->
		<section class="upcoming-exibition-area section-gap">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="menu-content pb-70 col-lg-8">
						<div class="title text-center">
							<h1 class="mb-10">EXHIBITION</h1>
							<p>WELCOME TO PALETTE EXHIBITION</p>
						</div>
					</div>
				</div>
				
				<div class="button-group-area mt-40">
					<!-- 글 등록 버튼-->
					<c:if test="${role eq 'admin' }">
						<!-- 글등록 버튼은 관리자만 보이게 -->
						<form id="frm" action="addExhibitListForm.do" method="post">
							<input type="submit" value="Add Exhibit" class="genric-btn danger circle"
								style="position: fixed; top: 20%; right: 3%; z-index: 100;">
						</form>
							<a href="#"><input type="button" value="TOP" class="genric-btn default circle"
										style="position: fixed; top: 25%; right: 3%; z-index: 100;"></a>
					</c:if>
					<!-- 전체 현재 버튼-->
					<form id="check" action="" method="post">
						<button type="button" class="genric-btn default circle" id="allListBtn" value=""
							onclick="location.href='exhibitList.do'" style="margin: 20px 0;">All</button>
						<button type="button" class="genric-btn default circle" id="ingListBtn" value=""
							onclick="location.href='ingList.do'" style="margin: 20px 0;">NOW</button>
					</form>
				</div>
				
				<!-- 전시 목록들-->
				<!-- list안에있는 하나의 레코드를 e라고 하겠다 -->
					<div class="row">
					<c:forEach items="${exhibits }" var="e">
						<div class="col-lg-4 col-md-6 single-exhibition">
							<div class="thumb">
								<a href="exhibitContent.do?exhibitNum=${e.exhibitNum }"><img class="img-fluid" src="${e.image }" alt=""></a>
								<h4>${e.exhibitName }</h4> 
								<p class="date">🔾 <c:out value="${fn:substring(e.startDate,0,10) }" /> ~ 
								<c:out value="${fn:substring(e.endDate,0,10) }" /></p>
								<p>${e.exhibitSchool } ${e.exhibitMajor }</p>
							</div>
						</div>
					</c:forEach>
					</div>
			</div>
	</section>
	<!-- End upcoming-exibition Area -->
	</div>
</body>
</html>