<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>

</head>
<body>
	<div align="center">
		<div>
			<h1>상세보기</h1>
		</div>
		<h3>
			<a href="boardUpdateForm.do?number=${board.boardNumber}">수정</a>
		</h3>
		<hr>
		<div>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td><c:out value="${board.boardNumber}"></c:out></td>
					<td><c:out value="${board.boardTitle}"></c:out></td>
					<td><c:out value="${board.boardContent}"></c:out></td>
					<td><c:out value="${board.boardWriter}"></c:out></td>
					<td><c:out value="${board.createDate}"></c:out></td>
					<td><c:out value="${board.viewCnt}"></c:out></td>
				</tr>
			</table>
		</div>
		<h3>
			<a href="boardList.do">돌아가기</a>
		</h3>
	</div>
</body>
</html>