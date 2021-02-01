<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.menu {
	width: 500px;
	height: 600px;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin: 0 auto;
	font-size: 24px;
	display: inline-block;
	float: left;
	font-size: 24px;
}

.img {
	width: 300px;
	height: 350px;
}

img {
	width: 300px;
	height: 300px;
	margin-top: 70px;
	display: block;
	margin: 90px;
}

.font {
	font-size: 180%;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="../navbar_user.jsp"%>

	<div class="menu" onclick="javascript:window.location='menu_list.jsp'">
		<p class="img">
			<img src="<spring:url value='/resources/img2/coffee.png'/>" />
		<p class="font" style="margin: 20px; text-align: center;">매장에서 식사</p>
	</div>

	<div class="menu" onclick="javascript:window.location='menu_list.jsp'"
		style="text-align: center;">
		<p class="img">
			<img src="<spring:url value='/resources/img2/take-away.png'/>" />
		</p>
		<p class="font" style="margin: 20px;">포장</p>
	</div>

</body>
</html>