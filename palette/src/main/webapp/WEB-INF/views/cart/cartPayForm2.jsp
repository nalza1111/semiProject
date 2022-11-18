<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<h3>장바구니폼</h3>
	<table border="1" >
		<tr>
			<td width="100px">제품</td>
			<td width="100px">productName</td>
			<td width="100px">productCount</td>
			<td width="100px">productPrice</td>
			<td width="100px">delete</td>
			<td width="100px"><input type="checkbox" id="check" checked></td>
		</tr>	
	</table>
	<c:set var="sum" value="0"/>
	<c:forEach var="cart" items="${userOrderDetailList}">
		<c:set var="sum" value="${sum+(cart.productCount*cart.productPrice)}"/>
		<c:if test="${cart.productCount >0}">
			<table border="1">
				<tr>
					<td width="100px">
						<a class="product-detail" href="productDetail.do?productNumber=${cart.productNumber}">
							<img class="product-img" src="/palette/image/${cart.getImage()}" alt="..." />
						</a>
					</td>
					<td width="100px">
						<a class="product-detail" href="productDetail.do?productNumber=${cart.productNumber}">
							${cart.productName}
						</a>
					</td>
					<td width="100px" id="${cart.productNumber}" name="${cart.productNumber}">
						<input type="hidden" value="${cart.productNumber}">
						<input type="button" onClick=fncCount('m',this) value="-">
						<input type="text" value="${cart.productCount}" readonly style="width:25px"></span>
						<input type="button" onClick=fncCount('p',this)  value="+">
						<input type="hidden" value="${cart.productPrice}">
					</td>
					<td width="100px">${cart.productPrice}</td>
					<td width="100px">
						<input type="hidden" value="${cart.productNumber}">
						<input type="button" value="삭제" onClick=fncDelete(this)  >
						<input type="hidden" value="${cart.productPrice}">
						<input type="hidden" value="${cart.productCount}">
					</td>
					<td width="100px"><input type="checkbox" checked></td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	<br>
	<div class="foot" id="total" style="border: 1px solid black;">
		<input type="button" value="결제하기(카카오)" onclick="requestPay()">
		<input type="button" value="선택삭제" id="del"  >
		<h3>총 금액</h3>
		<h4><c:out value="${sum }"/> </h4>
	</div>
	<!-- jQuery -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		function fncCount(type, cn){
			console.log(cn.parentNode.children[0].value); //상품번호

			let productNumber = cn.parentNode.children[0].value;
			let productPrice = cn.parentNode.children[4].value;
			console.log(productPrice);
			let job = '';

			let count = cn.parentNode.children[2];
			
			console.log(document.getElementById('total').children[3]);
			if (type == 'm'&&count.value>=1){
				count.value--;
				job = 'minus';
				document.getElementById('total').children[3].textContent=document.getElementById('total').children[3].textContent-productPrice;
				if(count.value==0){
					count.parentNode.parentNode.remove();
				}
			} else if(type == 'p'){
				count.value++;
				job = 'plus';
				document.getElementById('total').children[3].textContent=(document.getElementById('total').children[3].textContent-0)+(productPrice-0);
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
			
			console.log(document.getElementById('total').children[3]); //총금액에서 딜리트금액빼주기
			document.getElementById('total').children[3].textContent = document.getElementById('total').children[3].textContent-totalPrice;
			
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
		//카카오결제
		function requestPay() {
		  IMP.init('imp72143310'); //가맹점 식별코드
		  IMP.request_pay({
		    pg: "kakaopay.TC0ONETIME",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '주문명:결제테스트', //주문명
		    amount : '100', //결제금액
		    buyer_email : 'nalza1111@naver.com',//결제자아이디
		    buyer_name : 'puka', //결제자
		    buyer_tel : '010-4922-3063', //결제자
		    buyer_addr : '서울특별시', //주소
		    buyer_postcode : '123-456'
		  }, function (rsp) { // callback
			  console.log(rsp);
		      if (rsp.success) {
		    	  var msg = '결제가 완료되었습니다.';
		          alert(msg);
		          location.href = "product.do";
		      } else {
		    	  var msg = '결제에 실패하였습니다.';
		          msg += '에러내용 : ' + rsp.error_msg;
		          alert(msg);
		      }
		  });
		}
		
	</script>
</body>
</html>