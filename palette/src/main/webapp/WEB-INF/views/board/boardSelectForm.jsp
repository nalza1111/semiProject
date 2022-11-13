<%@page import="co.bootjava.palette.board.vo.BoardVO"%>
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
			<c:if test="${id eq board.userId}">
				<a href="boardUpdateForm.do?number=${board.boardNumber}">수정</a>
				<a href="boardDelete.do?number=${board.boardNumber }">삭제</a>
			</c:if>
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
		<br> <br>
		
		<c:if test="${not empty id}">
		<form id="frm" action="replyJoin.do?number=${board.boardNumber}" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="150">댓글</th>
						<td width="270"><input type="text" id="content"
							name="content" required="required"></td>
						<td><button onclick=check() required="required">작성</button></td>
						<td><input type="reset" value="취소" required="required"></td>
					</tr>
				</table>
			</div>
		</form>
		</c:if>
		<h3>
			<a href="boardList.do">돌아가기</a>
		</h3>
	</div>	
	
</body>


</html>