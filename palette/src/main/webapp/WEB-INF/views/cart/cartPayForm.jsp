<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.product-img{
			width:50px;
			height:80px;
		}
		table{
			text-align: center;
		}
		.foot{
			width: 650px;
		}
		
	</style>
</head>
<body>
	<h3>결제폼</h3>
	<table border="1" >
		<tr>
			<td width="100px">제품</td>
			<td width="100px">productName</td>
			<td width="100px">productCount</td>
			<td width="100px">productPrice</td>
		</tr>	
	</table>
	<c:set var="sum" value="0"/>
	<c:forEach var="cart" items="${userOrderDetailList}">
		<c:set var="sum" value="${sum+(cart.productCount*cart.productPrice)}"/>
		<c:if test="${cart.productCount >0}">
			<table border="1">
				<tr>
					<td width="100px">
						<img class="product-img" src="/palette/image/${cart.getImage()}" alt="..." />
					</td>
					<td width="100px">
						${cart.productName}
					</td>
					<td width="100px" id="${cart.productNumber}" name="${cart.productNumber}">
						<input type="hidden" value="${cart.productNumber}">
						<input type="text" value="${cart.productCount}" readonly style="width:25px"></span>
						<input type="hidden" value="${cart.productPrice}">
					</td>
					<td width="100px">${cart.productPrice}</td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	<br>
	<div class="foot" id="total" style="border: 1px solid black;">
		<h3>총 금액</h3>
		<div id="totalSum"><c:out value="${sum }"/> </div>
		
		<!-- 결제자정보 -->
		<table border="1">
			<tr>
				<th>id</th>
				<td>${account.id}</td>
			</tr>
			<tr>
				<th>name</th>
				<td>
					<input type="text" name="name" id="name" value="${account.name}">
				</td>
			</tr>
			<tr>
				<th>email</th>
				<td>
					<input type="email" name="email" id="email"  value="${account.email}">
				</td>
			</tr>
			<tr>
				<th>postcode</th>
				<td><input type="text" id="postcode" name="postcode"
					placeholder="우편번호" value="${fn:split((account.address),',')[0]}"> <input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호"></td>
			</tr>
			<tr>
				<th>address</th>
				<td><input type="text" id="address" name="address"
					placeholder="주소" style="width: 300px;" value="${fn:trim(fn:split((account.address),',')[1])}"></td>
			</tr>
			<tr>
				<th>detailAddress</th>
				<td><input type="text" id="detailAddress"
					name="detailAddress" placeholder="상세주소"value="${fn:trim(fn:split((account.address),',')[2])}">
					<input type="text" id="extraAddress" placeholder="참고항목" style="width: 117px;"></td>
			</tr>
			<tr>
				<th>phone</th>
				<td>
					<input type="tel" name="phone" id="phone"><br>
				</td>
			</tr>
		</table>
		
		<input type="button" value="결제하기(카카오)" onclick="requestPay()">
	</div>
	<!-- jQuery -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
			let total = document.getElementById('totalSum').textContent;//
			
			let newAddress = address.concat(detailAddress," ",extraAddress);
			
			console.log(name+" "+email+" "+postcode+" "+address+" "+detailAddress+" "+extraAddress+" "+phone+" "+total);
			console.log(newAddress);
			
			//DB접근해서 주문번호시퀸스하나받아와야겠음
			
		  	IMP.init('imp72143310'); //가맹점 식별코드
		  	IMP.request_pay({
		    pg: "kakaopay.TC0ONETIME",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(), //주문번호
		    name : '주문명:결제테스트', //주문명
		    amount : total, //결제금액
		    buyer_email : email,//결제자아이디
		    buyer_name : name, //결제자
		    buyer_tel : phone, //결제자
		    buyer_addr : newAddress, //주소
		    buyer_postcode : postcode
		  }, function (rsp) { // callback
			  console.log(rsp); 
		      if (rsp.success) {
		    	  var msg = '결제가 완료되었습니다.'; //db입력 //카트정보딜리트
		          alert(msg);
		          location.href = "product.do";//
		      } else {
		    	  var msg = '결제에 실패하였습니다.';
		          msg += '에러내용 : ' + rsp.error_msg;
		          alert(msg);
		      }
		  });
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
	<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>