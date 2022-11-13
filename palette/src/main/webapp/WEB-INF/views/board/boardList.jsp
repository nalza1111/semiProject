<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록화면</title>

</head>
<script>

	
</script>

<body>

	<div align="center">
		
		<h1>자유게시판</h1>	
		<hr>
		<c:if test="${not empty id}">
		<a href="boardJoinForm.do">글쓰기</a> 
		</c:if>
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
						<td><a href="boardSelect.do?id=${b.userId}&date=${b.createDate}&number=${b.boardNumber}&title=${b.boardTitle}&content=${b.boardContent}&writer=${b.boardWriter}&cnt=${b.viewCnt}">${b.boardTitle}</a></td>
						<td><a href="boardSelect.do?id=${b.userId}&date=${b.createDate}&number=${b.boardNumber}&title=${b.boardTitle}&content=${b.boardContent}&writer=${b.boardWriter}&cnt=${b.viewCnt}">${b.boardContent}</a></td>
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