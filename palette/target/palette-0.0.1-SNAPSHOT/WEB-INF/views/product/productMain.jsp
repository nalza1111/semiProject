<%@page import="org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.bootjava.palette.cart.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>shopmain</title>
	<style>
		.product-img{
			width:400px;
			height:500px;
		}
	</style>
</head>
<body>
	<c:if test="${empty cart }">
		<%
			//CartVO cart = new CartVO("a","b","c","d","d");
			//session.setAttribute("cart", cart);
			//System.out.print("test: "+ cart.toString());
		%>
	</c:if>
	<nav>
		<form>
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
		<button class="btnBasket">
			장바구니<span>[0]</span>
		</button>
		<button class="btnLog">구매내역</button>
		<button class="btnAdmin" onClick="location.href='addProductForm.do'">관리자의상품추가</button>
		<br>
	</nav>
	<hr>
	<div>
		<button class="btnCheckBasket">체크박스 장바구니담기</button>
		[정렬]<a href=#>조회순</a>|<a href=#>출시일순</a>| <a href=#>평점좋은순</a>|<a
			href=#>리뷰순</a>|<a href=#>가격순</a>
	</div>
	<hr>
	
	<c:forEach var="l" items="${list }">
	<div id="product-template">
		<!-- Product image-->
		<a class="product-detail" href="productDetail.do?productNumber=${l.productNumber}"><img class="product-img" src="/palette/img/${l.getImage()}" alt="..." /></a>
		<!-- Product details-->
		<div class="product-body">
			<div class="text">
				<!-- Product name-->
				<h5 class="product-cost"><a class="product-detail" href="productDetail.do?productNumber=${l.productNumber}">${l.getProductName()}</a></h5>
				<!-- Product price-->
				<!-- <span class="text-muted">$20.00</span>--><!-- 세일가격 -->
				${l.getProductPrice()}
			</div>
		</div>
		<!-- Product actions-->
		<div class="product-footer">
			<div class="text-center">
				<button class="btnAddBasket" value="productNumber=${l.productNumber}&productPrice=${l.productPrice}" onclick=fncAddCart(this.value)>Add to cart</button>
			</div>
		</div>
	</div>
	</c:forEach>
	<script>
	document.addEventListener('DOMContentLoaded', function(){
		/* let url = "productTest.do";
		fetch(url)
			.then(result=>result.text())
			.then(testFnc)
			.catch(err=>console.log(err))
		function testFnc(result){
				console.log(result)
			} */
	})
	function fncAddCart(value){
		console.log(value);
		let url = "addCart.do?"+value;
		
		fetch(url,{
			headers: {'Content-type':'application/x-www-form-urlencoded'}
		})
			.then(result=>result.json())
			.then(testFnc)
			.catch(err=>console.log(err));
	}
	function testFnc(result){
		console.log(result);
	}
		 
	</script>
</body>
</html>