<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	<html>
	<head>
<meta charset="UTF-8">
<title>orderHistory</title>
</head>
<body>
	<h3>구매 상세 내역</h3>
	<hr>
	<h4>${id }</h4>
	<h4>${orderNumber }</h4>
	<h4>${orderDate }</h4>
	<h4>${address }</h4>
	<h4>${Name }</h4>
	<h4>${payDo }</h4>
	<c:set var="sum" value="0" />
	<c:forEach var="l" items="${list }">
		<c:set var="sum" value="${sum+(l.productCount*l.productPrice)}" />
		<div id="order-detail-template">
			<p>상품번호: ${l.getProductNumber() }</p>
			<p>수량: ${l.getProductCount() }</p>
			<p>가격: ${l.getProductPrice() }</p>
			<p>결제여부: ${l.getPayDo() }</p>
		</div>
	</c:forEach>
	<c:forEach var="v" items="${orderProductList }">
		<div id="order-detail-template2">
			<p>상품분류: ${v.getCategoryCode() }</p>
			<p>상품명: ${v.getProductName() }</p>
			<img class="product-img" src="/palette/image/${v.getImage()}" alt="..." />
		</div>
	</c:forEach>
	<h3>
		총금액: <c:out value="${sum }" />
	</h3>
	<h1>리스트가 따로 출력되니 css할때 예쁘게 묶어줄 것</h1>
	<a href="orderHistory.do">뒤로</a>
	<script>
		
	</script>
</body>
</html>