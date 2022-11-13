<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productUpDelForm</title>
</head>
<body>
	<h3>상품 수정 혹은 삭제</h3>
	<form action="upDelProduct.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>productNumber</th>
				<td>
					<input type="text" name="productNumber" id="productNumber" value="${product.productNumber }" readonly>
				</td>
			</tr>
			<tr>
				<th>categoryCode</th>
				<td>
					<select name="categoryCode">
					<option value="">::선택::</option>
					<option value="europe" ${product.getCategoryCode().equals("europe")?'selected="selected"':''}>북유럽</option>
					<option value="modern" ${product.getCategoryCode().equals("modern")?'selected="selected"':''}>모던시크</option>
					<option value="vintage" ${product.getCategoryCode().equals("vintage")?'selected="selected"':''}>빈티지</option>
					<option value="mini" ${product.getCategoryCode().equals("europe")?'selected="selected"':''}>미니멀</option>
					<option value="classic" ${product.getCategoryCode().equals("mini")?'selected="selected"':''}>모던클래식</option>
					<option value="inder" ${product.getCategoryCode().equals("inder")?'selected="selected"':''}>인더스트리얼</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>productName</th>
				<td>
					<input type="text" name="productName" id="productName" value="${product.productName }">
				</td>
			</tr>
			<tr>
				<th>productPrice</th>
				<td>
					<input type="number" name="productPrice" id="productName" value="${product.productPrice }">
				</td>
			</tr>
			<tr>
				<th>productDesc</th>
				<td>
					<textarea name="productDesc" id="productDesc" rows="10" cols="30">${product.productDesc }</textarea>
				</td>
			</tr>
			<tr>
				<th>image</th>
				<td>
					<img class="product-img" id="product-img" src="/palette/image/${product.getImage()}" style="width:50px;" alt="..." />
					<input type="file" name="image" id="image" value="${product.getImage() }" onchange="readURL(this);" accept="image/*"> 
				</td>
			</tr>
		</table>
		<input type="submit" id="submit" name="submit" value="수정">
		<input type="button" id="delete" name="delete" value="삭제" onclick="location.href='delProduct.do?productNumber=${product.productNumber}'">
		<input type="button" value="취소" onclick="location.href='product.do'">
	</form>
	<script>
	function readURL(input) {
		// files 로 해당 파일 정보 얻기.
		let fileName = input.files[0].name;
		console.log(fileName);
		// 정규식으로 확장자 체크
		if(!/\.(jpg|jpeg|png)$/i.test(fileName)){
			alert('jpeg, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + fileName);
			input.outerHTML = input.outerHTML;
			document.getElementById('product-img').src = "";
			return false;
			
		} 
		document.getElementById('product-img').src = "";
		if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('product-img').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('product-img').src = "";
	  }
	}
	</script>
</body>
</html>