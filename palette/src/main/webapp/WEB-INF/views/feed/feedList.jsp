<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>feedList</title>

<style>
.artist {
	cursor: pointer;
	border-radius: 160px;
	border: 1px solid gray;
	font-weight: 100px;
	
}
</style>

</head>
<body>

<div align="center">
	<div>
		<h1>작가 목록</h1>	
	</div>
	
		<c:forEach items="${feed}" var="f">
			<div onclick="showList(this)" id="${f.feedNum}">
				<img class="artist"
					src="./image/${f.image }.jpg" width="400" height="400" alt="..." />
				${f.userName}
			</div>
		</c:forEach>
	
</div>
<script>
function showList(tagId) {
	//작가 상세보기
	console.log(tagId.id);
	let feedNum = tagId.id;
	let url= "feedSelect.do";
	location.href= url+"?feedNum=" + feedNum; 
	
		// fetch (url, {
		// 	method:'post',
		// 	headers: {'content-Type':'application/x-www-form-urlencoded'},
		// 	data: "feedNum=" + feedNum
		// })
		// .then(response => response.text())
		// .then(data => {
			
		// })
		// .catch(err => console.log(err));
	}


</script>
</body>
</html>