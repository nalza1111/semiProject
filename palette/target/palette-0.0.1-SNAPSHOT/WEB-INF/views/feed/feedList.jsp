<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>feedList</title>
</head>
<body>
<nav>
 	<form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Follow
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                        <hr>
	</form>

</nav>
<div align="center">
	<div>
		<h1>작가 목록</h1>
	</div>
	
		
		<c:forEach items="${feed}" var="f">
			<div onclick="showList(this)" id="${f.feedNum}">
				<img class="card-img-top"
					src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
				${f.userName}
			</div>
		</c:forEach>
	
	 <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">팔로우하기</a></div>
     
     
        </div>
 </div>
<script>
function addCart() {
   // document.querySelector('span.badge bg-dark text-white ms-1 rounded-pill').textContent = add+ 1;
   let add = document.querySelector('span.badge').textContent;
   add++;
   document.querySelector('span.badge').textContent = add;

}

let divTag = document.createElement('div');
divTag.addEventListener('click',showList);



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