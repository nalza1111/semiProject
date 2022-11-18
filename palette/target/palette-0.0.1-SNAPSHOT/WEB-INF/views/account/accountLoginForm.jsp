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
		<div>
			<h1>로 그 인</h1>
		</div>
		<div>
			<form action="accountLogin.do" id="frm" method="post">
				<div>
					<table>
						<tr>
							<th width="70">아이디</th>
							<td width="150"><input type="text" id="id" name="id"></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" id="password" name="password"></td>
						</tr>

					</table>
				</div>
				<br />
				<div>
					<input type="submit" value="로그인" style= "width:300px;"><br/>
					<a href="findPwForm.do">비밀번호찾기</a>
					<a href="main.do">홈으로</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>