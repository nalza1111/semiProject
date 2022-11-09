<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopmain</title>
</head>
<body>
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
	<div id="product-template">	<!-- style="display:none; -->
		<!-- Product image-->
		<img class="product-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
		<!-- Product details-->
		<div class="product-body">
			<div class="text">
				<!-- Product name-->
				<h5 class="product-cost"><a class="product-detail" href="#">Special Product</a></h5>
				<!-- Product price-->
				<!-- <span class="text-muted">$20.00</span>--><!-- 세일가격 -->
				58000
			</div>
		</div>
		<!-- Product actions-->
		<div class="product-footer">
			<div class="text-center">
				<button class="btnAddBasket">Add to cart</button>
			</div>
		</div>
	</div>
</body>
</html>