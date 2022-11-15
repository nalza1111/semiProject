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
	<div id="mainWrapper" align="center">
		<section class="main_section01">
			<div class="section_title">
				<div class="title2"></div>
				<div class="title1"></div>
			</div>
		</section>
		
		<section class="main_section02">
			<div class="section_title">
				<div class="title2">인기작품 TOP 6</div>

			</div>
			<div>
				<ul id="mainArtUl">
					<c:forEach items="${art}" var="a">
						<li class="artItem"><img class="artImg" src="${a.artImage }" />
							<div id="hoverArtText">
								<div id="hoverartP">
									<p style="font-size: 24px;font-weight: 700;">${a.artTitle}</p>
									<p style="font-size: 16px;font-weight: 500;">${a.artContent}</p>
									<p style="font-size: 18px;font-weight: 600;">${a.artId}</p>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>
		
		<section class="main_section03">
			<div class="section_title">
				<div class="title2">PALETTE TOP ARTIST</div>
			</div>
			<div>
				<ul id="mainAccountUl">
					<c:forEach items="${account}" var="ac">
						<li id="accountItem" onclick="location.href='feedSelect.do?id=${ac.id}';"><img
								class="accountImg" src="${ac.image }" />
							<p>${ac.name}</p>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>
		
		<div class="section_banner">
			<a href="product.do">
				<image src="https://www.art1.com/images/main/section_banner.jpg" style="vertical-align: middle;">
			</a>
		</div>
		
		<section class="main_section04">
			<div class="section_title">
				<div class="title2">PALETTE 아트마켓 최신 상품</div>
			</div>
			<div>
				<ul id="mainProductUl">
					<c:forEach items="${product}" var="p">
						<li id="productItem" onclick="location.href='productDetail.do?id=${p.productNumber}';">
							<img class="productImg" src="${p.image }"/>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>

		<section class="main_section05">
			<div class="section_title">
				<div class="title2">PALETTE COMMUNITY</div>
				<div class="title1"></div>
			</div>
		</section>
		
		<div id="section_banner">
			<a href="exhibitList.do">
				<image src="https://www.art1.com/images/main/section_banner_02.jpg" style="vertical-align: middle;"/>
			</a>
		</div>
	</div>
</body>

</html>