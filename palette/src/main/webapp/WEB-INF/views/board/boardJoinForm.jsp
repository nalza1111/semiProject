<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록화면</title>
</head>
<body>
	<div align="center">
		<h1>게시물 입력하기</h1>

		<form id="frm" action="boardJoin.do" method="post"
			onsubmit="return formSubmit()">
			<div>
				<table border="1">
					<tr>
						<th width="150">글제목</th>
						<td width="270"><input type="text" id="title" name="title"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">글내용</th>
						<td><input type="text" id="content" name="content"
							required="required"></td>
					</tr>
				</table>
			</div>
			<div>
				<input type="submit" value="저장">&nbsp;&nbsp; <input
					type="reset" value="취소">
			</div>
		</form>
		<h3><a href="boardMain.do">돌아가기</a></h3>
	</div>
</body>
</html>