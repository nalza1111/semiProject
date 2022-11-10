<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>상세페이지</h1>
		</div>
		<div>
			<div>
				<!-- 버튼 두개는 관리자만 보이게 -->
				<form id="frm" action="" method="post">
					<button type="button" id="editBtn" value="" onclick="">수정</button>
					<button type="button" id="delBtn" value="" onclick="">삭제</button>
				</form>
			</div>
			<div>
				<ul>
					<li>전시명: ${exhibit.exhibitName }</li>
					<li>전시일정: ${exhibit.startDate }</li><li> ~ ${exhibit.endDate }</li>
					<li>학교명: ${exhibit.exhibitSchool }</li>
					<li>전공명: ${exhibit.exhibitMajor }</li>
				</ul>
			</div>
			<div>
				<!-- 전시 대표 이미지 -->
				<img src="./image/${exhibit.image }" width="300" height="400">
			</div>
			<div>
				<p>전시 소개</p>
				<p>art3f는 전통적인 현대 미술 딜러 박람회의 라인을 옮겨 이러한 문화 행사에 인간적이고 따뜻한 면을
					제공합니다. 이번 새로운 모네가스크 에디션의 경우 텐트 밖의 케이터링 공간은 모든 사람들이 미식가의 휴식을 취하고
					재충전할 수 있도록 하며, 솔직하고 따스하고 편안한 분위기는 예술가 및 갤러리와 진정한 교류를 가능하게 할 것입니다.
					가족과 함께 예술을 발견해야 하는 많은 이유! 코드가 없고, 편견이 없고, 제약이 없는 art3f는 가장 좋아하는 예술,
					저렴한 예술, 그리고 그 순간의 가장 아름다운 예술적 표현 사이의 영리한 조합입니다.</p>
			</div>
		</div>
		<div>
			<!-- 전시 이미지들 -->
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