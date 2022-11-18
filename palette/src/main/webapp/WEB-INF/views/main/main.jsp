<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Jua&display=swap"
	rel="stylesheet">

	
<link rel="icon" href="image/hjjimage/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/hjjcss/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/hjjcss/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/hjjcss/owl.carousel.min.css">
<link rel="stylesheet" href="css/hjjcss/lightslider.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/hjjcss/all.css">
<link rel="stylesheet" href="css/hjjcss/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/hjjcss/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/hjjcss/style.css">
<script src="https://kit.fontawesome.com/0695eff491.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>

<style>
/***************** product list css *******************/
/* line 3, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item {
	border-radius: 5px;
	margin-bottom: 20px;
	-webkit-transition: 0.5s;
	transition: 0.5s;
}

/* line 7, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item .single_product_text {
	padding: 35px 0 0;
	background-color: #fff;
	-webkit-transition: 0.5s;
	transition: 0.5s;
}

/* line 11, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item .single_product_text h4 {
	font-weight: 700;
	font-size: 18px;
	margin-bottom: 14px;
}

/* line 16, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item .single_product_text h3 {
	font-weight: 300;
	font-size: 18px;
}

/* line 20, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item .single_product_text a {
	color: #ff3368;
	text-transform: uppercase;
	font-size: 18px;
	font-weight: 500;
	display: block;
	margin-top: 10px;
	opacity: 0;
	visibility: hidden;
	-webkit-transition: 0.5s;
	transition: 0.5s;
}

/* line 30, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item .single_product_text a i {
	float: right;
	font-size: 18px;
	line-height: 26px;
	color: #000;
}

/* line 38, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item:hover {
	box-shadow: none;
}

/* line 40, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item:hover .single_product_text {
	padding: 32px 0 0;
}

/* line 44, ../../01 cl html template/03_jun 2019/188_Aranoz shop_html/sass/_best_seller.scss */
.best_seller .single_product_item:hover a {
	opacity: 1;
	visibility: visible;
}

.product-img {
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transition: all 0.3s ease-in-out; /* 부드러운 모션을 위해 추가*/
	width: 450px;
	height: 430px;
	overflow: hidden
}

.product-img:hover {
	transform: scale(1.2);
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
}

.product_image_area {
	padding: 100px 0px 0px 50px;;
}

.pPrice {
	display: inline;
}

.dateColor {
	color: rgb(99, 99, 99);
}

.btnBasket, .btnUpDel {
	color: #ff3368;
	border: 1px solid #ff3368;
	background: #fff;
	margin: 5px;
}

.imsi {
	float: right;
	position: absolute;
	top: 700px;
	right: 100px;
}

.col-lg-7 .col-xl-7 {
	padding-top: 100px;
}

.single_product_item {
	
}

.sumImg {
	height: 187px;
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
	cursor: pointer;
}

.topMenu {
	padding-left: 40px;
}

#hoverartP p {
	padding-top:10px;
	color: white;
}

.main_section03 #mainAccountUl #accountItem:hover p{
	color: #ffffff!important;
}

#mainBoardUl{
margin-top:30px;
width:500px;
margin-right: 250px;
text-align: left;
transform:rotate(-1.5deg);

}

#mainBoardUl li{
cursor: pointer;
}

#mainBoardUl li:hover{
cursor: pointer;
transform: scale(1.1);

}
</style>
</head>

