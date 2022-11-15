<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add Exhibition</title>
<link rel="stylesheet" href="css/styles.css?after" type="text/css">
</head>
<body>
	<div id="addExhibitContainer" style="margin-top:50px;min-height:1080px;">
		<div id="joinFormStart">
			<br><br><h2>ADD EXHIBITION</h2><hr>
		</div>
		<div>
			<form id="frm" action="addExhibitList.do" method="post" enctype="multipart/form-data">
				<div>
					<table id="accountTbl" style="text-align:center">
						<tr>
							<th width="150">전시명</th>
							<td width="320"><input type="text" id="exhibitName"
								name="exhibitName" required="required"></td>
						</tr>
						<tr>
							<th width="150">전시일자</th>
							<td width="320"><input type="date" id="startDate"
								name="startDate" required="required" style="text-align:center;"></td>
						</tr>
						<tr>
							<th width="150">전시마감</th>
							<td width="320"><input type="date" id="endDate"
								name="endDate" required="required" style="text-align:center;"></td>
						</tr>
						<tr>
							<th>학교</th>
							<td><select id="exhibitSchool" name="exhibitSchool">
									<option>=========선택=========</option>
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
									<option>=========선택=========</option>
									<option>회화과</option>
									<option>환경조각과</option>
									<option>패션디자인과</option>
									<option>산업디자인과</option>
									<option>금속주얼리디자인과</option>
							</select></td>
						</tr>
						<tr>
							<th width="150">전시소개</th>
							<td width="313">
							<textarea id="content" name="content" rows="8" cols="50" placeholder="500자 미만으로 입력해주세요"
							style="border: 1px solid #cfcfcf;font-size: 1em;border-radius: 5px; margin-right: 10px;"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<br />
				<div >
					<!-- 대표 이미지 추가 -->
					<div id="imageAddAlign" style="text-align:center;line-height:30px;">
					<span style="width: 150px;color: #333;font-size: 17px;padding-left: 20px;font-weight:bold;">대표 이미지 </span><input type="file" name="image" accept="image/*" /><br/>

					<!-- 상세 이미지 추가 -->
					<span style="width: 150px;color: #333;font-size: 17px;padding-left: 20px;font-weight:bold;">상세 이미지 </span><input type="file" name="image1" accept="image/*" /><br/>
					<span style="width: 150px;color: #333;font-size: 17px;padding-left: 20px;font-weight:bold;">상세 이미지 </span><input type="file" name="image2" accept="image/*" /><br/>
					<span style="width: 150px;color: #333;font-size: 17px;padding-left: 20px;font-weight:bold;">상세 이미지 </span><input type="file" name="image3" accept="image/*" /><br/>
					<br><br></div>
					
					<input type="hidden" name="exhibitNum" value="${exhibit.exhibitNum }">
					
					<div class="accountSubmitBox">
						<button type="submit" 
						class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
						data-text="ADD"><span>등록</span>
						</button>
						<button type="reset"
						class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
						data-text="RESET"><span>취소</span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>