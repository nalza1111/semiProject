<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Palette</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>aranaz</title>
	<link rel="icon" href="image/hjjimg/favicon.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/hjjcss/bootstrap.min.css">
	<!-- animate CSS -->
	<link rel="stylesheet" href="css/hjjcss/animate.css">
	<!-- owl carousel CSS -->
	<link rel="stylesheet" href="css/hjjcss/owl.carousel.min.css">
	<!-- nice select CSS -->
	<link rel="stylesheet" href="css/hjjcss/nice-select.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/hjjcss/all.css">
	<!-- flaticon CSS -->
	<link rel="stylesheet" href="css/hjjcss/flaticon.css">
	<link rel="stylesheet" href="css/hjjcss/themify-icons.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/hjjcss/magnific-popup.css">
	<!-- swiper CSS -->
	<link rel="stylesheet" href="css/hjjcss/slick.css">
	<link rel="stylesheet" href="css/hjjcss/price_rangs.css">
	<!-- style CSS -->
	<link rel="stylesheet" href="css/hjjcss/style.css">
	<script src="https://kit.fontawesome.com/0695eff491.js" crossorigin="anonymous"></script>
	<style>
		.product-img {
			width: 80px;
			height: 80px;
		}

		.modal {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			display: none;
			background-color: rgba(255, 255, 255, 0.4);
			mix-blend-mode: normal;
		}

		.modal.show {
			position: fixed;
			display: block;
			height: 100%;
			width: 100%;
		}

		.modal_body {
			position: absolute;
			top: 50%;
			left: 50%;
			width: 50%;
			height: 80%;
			padding: 2%;
			text-align: center;
			/* font-size: 22px; */
			background-color: #fff6ee;
			border-radius: 10px;
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 1);
			transform: translateX(-50%) translateY(-50%);
			z-index: 2;
			display: flex;
		}

		.table-responsive {
			margin-bottom: 150px;
		}

		input {
			padding-left: 50px;
		}

		.AAA {
			width: 50%;
			height: 80%;
		}

		.BBB {
			padding-left: 5%;
			width: 50%;
			height: 80%;
			text-align: left;
		}

		.bbb {
			width: 100%;
			display: block;
			float: left;
		}

		.deliv {
			display: inline-block;
			text-align: left;
		}

		.order_box {
			width: 100%;
			height: 100%;
			margin-top: 20%;
		}

		#btn-sum {
			width: 100%;
			text-align: center;
			padding-left: 25%;
		}

		#postBtn {
			width: 25%;
			margin-left: 10%;
			padding-left: 3px;
			display: inline;
			color: #ff3368;
			border: 1px solid #ff3368;
			background: #fff;
		}

		.billing_details {
			display: inline;
		}
		.imsi{
			right:50px;
			position: fixed;
			bottom:120px;
		}	
		.subTT{
			font:border;
		}
	</style>
</head>

