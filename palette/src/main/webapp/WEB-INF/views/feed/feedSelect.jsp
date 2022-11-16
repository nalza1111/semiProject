<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>feedSelect</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
	<style>
		* {
			font-family: 'East Sea Dokdo', cursive;
		}
		.artistFeed {
			font-size: 50px;
			color: #333333;
			height: 100px;
			background-color: rgb(218, 212, 212, 0.3);
		}

		.profile {
			width: 700px;
			height: 250px;
			margin: 0 auto;
			padding: 30px;
			margin-bottom: 10px;
		}


		.collection-list2 {
			width: 80%;
			margin: 0 auto;
			margin-bottom: 20px;
		}

		.collection2 {
			font-size: 25px;
			text-align: center;
			display: block;
			text-decoration: none;
			float: left;
			margin-right: 27px;
			margin-bottom: 5px;
			padding: 40px;
		}

		.collection:last-child {
			margin-bottom: 100px;
		}

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
			padding: 5px;
		}

		#follow {
			background-color: #4CAF50;
			color: white;
			border: 1px dotted gray;
			font-size: 25px;
			margin-top: 50px;
			cursor: pointer;
			border-radius: 150px;
			padding: 20px;
			font-weight: bold;
		}

		.profile form p {
			width: 200px;
			font-size: 25px;
			color: #333333;
		}

		.profile img {
			margin-right: 15px;
		}

		.profile img,
		.profile form {
			float: left;

		}

		.collection-list2 {
			clear: both;
		}
		.content {
			border: 1px solid gray;
			padding: 10px;
		}

		a:link {
			text-decoration: none;
		}

		a:visited {
			color: black;
			text-decoration: none;
		}

		a:hover {
			color: rgb(141, 196, 247);
			text-decoration: underline;
		}

		a:active {
			color: green;
			text-decoration: none;
		}

		.return {
			clear: both;
			font-size: 30px;
			margin-top: 20px;
		}
	</style>
</head>

<body>

	<div align="center">
		<div>
			<div class="artistFeed">
				<h2>Artist ${account.name}'s Feed</h2>
			</div>
			<!--작가 프로필 사진-->
			<div class="profile">
				<img class="artist" src="${account.image}" width="200" height="200">

				<form>
					<input type="hidden" id="id" value="${account.id}">


					<!--ID, Follower, email, school, major 표시-->

					<p>ID : ${account.id}</p>
					<p>
						Follower : <span id="followerNum">${account.follower}</span>
					</p>
					<p>${account.email}
						<br> ${account.school} • ${account.major}
					</p>

				</form>
				<!-- 팔로우 버튼 -->
				<div class="followBtn">
					<c:choose>
						<c:when test="${follower == null}">
							<input type="button" id="follow" value="follow">
						</c:when>
						<c:otherwise>
							<input type="button" id="follow" value="${follower}">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>


		<!-- 작품 소개 내용 -->
		<div class="collection-list2">
			<br>
			<hr>
			<c:forEach items="${artList}" var="art">
				<div class="collection2">
					<img class="artist" src="${art.artImage}" width="400" height="400" /> <br>
					${art.artTitle}
				</div>
			</c:forEach>
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
			document.getElementById('follow')
				.addEventListener('click', checkFollow);

			function checkFollow() {
				if (document.querySelector('#follow').value == 'follow') {
					addFollower();
				} else {
					deleteFollower();
				}
			}

			function addFollower() {
				let id = document.getElementById('id').value;
				let f = document.getElementById('follow').value;
				console.log(id);
				let idAjax = new XMLHttpRequest();
				idAjax.open('post', './updateFollow.do');
				idAjax.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
				idAjax.send("id=" + id + "&job=" + f);
				idAjax.onload = function () {
					alert('팔로우 완료!');
					document.querySelector('#follow').value = 'unfollow';
					let fo = parseInt(document.getElementById('followerNum').textContent) + 1;
					document.getElementById('followerNum').textContent = fo;

				}
			}

			function deleteFollower() {
				let id = document.getElementById('id').value;
				let f = document.getElementById('follow').value;
				console.log(id);
				let idAjax = new XMLHttpRequest();
				idAjax.open('post', './updateFollow.do');
				idAjax.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
				idAjax.send("id=" + id + "&job=" + f);
				idAjax.onload = function () {
					alert('팔로우 취소!');
					document.querySelector('#follow').value = 'follow';
					let fo = parseInt(document.getElementById('followerNum').textContent) - 1;
					document.getElementById('followerNum').textContent = fo;
				}
			}
		</script>
	</div>
</body>

</html>