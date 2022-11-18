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
		.table-responsive{
			margin-bottom: 150px;
		}
		tr td:last-child {
    		padding-left: 3%; 
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
								<th scope="col"> &nbsp;  &nbsp;  &nbsp;  &nbsp; <i class="fa-solid fa-chart-simple"></i> &nbsp;  &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;배송지</th>
								<th scope="col">주문일</th>
								<th scope="col">주문자</th>
								<th scope="col">TEL</th>
								<th scope="col">결제여부</th>
							</tr>
						</thead>
						<tbody>
							<!--여기시작-->
							<c:forEach var="l" items="${list}">
									<tr>
										<td>
											<div class="media">
												<div class="d-flex">
													<a class="order-detail" href="orderDetail.do?
																orderNumber=${l.getOrderNumber() }
																&orderDate=${l.getOrderDate() }
																&address=${l.getAddress() }
																&name=${l.getName() }
																&tel=${l.getTel() }
																&payDo=${l.getPayDo() }">
																<p>주문번호: ${l.getOrderNumber() }</p></a>
												</div>
												<div class="media-body">
													<p>${l.getAddress() }</p>
												</div>
											</div>
										</td>
										<td>
											<h5>${l.getOrderDate() }</h5>
										</td>
										<td>
											<h5>${l.getName() }</h5>
										</td>
										<td>
											<h5>${l.getTel() }</h5>
										</td>
										<td>
											<h5><c:if test="${l.getPayDo()  eq '0'}">O</c:if>
											<c:if test="${l.getPayDo()  eq '1'}">X</c:if></h5>
										</td>
									</tr>
							</c:forEach>
					</table>
				</div>
			</div>
		</div>
	<!--- THE END HERO HEADER (이전)--->
	<nav id="navi">
		<hr>
		<button class="btnBasket" onClick="cartFnc()">
			<i class="fas fa-shopping-basket"></i> <span id="basket">${cartCountNumber }</span>
		</button>
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