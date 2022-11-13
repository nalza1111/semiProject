<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>글 수정</h1>
		</div>
		<div>
			<form id="frm" action="contentUpdate.do" method="post" enctype="multipart/form-data">
				<div>
					<table border="1">
						<tr>
							<th width="150">전시명</th>
							<td width="270"><input type="text" id="exhibitName"
								name="exhibitName" value="${exhibit.exhibitName }"></td>
						</tr>
						<tr>
							<th width="150">전시일자</th>
							<td width="270"><input type="date" id="startDate"
								name="startDate" value=${exhibit.startDate }></td>
						</tr>
						<tr>
							<th width="150">전시마감</th>
							<td width="270"><input type="date" id="endDate"
								name="endDate" value=${exhibit.endDate }></td>
						</tr>
						<tr>
							<th>학교</th>
							<td><select id="exhibitSchool" name="exhibitSchool">
									<option>=======선택=======</option>
									<option value="경북대학교" <c:if test="${exhibit.exhibitSchool eq '경북대학교' }">selected</c:if>>경북대학교</option>
									<option value="계명대학교" <c:if test="${exhibit.exhibitSchool eq '계명대학교' }">selected</c:if>>계명대학교</option>
									<option value="영남대학교" <c:if test="${exhibit.exhibitSchool eq '영남대학교' }">selected</c:if>>영남대학교</option>
									<option value="대구가톨릭대학교" <c:if test="${exhibit.exhibitSchool eq '대구가톨릭대학교' }">selected</c:if>>대구가톨릭대학교</option>
									<option value="대구대학교" <c:if test="${exhibit.exhibitSchool eq '대구대학교' }">selected</c:if>>대구대학교</option>
							</select></td>
						<!-- <th width="150">학교</th>
							<td width="270"><input type="text" id="exhibitSchool"
								name="exhibitSchool" value=${exhibit.exhibitSchool }></td> -->	
						</tr>
						<tr>
							<th>학과</th>
							<td><select id="exhibitMajor" name="exhibitMajor">
									<option>=======선택=======</option>
									<option value="회화과" <c:if test="${exhibit.exhibitMajor eq '회화과' }">selected</c:if>>회화과</option>
									<option value="환경조각과" <c:if test="${exhibit.exhibitMajor eq '환경조각과' }">selected</c:if>>환경조각과</option>
									<option value="패션디자인과" <c:if test="${exhibit.exhibitMajor eq '패션디자인과' }">selected</c:if>>패션디자인과</option>
									<option value="산업디자인과" <c:if test="${exhibit.exhibitMajor eq '산업디자인과' }">selected</c:if>>산업디자인과</option>
									<option value="금속주얼리디자인과" <c:if test="${exhibit.exhibitMajor eq '금속주얼리디자인과' }">selected</c:if>>금속주얼리디자인과</option>
							</select></td>
						<!--  <th width="150">전공</th>
							<td width="270"><input type="text" id="exhibitMajor"
								name="exhibitMajor" value=${exhibit.exhibitMajor }></td> -->
						</tr>
						<tr>
							<th width="150">전시소개</th>
							<td width="270">
							<textarea id="content" name="content" rows="8" cols="50" placeholder="500자 미만으로 입력해주세요"><c:if test="${exhibit.content != null}">${exhibit.content }</c:if></textarea>
							</td>
						</tr>
					</table>
				</div>
				<br />
				<div>
					<!-- 대표 이미지 추가 -->
					<input type="file" name="image"><br/>
					<input type="hidden" name="exhibitNum" value="${exhibit.exhibitNum }">
					<input type="submit" value="등록">&nbsp;&nbsp; 
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>