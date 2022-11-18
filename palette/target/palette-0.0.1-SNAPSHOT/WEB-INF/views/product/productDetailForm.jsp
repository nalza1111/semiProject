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
		<tr>
			<th>product.productStock</th>
			<td>
				${product.productStock }
			</td>
		</tr>
			<tr>
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
				<img class="product-img" src="/palette/img/${product.getImage()}" alt="..." /> 
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onClick=fncCount('p')>+</button>
				<input type="text" id="cartNumber" name="cartNumber" value="0" readonly>
				<button type="button" onClick=fncCount('m')>-</button>
			</td>
			<td>
				<button class="btnAddBasket">Add to cart</button>
			</td>
		</tr>
	</table>
	<script>
		function fncCount(type){
			let countBox = document.getElementById('cartNumber');
			if (type == 'p'){
				countBox.value++;
			} else if(type == 'm'&&countBox.value>=1){
				countBox.value--;
			}
		}
	</script>
</body>
</html>