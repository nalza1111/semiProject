<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<title>feedSelect</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<style>
#fontAll{
	font-family: 'East Sea Dokdo', cursive;
}

.img {
	width: 427px;
	height: 427px;
	border-radius: 10px;
	cursor: pointer;
	transition: 0.3s;
}

/* 이미지 클릭 시, 밝기 조절 */
.img:hover {
	opacity: 0.8;
}

.modal {
	display: none;
	/* 모달창 숨겨 놓기 */
	position: fixed;
	z-index: 1;
	/* 모달창을 제일 앞에 두기 */
	padding-top: 5%;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	/* 스크롤 허용 auto */
	cursor: pointer;
	/* 마우스 손가락모양 */
	background-color: rgba(0, 0, 0, 0.8);
	color: white;
}

/* 모달창 이미지 */
.modal_content {
	margin: auto;
	display: inline;
	width: 30%;
	height: auto;
	max-width: 1000px;
	border-radius: 10px;
	animation-name: zoom;
	animation-duration: 0.8s;
}

/* 모달창 애니메이션 추가 */
@
keyframes zoom {from { transform:scale(0)
	
}

to {
	transform: scale(1)
}

}

/* 닫기 버튼 꾸미기 */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
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
	margin-top: 70px;
	position: relative;
	border: none;
	min-width: 180px;
	min-height: 50px;
	background: linear-gradient(90deg, rgba(129, 230, 217, 1) 0%,
		rgba(79, 209, 197, 1) 100%);
	border-radius: 1000px;
	color: darkslategray;
	cursor: pointer;
	box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
	font-size: 50px;
	transition: 0.3s;
	font-family: 'East Sea Dokdo', cursive;
}

#follow:hover {
	transform: scale(1.2);
}

.profile form p {
	width: 225px;
	font-size: 25px;
	color: #333333;
}

.profile img {
	margin-right: 15px;
}

.profile img, .profile form {
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

#hoverartP p {
	display: inline;
	padding-top: 10px;
	color: black;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/jhkcss/linearicons.css">
<link rel="stylesheet" href="css/jhkcss/font-awesome.min.css">
<link rel="stylesheet" href="css/jhkcss/bootstrap.css">
<link rel="stylesheet" href="css/jhkcss/magnific-popup.css">
<link rel="stylesheet" href="css/jhkcss/nice-select.css">
<link rel="stylesheet" href="css/jhkcss/animate.min.css">
<link rel="stylesheet" href="css/jhkcss/owl.carousel.css">
<link rel="stylesheet" href="css/jhkcss/main.css">
</head>

<body>

	<div align="center" id="fontAll">
		<section class="banner-area relative" id="home"
			style="height: 357.59px; ">
			<div class="overlay overlay-bg"
				style="background: url(https://cdn.pixabay.com/photo/2021/02/12/10/56/background-6008188_960_720.png); background-repeat: no-repeat; background-size: cover;">
			</div>
			<div class="container" align="center"
				style="top: -30px; z-index: -3 !important;">
				<div class="row d-flex align-items-center justify-content-center">
					<div class="about-content col-lg-12">
						<!--작가 프로필 사진-->
						<div class="profile" style="margin-top: -100px">
							<img class="artist" src="${account.image}" width="200"
								height="200">

							<form>
								<input type="hidden" id="id" value="${account.id}">


								<!--ID, Follower, email, school, major 표시-->
								<div style="margin-top: 20px;">
									<p style="font-size:40px">ID : ${account.id}</p>
									<p>
										<i class="fa-solid fa-heart-circle-plus"></i> Follower : <span
											id="followerNum">${account.follower}</span>
									</p>
									<p>${account.email}
										<br> ${account.school} • ${account.major}
									</p>
								</div>
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
				</div>
			</div>
		</section>
	</div>



	<!-- 작품 소개 내용 -->
	<div class="collection-list2">
		<br>
		<hr>
		<c:forEach items="${artList}" var="art">
			<div class="collection2">
				<img class="img" id="${art.artNum}" src="${art.artImage}"
					width="427px" height="427px" onclick="modalOpen(this)" />
				<div id="hoverartP" style="font-family: 'East Sea Dokdo', cursive!important;">
					<p style="font-size: 35px;">${art.artTitle}</p>
					<br>
					<p style="font-size: 30px;">${art.artContent}</p>
					<br>
					<p style="font-size: 25px;">${art.artCreationDate}</p>
				</div>
				<div class="modal">
					<span class="close">&times;</span> <img class="modal_content">
				</div>
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

	<script src="https://kit.fontawesome.com/d3060d9c8b.js"
		crossorigin="anonymous"></script>

	<script>
			document.getElementById('follow').addEventListener('click',
					checkFollow);

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
				idAjax.onload = function() {
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
				idAjax.onload = function() {
					alert('팔로우 취소!');
					document.querySelector('#follow').value = 'follow';
					let fo = parseInt(document.getElementById('followerNum').textContent) - 1;
					document.getElementById('followerNum').textContent = fo;
				}
			}
			
			const modal = document.querySelector(".modal");
			const modal_img = document.querySelector(".modal_content");
			const span = document.querySelector(".close");

			function modalOpen(tagId){
				let id = "";
				id = tagId.id;
				let url = "viewCntPlus.do?artNum="+id;
				fetch(url)
					.then(response => response.text())
				modalDisplay("block");
				modal_img.src = tagId.src;
				span.addEventListener('click', () => {
					modalDisplay("none");
				});
				modal.addEventListener('click', () => {
		            modalDisplay("none");
		         });
			
				function modalDisplay(text) {
					modal.style.display = text;
				}
			};
		</script>

</body>

</html>