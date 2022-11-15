<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>피드 생성하기</h1>
		</div>
		<div>
			<form id="frm" action="feedAdd.do" method="post"
				enctype="multipart/form-data">


				<table border="1">
					<tr>
						<th width="150">작품명</th>
						<td width="270"><input type="text" id="artName"
							name="artName" required="required"></td>
					</tr>
					<tr>
						<th width="150">작품설명</th>
						<td><input type="text" id="content" name="content"
							required="required"></td>
					</tr>
				</table>

				<div>
					<input type="submit" value="저장">&nbsp;&nbsp; 
					<input type="reset" value="취소">
				</div>
			</form>
		</div>






	</div>
</body>
</html>