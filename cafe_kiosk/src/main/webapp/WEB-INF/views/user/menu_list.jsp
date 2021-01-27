<%@page import="com.model.dto.MenuDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
@font-face {
	font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf");
}

* {
	font-family: hzStyleFont;
}

table {
	margin: 50px 500px 0% 600px;
	text-align: center;
}

.side {
	height: 96.3%;
	position: fixed;
	left: 85%;
	width: 15%;
	text-align: center;
	background: lightgray;
	vertical-align: middle;
}

img {
	margin: 0px auto;
	display: block;
}

td, th {
	padding: 50px;
}

.menu {
	width: 200px;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin: 30px;
	font-size: 24px;
	float: left;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../navbar_user.jsp"%>
	<div class="side">
		<input type="button" value="커피" class="show1"> <input
			type="button" value="티" class="show2"> <input type="button"
			value="음료" class="show3"><br> <input type="button"
			value="블렌디드" class="show4"> <input type="button" value="디저트"
			class="show5"> <br> 총 합계 금액 : <br>10000원 <br>
		<br> <input type="reset" value="메뉴 추가하기" class="btn btn-warning"
			style="font-size: 30px;"><br> <br> <input
			type="submit" value="주문 하기" class="btn btn-warning"
			style="font-size: 30px;">
	</div>
	<div style="width: 1500px;">
		<div class="coffee">
			<%
				ArrayList<MenuDto> menuDtos1 = MenuDao.getInstance().allmenuType("espresso");
			for (MenuDto menuDto : menuDtos1) {
			%>
			<div class="menu">
				<p>
					<img src="../showImage?key1=<%=menuDto.getName()%>" height="200px"
						width="200px">
				</p>
				<p><%=menuDto.getName()%></p>
				<p><%=menuDto.getPrice()%></p>
			</div>
			<%
				}
			%>
		</div>

		<div class="blended">
			<%
				ArrayList<MenuDto> menuDtos2 = MenuDao.getInstance().allmenuType("blended");
			for (MenuDto menuDto : menuDtos2) {
			%>
			<div class="menu">
				<p>
					<img src="../showImage?key1=<%=menuDto.getName()%>" height="200px"
						width="200px">
				</p>
				<p><%=menuDto.getName()%></p>
				<p><%=menuDto.getPrice()%></p>
			</div>
			<%
				}
			%>
		</div>

		<div class="etc">
			<%
				ArrayList<MenuDto> menuDtos3 = MenuDao.getInstance().allmenuType("etc");
			for (MenuDto menuDto : menuDtos3) {
			%>
			<div class="menu">
				<p>
					<img src="../showImage?key1=<%=menuDto.getName()%>" height="200px"
						width="200px">
				</p>
				<p><%=menuDto.getName()%></p>
				<p><%=menuDto.getPrice()%></p>
			</div>
			<%
				}
			%>
		</div>

		<div class="tea">
			<%
				ArrayList<MenuDto> menuDtos4 = MenuDao.getInstance().allmenuType("tea");
			for (MenuDto menuDto : menuDtos4) {
			%>
			<div class="menu">
				<p>
					<img src="../showImage?key1=<%=menuDto.getName()%>" height="200px"
						width="200px">
				</p>
				<p><%=menuDto.getName()%></p>
				<p><%=menuDto.getPrice()%></p>
			</div>
			<%
				}
			%>
		</div>

		<div class="dessert">
			<%
				ArrayList<MenuDto> menuDtos5 = MenuDao.getInstance().allmenuType("dessert");
			for (MenuDto menuDto : menuDtos5) {
			%>
			<div class="menu">
				<p>
					<img src="../showImage?key1=<%=menuDto.getName()%>" height="200px"
						width="200px">
				</p>
				<p><%=menuDto.getName()%></p>
				<p><%=menuDto.getPrice()%></p>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('.coffee').show();
	$('.blended').hide();
	$('.etc').hide();
	$('.tea').hide();
	$('.dessert').hide();

	$('.show1').click(function() {
		$('.coffee').show();
		$('.blended').hide();
		$('.etc').hide();
		$('.tea').hide();
		$('.dessert').hide();
		return false;
	});
	$('.show2').click(function() {
		$('.coffee').hide();
		$('.blended').show();
		$('.etc').hide();
		$('.tea').hide();
		$('.dessert').hide();
		return false;
	});
	$('.show3').click(function() {
		$('.coffee').hide();
		$('.blended').hide();
		$('.etc').show();
		$('.tea').hide();
		$('.dessert').hide();
		return false;
	});
	$('.show4').click(function() {
		$('.coffee').hide();
		$('.blended').hide();
		$('.etc').hide();
		$('.tea').show();
		$('.dessert').hide();
		return false;
	});
	$('.show5').click(function() {
		$('.coffee').hide();
		$('.blended').hide();
		$('.etc').hide();
		$('.tea').hide();
		$('.dessert').show();
		return false;
	});
</script>
</html>