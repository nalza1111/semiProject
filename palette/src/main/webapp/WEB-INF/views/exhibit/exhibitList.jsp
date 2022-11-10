<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align = "center">
	<div><h1>전시 목록보기</h1></div>
	<div>
		<form id="frm" action="addExhibitListForm.do" method="post">
			<input type="submit" value="글등록">
		</form>	
	</div>
	<div>
		<form id="check" action="" method="post">
			<button type="button" id="allListBtn" value="" onclick="">전체</button>
			<button type="button" id="ingListBtn" value="" onclick="">현재</button>
		</form>
	</div>
	<div>
		<c:forEach items="${exhibits }" var="e"> <!-- list안에있는 하나의 레코드를 e라고 하겠다 -->
			${e.exhibitNum } : <a href="exhibitContent.do?exhibitNum=${e.exhibitNum }">${e.exhibitName }</a> : ${e.startDate } ~ ${e.endDate } : ${e.exhibitSchool } ${e.exhibitMajor }<br/>
		</c:forEach>
	</div>
</div>
</body>
</html>