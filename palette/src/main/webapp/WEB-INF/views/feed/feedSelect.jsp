<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>feedSelect</title>
	<style>
		.artist {
			border-radius: 100px;
			border: 1.5px solid black;
		}

	
		li {
			list-style: none;
			font-weight: bold;
		}
		p {
			width: 750px;
			font-weight: bolder;
		}
		#follow {
			cursor: pointer;
			border-radius: 150px;
			padding: 20px;
			font-weight: bold;
		}
		.content {
			border: 1px solid gray;
			padding: 10px;
		}

		a:link {
		  text-decoration: none;
		}
		
		a:visited { 
			color:black; 
			text-decoration: none;
		}

		a:hover {
			color : rgb(141, 196, 247);
			text-decoration: underline;
		}

		a:active {
			color : green;
			text-decoration: none;
		}
		
	</style>
</head>

<body>

	<div align="center">
		<div>
			<h2>${feed.userName}작가 피드</h2>
			
			<!--작가 프로필 사진-->
			<div>
				<img class="artist" src="./image/${feed.image}.jpg" width="200" height="200">
			</div>

			<form>
					<input type="hidden" id="feedNum" value="${feed.feedNum}">
			
			<!-- 팔로우 버튼 -->
			<c:choose>
				<c:when test="${follow == null}"><input type="button" id="follow" value="follow"></c:when>
				<c:otherwise><input type="button" id="follow" value="${follow}"></c:otherwise>
			</c:choose>
				
			<!--ID, Follower, email, school, major 표시-->
				<div class="intro">
							<p>ID : ${feed.userId}</p>
							<p>Follower : <span id="followerNum">${feed.userFollower}</span></p>
							<p>${feed.userEmail} <br> ${feed.userSchool} • ${feed.userMajor}</p>
				</div>
			</form>
		</div>

	</div>
	<!-- 작가 소개 내용 -->
	<p class="content">${feed.content}</p>
	
	<div class="collection">
		<img height="300" width="400" title="Reef" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/16173301_1.jpg?v=1668081389">
		<img height="300" width="400" title="Early_evening" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/16159954_1.jpg?v=1665672885">
		<img height="300" width="400" title="Fresh air I" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/16138978_1.jpg">
		<img height="300" width="400" title="Fresh air II" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/16138933_1.jpg">
		<img height="300" width="400" title="Summer clouds" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/16067851_1.jpg">
		<img height="300" width="400" title="Time to relax" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15989389_1.jpg" >
		<img height="300" width="400" title="Summerlight" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15936685_1.jpg" >
		<img height="300" width="400" title="Happy hour" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15887167_1.jpg">
		<img height="300" width="400" title="Field of cornflowers" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15467965_1.jpg">
		<img height="300" width="400" title="Midnight party" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15367912_1.jpg">
		<img height="300" width="400" title="Autumn evening at the lake" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15182947_1.jpg">
		<img height="300" width="400" title="Autumn" src="https://www.artmajeur.com/medias/mini/i/r/irina-laube/artwork/15170854_1.jpg">
	</div>
	
	<div class="return">
	<h4>
		<a href="feedList.do">작가 목록으로 돌아가기</a>
	</h4>
	<h4>
		<a href="main.do">Home 돌아가기</a>
	</h4>
	</div>

	<script>

		document.getElementById('follow').addEventListener('click',checkFollow);

		function checkFollow() {
			if(document.querySelector('#follow').value == 'follow'){
				addFollower();
			} else {
				deleteFollower();
			}
		}
		
		function addFollower() {
			let feedNum = document.getElementById('feedNum').value;
			let f = document.getElementById('follow').value;
			console.log(feedNum);
			let feedNumAjax = new XMLHttpRequest();
			feedNumAjax.open('post','./updateFollow.do');
			feedNumAjax.setRequestHeader('Content-type','application/x-www-form-urlencoded');
			feedNumAjax.send("feedNum="+feedNum+"&job="+f);
			feedNumAjax.onload = function() {
				alert('팔로우 완료!');
				document.querySelector('#follow').value = 'unfollow';
				let fo = parseInt(document.getElementById('followerNum').textContent)+1;
				document.getElementById('followerNum').textContent = fo;
				
			}
		}

		function deleteFollower() {
			let feedNum = document.getElementById('feedNum').value;
			let f = document.getElementById('follow').value;
			console.log(feedNum);
			let feedNumAjax = new XMLHttpRequest();
			feedNumAjax.open('post','./updateFollow.do');
			feedNumAjax.setRequestHeader('Content-type','application/x-www-form-urlencoded');
			feedNumAjax.send("feedNum="+feedNum+"&job="+f);
			feedNumAjax.onload = function() {
			alert('팔로우 취소!');
				document.querySelector('#follow').value = 'follow';
				let fo = parseInt(document.getElementById('followerNum').textContent)-1;
				document.getElementById('followerNum').textContent = fo;
			}
		}
	
	</script>

</body>
</html>