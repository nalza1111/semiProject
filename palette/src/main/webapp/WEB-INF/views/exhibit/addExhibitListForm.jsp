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
							<td width="270"><input type="date" id="startDate"
								name="startDate" required="required"></td>
						</tr>
						<tr>
							<th width="150">전시마감</th>
							<td width="270"><input type="date" id="endDate"
								name="endDate" required="required"></td>
						</tr>
						<tr>
							<th>학교</th>
							<td><select id="exhibitSchool" name="exhibitSchool">
									<option>=======선택=======</option>
									<option>경북대학교</option>
									<option>계명대학교</option>
									<option>영남대학교</option>
									<option>대구가톨릭대학교</option>
									<option>대구대학교</option>
							</select></td>
						</tr>
						<tr>
							<th>학과</th>
							<td><select id="exhibitMajor" name="exhibitMajor">
									<option>=======선택=======</option>
									<option>회화과</option>
									<option>환경조각과</option>
									<option>패션디자인과</option>
									<option>산업디자인과</option>
									<option>금속주얼리디자인과</option>
							</select></td>
						
						<!-- <th width="150">전공</th>
							<td width="270"><input type="text" id="exhibitMajor"
								name="exhibitMajor" required="required"></td> -->
						</tr>
						<tr>
							<th width="150">전시소개</th>
							<td width="270">
							<textarea id="content" name="content" rows="8" cols="50" placeholder="500자 미만으로 입력해주세요"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<br />
				<div>
					<!-- 대표 이미지 추가 -->
					대표 이미지: <input type="file" name="image"><br/>

					<!-- 상세 이미지 추가 -->
					상세 이미지: <input type="file" name="images" multiple><br/>

					<input type="hidden" name="exhibitNum" value="${exhibit.exhibitNum }">
					<input type="submit" value="등록">&nbsp;&nbsp; 
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>