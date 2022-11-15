<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'East Sea Dokdo', cursive;
	font-size: 25px;
	color: #333333;
}
#artInsertBtn, #artResetBtn {
	cursor: pointer;
	border-radius: 150px;
	padding: 10px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="artInsertFormContainer">
		<form action="artInsert.do" enctype="multipart/form-data"
			method="post">
			<table>
				<thead></thead>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" id="artId" name="artId" value="${id }"
							disabled> ${id }</td>
					</tr>
					<tr>
						<th>작품제목</th>
						<td><input type="text" id="artTitle" name="artTitle"></td>
					</tr>
					<tr>
						<th>작품내용</th>
						<td><input type="text" id="artContent" name="artContent"></td>
					</tr>
					<tr>
						<th>사진 업로드</th>
						<td><input type="file" id="artImage" name="artImage"></td>
					</tr>
				</tbody>
			</table>
			<button type="submit" id="artInsertBtn">업로드</button>
			<button type="reset" id="artResetBtn">초기화</button>

		</form>
	</div>
</body>
</html>