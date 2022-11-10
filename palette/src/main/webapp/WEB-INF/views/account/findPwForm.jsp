<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h3>비밀번호 찾기</h3>
	<table id="tbl">
		<tr>
			<th>아이디</th>
			<td>
			<input type="text" id="id" name="id">
			<button type="button" id="btn" onclick="pwSend()">비밀번호전송</button>
			</td>
		</tr>
	</table>
	
	<a href="accountLoginForm.do">로그인화면으로</a>
	<a href="main.do">홈으로</a>
	</div>
	<script type="text/javascript">
	function pwSend(){ //인증번호 발송
		alert("비밀번호가 등록된 이메일로 발송중입니다. 잠시만 기다려주세요");
		let idF = id.value;
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