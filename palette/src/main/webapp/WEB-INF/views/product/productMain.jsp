<%@page
	import="org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.bootjava.palette.cart.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- nice select CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/price_rangs.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
	<style>
		.product-img{
			height: 223.56px;
			width: 210px;
		}
	</style>
</head>

<body>
	<!--여기시작-->
    <!--::header part start::-->
    <header class="main_menu home_menu">
        
        <div class="search_input" id="search_input_box">
            <div class="container" style="display:none;">
                <form class="d-flex justify-content-between search-inner" >
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    <!-- Header part end-->

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Shop Category</h2>
                            <p>Home <span>-</span> Shop Category</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
<!--================Category Product Area =================-->
<section class="cat_product_area section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="left_sidebar_area">
					<aside class="left_widgets p_filter_widgets">
						<div class="l_w_title">
							<h3>Browse Categories</h3>
						</div>
						<div class="widgets_inner">
							<ul class="list">
								<li>
									<a href="#">Frozen Fish</a>
									<span>(250)</span>
								</li>
								<li>
									<a href="#">Dried Fish</a>
									<span>(250)</span>
								</li>
								<li>
									<a href="#">Fresh Fish</a>
									<span>(250)</span>
								</li>
								<li>
									<a href="#">Meat Alternatives</a>
									<span>(250)</span>
								</li>
								<li>
									<a href="#">Fresh Fish</a>
									<span>(250)</span>
								</li>
								<li>
									<a href="#">Meat Alternatives</a>
									<span>(250)</span>
								</li>
								<li>
									<a href="#">Meat</a>
									<span>(250)</span>
								</li>
							</ul>
						</div>
					</aside>


					<aside class="left_widgets p_filter_widgets price_rangs_aside">
						<div class="l_w_title">
							<h3>Price Filter</h3>
						</div>
						<div class="widgets_inner">
							<div class="range_item">
								<!-- <div id="slider-range"></div> -->
								<input type="text" class="js-range-slider" value="" />
								<div class="d-flex">
									<div class="price_text">
										<p>Price :</p>
									</div>
									<div class="price_value d-flex justify-content-center">
										<input type="text" class="js-input-from" id="amount" readonly />
										<span>to</span>
										<input type="text" class="js-input-to" id="amount" readonly />
									</div>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-lg-12">
						<div class="product_top_bar d-flex justify-content-between align-items-center">
							<div class="single_product_menu">
								<p><span>10000 </span> Prodict Found</p>
							</div>
							<div class="single_product_menu d-flex">
								<h5>short by : </h5>
								<select>
									<option data-display="Select">name</option>
									<option value="1">price</option>
									<option value="2">product</option>
								</select>
							</div>
							<div class="single_product_menu d-flex">
								<h5></h5>
								<div class="top_pageniation">
									<ul>
										<li></li>
										<li></li>
										<li></li>
									</ul>
								</div>
							</div>
							<div class="single_product_menu d-flex">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="search"
										aria-describedby="inputGroupPrepend">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroupPrepend"><i
												class="ti-search"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row align-items-center latest_product_inner" id="All-list">
					<div class="col-lg-4 col-sm-6">
						<div class="single_product_item" style="display:none;">
							<img src="" alt="" class="product-img">
							<div class="single_product_text">
								<a href="" class="product-detail">
									<h4 class="product-namename"></h4>
								</a>
								<h3 class="product-priceprice"></h3>
								<a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Category Product Area =================-->

	<!--- THE END HERO HEADER (이전)--->

		<!-- <input type="hidden" id="idCheck" value="${id }">
		<nav>
			<form action="searchProduct.do">
				<select name="categoryCode">
					<option value="all">::전체::</option>
					<option value="europe">북유럽</option>
					<option value="modern">모던시크</option>
					<option value="vintage">빈티지</option>
					<option value="mini">미니멀</option>
					<option value="classic">모던클래식</option>
					<option value="inder">인더스트리얼</option>
				</select> 검색<input type="text" id="search" name="search"> <input
					type="submit" value="검색">
			</form>
			<br>
			<button class="btnBasket" onClick="cartFnc()">
				장바구니 <span id="basket">${cartCountNumber }</span>
			</button>
			<button class="btnLog" onClick="oderHisFnc()">구매내역</button>
			<button class="btnAdmin" onClick="location.href='addProductForm.do'">관리자의상품추가</button>
			<br>
		</nav>
		<hr>-->
		<div>
			<button class="btnO" id="btnO" name="btnO"
				onclick="fncList('search')">조회순</button>
			<button class="btnO" id="btnO" name="dateBtn"
				onclick="fncList('date')">출시일</button>
			<button class="btnO" id="btnO" name="highPriceBtn"
				onclick="fncList('highPrice')">높은가격</button>
			<button class="btnO" id="btnO" name="lowPriceBtn"
				onclick="fncList('lowPrice')">낮은가격</button>
		</div>
		<!--<hr>
		<div class="All-list">-->

			<!--- WORK PAGE PROJECTS --->

		</div>
		<!--- THE END WORK PAGE PROJECTS --->
	
	<!--- THE END WORK PAGE PROJECTS --->
	<script>
		window.onload =  function aaa() {
			let url = "productTest.do";
			fetch(url)
				.then(result=>result.json())
				.then(listDo2)
				.catch(err=>console.log(err))
		}
		function fncAddCart(value) {
			//아이디유무체크
			function cartFnc() {//아이디체크 없으면 로그인화면으로
				let checkId = document.getElementById('idCheck').value;
				console.log(checkId);
				if (checkId != '') {
				} else {
					alert('로그인 후 이용해주세요');
					location.href = 'accountLoginForm.do';
				}
			}
			console.log(value);
			let url = "addCart.do?" + value;

			fetch(url, {
				headers: { 'Content-type': 'application/x-www-form-urlencoded' }
			})
				.then(result => result.json())
				.then(testFnc)
				.catch(err => console.log(err));
		}
		function testFnc(result) {
			console.log(result);
			document.getElementById('basket').textContent++;
		}
		function cartFnc() {//아이디체크 없으면 로그인화면으로
			let checkId = document.getElementById('idCheck').value;
			console.log(checkId);
			if (checkId != '') {
				location.href = 'cartForm.do';
			} else {
				alert('로그인 후 이용해주세요');
				location.href = 'accountLoginForm.do';
			}
		}
		function oderHisFnc() {
			let checkId = document.getElementById('idCheck').value;
			if (checkId != '') {
				location.href = 'orderHistory.do';
			} else {
				alert('로그인 후 이용해주세요');
				location.href = 'accountLoginForm.do';
			}
		}
	</script>
		<script>
		function fncList(text) {
			let url = "productSort.do?job=" + text;
			fetch(url)
				.then(result => result.json())
				.then(listDo)
				.catch(err => console.log(err));
		}
		function listDo2(result) { //화면 처음 열 때
			console.log(result);
			result.forEach(item => {
				makeItemDiv(item);
			});
		}
		
		function listDo(result) { //조회
			console.log(result);
			//먼저 있던거 지우기
			let allList = document.querySelector('.col-lg-4');
			while (allList.children.hasChildNodes()) {
				allList.removeChild(allList.firstChild);
			}
			result.forEach(item => {
				makeItemDiv(item);
			});
		}
		function makeItemDiv(item = {}) {
			let allList = document.querySelector('.col-lg-4');

			let template = document.querySelector('.single_product_item');
			let good = template.cloneNode(true);
			//이미지링크
			let imgLink = good.querySelector('.single_product_item>img');
			imgLink.setAttribute('href', 'productDetail.do?productNumber=' + item.productNumber);
			//이미지
			good.querySelector('.product-img').src = '/palette/image/' + item.image;
			//링크
			
			let link = good.querySelector('.product-detail');
			link.setAttribute('href', 'productDetail.do?productNumber=' + item.productNumber);
			//제목
			good.querySelector('.product-namename').textContent = item.productName;
			//가격
			good.querySelector('.product-priceprice').textContent = item.productPrice + '￦';
			//애드카트
			//good.querySelector('.btnAddBasket').value = 'productNumber=' + item.productNumber + '&productPrice=' + item.productPrice;
			good.setAttribute('style',"display:'';")
			allList.append(good);

		}
		</script>
		<!-- jquery plugins here-->
		<script src="js/jquery-1.12.1.min.js"></script>
		<!-- popper js -->
		<script src="js/popper.min.js"></script>
		<!-- bootstrap js -->
		<script src="js/bootstrap.min.js"></script>
		<!-- easing js -->
		<script src="js/jquery.magnific-popup.js"></script>
		<!-- swiper js -->
		<script src="js/swiper.min.js"></script>
		<!-- swiper js -->
		<script src="js/masonry.pkgd.js"></script>
		<!-- particles js -->
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.nice-select.min.js"></script>
		<!-- slick js -->
		<script src="js/slick.min.js"></script>
		<script src="js/jquery.counterup.min.js"></script>
		<script src="js/waypoints.min.js"></script>
		<script src="js/contact.js"></script>
		<script src="js/jquery.ajaxchimp.min.js"></script>
		<script src="js/jquery.form.js"></script>
		<script src="js/jquery.validate.min.js"></script>
		<script src="js/mail-script.js"></script>
		<script src="js/stellar.js"></script>
		<script src="js/price_rangs.js"></script>
		<!-- custom js -->
		<script src="js/custom.js"></script>
</body>

</html>