<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>feedSelect</title>
</head>
<body>
<div align="center">
	<div>
	<h2>작가 상세보기</h2>
	</div>
	
	<div>
			${feed.feedNum} : ${feed.userId} : ${feed.userFollower} : ${feed.userArt} : ${feed.userName} : ${feed.userEmail} : ${feed.userSchool} : ${feed.userMajor}<br>
	</div>
</div>
</body>
</html>