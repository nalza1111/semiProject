<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="css/styles.css?after">
</head>
<body>
	<div align ="center">
		<div><tiles:insertAttribute name="header"/></div>
		<div id="bodyTile" style="min-height:850px;margin-top:50px;z-index:90;"><tiles:insertAttribute name="body"/></div>
		<div id="footerTile"><tiles:insertAttribute name="footer"/></div>
	</div>
</body>
</html>