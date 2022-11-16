<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>feedList</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">

<style>
* {
	font-family: 'East Sea Dokdo', cursive;
}

.myFeed {
	font-size: 25px;
	text-decoration: none;
}

summary {
	color: #333333;
	padding: 20px;
	font-size: 30px;
	background-color: rgb(218, 212, 212, 0.3);
	height: 100px;
}

li {
	font-size: 23px;
}

.myFeed a:link, .myFeed a:visited {
	background-color: rgb(228, 225, 225);
	color: black;
	padding: 15px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

.myFeed a:hover, .myFeed a:active {
	background-color: rgb(175, 209, 247);
}

.artist text {
	font-size: 20px;
}

.artist {
	cursor: pointer;
	border-radius: 160px;
	border: 1px solid gray;
	font-weight: 100px;
}

details {
	margin-bottom: 10px;
}

details summary {
	padding: 0 10px;
	background: #000;
	color: #fff;
	height: 35px;
	line-height: 35px;
	font-weight: bold;
	cursor: pointer;
}

details summary::marker {
	font-size: 0;
}

details ul {
	width: 1000px;
	border: 1px solid #aaa;
	list-style: none;
	padding: 10px;
}

details ul li a {
	display: block;
	padding: 5px 10px;
}

details ul li a:hover {
	background: #333;
	color: #fff;
}

details .txt {
	border: 1px solid #999;
	padding: 5px 10px;
	text-align: center;
}
</style>

</head>
<body>

	<div align="right">
		<span class="myFeed"><a href="myFeed.do">내 피드가기</a></span>
	</div>

	<div align="center">
		<details>
			<summary>컨템포러리 아티스트</summary>
			<div>
				<ul>
					<li>palette는 현대 대학생 예술가들이 판매하는 독점적인 예술 작품을 선보입니다. 현대 예술가들의 원본
						작품, 한정판 및 미술 판화를 구입하십시오. palette는 현대 예술가들이 간단하고 직관적으로 자신의 작품을 전시하고
						판매할 수 있도록 만들어졌습니다.</li>
					<li>현대 미술은 20세기 후반 또는 21세기 초반에 만들어진 오늘날의 대중적인 예술 형식입니다.</li>
					<li>컨템포러리(contemporary)라는 것은 최근 몇 년 동안 이루어진 모든 작업을 의미하며, 이는
						컨템포러리 아트의 영향을 받은 것으로 분류될 수 있습니다.</li>
					<li>현대 미술은 다른 어떤 예술 범주보다 추상적인 작업으로 구성됩니다.</li>
					<li>이 범주의 예술가는 색상, 모양, 질감 및 테마를 사용하여 공간, 시간 및 인간 자체만큼 광대한 주제에
						생명을 불어넣습니다.</li>
					<li>디지털 시대에 현대 예술가들은 인터넷 덕분에 아이디어의 교환과 글로벌 미학에 참여할 수 있는 더 큰
						기회를 갖게 되었습니다.</li>
				</ul>
			</div>
		</details>
	</div>





	<c:forEach items="${account}" var="a">
		<div onclick="showList(this)" id="${a.id}">
			<img class="artist" src="${a.image}" width="400" height="400"
				alt="..." /> <br> ${a.name} 작가
			<hr>
		</div>
	</c:forEach>


	<script>
function showList(tagId) {
	//작가 상세보기
	console.log(tagId.id);
	let id = tagId.id;
	let url= "feedSelect.do";
	location.href= url+"?id=" + id; 
	}
	
</script>
</body>
</html>