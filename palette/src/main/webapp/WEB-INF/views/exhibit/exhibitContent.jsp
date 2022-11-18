<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 날짜 포맷 변경 --> 
<!-- 중간정렬, 수정삭제버튼 오른쪽으로 밀기, 전시명,일정등등 사진 오른쪽으로 붙이기 -->
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
<title>About Exhibition</title>
<style>
#logo{
	padding-left: 40px;
}
</style>
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
	<!-- start banner Area -->
		<section class="banner-area relative" id="home">
			<div class="overlay overlay-bg" style="background : url(image//detailart3.jpg); background-repeat: no-repeat; background-size: cover;">
				<div class="overlay overlay-bg"></div>
			</div>	
				<div class="container">
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								PALETTE			
							</h1>	
							<p class="text-white link-nav"><a href="exhibitList.do">Exhibition </a>  ➮  <a href="#"> About Exhibition</a></p>
						</div>											
					</div>
				</div>
		</section>
	<!-- End banner Area -->
			<div class="button-group-area mt-40">
				<!-- 버튼 두개는 관리자만 보이게 -->
				<c:if test="${role eq 'admin' }">
					<button type="button" id="editBtn" class="genric-btn default circle" style="position: fixed; top: 20%; right: 2.5%; z-index: 100;"
					onclick="location.href='contentUpdateForm.do?exhibitNum=${exhibit.exhibitNum }'">EDIT</button>
					<button type="button" id="delBtn" class="genric-btn danger circle" style="position: fixed; top: 25%; right: 3%; z-index: 100;"
					onclick="location.href='deleteContentForm.do?exhibitNum=${exhibit.exhibitNum}'">DELETE</button>
				</c:if>
			</div>
	<!-- Start cat-top Area -->
			<section class="cat-top-area section-gap">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6 cat-top-left">
							<h1>${exhibit.exhibitName }</h1>
							<p style="font-size: 20px;line-height: 40px;">
								<span style="font-weight: bold">Exhibit Date :</span> <c:out value="${fn:substring(exhibit.startDate,0,10) }"/> ~ <c:out value="${fn:substring(exhibit.endDate,0,10) }"/><br/>
								<span style="font-weight: bold">College :</span> ${exhibit.exhibitSchool }<br/>
								<span style="font-weight: bold">Major :</span> ${exhibit.exhibitMajor }
							</p>
						</div>
						<!-- 전시 대표 이미지 -->
						<div class="col-lg-6 cat-top-right">
							<img class="img-fluid" src="${exhibit.image }" alt="">
						</div>
					</div>
				</div>	
			</section>
	<!-- End cat-top Area -->	
	
	<!-- Start recent-worl Area -->
			<section class="recent-work-area section-gap">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">About Exhibition</h1>
								<p>${exhibit.content }</p>
							</div>
						</div>
					</div>						
					<div class="row">
					<c:forEach items="${exhibitImages }" var="e">
						<div class="col-lg-6 single-recent-work">
							<a class="recent-project">
								<img class="img-fluid" src="${e.fileImage }" width="200" height="300">
							</a>	
						</div>
					</c:forEach>
					</div>
				</div>	
			</section>
	<!-- End recent-worl Area -->
		<div class="button-group-area mt-40" style="margin:10px;font-size:15px;">
					<button type="button" class="genric-btn default circle arrow"
							onclick="location.href='main.do'">HOME</button>
					<button type="button" class="genric-btn default circle arrow"
							onclick="location.href='exhibitList.do'">BACK</button>
		</div>

</body>
</html>