<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>addShop</title>
</head>
<body>
	<h3>admin의 product추가페이지</h3>
	<form action="addProduct.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>categoryCode</th>
				<td>
					<select name="categoryCode">
					<option value="">::선택::</option>
					<option value="europe">북유럽</option>
					<option value="modern">모던시크</option>
					<option value="vintage">빈티지</option>
					<option value="mini">미니멀</option>
					<option value="classic">모던클래식</option>
					<option value="inder">인더스트리얼</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>productName</th>
				<td>
					<input type="text" name="productName" id="productName">
				</td>
			</tr>
			<tr>
				<th>productPrice</th>
				<td>
					<input type="number" name="productPrice" id="productName">
				</td>
			</tr>
			<tr>
				<th>productDesc</th>
				<td>
					<textarea name="productDesc" id="productDesc" rows="10" cols="30"></textarea>
				</td>
			</tr>
			<tr>
				<th>image</th>
				<td>
					<input type="file" name="image" id="image"> 
				</td>
			</tr>
		</table>
		<input type="submit" id="submit" name="submit">
		<input type="reset">
	</form>
</body>
</html>