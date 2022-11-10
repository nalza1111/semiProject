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
			<h1>글 등록</h1>
		</div>
		<div>
			<form id="frm" action="addExhibitList.do" method="post" enctype="multipart/form-data">
				<div>
					<table border="1">
						<tr>
							<th width="150">전시명</th>
							<td width="270"><input type="text" id="exhibitName"
								name="exhibitName" required="required"></td>
						</tr>
						<tr>
							<th width="150">전시일자</th>
							<td width="270"><input type="text" id="startDate"
								name="startDate" required="required"></td>
						</tr>
						<tr>
							<th width="150">전시마감</th>
							<td width="270"><input type="text" id="endDate"
								name="endDate" required="required"></td>
						</tr>
						<tr>
							<th width="150">학교</th>
							<td width="270"><input type="text" id="exhibitSchool"
								name="exhibitSchool" required="required"></td>
						</tr>
						<tr>
							<th width="150">전공</th>
							<td width="270"><input type="text" id="exhibitMajor"
								name="exhibitMajor" required="required"></td>
						</tr>
						
					</table>
				</div>
				<br />
				<div>
					<!-- 대표 이미지 추가 -->
					<input type="file" name="image"><br/>
					<input type="submit" value="등록">&nbsp;&nbsp; 
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>