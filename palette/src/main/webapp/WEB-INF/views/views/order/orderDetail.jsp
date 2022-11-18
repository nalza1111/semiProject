<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Palette</title>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>aranaz</title>
	<link rel="icon" href="image/hjjimg/favicon.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/hjjcss/bootstrap.min.css">
	<!-- animate CSS -->
	<link rel="stylesheet" href="css/hjjcss/animate.css">
	<!-- owl carousel CSS -->
	<link rel="stylesheet" href="css/hjjcss/owl.carousel.min.css">
	<!-- nice select CSS -->
	<link rel="stylesheet" href="css/hjjcss/nice-select.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/hjjcss/all.css">
	<!-- flaticon CSS -->
	<link rel="stylesheet" href="css/hjjcss/flaticon.css">
	<link rel="stylesheet" href="css/hjjcss/themify-icons.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/hjjcss/magnific-popup.css">
	<!-- swiper CSS -->
	<link rel="stylesheet" href="css/hjjcss/slick.css">
	<link rel="stylesheet" href="css/hjjcss/price_rangs.css">
	<!-- style CSS -->
	<link rel="stylesheet" href="css/hjjcss/style.css">
	<script src="https://kit.fontawesome.com/0695eff491.js" crossorigin="anonymous"></script>
	<style>
		img {
			width: 80px;
			height: 80px;
		}
		#navi{
			position: fixed;
			bottom:120px;
			right:50px;
			border: none;
		}
		.d-flex p {
			color: #ff3368;
			font-weight: bolder;
		}
		button {
			color: #ff3368;
	    	border: 1px solid #ff3368;
    		background: #fff;
			margin: 5px;
		}
		#numi {
			padding-top: 30px;
			margin-bottom: 150px;
		}
	</style>
</head>
<body>
<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Shop Palette</h2>
							<p>Art <span>-</span>Gallery Shop</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================Order Area =================-->
	<section class="cart_area padding_top">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">주문번호 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;배송지</th>
								<th scope="col">주문일</th>
								<th scope="col">id</th>
								<th scope="col">이름</th>
								<th scope="col">전화번호</th>
							</tr>
						</thead>
						<tbody>
							<!--여기시작-->
									<tr>
										<td>
											<div class="media">
													<div class="d-flex"><p>${orderNumber }</p>
												</div>
												<div class="media-body">
													<p>${address }</p>
												</div>
											</div>
										</td>
										<td>
											<h5>${orderDate }</h5>
										</td>
										<td>
											<h5>${id }</h5>
										</td>
										<td>
											<h5>${name }</h5>
										</td>
										<td style="padding-left: 3%;">
											${tel}
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					</section>
				<!--- THE END HERO HEADER (주문자)--->
				<section class="cart_area padding_top" style="padding-top: 30px; padding-bottom: 150px;">
					<div class="container">
						<div class="cart_inner">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th scope="col" >Product</th>
											<th></th>
											<th scope="col">Price</th>
											<th scope="col" >Quantity</th>
											<th scope="col">Subtotal</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="sum" value="0" />
										<c:forEach var="l" items="${FinalList }">
										<c:set var="sum" value="${sum+(l.productCount*l.productPrice)}" />
											<tr>
											<td>
												<div class="media">
													<div class="d-flex">
														<a class="product-detail" href="productDetail.do?productNumber=${l.productNumber}">
															<img class="product-img"src="${l.image}" alt="..." />
														</a>
													</div>
													<div class="media-body">
														<p><a class="product-detail" href="productDetail.do?productNumber=${l.productNumber}">
																${l.productName }
															</a>
														</p>
											</div>
											</div>
														
											</td>
											<td></td>
											<td>
												<h5>${l.productPrice}</h5>
											</td>
											<td>${l.productCount }</td>
											<td>${l.productCount*l.productPrice}</td>
											</c:forEach>
										</tbody>
										<tr>
											<td></td>
											<td></td>
											<td>
												<h5 class="subTT">Total</h5>
											</td>
										
											<td>
												<h5 id="totalCartForm" class="subTT">
													<c:out value="${sum }" />
												</h5>
											</td>
											<td>
											</td>
										</tr>
								</table>
								<!--#####################################################-->
							</div>
						</div>
					</div>
				<!--- THE END HERO HEADER (주문물건)--->
				<!--- THE END HERO HEADER (네비)--->
				<nav id="navi">
					<hr>
					<button class="btnBasket" onClick="cartFnc()">
						<i class="fas fa-shopping-basket"></i> <span id="basket">${cartCountNumber }</span>
					</button>
					<hr>		
					<button class="btnLog" onClick="location.href = 'orderHistory.do'">구매내역</button>
					<hr>
						<a href="product.do">HOME</a>
					<hr>
				</nav>		
	</section>
	<script>
		function cartFnc() {//주문내역이라 로그인확인x
			location.href = 'cartForm.do';
		}
		
	</script>
</body>
</html>