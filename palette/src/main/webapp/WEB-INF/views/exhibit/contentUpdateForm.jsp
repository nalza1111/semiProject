<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update Exhibition</title>
<link rel="stylesheet" href="css/styles.css?after" type="text/css">
</head>
<body>
	<div id="updateExhibitContainer" style="margin-top:50px;min-height:1080px;">
		<div id="joinFormStart">
			<br><br><h2>EDIT EXHIBITION</h2><hr>
			<!-- <h4><span style="font-weight: bold; color: red;">주의!</span> 수정시, 상세 이미지들이 사라집니다. 상세이미지 수정을 원하시면 삭제 후 전시를 새로 추가해주세요!</h4> -->
		</div>
		<div>
			<form id="frm" action="contentUpdate.do" method="post" enctype="multipart/form-data">
				<div>
					<table id="accountTbl" style="text-align:center">
						<tr>
							<th width="150">전시명</th>
							<td width="320"><input type="text" id="exhibitName" style="text-align:center;"
								name="exhibitName" value="${exhibit.exhibitName }"></td>
						</tr>
						<tr>
							<th width="150">전시일자</th>
							<td width="320"><input type="date" id="startDate" style="text-align:center;"
								name="startDate" value=${exhibit.startDate }></td>
						</tr>
						<tr>
							<th width="150">전시마감</th>
							<td width="320"><input type="date" id="endDate" style="text-align:center;"
								name="endDate" value=${exhibit.endDate }></td>
						</tr>
						<tr>
							<th>학교</th>
							<td><select id="exhibitSchool" name="exhibitSchool">
									<option>=========선택=========</option>
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
									<option>=========선택=========</option>
									<option value="회화과" <c:if test="${exhibit.exhibitMajor eq '회화과' }">selected</c:if>>회화과</option>
									<option value="환경조각과" <c:if test="${exhibit.exhibitMajor eq '환경조각과' }">selected</c:if>>환경조각과</option>
									<option value="패션디자인과" <c:if test="${exhibit.exhibitMajor eq '패션디자인과' }">selected</c:if>>패션디자인과</option>
									<option value="산업디자인과" <c:if test="${exhibit.exhibitMajor eq '산업디자인과' }">selected</c:if>>산업디자인과</option>
									<option value="금속주얼리디자인과" <c:if test="${exhibit.exhibitMajor eq '금속주얼리디자인과' }">selected</c:if>>금속주얼리디자인과</option>
							</select></td>
						</tr>
						<tr>
							<th width="150">전시소개</th>
							<td width="313">
							<textarea id="content" name="content" rows="8" cols="50" onkeyup= "counter();" maxlength="500" placeholder="500자 미만으로 입력해주세요"
							style="border: 1px solid #cfcfcf;font-size: 1em;border-radius: 5px; margin-right: 10px;"><c:if test="${exhibit.content != null}">${exhibit.content }</c:if></textarea>
							</td>
							<td style="float:right;font-size:15px;"><span id="count">(0/500)</span>&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>
				<div id="imageAddAlign" style="text-align:center;line-height:30px;">
					<!-- 대표 이미지 추가 -->
					<span style="width: 150px;color: #333;font-size: 17px;padding-right: 10px;font-weight:bold;text-align:center;">대표 이미지 </span><input type="file" name="image" accept="image/*" style="text-align:center;"/><br/><br/>
					
					<input type="hidden" name="exhibitNum" value="${exhibit.exhibitNum }">
					
					<div class="accountSubmitBox">
						<button type="submit" 
						class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
						data-text="UPDATE"><span>수정</span>
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
	<script>
	// counter라는 함수 정의
	function counter() {
		// content 변수 지정
	    // getElementById(id입력)
	    // -> 특정 id를 가진 DOM(textarea, span 과 같은 특정 객체를 의미함)을 가져옴  
	    // .value를 붙이면 그 안의 내용을 가져옴
	    var content = document.getElementById('content').value;
	
		//count 라는 id를 가진 객체 내용 (0/500) 을 가져온 후 현재 글자수 넣어주기

		document.getElementById('count').innerHTML = '(' + content.length + ' / 500)';

	
		// 글자수 500초과 시 500자리까지만 표시
		if (content.length > 500){ 
			document.getElementById('content').value = content.substring(0, 500);
		}
	}
	
	counter() //counter 함수 실행
	</script>
</body>
</html>