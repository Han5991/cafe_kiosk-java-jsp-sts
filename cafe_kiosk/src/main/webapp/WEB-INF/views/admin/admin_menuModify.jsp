<%@page import="com.model.dao.MenuDao"%>
<%@page import="com.model.dto.MenuDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.row.content {
	height: 1119px;
	text-align: center;
	vertical-align: middle;
}

.menu {
	width: 200px;
	height: 300px;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin: 30px;
	font-size: 24px;
	display: inline-block;
	float: left;
}

img {
	width: 150px;
	height: 150px;
	margin-top: 5px;
	border-radius: 10px;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<%@ include file="../navbar_admin.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center" style="margin-left: 30px;">
				<h1>관리자 페이지</h1>
				<hr>
				<h3>메뉴 수정</h3>
				<div style="margin: 0 auto;">
					<%
						ArrayList<MenuDto> menuDtos = MenuDao.getInstance().allmenu();
					for (MenuDto menu : menuDtos) {
					%>
					<form action="admin_menuModify.do">
						<div class="menu">
							<p>
								<img src="../showImage?key1=<%=menu.getName()%>" />
							</p>
							<p><%=menu.getName()%></p>
							<p>
								<input type="submit" value="수정하기">
							</p>
							<input type="hidden" name="name" value="<%=menu.getName()%>">
						</div>
					</form>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>