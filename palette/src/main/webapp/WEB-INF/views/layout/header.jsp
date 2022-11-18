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
	<nav id="topMenu" style="padding-left:40px;">
		<ul id="leftUl">
			<li id="logo"><a class="menuLink" href="main.do"></a></li>
			<li class="navHover"><a class="menuLink" href="feedList.do"><span>작가</span></a></li>
			<li class="navHover"><a class="menuLink" href="exhibitList.do"><span>전시회</span></a></li>
			<li class="navHover"><a class="menuLink" href="product.do"><span>샵으로</span></a></li>
			<li class="navHover"><a class="menuLink" href="boardList.do?page=1"><span>게시판</span></a></li>
			<c:if test="${role eq 'admin' }">
				<li class="navHover"><a class="menuLink" href="manageSite.do"><span>사이트관리</span></a></li>
			</c:if>
		</ul>
		<ul id="rightUl">
			<c:if test="${empty id }">
				<li class="navHover"><a class="menuLink" href="accountLoginForm.do"><span>로그인</span></a></li>
			</c:if>
			<c:if test="${not empty id }">
				<li class="navHover"><a class="menuLink" href="logout.do"><span>Logout</span></a></li>
				<li>${name }님 접속중</li>
			</c:if>
		</ul>
	</nav>
	
</body>
</html>