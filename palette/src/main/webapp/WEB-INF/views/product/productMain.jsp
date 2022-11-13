<%@page import="org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor" %>
	<%@page import="java.util.ArrayList" %>
		<%@page import="co.bootjava.palette.cart.vo.CartVO" %>
			<%@page import="java.util.List" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
						<!DOCTYPE html>
						<html>
						<head>
							<meta charset="UTF-8">
							<title>shopmain</title>
							<link href="hjjcss/bootstrap.min.css" rel="stylesheet" type="text/css" />
							<link href="hjjcss/style.css" rel="stylesheet" type="text/css" />
							<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700,900"
								rel="stylesheet">
							<style>
								img {
									width: 400px;
									height: 300px;
								}
								#btnAddBasket {
									margin: 20px;
									outline: none;
									width: 150px;
									height: 40px;
									padding: 10px 25px;
									border: 2px solid #000;
									font-family: 'Lato', sans-serif;
									font-weight: 500;
									background: transparent;
									cursor: pointer;
									transition: all 0.3s ease;
									position: relative;
									display: inline-block;
									line-height: 5px;
									
									background: #000;
									color: #fff;
									z-index: 1;
								}
								#btnAddBasket:after {
									position: absolute;
									content: "";
									width: 0;
									height: 100%;
									top: 0;
									right: 0;
									z-index: -1;
									background: #e0e5ec;
									transition: all 0.3s ease;
								}
								#btnAddBasket:hover {
									color: #000;
								}
								#btnAddBasket:hover:after {
									left: 0;
									width: 100%;
								}
								#btnAddBasket:active {
									top: 2px;
								}

								#btnO {
									font-size: 1.2rem;
									font-family: "Open Sans", sans-serif;
									color: #444;
									background-color: #fff;
									margin: 0;
									padding: 4rem;
									text-align: center;
									border: none;
									display: inline-block;
									padding: 1em 0;
									border-radius: 0;
									color: #b2876f;
									margin-top: 2rem;
									font-weight: bold;
									font-size: 1.5rem;
									letter-spacing: 2px;
									text-transform: uppercase;
									text-decoration: none;
									position: relative;
								}
								#btnO:hover {
									color: #b2876f;
								}
								#btnO:hover:before {
									transform: none;
									opacity: 1;
									transition-duration: 0.4s;
								}
								#btnO:before {
									content: "";
									position: absolute;
									width: 100%;
									height: 2px;
									left: 0;
									bottom: 0px;
									background: #d6beb1;
									transform: translateY(6px);
									opacity: 0;
									transition: 1.8s cubic-bezier(0.2, 1, 0.3, 1);
									pointer-events: none;
								}
							</style>
						</head>

						<body>
							<!--여기시작-->
							<div class="container">
								<!--여기시작-->
								<!--- HERO HEADER --->
								<div class="row">
									<div class="col-md-12">
										<div class="works-hero-bg">
											<h1 class="fade-anime-top">PALETTE</h1>
											<h2 class="fade-anime-bottom">Happy Campus</h2>
										</div>
									</div>
								</div>
								<!--- THE END HERO HEADER --->

								<input type="hidden" id="idCheck" value="${id }">
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
										</select> 검색<input type="text" id="search" name="search"> <input type="submit"
											value="검색">
									</form>
									<br>
									<button class="btnBasket" onClick="cartFnc()">
										장바구니 <span id="basket">${cartCountNumber }</span>
									</button>
									<button class="btnLog" onClick="oderHisFnc()">구매내역</button>
									<button class="btnAdmin"
										onClick="location.href='addProductForm.do'">관리자의상품추가</button>
									<br>
								</nav>
								<hr>
								<div>
									<button class="btnO" id="btnO" name="btnO" onclick="fncList('search')">조회순</button>  
										 <button class="btnO" id="btnO" name="dateBtn" onclick="fncList('date')">출시일</button>  
										 <button class="btnO" id="btnO" name="highPriceBtn" onclick="fncList('highPrice')">높은가격</button>  
										 <button class="btnO" id="btnO" name="lowPriceBtn" onclick="fncList('lowPrice')">낮은가격</button>
								</div>
								<hr>
								<div class="All-list">
								
									<!--- WORK PAGE PROJECTS --->

								</div>
								<!--뿌리기용!!!!!-->
								<div class="row-none" style="display: none;">
									<div class="col-md-6 col-xs-12">
										<div class="prjct-bg">

											<div id="product-template">
												<!-- Product image-->
												<a class="img-prjct-wrk" href="#">
													<img class="product-img" src="" alt="..." /></a>
												<!-- Product details-->
												<div class="prjct-wrt-left-wrk"></div>
												<!-- Product name-->
												<div class="shw-cs2">
													<a class="product-detail" href=""></a>
												</div>
												<div class="shw-cs4"></div>
												<!-- Product price-->
												<div class="shw-cs"></div>
												<!-- Product actions-->
												<div class="col-md-12 col-xs-12">
													<div class="allprojects-lgs-bg" >
														<button class="btnAddBasket" id="btnAddBasket" name="btnAddBasket" value=""	onclick=fncAddCart(this.value)>ADD TO CART</button>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!---->
								<!--- THE END WORK PAGE PROJECTS --->
							</div>
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
								function fncList(text) {
									let url = "productSort.do?job=" + text;
									fetch(url)
										.then(result => result.json())
										.then(listDo)
										.catch(err => console.log(err));
								}
								function listDo2(result) {
									console.log(result);
									result.forEach(item => {
										makeItemDiv(item);
									});
								}
								
								function listDo(result) {
									console.log(result);
									//먼저 있던거 지우기
									let allList = document.querySelector('.All-list');
									while (allList.hasChildNodes()) {
										allList.removeChild(allList.firstChild);
									}
									result.forEach(item => {
										makeItemDiv(item);
									});
								}
								function makeItemDiv(item = {}) {
									//먼저 있던거 지우기
									let allList = document.querySelector('.All-list');

									let template = document.querySelector('.row-none>div');
									let good = template.cloneNode(true);
									//이미지링크
									let imgLink = good.querySelector('.img-prjct-wrk');
									imgLink.setAttribute('href', 'productDetail.do?productNumber=' + item.productNumber);
									//이미지
									good.querySelector('.product-img').src = '/palette/image/' + item.image;
									//링크
									
									let link = good.querySelector('.product-detail');
									link.setAttribute('href', 'productDetail.do?productNumber=' + item.productNumber);
									//제목
									good.querySelector('.product-detail').textContent = item.productName;
									//가격
									good.querySelector('.shw-cs').textContent = item.productPrice + '￦';
									//애드카트
									good.querySelector('.btnAddBasket').value = 'productNumber=' + item.productNumber + '&productPrice=' + item.productPrice;

									allList.append(good);

								}



							</script>
						</body>

						</html>