<body>
	<div id="mainWrapper" align="center">
		<section class="main_section01">
		<div style="width: 1920px; height: 1000px; overflow:hidden;">
			<iframe muted="" src="https://player.vimeo.com/video/351041917?color=ffffff&amp;title=0&amp;byline=0&amp;portrait=0&amp;background=1&amp;muted=1" frameborder="0" allow="autoplay;" style="width: 1657px; height: 1080px; margin-top:-100px;margin-right:3px;"></iframe>
		</div>
			<!-- <div class="section_title">
				<div class="title2"></div>
				<div class="title1"></div>
			</div> -->
		</section>

		<section class="main_section02">
			<div class="section_title">
				<div class="title2">Best Collection</div>

			</div>
			<div>
				<ul id="mainArtUl">
					<c:forEach items="${art}" var="a">
						<li class="artItem" onclick="location.href='feedSelect.do?id=${a.artId}';"><img class="artImg" src="${a.artImage }" />
							<div id="hoverArtText">
								<div id="hoverartP">
									<p style="font-size: 24px; font-weight: 700;">${a.artTitle}</p>
									<p style="font-size: 16px; font-weight: 500;">${a.artContent}</p>
									<p style="font-size: 18px; font-weight: 600;">${a.artId}</p>
								</div>
							</div></li>
					</c:forEach>
				</ul>
			</div>
		</section>

		<section class="main_section03">
			<div class="section_title">
				<div class="title2">PALETTE TOP ARTIST</div>
			</div>
			<div>
				<ul id="mainAccountUl">
					<c:forEach items="${account}" var="ac">
						<li id="accountItem"
							onclick="location.href='feedSelect.do?id=${ac.id}';"><img
							class="accountImg" src="${ac.image }" />
							<p style="font-size: 16px; font-weight: 600;margin-bottom:-10px;">${ac.name}</p></li>
					</c:forEach>
				</ul>
			</div>
		</section>

		<div class="section_banner">
			<a href="product.do">
				<image src="https://www.art1.com/images/main/section_banner.jpg" style="vertical-align: middle;">
			</a>
		</div>

		<section class="main_section04">
			<!-- product_list part start-->
			<section class="product_list best_seller">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-12">
							<div class="section_tittle text-center">
								<h2>
									Best Sellers <span>shop</span>
								</h2>
							</div>
						</div>
					</div>
					<div class="row align-items-center justify-content-between">

						<div class="col-lg-12">
							<div class="best_product_slider owl-carousel">
								<c:forEach var="topFive" items="${topFivelist }">
									<div class="single_product_item">
										<a href="productDetail.do?productNumber=${topFive.productNumber}">
											<img src="${topFive.getImage()}" alt="" class="sumImg">
										</a>
										<div class="single_product_text">
											<h4>${topFive.getProductName()}</h4>
											<h3>${topFive.getProductPrice()}</h3>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- product_list part end-->
		</section>

		<section class="main_section05">
			<div class="section_title">
				<div class="title2">PALETTE COMMUNITY</div>
			</div>
			<div>
				<ul id="mainBoardUl">
					<c:forEach items="${board}" var="b">
						<li id="boardItem" onclick="location.href='boardSelectSession.do?userid=${b.userId}&date=${b.createDate}&number=${b.boardNumber}&title=${b.boardTitle}&content=${b.boardContent}&writer=${b.boardWriter}&cnt=${b.viewCnt}';">
							<p style="font-size: 30px; font-weight: 600;color: #333;font-family: 'East Sea Dokdo', cursive;">▶&nbsp;${b.boardTitle} - ${b.boardWriter }</p>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>

		<div id="section_banner">
			<a href="exhibitList.do"> <image
					src="https://www.art1.com/images/main/section_banner_02.jpg"
					style="vertical-align: middle;" />
			</a>
		</div>
	</div>

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/hjjjs/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/hjjjs/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/hjjjs/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/hjjjs/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/hjjjs/lightslider.min.js"></script>
	<!-- swiper js -->
	<script src="js/hjjjs/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/hjjjs/owl.carousel.min.js"></script>
	<script src="js/hjjjs/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/hjjjs/slick.min.js"></script>
	<script src="js/hjjjs/swiper.jquery.js"></script>
	<script src="js/hjjjs/jquery.counterup.min.js"></script>
	<script src="js/hjjjs/waypoints.min.js"></script>
	<script src="js/hjjjs/contact.js"></script>
	<script src="js/hjjjs/jquery.ajaxchimp.min.js"></script>
	<script src="js/hjjjs/jquery.form.js"></script>
	<script src="js/hjjjs/jquery.validate.min.js"></script>
	<script src="js/hjjjs/mail-script.js"></script>
	<script src="js/hjjjs/stellar.js"></script>
	<!-- custom js -->
	<script src="js/hjjjs/custom.js"></script>
</body>

</html>