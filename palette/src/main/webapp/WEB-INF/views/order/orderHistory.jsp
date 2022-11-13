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
	<h3>구매내역</h3>
	<hr>
	${id }
	<c:forEach var="l" items="${list }">
	<div id="order-template">
		<h4><a class="order-detail" href="orderDetail.do?
											orderNumber=${l.getOrderNumber() }
											&orderDate=${l.getOrderDate() }
											&address=${l.getAddress() }
											&name=${l.getName() }
											&tel=${l.getTel() }
											&payDo=${l.getPayDo() }">
		주문번호: ${l.getOrderNumber() }</a></h4>
		<p>주문자이름: ${l.getName() }</p>
		<p>주문일: ${l.getOrderDate() }</p>
		<p>배송지: ${l.getAddress() }</p>
		<p>주문자 번호: ${l.getTel() }</p>
		<p>결제여부:${l.getPayDo() }</p>
	</div>
	</c:forEach>
</body>
</html>