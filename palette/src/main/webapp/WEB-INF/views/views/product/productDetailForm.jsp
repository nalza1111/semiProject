<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Palette</title>
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
	<script src="https://kit.fontawesome.com/0695eff491.js" crossorigin="anonymous"></script>
	<title>Palette</title>
	<style>
		
		.product-img {
		transform: scale(1);
		-webkit-transform: scale(1);
		-moz-transform: scale(1);
		-ms-transform: scale(1);
		-o-transform: scale(1);
		transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
		width: 450px;
		height: 430px;
		overflow:hidden 
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
		.pPrice{
			display: inline;
		}
		.dateColor{
			color: rgb(99, 99, 99);
		}
		.btnBasket, .btnUpDel {
			color: #ff3368;
	    	border: 1px solid #ff3368;
    		background: #fff;
			margin: 5px;
		}
		.imsi{
			right:50px;
			position: fixed;
			bottom:120px;
		}
		}
		.col-lg-7 .col-xl-7{
			padding-top: 100px;
		}
		.single_product_item, .btn_3{
			cursor: pointer;
		}
		.sumImg {
			height: 187px;
			-webkit-transition: .3s ease-in-out;
  			transition: .3s ease-in-out;
  			cursor: pointer;
		}
	</style>
</head>
<body>
	<input type="hidden" id="idCheck" value="${id }">
	<input type="hidden" class="pNumber" value="${product.productNumber }">
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
			<div class="breadcrumb_iner">
				<div class="breadcrumb_iner_item">
				<h2>Shop Single</h2>
				<p>Home <span>-</span> Shop Single</p>
				</div>
			</div>
			</div>
		</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================End Home Banner Area =================-->

	
  <!--================Single Product Area =================-->
  <div class="product_image_area section_padding">
    <div class="container">
      <div class="row s_product_inner justify-content-between">
        <div class="col-lg-7 col-xl-7">
          <div class="product_slider_img">
            <div id="vertical">
              <div data-thumb="/palette/image/product/${product.getImage()}">
                <img src="${product.getImage()}" class="product-img" />
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 col-xl-4">
          <div class="s_product_text">
            <h3>${product.getProductName()}</h3>
            <i class="fa-solid fa-coins"></i><h2 class="pPrice"> ${product.getProductPrice()}</h2>
            <ul class="list">
              <li>
                <a class="active" href="product.do?categoryCode=${product.getCategoryCode()}">
                  <span>Category</span> : ${product.getCategoryCode()}</a>
              </li>
              <li>
                <a> <span>Availibility</span> : In Stock</a>
              </li>
            </ul>
            <p>
            	<h5 class="dateColor">${product.getProductDate()}</h5>
              First replenish living. Creepeth image image. Creeping can't, won't called.
              Two fruitful let days signs sea together all land fly subdue
            </p>
            <div class="card_area d-flex justify-content-between align-items-center">
              <div class="product_count">
                <span class="inumber-decrement"> <i class="fa-solid fa-caret-left"></i></span>
                <input class="input-number" type="text" value="1" min="1" max="10">
                <span class="number-increment"> <i class="fa-solid fa-caret-right"></i></span>
              </div>
              <a class="btn_3" onClick=fucCountAdd()>add to cart</a>
              <a class="like_us"> <i class="fa-solid fa-heart"></i> </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
  <section class="product_description_area">
		<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
			<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">Description</a>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
			<p>
				${product.getProductDesc()}
			</p>
			<p>
				It is often frustrating to attempt to plan meals that are designed
				for one. Despite this fact, we are seeing more and more recipe
				books and Internet websites that are dedicated to the act of
				cooking for one. Divorce and the death of spouses or grown
				children leaving for college are all reasons that someone
				accustomed to cooking for more than one would suddenly need to
				learn how to adjust all the cooking practices utilized before into
				a streamlined plan of cooking that is more efficient for one
				person creating less
			</p>
			</div>
		</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!-- product_list part start-->
	<section class="product_list best_seller">
		<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
			<div class="section_tittle text-center">
				<h2>Best Sellers <span>shop</span></h2>
			</div>
			</div>
		</div>
		<div class="row align-items-center justify-content-between">
			
			<div class="col-lg-12">
				<div class="best_product_slider owl-carousel">
					<c:forEach var="topFive" items="${topFivelist }">
						<div class="single_product_item">
							<a href="productDetail.do?productNumber=${topFive.getProductNumber()}"><img src="${topFive.getImage()}" alt="" class="sumImg"></a>
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


	<div class="imsi">
		<hr>
		
		<button class="btnBasket" onClick="cartFnc()">
			<i class="fas fa-shopping-basket"></i>
			<span id="basket">${cartCountNumber }</span>
		</button>
		<c:if test="${role eq 'admin'}">
			<button class="btnUpDel" onclick="location.href='upDelProductForm.do?productNumber=${product.productNumber}'">UP/DEL</button>
		<a href="product.do">뒤로</a>
		<hr>
		</c:if>
	</div>
	<script>
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
		function fucCountAdd(){
			//아이디체크
			let checkId = document.getElementById('idCheck').value;
			console.log(checkId);
			if(checkId == ''){
				alert('로그인 후 이용해주세요');
				location.href='accountLoginForm.do';
			}
			let countBoxValue = document.querySelector('.input-number').value;
			let productNumber = document.querySelector('.pNumber').value;
			console.log(countBoxValue+" "+productNumber);
			let url =  "addCartSome.do?countBoxValue="+countBoxValue+"&productNumber="+productNumber;
			console.log(url);
			fetch(url,{
				headers: {'Content-type':'application/x-www-form-urlencoded'}
			})
				.then(result=>result.json())
				.then(testFnc)
				.catch(err=>console.log(err));
		}
		function testFnc(result){
			let sum = document.getElementById('basket').textContent;
			console.log(sum);
			document.getElementById('basket').innerHTML = (document.getElementById('basket').innerHTML-0)+(document.querySelector('.input-number').value-0);
			document.querySelector('.input-number').value="0";
		}
		
	</script>
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
	<script src="js/hjjjs/theme.js"></script>
	<script src="js/hjjjs/custom.js"></script>
</body>
</html>