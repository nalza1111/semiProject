<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productDetailForm</title>
	<style>
		.product-img{
			width:400px;
			height:500px;
		}
	</style>
</head>
<body>
	<hr>
		<button class="btnBasket" onClick="location.href='cartForm.do'">
			장바구니
			<span id="basket">${cartCountNumber }</span>
		</button>
	<hr>
	<table border="1">
		<tr>
			<th>productNumber</th>
			<td>
				${product.productNumber }
			</td>
		</tr>
		<tr>
			<th>categoryCode</th>
			<td>
				${product.categoryCode }
			</td>
		</tr>
		<tr>
			<th>productName</th>
			<td>
				${product.productName }
			</td>
		</tr>
		<tr>
			<th>productPrice</th>
			<td>
				${product.productPrice }
			</td>
		</tr>
		<tr>
			<th>productDesc</th>
			<td>
				${product.productDesc }
			</td>
		</tr>
<%--재고	<tr>
			<th>product.productStock</th>
			<td>
				${product.productStock }
			</td>
		</tr>
 --%>			<tr>
			<th>productHits</th>
			<td>
				${product.productHits }
			</td>
		</tr>
		<tr>
			<th>productDate</th>
			<td>
				${product.productDate }
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img class="product-img" src="/palette/image/${product.getImage()}" alt="..." /> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" value="${product.productNumber }">
				<button type="button" onClick=fncCount()>+</button>
				<input type="text" id="cartNumber" name="cartNumber" value="0" readonly>
			</td>
			<td>
				<button class="btnAddBasket" onClick=fucCountAdd()>Add to cart</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btnUpDel" onclick="location.href='upDelProductForm.do?productNumber=${product.productNumber}'">UPDATE/DELETE</button>
			</td>
		</tr>
		
	</table>
	 <a href="product.do">뒤로</a>
	<script>
		function fncCount(){
			let countBox = document.getElementById('cartNumber');
				countBox.value++;
		}
		function fucCountAdd(){
			let countBoxValue = document.getElementById('cartNumber').value;
			let productNumber = document.querySelector('input[type="hidden"]').value;
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
			document.getElementById('basket').textContent=(document.getElementById('basket').textContent-0)+(document.getElementById('cartNumber').value-0);
			document.getElementById('cartNumber').value="0";
		}
		
	</script>
</body>
</html>