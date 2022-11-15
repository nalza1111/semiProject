<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styles.css?after" type="text/css">
</head>
<body>
	<div id="joinFormContainer">

		<div>
			<form id="frm" action="accountJoin.do" enctype="multipart/form-data" onsubmit="return formSubmit()"
				method="post">
				<div id="joinFormStart">
				<br><br>
					<h2>회원 가입</h2>
					<hr>
				</div>
				<div>
					<table id="accountTbl">
						<tr>
							<th style="width:120px;">> 아이디</th>
							<td><input type="text" id="id" name="id" required="required">
								<button class="frmBtn" type="button" id="btn" value="No"
									onclick="idCheck()">중복체크</button></td>
						</tr>
						<tr>
							<th>> 패스워드</th>
							<td><input type="password" id="password" name="password"
								required="required"></td>
						</tr>
						<tr>
							<th>> 패스워드확인</th>
							<td><input type="password" id="password1" name="password1"
								required="required"></td>
						</tr>
						<tr>
							<th>> 이름</th>
							<td><input type="text" id="name" name="name"
								required="required"></td>
						</tr>
						<tr>
							<th>> 이메일</th>
							<td><input type="email" id="email" name="email"
								required="required">
								<button class="frmBtn" type="button" id="emailCheck"
									onclick="emailSend()">인증번호받기</button>
								<button id="saveNum" value="1" ></button></td>
						</tr>
						<tr>
							<th>> 인증번호</th>
							<td><input type="text" id="certNum" name="certNum"
								required="required">
								<button class="frmBtn" type="button" id="certificationBtn"
									value="No" onclick="emailCertification()" >인증하기</button></td>
						</tr>
						<tr>
							<th>> 주소</th>
							<td><input type="text" id="postcode" name="postcode"
								placeholder="우편번호">
								<button class="frmBtn" type="button"
									onclick="sample6_execDaumPostcode()">우편번호 찾기</button></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" id="address" name="address"
								placeholder="주소" style="width: 427px;"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" id="detailAddress"
								name="detailAddress" placeholder="상세주소"> <input
								type="text" id="extraAddress" placeholder="참고항목"
								style="width: 117px;"></td>
						</tr>
						<tr>
							<th>> 학교</th>
							<td><select id="school" name="school">
									<option>=======선택=======</option>
									<option>경북대학교</option>
									<option>계명대학교</option>
									<option>영남대학교</option>
									<option>대구가톨릭대학교</option>
									<option>대구대학교</option>
							</select></td>
						</tr>
						<tr>
							<th>> 학과</th>
							<td><select id="major" name="major">
									<option>=======선택=======</option>
									<option>회화과</option>
									<option>환경조각과</option>
									<option>패션디자인과</option>
									<option>산업디자인과</option>
									<option>금속주얼리디자인과</option>
							</select></td>
						</tr>
						<tr>
							<th>> 파일</th>
							<td><input type="file" id="image" name="image"></td>
						</tr>
					</table>
				</div>
				<br />

				<div class="accountSubmitBox">
					<button type="submit"
						class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
						data-text="PALETTE">
						<span>가입하기</span>
					</button>
					<button type="reset"
						class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
						data-text="RESET">
						<span>새로쓰기</span>
					</button>
				</div>

			</form>
		</div>
	</div>
	<script type="text/javascript">
	
		function formSubmit(){
			if(frm.btn.value == 'No'){
				alert("아이디 중복체크를 해주세요...");
				return false;
			}
			if(frm.password.value != frm.password1.value){
				alert("패스워드가 확인값과 일치하지 않습니다.");
				frm.password.value="";
				frm.password1.value="";
				frm.password.focus();
				return false;
			}
			if(frm.certificationBtn.value=='No'){
				alert("이메일 인증을 해주세용");
				return false;
			}
			if(frm.school.value=='=======선택======='){
				alert("대학교를 선택해주세요");
				frm.school.focus()
				return false;
			}
			if(frm.major.value=='=======선택======='){
				alert("전공을 선택해주세요");
				frm.major.focus()
				return false;
			}
			return true;
		}
		
		function idCheck(){ //아이디 중복체크
			let id = frm.id.value;
			let url = "ajaxIdCheck.do?id="+id;
			fetch(url)
				.then(response => response.text())
				.then(data =>{
					if(data=='1'){
						alert(id + "는 사용가능한 아이디 입니다.");
						frm.btn.value = 'Yes';
					}else{
						alert(id+"는 이미 사용중인 아이디 입니다.");
						frm.id.value="";
						frm.id.focus();
					}
				});
		}
		function emailSend(){ //인증번호 발송
			alert("인증메일이 발송중입니다. 잠시만 기다려주세요");
			let email = frm.email.value;
			let url= "emailSend.do?email="+email;
			fetch(url)
				.then(response => response.text())
				.then(data=>{
					if(data != "failed"){
						console.log(data);
						alert("인증메일이 발송되었습니다");
						frm.emailCheck.disabled=true;
						frm.certNum.focus();
						frm.saveNum.value=data;
					}else{
						alert("발송에 실패했습니다. 잠시 후 다시 시도해주세요");
					}
				})
		}
		function emailCertification(){ //인증번호 확인
			let certNum = frm.saveNum.value;
			let certIn = frm.certNum.value;
				if(certIn==certNum){
					alert("인증 성공!");
					frm.certificationBtn.value = 'Yes';
				}else{
					alert("인증번호가 다릅니다.")
					frm.certNum.value="";
					frm.certNum.focus()
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