<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 날짜 포맷 변경 -->
<!-- footer따라오는거 고치기-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.exhibitList-ul {
	width: 500px;
	display: flex;
	justigy-content: center;
	height: 400px;
	float: left;
	margin: 20px;
}

input, button {
	padding: 10px;
	width: 100px;
	border-radius: 30px;
	border: 1px solid gray;
	font-weight: bold;
}
li{
	list-style: none;
}
</style>
</head>
<body>
	<div align="center">
		<header>
			<div>
				<h1>전시 목록보기</h1>
			</div>
		</header>
		<div>
			<c:if test="${role eq 'admin' }">
				<!-- 글등록 버튼은 관리자만 보이게 -->
				<form id="frm" action="addExhibitListForm.do" method="post">
					<input type="submit" value="Add Exhibit"
						style="position: absolute; top: 50; right: 30px; padding: 10px">
				</form>
			</c:if>
		</div>
		<div>
			<form id="check" action="" method="post">
				<button type="button" id="allListBtn" value=""
					onclick="location.href='exhibitList.do'">전체</button>
				<button type="button" id="ingListBtn" value=""
					onclick="location.href='ingList.do'">현재</button>
			</form>
		</div>
		<div>
			<c:forEach items="${exhibits }" var="e">
				<!-- list안에있는 하나의 레코드를 e라고 하겠다 -->
				<div class="exhibitList-ul">
					<ul>
						<li><a href="exhibitContent.do?exhibitNum=${e.exhibitNum }"><img src="${e.image }" width="500" height="300"></a>
							${e.exhibitName }
							: <c:out value="${fn:substring(e.startDate,0,10) }" /> 
							~ <c:out value="${fn:substring(e.endDate,0,10) }" /> 
							: ${e.exhibitSchool } ${e.exhibitMajor }</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>