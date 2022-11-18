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
#fontAll {
	font-family: 'East Sea Dokdo', cursive !important;
}

.img {
	width: 400px;
	height: 400px;
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

#follower {
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

.myArtistFeed {
	font-size: 50px;
	color: #333333;
	height: 100px;
	background-color: rgb(218, 212, 212, 0.3);
}

.myProfile {
	width: 700px;
	height: 250px;
	margin: 0 auto;
	padding: 30px;
	margin-bottom: 10px;
}

.collection-list {
	width: 80%;
	margin: 0 auto;
	margin-bottom: 20px;
}

.collection {
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

.addArtBtn {
	font-size: 20px;
	font-size: 20px;
	margin-top: 50px;
	cursor: pointer;
	border-radius: 150px;
	padding: 20px;
	font-weight: bold;
}

.myProfile form p {
	width: 200px;
	font-size: 25px;
	color: #333333;
}

.myProfile img {
	margin-right: 15px;
}

.myProfile img, .myProfile form {
	float: left;
}

.upload a:link, .upload a:visited {
	background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
	color: white;
	padding: 15px 25px;
	text-align: center;
	text-decoration: none;
	font-size: 25px;
	display: inline-block;
	border-radius: 50px;
	font-weight: bold;
}

.upload a:hover {
	transform: scale(1.2);
}

.backArtist a link, .backArtist a:visited {
	background-color: rgb(228, 225, 225);
	color: black;
	text-decoration: none;
}

.backArtist a:hover {
	color: rgb(141, 196, 247);
	text-decoration: none;
}

.backArtist a:active {
	color: green;
	text-decoration: none;
}

.return {
	font-family: 'East Sea Dokdo', cursive !important;
	clear: both;
	font-size: 30px;
	margin-top: 20px;
}

#delete {
	cursor: pointer;
	background-color: #880808;
	color: white;
	font-size: 30px;
	border-radius: 10px;
	border: 0;
}

#delete:hover {
	transform: scale(1.2);
}

.hoverartP p {
	display: inline;
	padding-top: 10px;
	color: black;
}

.about-content {
	padding: 55px 0 !important;
}

.banner-area .overlay-bg {
	background: none;
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
		<!-- 배너 -->
		<!-- start banner Area -->
		<section class="banner-area relative" id="home"
			style="height: 357.59px;">
			<div class="overlay overlay-bg"
				style="background: url(https://cdn.pixabay.com/photo/2021/02/12/10/56/background-6008188_960_720.png); background-repeat: no-repeat; background-size: cover;">
			</div>
			<div class="container" align="center" style="top: -30px;">
				<div class="row d-flex align-items-center justify-content-center">
					<div class="about-content col-lg-12">
						<div class="myProfile">
							<img class="artist" src="${account.image}" width="200"
								height="200">

							<form style="margin-top: 20px;">
								<input type="hidden" id="id" value="${account.id}">

								<!--ID, Follower, email, school, major 표시-->

								<p>ID : ${account.id}</p>
								<p>
									<i class="fa-solid fa-heart-circle-plus"></i> Follower : <span
										id="followerNum">${account.follower}</span>
								</p>
								<p>${account.email}
									<br> ${account.school} • ${account.major}
								</p>
							</form>

							<!-- 피드 업로드 버튼 -->
							<div class="addArtBtn">
								<span class="upload"><a href="artInsertForm.do">내 피드
										업로드</a></span>
							</div>

						</div>

					</div>
				</div>
			</div>
		</section>




		<div class="collection-list">
			<br>
			<hr>
			<c:forEach items="${artList}" var="art">
				<div class="collection">
					<img class="img" id="${art.artNum}" src="${art.artImage}"
						width="400" height="400" onclick="modalOpen(this)" />
					<!--사진 삭제버튼-->
					<div>
						<input type="button" id="delete" value="delete">
					</div>
					<div class="modal">
						<span class="close">&times;</span> <img class="modal_content">
					</div>
					<div class="hoverartP">
						<p style="font-size: 30px;">${art.artTitle}</p>
						<br>
						<p style="font-size: 25px;">${art.artContent}</p>
						<br>
						<p style="font-size: 20px;">${art.artCreationDate}</p>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="return"
			style="font-family: 'East Sea Dokdo', cursive !important;">
			<h4>
				<span class="backArtist"><a href="feedList.do">작가 목록으로
						돌아가기</a></span>
			</h4>
			<h4>
				<span class="backArtist"><a href="main.do">Home 돌아가기</a></span>
			</h4>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/d3060d9c8b.js"
		crossorigin="anonymous"></script>

	<script>
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
		
		// 내 피드에서 작품 삭제.
		let delBtns = document.querySelectorAll('#delete');
		delBtns.forEach(delBtn=>delBtn.addEventListener('click', artDelete));
		
		function artDelete(){
			let artNum = this.parentElement.previousElementSibling.id;
			let idAjax = new XMLHttpRequest();
			idAjax.open('post', './artDelete.do');
			idAjax.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
			idAjax.send("artNum=" + artNum);
			idAjax.onload = function() {
				let message = idAjax.responseText;
				location.replace(location.href); 
				alert(message); 
			}
		}
		

	</script>

</body>

</html>