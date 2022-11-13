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
	<div id="accountLoginContainer">
		<div id="loginLogo">
			<img src="image/login_logo.png" style="opacity:1;"/>
			<img src="image/login_logo.png" style="opacity:1;"/>
			<img src="image/login_logo.png" style="opacity:0.8;"/>
			<img src="image/login_logo.png" style="opacity:0.8;"/>
			<img src="image/login_logo.png" style="opacity:0.6;"/>
			<img src="image/login_logo.png" style="opacity:0.6;"/>
			<img src="image/login_logo.png" style="opacity:0.4;"/>
			<img src="image/login_logo.png" style="opacity:0.4;"/>
			<img src="image/login_logo.png" style="opacity:0.2;"/>
			<img src="image/login_logo.png" style="opacity:0.2;"/>
		</div>
		<form id="loginFrm" action="accountLogin.do" method="post">
			<div id="loginBox">
				<table id="loginTbl">
					<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" id="password" name="password"></td>
					</tr>
				</table>
				<button id="loginSubmitBtn" type="submit">LOGIN</button>
				<div id="findPwSendCon">
					<button class="findPwBtn" type="button" onclick="showFindPw()">비밀번호찾기</button>
					<button class="findPwBtn" type="button"
						onclick="location.href='accountJoinForm.do';">회원가입</button>
				</div>
				<div id="findPwForm" style="display: none;">
					<table id="findPwTbl">
						<tr>
							<th>아이디</th>
							<td><input type="text" id="findPw" name="findPw"></td>
						</tr>
					</table>
					<button type="button" id="findPwSend" onclick="pwSend()">비밀번호전송</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	function showFindPw(){ //비밀번호 찾기 보이기
		if(findPwForm.style.display=="none"){
			findPwForm.style.display="block";
		}else{
			findPwForm.style.display="none";
		}
	}
	function pwSend(){ //비밀번호 찾기
		alert("비밀번호가 등록된 이메일로 발송중입니다. 잠시만 기다려주세요");
		let idF = findPw.value;
		let url= "pwSend.do?id="+idF;
		fetch(url)
			.then(response => response.text())
			.then(data=>{
				if(data == '0'){
					alert("등록된 이메일로 비밀번호가 발송되었습니다.");
				}else{
					alert("발송에 실패했습니다. 잠시 후 다시 시도해주세요");
				}
			})
	}
	
	</script>

</body>
</html>