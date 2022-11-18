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
<title>Palette</title>
	<link rel="icon" href="image/img/favicon.png">
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
    <!-- 어썸폰트 -->
    <script src="https://kit.fontawesome.com/0695eff491.js" crossorigin="anonymous"></script>
	<style>
		.product-img{
			height: 223.56px;
			width: 210px;
		}
		 .product-priceprice{
			visibility: hidden ;
			display: inline;
		}
		.fa-solid{
			visibility: hidden ;
		}
		.single_product_item:hover  .product-priceprice{
			transition: 10s;
			visibility: visible;
		}
		.single_product_item:hover  .fa-solid{
			visibility: visible;
		}
		.list li a:hover{
			cursor: pointer;
		}
		.input-group-prepend {
			cursor: pointer;
		}
		#add_cart {
			cursor: pointer;
		}
		button {
			color: #ff3368;
	    	border: 1px solid #ff3368;
    		background: #fff;
			margin: 5px;
		}
		#navi{
			position: fixed;
			bottom:120px;
			right:50px;
			border: none;
		}
		
	</style>
</head>

<body>
	<!--여기시작-->
	<input type="hidden" id="idCheck" value="${id }">
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
										<a>전체</a>
										<span>${allSum}</span>
									</li>
									<li>
										<a>미술작품</a>
										<span>${b01}</span>
									</li>
									<li>
										<a>조형물</a>
										<span>${b02}</span>
									</li>
									<li>
										<a>사진</a>
										<span>${b03}</span>
									</li>
									<li>
										<a>판화</a>
										<span>${b04}</span>
									</li>
									<li>
										<a>디지털 아트</a>
										<span>${b05}</span>
									</li>
									<li>
										<a>콜라주</a>
										<span>${b06}</span>
									</li>
									<li>
										<a>섬유 예술</a>
										<span>${b07}</span>
									</li>
								</ul>
							</div>
							<div>
								
							</div>
						</aside>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div class="product_top_bar d-flex justify-content-between align-items-center">
								<div class="single_product_menu">
									<p><span>loading... </span> Prodict Found</p>
								</div>
								<div class="single_product_menu d-flex">
									<h5>sort by : </h5>
									<select  onchange="fncList()" id="select-option-sort">
										<option data-display="Select">Select</option>
										<option value="search">조회순</option>
										<option value="date">출시일</option>
										<option value="highPrice">고가격순</option>
										<option value="lowPrice">저가격순</option>
									</select>
								</div>
								<div class="single_product_menu d-flex">
									<div class="input-group">
										<input type="text" class="form-control" name="form-control" id="form-control" placeholder="search"
											aria-describedby="inputGroupPrepend">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend"><i class="fa fa-search"></i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row align-items-center latest_product_inner" id="All-list">
						
					</div>
					<!--뿌리기용-->
					<div class="col-lg-4 col-sm-6" id="copyList">
						<div class="single_product_item" style="display:none;">
							<a href="" class="product-detail-photo">
								<img src="" alt="" class="product-img">
							</a>
							<div class="single_product_text">
								<a href="" class="product-detail">
									<h4 class="product-namename"></h4>
								</a>
							<i class="fa-solid fa-coins"></i>
							<h3 class="product-priceprice"></h3>
							<a class="add_cart" id="add_cart" onClick="fncAddCart(this)">
								+ add to cart
								<i class="fa-solid fa-cart-shopping"></i>
							</a>
							<input type="hidden" class="add_cart_value" name="add_cart_value"></div>
					</div>
				</div>
				<!--뿌리기용-->
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
		<button class="btnLog" onClick="oderHisFnc()">구매내역</button>
		<hr>
		<button class="btnAdmin" onClick="location.href='addProductForm.do'">상품추가</button>
		<hr>
	</nav>
	<!--- THE END WORK PAGE PROJECTS --->
	</section>
	<!--================End Category Product Area =================-->
	<script>
		//서치버튼
		let glass = document.querySelector('.input-group-prepend');
		glass.addEventListener('click', fncSearch)

		function fncSearch(){
			let search = document.querySelector('#form-control').value;
			console.log(search);
			document.querySelector('#form-control').value='';

			let url = "searchProduct.do?search=" + search;

			fetch(url, {
				headers: { 'Content-type': 'application/x-www-form-urlencoded' }
			})
				.then(result => result.json())
				.then(listDo)
				.catch(err => console.log(err));
		}
		//장바구니담기
		function fncAddCart(th) {
			let value = th.parentNode.lastChild.value;
			//아이디유무체크
			cartFnc2();
			
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
			document.getElementById('basket').textContent++;
		}
		function cartFnc() {//아이디체크 없으면 로그인화면으로(장바구니가기 기능)
			let checkId = document.getElementById('idCheck').value;
			console.log(checkId);
			if (checkId != '') {
				location.href = 'cartForm.do';
			} else {
				alert('로그인 후 이용해주세요');
				location.href = 'accountLoginForm.do';
				}
		}
		function cartFnc2() {//아이디체크 없으면 로그인화면으로(카트)
				let checkId = document.getElementById('idCheck').value;
				console.log(checkId);
				if (checkId != '') {
				} else {
					alert('로그인 후 이용해주세요');
					location.href = 'accountLoginForm.do';
				}
			}
		//주문내역
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
		//깔아주기용
		window.onload =  function aaa() {
				let url = "productTest.do";
				fetch(url)
					.then(result=>result.json())
					.then(listDo2)
					.catch(err=>console.log(err))
			}	
		//카테고리버튼누름
		let cateText = document.querySelectorAll('.list>li>a');
		cateText.forEach(row=>{
			row.addEventListener('click', cateSearch);
		})
		function cateSearch(){
			txt = this.textContent;
			console.log(txt); 
			if(txt=='전체'){
				txt='all';
			}/* if(txt=='미술작품') {
				txt='B01';
			} if(txt=='조형물') {
				txt='B02';
			} if(txt=='사진') {
				txt='B03';
			} if(txt=='판화') {
				txt='B04';
			} if(txt=='디지털 아트') {
				txt='B05';
			}  if(txt=='콜라주') {
				txt='B06';
			} if(txt=='섬유 예술') {
				txt='B07';
			} */
			let url = "searchProductBtn.do?job=" + txt;
			fetch(url)
				.then(result => result.json())
				.then(listDo)
				.catch(err => console.log(err));
		}

		//셀렉트 조회 펑션
		function fncList() {
			let text = document.getElementById('select-option-sort').value;
			console.log(text);
			let url = "productSort.do?job=" + text;
			fetch(url)
				.then(result => result.json())
				.then(listDo)
				.catch(err => console.log(err));
		}
		//화면 처음 열 때
		function listDo2(result) {
			console.log(result.length);
			document.querySelector('.single_product_menu>p>span').textContent=result.length;
			result.forEach(item => {
				makeItemDiv(item);
			});
		}
		//셀렉트 조회
		function listDo(result) { 
			document.querySelector('.single_product_menu>p>span').textContent=result.length;
			//먼저 있던거 지우기
			let allList = document.querySelector('#All-list');
			while (allList.hasChildNodes()) {
				allList.removeChild(allList.firstChild);
			}
			result.forEach(item => {
				makeItemDiv(item);
			});
		}
		function makeItemDiv(item = {}) {
			let allList = document.querySelector('#All-list');

			let template = document.querySelector('#copyList');
			let good = template.cloneNode(true);
			//이미지링크
			let imgLink = good.querySelector('.product-detail-photo');
			imgLink.setAttribute('href', 'productDetail.do?productNumber=' + item.productNumber);
			//이미지
			good.querySelector('.product-img').src = item.image;
			//링크
			
			let link = good.querySelector('.product-detail');
			link.setAttribute('href', 'productDetail.do?productNumber=' + item.productNumber);
			//제목
			good.querySelector('.product-namename').textContent = item.productName;
			//가격
			good.querySelector('.product-priceprice').textContent = item.productPrice ;
			//애드카트
			good.querySelector('.add_cart_value').value = 'productNumber=' + item.productNumber + '&productPrice=' + item.productPrice;
			good.querySelector('.single_product_item').setAttribute('style',"display:'';")
			allList.append(good);
		}
	</script>
	<!-- jquery plugins here-->
	<script src="js/hjjjs/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/hjjjs/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/hjjjs/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/hjjjs/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/hjjjs/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/hjjjs/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/hjjjs/owl.carousel.min.js"></script>
	<script src="js/hjjjs/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/hjjjs/slick.min.js"></script>
	<script src="js/hjjjs/jquery.counterup.min.js"></script>
	<script src="js/hjjjs/waypoints.min.js"></script>
	<script src="js/hjjjs/contact.js"></script>
	<script src="js/hjjjs/jquery.ajaxchimp.min.js"></script>
	<script src="js/hjjjs/jquery.form.js"></script>
	<script src="js/hjjjs/jquery.validate.min.js"></script>
	<script src="js/hjjjs/mail-script.js"></script>
	<script src="js/hjjjs/stellar.js"></script>
	<script src="js/hjjjs/price_rangs.js"></script>
	<!-- custom js -->
	<script src="js/hjjjs/custom.js"></script>
</body>

</html>