<body>
	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Shop Palette</h2>
							<p>Art <span>-</span>Gallery Shop</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================Cart Area =================-->
	<section class="cart_area padding_top">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" >Product</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
								<th scope="col">Total</th>
								<th><input type="checkbox" id="check" checked value="noChk"><input type="hidden"
										value="no"></th>
							</tr>
						</thead>
						<tbody>
							<!--여기시작-->
							<c:set var="sum" value="0" />
							<c:forEach var="cart" items="${userOrderDetailList}">
								<c:set var="sum" value="${sum+(cart.productCount*cart.productPrice)}" />
								<c:if test="${cart.productCount >0}">
									<!--계산을 위한 곳-->
									<tr>
										<td>
											<div class="media">
												<div class="d-flex">
													<a class="product-detail"
														href="productDetail.do?productNumber=${cart.productNumber}">
														<img class="product-img"
															src="${cart.getImage()}" alt="..." />
													</a>
												</div>
												<div class="media-body">
													<p><a class="product-detail"
															href="productDetail.do?productNumber=${cart.productNumber}">
															${cart.productName}
														</a>
													</p>
												</div>
											</div>
										</td>
										<td>
											<h5>${cart.productPrice}</h5>
										</td>
										<td>
											<div class="product_count"><input type="hidden" id="ppn"
													value="${cart.productNumber}"><span class="input-number-decrement"
													onclick="fncCount('m',this)"><i
														class="fa-solid fa-caret-down"></i></span><input
													class="input-number" type="text" value="${cart.productCount}"
													readonly min="0" max="10"><span class="input-number-increment"
													onclick="fncCount('p',this)"><i
														class="fa-solid fa-caret-up"></i></span><input type="hidden"
													name="ppm" value="${cart.productPrice}"></div>
										</td>
										<td>
											<h5>${cart.productPrice*cart.productCount}</h5>
										</td>
										<td><input type="hidden" id="ppn" value="${cart.productNumber}"><input
												type="hidden" name="ppm" value="${cart.productPrice}"><input
												type="checkbox" checked><input type="hidden" value="yes"></td>
									</tr>
								</c:if>
							</c:forEach>
							<!--여기 끝-->
							<tr>
								<td></td>
								<td></td>
								<td>
									<h5 class="subTT">Subtotal</h5>
								</td>
								<td>
									<h5 id="totalCartForm" class="subTT">
										<c:out value="${sum }" />
									</h5>
								</td>
								<td>
								</td>
							</tr>
							<tr class="bottom_button">
								<td><a class="btn_1" id="delCart">선택삭제</a></td>
								<td></td>
								<td>
									<a class="btn_1" onClick="fncPay()" id="btn-open-popup">선택결제</a>
								</td>
								<td></td>
								<td>
									<div class="cupon_text float-right">
										<a class="btn_1" id="btn-open-popup" onClick="fncPayAll()">모두결제</a>
									</div>
								</td>
							</tr>
					</table>

					<br>

					<!-- 결제 모달 -->
					<div class="modal">
						<div class="modal_body">
							<a  href="cartForm.do" id="foot-pay" id="total" style="width: 100px;height:100px; z-index: 99;">
								<i class="fa-solid fa-xmark" ></i>
							</a>
							<div class="billing_details" style="display: inline;">
								<div class="row">
									<div class="AAA">
										<h3>Billing Details</h3>
										<div class="middleAAA">
											<form class="BBB" action="#" method="post" novalidate="novalidate">
												<p class="deliv">name :</p>
												<div class="bbb">
													<input style="width: 200%;" type="text" class="form-control"
														name="number" id="name" />
													<span class="placeholder" data-placeholder=""></span>
												</div>
												<div class="bbb">
													<p class="deliv">phone :</p>
													<input style="width: 200%;" type="text" class="form-control"
														name="number" id="phone" />
													<span class="placeholder"></span>
												</div>
												<div class="bbb">
													<p class="deliv">email :</p>
													<input style="width: 200%;" type="text" class="form-control"
														name="number" id="email" />
													<span class="placeholder"></span>
												</div>
												<div class="bbb" style="width: 200%;">
													<p class="deliv" style="display: block;">postcode :</p>
													<input style="width: 60%; display: inline;" type="text"
														class="form-control" name="number" id="postcode" />
													<input type="button" id="postBtn"
														onclick="sample6_execDaumPostcode()" value="우편번호">
												</div>
												<div class="bbb">
													<p class="deliv">address :</p>
													<input style="width: 200%;" type="text" class="form-control"
														name="number" id="address" />
													<span class="placeholder"></span>
												</div>
												<div class="bbb">
													<p>detailAddress :</p>
													<input style="width: 200%;" type="text" class="form-control"
														name="number" id="detailAddress" />
													<span class="placeholder"></span>
												</div>
												<div class="bbb">
													<p>extraAddress :</p>
													<input style="width: 200%;" type="text" class="form-control"
														name="number" id="extraAddress" />
													<span class="placeholder"></span>
												</div>
											</form>
										</div>
									</div>
									<div class="col-lg-4" style="width: 70%; display: inline;">
										<div class="order_box">
											<h2>Your Order</h2>
											<ul class="list" id="list55">
												<li>
													<a href="#">Product
														<span>Total</span>
													</a>
												</li>
											</ul>
											<ul class="list list_2">
												<li>
													<a href="#">Total
														<span id="totalFinal">$2210.00</span>
													</a>
												</li>
												<li>
													<a class="btn_3" onclick="requestPay()">kakaopay</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="imsi">
		<button id="btnLog" onClick="oderHisFnc()"
		style="
			color: #ff3368;
	    	border: 1px solid #ff3368;
    		background: #fff;
			margin: 5px;">구매내역</button>
		<hr>
		<a href="product.do">HOME</a>
		<hr>
	</div>
	</section>
	<script>
		//주문내역
		function oderHisFnc() {
			location.href = 'orderHistory.do';
		}
		function fncCount(type, cn) {
			let productNumber = cn.parentNode.firstChild.value; //상품번호
			let productPrice = cn.parentNode.lastChild.value; //상품가격
			let job = '';
			console.log('상품번호' + productNumber);
			console.log('상품가격' + productPrice);
			let count = cn.parentNode.children[2].value;
			console.log(count);
			if (type == 'm' && count >= 1) {
				cn.parentNode.children[2].value = cn.parentNode.children[2].value - 1;
			} else if (type == 'p') {
				cn.parentNode.children[2].value = (cn.parentNode.children[2].value - 0) + (1 - 0);
			}
			console.log('input-number' + count);
			let subTo = cn.parentNode.parentNode.parentNode.children[3]; //서브토탈
			let mainTo = document.getElementById('totalCartForm'); //토탈
			if (type == 'm') {
				job = 'minus';
				console.log(productPrice);
				mainTo.textContent = mainTo.textContent - productPrice;
				subTo.textContent = subTo.textContent - productPrice;
				if (cn.parentNode.children[2].value == 0) {
					cn.parentNode.parentNode.parentNode.remove();
				}
			} else if (type == 'p') {
				count.value++;
				job = 'plus';
				mainTo.textContent = (mainTo.textContent - 0) + (productPrice - 0);
				subTo.textContent = (subTo.textContent - 0) + (productPrice - 0);

			}
			let data = "productNumber=" + productNumber + "&job=" + job;
			let url = "addCartTwo.do?" + data;
			console.log(data);
			fetch(url, {
					headers: {
						'Content-type': 'application/x-www-form-urlencoded'
					}
				})
				.then(result => result.json())
				.then(addCartTwoFnc)
				.catch(err => console.log(err));
		}

		function addCartTwoFnc(result) {
			console.log(result);
		}

		function addCartTwoFnc(result) {
			console.log(result);
		}
		document.querySelector('input[type="checkbox"]').addEventListener('change', function () {
			document.querySelectorAll('input[type="checkbox"]').forEach(function (check) {
				check.checked = document.querySelector('input[type="checkbox"]').checked;
			})
		})
		document.getElementById('delCart').addEventListener('click', function fncDeleteDo() {
			document.querySelectorAll('input[type="checkbox"]').forEach(row => {
				//체크박스 한개빼고 체크된거 지우기
				console.log(row);
				console.log(row.parentNode.lastChild);
				if (row.checked && row.parentNode.lastChild.value == 'yes') {
					row.parentNode.parentNode.remove();
					fncDelete(row);
				}

			})
		})

		function fncDelete(th) {
			console.log(th);
			console.log(th.parentNode.parentNode.children[2].children[0].children[0].value); //상품번호
			console.log(th.parentNode.parentNode.children[2].children[0].children[2].value); //상품개수
			console.log(th.parentNode.parentNode.children[2].children[0].children[4].value); //상품가격
			let productNumber = th.parentNode.parentNode.children[2].children[0].children[0].value;
			let productPrice = th.parentNode.parentNode.children[2].children[0].children[2].value;
			let productCount = th.parentNode.parentNode.children[2].children[0].children[4].value;

			let totalPrice = productPrice * productCount; //빼야할 금액

			let mainTo = document.getElementById('totalCartForm'); //총금액에서 딜리트금액빼주기
			mainTo.textContent = mainTo.textContent - totalPrice;

			let data = "productNumber=" + productNumber;
			let url = "deleteCart.do?" + data;
			console.log(data);
			fetch(url, {
					headers: {
						'Content-type': 'application/x-www-form-urlencoded'
					}
				})
				.then(result => result.json())
				.then()
				.catch(err => console.log(err));
		}
		//결제버튼눌림(개별)
		function fncPay() {
			//이전에 있던 컴플리트오더(DB)먼저 지워주기
			let url2 = "orderDelete.do?"
			fetch(url2)
				.then(result => result.text())
				.catch(err => console.log(err));

			let data = ''; //체크리스트뽑기
			document.querySelectorAll('input[type="checkbox"]').forEach(function (check) {
				//프로덕트넘버뽑기
				console.log(check.parentNode.lastChild.value);
				if (check.checked && check.parentNode.lastChild.value != 'no') {
					let toPayCart = check.parentNode.parentNode.children[2].children[0].children[0];
					console.log('toPayCart.value:' + toPayCart.value)
					data += (toPayCart.value + "_");
				}
			})

			console.log(data) //주문할 것들 체크해서 품목확인 30_20_5_...
			data = data.slice(0, -1);
			let url = "cartPayForm.do?payCart=" + data; //체크리스트뽑아오기
			console.log(url)
			fetch(url)
				.then(response => response.json())
				.then(conFnc)
				.catch(err => alert('선택된 상품없음'));


			let urlId = "cartPayFormId.do"; //계정뽑기
			fetch(urlId)
				.then(response => response.json())
				.then(conFnc2)
				.catch(err => console.log(err));

		}

		//결제버튼눌림(all)
		function fncPayAll() {
			//이전에 있던 컴플리트오더(DB)먼저 지워주기
			let url2 = "orderDelete.do?"
			fetch(url2)
				.then(result => result.text())
				.catch(err => console.log(err));

			let url = "cartPayFormAll.do"; //체크리스트뽑아오기
			console.log(url)
			fetch(url)
				.then(response => response.json())
				.then(conFnc)
				.catch(err => {
					alert('선택된 상품없음');
					//이동시키기
				});


			let urlId = "cartPayFormId.do"; //계정뽑기
			fetch(urlId)
				.then(response => response.json())
				.then(conFnc2)
				.catch(err => console.log(err));
		}


		function conFnc(result) {
			console.log("결과")
			console.log(result)
			//있던거지우기
			document.querySelectorAll('.dle').forEach(row=>{
				row.remove();
			})
			
			let totalPaySumPay = 0;
			//붙일 곳
			let list = document.getElementById('list55');
			console.log('list'+list);
			result.forEach((row) => {
				console.log(row);
				let liTag = document.createElement('li');
				liTag.setAttribute('class','dle');
				console.log(liTag);
				//a 경로
				let aTag = document.createElement('a');
				aTag.setAttribute('href','productDetail.do?productNumber='+row['productNumber']);
				liTag.appendChild(aTag);
				console.log(liTag);
				//txt 이름
				console.log(row['productName']);
				let txt = document.createTextNode(row['productName']);
				let pTag = document.createElement('p');
				pTag.setAttribute("style","display:inline;");
				pTag.appendChild(txt);
				liTag.appendChild(pTag);
				console.log(liTag);
				//span2 가격
				let sp2 = document.createElement('span');
				sp2.setAttribute("style","float:right; padding:3px;");
				sp2.textContent =row['productPrice']*row['productCount'];
				sp2.setAttribute('class','last');
				liTag.appendChild(sp2);
				console.log(liTag);
				//span1 수량
				let sp1 = document.createElement('span');
				sp1.setAttribute("style","float:right; padding:3px;");
				sp1.textContent = 'x' + row['productCount'];
				sp1.setAttribute('class','middle');
				liTag.appendChild(sp1);
				console.log(liTag);
				


				list.append(liTag);
				console.log(liTag);

				console.log(liTag);
				//금액
				totalPaySumPay += (row['productPrice'] - 0) * (row['productCount'] - 0);
				console.log(totalPaySumPay);
			})
			console.log(totalPaySumPay);
			document.getElementById('totalFinal').textContent = totalPaySumPay;
		}

		function conFnc2(result) {
			console.log("결과id")
			console.log(result)
			document.getElementById('name').value = result['name'];
			document.getElementById('email').value = result['email'];
			console.log(result['address']);
			document.getElementById('postcode').value = result['address'].split(',')[0];
			document.getElementById('address').value = result['address'].split(',')[1];
			document.getElementById('detailAddress').value = result['address'].split(',')[2];

		}

		const body = document.querySelector('body');
		const modal = document.querySelector('.modal');
		const btnOpenPopup = document.querySelectorAll('#btn-open-popup');
		const backPay = document.querySelector('.closePay');

		btnOpenPopup.forEach((box) => {
			box.addEventListener('click', () => {
				modal.classList.toggle('show');

				if (modal.classList.contains('show')) {
					body.style.overflow = 'hidden';

				}
			})
		});
		modal.addEventListener('click', (event) => {
			if (event.target === modal) {
				modal.classList.toggle('show');
				if (!modal.classList.contains('show')) {
					body.style.overflow = 'auto';
				}
			}
		});
		backPay.addEventListener("click", e => {
		    modal.style.display = "none"
		    	body.style.overflow = 'scroll';
		});
		
	</script>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		//카카오결제
		function requestPay() {
			let name = document.getElementById('name').value; //
			let email = document.getElementById('email').value; //
			let postcode = document.getElementById('postcode').value; //
			let address = document.getElementById('address').value; //
			let detailAddress = document.getElementById('detailAddress').value; //
			let extraAddress = document.getElementById('extraAddress').value; //
			let phone = document.getElementById('phone').value; //
			let total = document.getElementById('totalFinal').textContent; //

			let check = name && email && postcode && address && detailAddress && phone;
			if (!check) {
				alert('비어있음');
				return false;
			}
			//let newAddress = address.concat(' ',detailAddress,' ',extraAddress);
			let newAddress = address + ' ' + detailAddress + ' ' + extraAddress;
			let newAddress2 = postcode + ' ' + address + ' ' + detailAddress + ' ' + extraAddress;
			console.log(newAddress2)
			//DB접근해서 주문번호시퀸스하나받아와야겠음
			let url = "orderHistoryInsertSearch.do?name=" + name + "+&email=" + email + "&address=" + newAddress2 +
				"&phone=" + phone;
			fetch(url)
				.then(orderNumber => orderNumber.text())
				.then(getOrderNumber)
				.catch(err => console.log(err));

			function getOrderNumber(orderNumber) {
				console.log(orderNumber);

				console.log("주문번호 출력" + orderNumber);
				IMP.init('imp72143310'); //가맹점 식별코드
				IMP.request_pay({
					pg: "kakaopay.TC0ONETIME",
					pay_method: "card",
					merchant_uid: orderNumber + new Date().getTime(), //주문번호
					name: '주문번호:' + orderNumber, //주문명
					amount: total, //결제금액
					buyer_email: email, //결제자아이디
					buyer_name: name, //결제자
					buyer_tel: phone, //결제자
					buyer_addr: newAddress, //주소
					buyer_postcode: postcode
				}, function (rsp) { // callback
					console.log(rsp);
					if (rsp.success) {
						let url = "orderHistoryInsertSearch2.do";
						fetch(url) //db입력//카트정보딜리트
							.then(response => response.text())
							.then(orderCom)
							.catch(err => console.log(err));

						function orderCom(response) {
							console.log(response);
						}
						var msg = '결제가 완료되었습니다.';
						alert(msg);
						location.href = "orderComplete.do"; //
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
						alert(msg);
					}

				});

			}
		}
	</script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function (data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("extraAddress").value = extraAddr;

					} else {
						document.getElementById("extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
		}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	</script>
</body>

</html>