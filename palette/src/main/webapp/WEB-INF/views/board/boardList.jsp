<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록화면</title>
<script>
	
</script>
</head>
<body>

	<div align="center">
		<h3>게시물 등록</h3>
			<a href="boardJoinForm.do">등록</a>
		<hr>
		<h1>게시물 목록보기</h1>
		<div>
			<table border="1">
				<tr>
					<th width="150">번호</th>
					<th width="150">제목</th>
					<th width="150">내용</th>
					<th width="150">작성자</th>
					<th width="150">조회수</th>
				</tr>
				<c:forEach items="${boards}" var="b">
					<tr>
						<td>${b.boardNumber}</td>
						<td><a href="boardSelect.do?date=${b.createDate}&number=${b.boardNumber}&title=${b.boardTitle}&content=${b.boardContent}&writer=${b.boardWriter}&cnt=${b.viewCnt}">${b.boardTitle}</a></td>
						<td><a href="boardSelect.do?date=${b.createDate}&number=${b.boardNumber}&title=${b.boardTitle}&content=${b.boardContent}&writer=${b.boardWriter}&cnt=${b.viewCnt}">${b.boardContent}</a></td>
						<td>${b.boardWriter}</td>
						<td>${b.viewCnt }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<h3>
			<a href="boardMain.do">돌아가기</a>
		</h3>
	</div>

</body>



</html>