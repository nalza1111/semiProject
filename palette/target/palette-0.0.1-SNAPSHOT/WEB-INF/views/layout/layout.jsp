<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="css/menu.css?ver=1">
</head>
<body>
	<div align ="center">
		<div><tiles:insertAttribute name="header"/></div>
		<div id="bodyTile"><tiles:insertAttribute name="body"/></div>
		<div><tiles:insertAttribute name="footer"/></div>
	</div>
</body>
</html>