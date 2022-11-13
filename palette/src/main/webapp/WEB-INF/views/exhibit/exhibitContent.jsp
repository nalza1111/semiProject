<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 날짜 포맷 변경 --> 
<!-- 중간정렬, 수정삭제버튼 오른쪽으로 밀기, 전시명,일정등등 사진 오른쪽으로 붙이기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
button {
	padding: 10px;
	width: 100px;
	border-radius: 30px;
	border: 1px solid gray;
	font-weight: bold;
}
li{
	list-style: none;
}
#detail-content{
	width: 500px;
}
a{
	text-decoration: none;
}
.bold-text{
	font-weight: bold;
}	
</style>
</head>
<body>
	<div align="center">
		<div>
			<h1>상세페이지</h1>
		</div>
		<div>
			<div>
				<!-- 버튼 두개는 관리자만 보이게 -->
				<c:if test="${role eq 'admin' }">
					<button type="button" id="editBtn" onclick="location.href='contentUpdateForm.do?exhibitNum=${exhibit.exhibitNum }'">수정</button>
					<button type="button" id="delBtn" onclick="location.href='deleteContentForm.do?exhibitNum=${exhibit.exhibitNum}'">삭제</button>
				</c:if>
			</div>
			<div>
				<ul>
					<li><span class="bold-text">전시명:</span> ${exhibit.exhibitName }</li>
					<li><span class="bold-text">전시일정:</span> <c:out value="${fn:substring(exhibit.startDate,0,10) }"/></li><li> ~ <c:out value="${fn:substring(exhibit.endDate,0,10) }"/></li>
					<li><span class="bold-text">학교명:</span> ${exhibit.exhibitSchool }</li>
					<li><span class="bold-text">전공명:</span> ${exhibit.exhibitMajor }</li>
				</ul>
			</div>
			<div>
				<!-- 전시 대표 이미지 -->
				<img src="${exhibit.image }" width="600" height="400">
			</div>
			<div id="detail-content">
				<p><span class="bold-text">전시 소개</span></p>
				<p>${exhibit.content }</p>
			</div>
		</div>
		<div>
			<!-- 전시 이미지들 -->
			<c:forEach items="${exhibits }" var="e">
				<img src="${e.image }" width="200" height="300">
			</c:forEach>
			
			<img src="./image/poster2.jpg" width="200" height="300">
			<img src="./image/poster3.jpg" width="200" height="300">
			<img src="./image/poster4.png" width="200" height="300">
		</div>
		<h3>
			<a href="main.do">홈 가기</a>
		</h3>
		<h3>
			<a href="exhibitList.do">목록 보기</a>
		</h3>
	</div>
</body>
</html>