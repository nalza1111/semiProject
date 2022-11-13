<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardUpdate</title>
</head>
<script type="text/javascript">
	
</script>

<body>
	<div align="center">
		<h1>게시물 수정</h1>
		<form id="frm" action="boardUpdate.do" method="post"
			onsubmit="return formSubmit()">
			<div>
				<table border="1">
					<tr>
						<th width="150">글제목</th>
						<td width="270"><input type="text" id="title" name="title"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">글내용</th>
						<td><input type="text" id="content" name="content"
							required="required" value="${board.boardContent}"></td>
					</tr>
				</table>
			</div>
			<div>
				<input type="submit" value="저장">&nbsp;&nbsp; <input
					type="reset" value="취소">
			</div>
		</form>
	</div>
	
	<div id="show">
	
	</div>
	
	<a href="boardList.do">돌아가기</a>

	<script>
		let table=document.createElemente('table');
		let show=document.getElementById('show');
		show.appendChild(table);
		let tr=document.createElement('tr');
		
	</script>
</body>
</html>