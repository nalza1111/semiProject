<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>정말 삭제하시겠습니까?</h1>
	<form id="frm" action="deleteContent.do" method="post">
		<input type="submit" value="확인">
		<button type="button" id="backBtn" onclick="location.href='exhibitList.do'">취소</button>
		<input type="hidden" name="exhibitNum" value="${exhibit.exhibitNum }">
	</form>
</body>
</html>