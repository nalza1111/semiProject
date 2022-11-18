<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styles.css?ver=1">
</head>
<body>
	<nav id="topMenu">
		<ul id="leftUl">
			<li id="logo"><a class="menuLink" href="main.do"></a></li>
			<li><a class="menuLink" href="feedList.do">작가</a></li>
			<li><a class="menuLink" href="exhibitList.do">전시회</a></li>
			<li><a class="menuLink" href="product.do">샵으로</a></li>
			<li><a class="menuLink" href="boardMain.do">게시판</a></li>
		</ul>
		<ul id="rightUl">
			<c:if test="${empty id }">
				<li><a class="menuLink" href="accountJoinForm.do">회원가입</a></li>
			</c:if>
			<c:if test="${empty id }">
				<li><a class="menuLink" href="accountLoginForm.do">로그인</a></li>
			</c:if>
			<c:if test="${not empty id }">
				<li><a class="menuLink" href="logout.do">Logout</a></li>
				<li>${name }님접속중</li>
			</c:if>
		</ul>
	</nav>
</body>
</html>