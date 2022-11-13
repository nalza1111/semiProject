<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product-img {
	width: 50px;
	height: 80px;
}

.product-img-pay {
	width: 25px;
	height: 25px;
}

table {
	text-align: center;
}

.foot {
	width: 650px;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	mix-blend-mode: normal;
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 800px;
	height: 600px;
	padding: 40px;
	text-align: center;
	/* font-size: 22px; */
	background-color: #d6cfc7;
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 1);
	transform: translateX(-50%) translateY(-50%);
	z-index: 2;
}
</style>
</head>
<body>
	<h3>장바구니폼</h3>
	<table border="1">
		<tr>
			<td width="100px">제품</td>
			<td width="100px">productName</td>
			<td width="100px">productCount</td>
			<td width="100px">productPrice</td>
			<td width="100px">delete</td>
			<td width="100px"><input type="checkbox" id="check" checked></td>
		</tr>
	</table>
	<c:set var="sum" value="0" />
	<c:forEach var="cart" items="${userOrderDetailList}">
		<c:set var="sum" value="${sum+(cart.productCount*cart.productPrice)}" />
		<c:if test="${cart.productCount >0}">
			<table id="cart" class="cart" border="1">
				<tr>
					<td width="100px"><a class="product-detail"
						href="productDetail.do?productNumber=${cart.productNumber}"> <img
							class="product-img" src="/palette/image/${cart.getImage()}"
							alt="..." />
					</a></td>
					<td width="100px"><a class="product-detail"
						href="productDetail.do?productNumber=${cart.productNumber}">
							${cart.productName} </a></td>
					<td width="100px" id="${cart.productNumber}"
						name="${cart.productNumber}"><input type="hidden"
						value="${cart.productNumber}"> <input type="button"
						onClick="fncCount('m', this)" value="-"> <input
						type="text" value="${cart.productCount}" readonly
						style="width: 25px;"> <input type="button"
						onClick="fncCount('p', this)" value="+"> <input
						type="hidden" value="${cart.productPrice}"></td>
					<td width="100px">${cart.productPrice}</td>
					<td width="100px"><input type="hidden"
						value="${cart.productNumber}"> <input type="button"
						value="삭제" onClick="fncDelete(this)"> <input type="hidden"
						value="${cart.productPrice}"> <input type="hidden"
						value="${cart.productCount}"></td>
					<td width="100px"><input type="checkbox" checked></td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	<br>
	<div class="foot" id="totalCartForm" style="border: 1px solid black;">
		<input type="button" id="btn-open-popup" value="체크상품 결제하기"
			onclick=fncPay()> <input type="button" id="btn-open-popup"
			value="모두 결제하기" onclick=fncPayAll()> <input type="button"
			value="선택삭제" id="del">
		<h3>총 금액</h3>
		<h4>
			<c:out value="${sum }" />
		</h4>
	</div>

	<!-- 결제 모달 -->
	<div class="modal">
		<div class="modal_body">
			<h3>결제폼</h3>
			<table border="1">
				<thead>
					<tr>
						<td width="100px">제품</td>
						<td width="100px">productName</td>
						<td width="100px">productCount</td>
						<td width="100px">productPrice</td>
					</tr>
				</thead>
				<tbody id="dynamic-pay" class="dynamic-pay">
					<tr></tr>
				</tbody>
			</table>
			<br>
			<div class="foot-pay" id="total" style="border: 1px solid black;">
				<h3>총 금액</h3>
				<h4 id="totalPaySum-pay"></h4>
				<!-- 결제자정보 -->
				<table id="payAcc" border="1">
					<tr>
						<th>name</th>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<th>email</th>
						<td><input type="email" name="email" id="email"></td>
					</tr>
					<tr>
						<th>postcode</th>
						<td><input type="text" id="postcode" name="postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호"></td>
					</tr>
					<tr>
						<th>address</th>
						<td><input type="text" id="address" name="address"
							placeholder="주소" style="width: 300px;"></td>
					</tr>
					<tr>
						<th>detailAddress</th>
						<td><input type="text" id="detailAddress"
							name="detailAddress" placeholder="상세주소"> <input
							type="text" id="extraAddress" placeholder="참고항목"
							style="width: 117px;"></td>
					</tr>
					<tr>
						<th>phone</th>
						<td><input type="tel" name="phone" id="phone"><br></td>
					</tr>
				</table>
				<input type="button" value="결제하기(카카오)" onclick="requestPay()">
				<input type="button" value="취소" class="closePay">
			</div>
		</div>
	</div>
	<script>
		function fncCount(type, cn){
			console.log(cn.parentNode.children[0].value); //상품번호

			let productNumber = cn.parentNode.children[0].value;
			let productPrice = cn.parentNode.children[4].value;
			console.log(productPrice);
			let job = '';

			let count = cn.parentNode.children[2];
			
			console.log(document.getElementById('totalCartForm').children[4]);
			if (type == 'm'&&count.value>=1){
				count.value--;
				job = 'minus';
				document.getElementById('totalCartForm').children[4].textContent=document.getElementById('totalCartForm').children[4].textContent-productPrice;
				if(count.value==0){
					count.parentNode.parentNode.remove();
				}
			} else if(type == 'p'){
				count.value++;
				job = 'plus';
				document.getElementById('totalCartForm').children[4].textContent=(document.getElementById('totalCartForm').children[4].textContent-0)+(productPrice-0);
			}
			let data = "productNumber="+productNumber+"&job="+job;
			let url = "addCartTwo.do?"+data;
			console.log(data);
			fetch(url,{
			headers: {'Content-type':'application/x-www-form-urlencoded'}
			})
			.then(result=>result.json())
			.then(addCartTwoFnc)
			.catch(err=>console.log(err));
		}
		function addCartTwoFnc(result){
			console.log(result);
		}
		
		function addCartTwoFnc(result){
			console.log(result);
		}
		document.querySelector('input[type="checkbox"]').addEventListener('change',function(){
			document.querySelectorAll('input[type="checkbox"]').forEach(function(check){
				check.checked = document.querySelector('input[type="checkbox"]').checked;
			})
		})
		document.getElementById('del').addEventListener('click', function fncDeleteDo(){
			document.querySelectorAll('input[type="checkbox"]').forEach(function(check){
				let del = check.parentNode.parentNode.children[4].children[1];
				if(check.checked&&del!=null){
					console.log(del);
					fncDelete(del);
				}
			})
		})
	
		function fncDelete(th){
			console.log(th.parentNode.children[0].value); //상품번호
			console.log(th.parentNode.children[2].value); //상품가격
			console.log(th.parentNode.children[3].value); //상품개수
			let productNumber = th.parentNode.children[0].value;
			let productPrice = th.parentNode.children[2].value;
			let productCount = th.parentNode.children[3].value; 
			
			let totalPrice = productPrice*productCount;//빼야할 금액
			
			th.parentNode.parentNode.parentNode.remove();
			
			console.log(document.getElementById('totalCartForm').children[4]); //총금액에서 딜리트금액빼주기
			document.getElementById('totalCartForm').children[4].textContent = document.getElementById('totalCartForm').children[4].textContent-totalPrice;
			
			let data = "productNumber="+productNumber;
			let url = "deleteCart.do?"+data;
			console.log(data);
			fetch(url,{
			headers: {'Content-type':'application/x-www-form-urlencoded'}
			})
			.then(result=>result.json())
			.then()
			.catch(err=>console.log(err));
		}
	</script>
	<script>
	//결제버튼눌림
		function fncPay(){
			//이전에 있던 컴플리트오더(DB)먼저 지워주기
			let url2 = "orderDelete.do?"
			fetch(url2)
			.then(result=>result.text())
			.catch(err=>console.log(err));
			
			let data = ''; //체크리스트뽑기
			document.querySelectorAll('input[type="checkbox"]').forEach(function(check){
				let toPayCart = check.parentNode.parentNode.children[4].children[0];//프로덕트넘버
				console.log(toPayCart);
				if(check.checked&&toPayCart!=null){
					data +=(toPayCart.value+"_");
				}})
			console.log(data) //주문할 것들 체크해서 품목확인 30_20_5_...
			data = data.slice(0,-1);
			let url = "cartPayForm.do?payCart="+data; //체크리스트뽑아오기
			console.log(url)
			fetch(url)
				.then(response => response.json())
				.then(conFnc)
				.catch(err=>alert('선택된 상품없음'));
			

			let urlId = "cartPayFormId.do"; //계정뽑기
			fetch(urlId)
				.then(response => response.json())
				.then(conFnc2)
				.catch(err=>console.log(err));
			
		}
		//결제버튼눌림(all)
		function fncPayAll(){
			//이전에 있던 컴플리트오더(DB)먼저 지워주기
			let url2 = "orderDelete.do?"
			fetch(url2)
			.then(result=>result.text())
			.catch(err=>console.log(err));
			
			let url = "cartPayFormAll.do"; //체크리스트뽑아오기
			console.log(url)
			fetch(url)
				.then(response => response.json())
				.then(conFnc)
				.catch(err=>alert('선택된 상품없음'));
			

			let urlId = "cartPayFormId.do"; //계정뽑기
			fetch(urlId)
				.then(response => response.json())
				.then(conFnc2)
				.catch(err=>console.log(err));
			}
		
	
		function conFnc(result){
			if(result)
			console.log("결과")
			console.log(result)
			let dynamicPay = document.getElementById('dynamic-pay');
			document.querySelectorAll('#dynamic-pay>tr').forEach(tr=>tr.remove());
			
			let totalPaySumPay = 0;
			result.forEach(function(row){
				let trTag = document.createElement('tr');
				console.log(row);
				for(r in row){
					let tdTag = document.createElement('td');
					if(r!='id'&&r!='productNumber'&&r!='image'){
						tdTag.append(document.createTextNode(row[r]));
						trTag.append(tdTag);
					}
					if(r=='image'){
						let img = document.createElement('img');
						img.setAttribute('src','/palette/image/'+row[r]);
						img.setAttribute('style','width:50px');
						tdTag.append(img);
						trTag.append(tdTag);
					}
				}
				dynamicPay.appendChild(trTag);

				totalPaySumPay += (row['productPrice']-0)*(row['productCount']-0);
			})
			console.log(totalPaySumPay);
			document.getElementById('totalPaySum-pay').textContent = totalPaySumPay;
		}
		
		function conFnc2(result){
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
		backPay.addEventListener("click", e => { modal.style.display = "none" }); 
		
	</script>
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		//카카오결제
		function requestPay() {
			let name = document.getElementById('name').value;//
			let email = document.getElementById('email').value;//
			let postcode = document.getElementById('postcode').value;//
			let address = document.getElementById('address').value;//
			let detailAddress = document.getElementById('detailAddress').value;//
			let extraAddress = document.getElementById('extraAddress').value;//
			let phone = document.getElementById('phone').value;//
			let total = document.getElementById('totalPaySum-pay').textContent;//
			
			let check = name && email && postcode && address && detailAddress && phone;
			if(!check){
				alert('비어있음');
				return false;
			}
			//let newAddress = address.concat(' ',detailAddress,' ',extraAddress);
			let newAddress = address+' '+detailAddress+' '+extraAddress;
			let newAddress2 = postcode +' '+address+' '+detailAddress+' '+extraAddress;
			console.log(newAddress2)
			//DB접근해서 주문번호시퀸스하나받아와야겠음
			let url = "orderHistoryInsertSearch.do?name="+name+"+&email="+email+"&address="+newAddress2+"&phone="+phone;
			fetch(url)
				.then(orderNumber => orderNumber.text())
				.then(getOrderNumber)
				.catch(err=>console.log(err));
			
			function getOrderNumber(orderNumber) {
				console.log(orderNumber);
				
				console.log("주문번호 출력"+orderNumber);
				IMP.init('imp72143310'); //가맹점 식별코드
			  	IMP.request_pay({
			    pg: "kakaopay.TC0ONETIME",
			    pay_method: "card",
			    merchant_uid : orderNumber+new Date().getTime(), //주문번호
			    name : '주문번호:'+orderNumber, //주문명
			    amount : total, //결제금액
			    buyer_email : email,//결제자아이디
			    buyer_name : name, //결제자
			    buyer_tel : phone, //결제자
			    buyer_addr : newAddress, //주소
			    buyer_postcode : postcode
			  }, function (rsp) { // callback
				  console.log(rsp); 
			      if (rsp.success) {
			    	  let url = "orderHistoryInsertSearch2.do";
							fetch(url) //db입력//카트정보딜리트
								.then(response => response.text())
								.then(orderCom)
								.catch(err=>console.log(err));
							function orderCom(response){
								console.log(response);
							}
			    	  var msg = '결제가 완료되었습니다.';
			          alert(msg);
			          location.href = "orderComplete.do";//
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
	            oncomplete: function(data) {
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
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>