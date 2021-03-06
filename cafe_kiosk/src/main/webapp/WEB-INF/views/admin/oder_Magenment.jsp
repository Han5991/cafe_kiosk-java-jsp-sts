<%@page import="com.model.dto.*"%>
<%@page import="com.model.dao.OderDao"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
ul {
	list-style: none;
}

#ul>li {
	width: 270px;
	height: 500px;
	margin: 5px;
	float: left;
	border: 3px solid lightgray;
	border-radius: 20px;
	text-align: left;
	padding: 5px;
}

#ul>li:active {
	background-color: lightgray;
}

footer {
	width: 100%;
	bottom: 0;
	position: fixed;
	background: lightgray;
	text-align: center;
}

.oderdetail {
	border-radius: 10px;
	border: 0px;
}

@font-face {
	font-family: hzStyleFont;
	src: url("<spring:url value='/resources/font/ImcreSoojin.ttf'/>");
}

* {
	font-family: hzStyleFont;
	font-size: 25px;
}

#navbar {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #D9CDBC;
}

#navbar>li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

#navbar>li a:hover {
	background-color: #333;
}

#navbar>li {
	float: left;
	text-align: left;
	padding: 5px;
}
</style>
</head>
<body>
	<nav>
		<ul id="navbar">
			<li><a href="admin_menuInsert">메뉴 추가</a></li>
			<li><a href="admin_menuModify">메뉴 수정</a></li>
			<li><a href="admin_menuDelete">메뉴 삭제</a></li>
			<li><a href="admin_menuinventory">메뉴 입고</a></li>
			<li><a href="admin_oderlist">주문 접수</a></li>
			<li><a href="#">등록 기계 관리</a></li>
		</ul>
	</nav>
	<%
		ArrayList<oderlistDto> alloder = new ArrayList<oderlistDto>();
	alloder = OderDao.getInstance().allOder("조리전");
	%>
	<h1
		style="text-align: center; font-family: hzStyleFont; font-size: 25px; font-weight: bold;">
		주문 접수 페이지 <select id="status">
			<option>전체보기</option>
			<option value="주문전">주문전</option>
			<option value="주문완료">주문완료</option>
			<option value="주문취소">주문취소</option>
		</select>
	</h1>
	<hr>
	<div id="pop1">
		<ul id="ul">
			<%
				for (oderlistDto oderlistDto : alloder) {
			%>
			<li class="oderNum">주문번호 : <%=oderlistDto.getOdernum()%><input
				name="oderNum" type="hidden" value="<%=oderlistDto.getOdernum()%>">
				<br> 주문시각 : <%=oderlistDto.getOderdate()%><br>주문상태 : <%=oderlistDto.getStatus()%><br>
				<input type="button" value="주문목록 보기" class="oderdetail">
				<table class="detail">
					<%
						for (oderDto dto : oderlistDto.getOderDtos()) {
					%>
					<tr>
						<td><%=dto.getMenu()%></td>
						<td><%=dto.getQuantity()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<p>
					총계 :
					<%=oderlistDto.getSum()%>원</li>
			<%
				}
			%>
		</ul>
	</div>
	<%
		alloder = OderDao.getInstance().allOder("조리완료");
	%>
	<div id=pop2>
		<ul id="ul">
			<%
				for (oderlistDto oderlistDto : alloder) {
			%>
			<li class="oderNum">주문번호 : <%=oderlistDto.getOdernum()%><input
				name="oderNum" type="hidden" value="<%=oderlistDto.getOdernum()%>">
				<br> 주문시각 : <%=oderlistDto.getOderdate()%><br>주문상태 : <%=oderlistDto.getStatus()%><br>
				<input type="button" value="주문목록 보기" class="oderdetail">
				<table class="detail">
					<%
						for (oderDto dto : oderlistDto.getOderDtos()) {
					%>
					<tr>
						<td><%=dto.getMenu()%></td>
						<td><%=dto.getQuantity()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<p>
					총계 :
					<%=oderlistDto.getSum()%>원</li>
			<%
				}
			%>
		</ul>
	</div>
	<%
		alloder = OderDao.getInstance().allOder("조리취소");
	%>
	<div id="pop3">
		<ul id="ul">
			<%
				for (oderlistDto oderlistDto : alloder) {
			%>
			<li class="oderNum">주문번호 : <%=oderlistDto.getOdernum()%><input
				name="oderNum" type="hidden" value="<%=oderlistDto.getOdernum()%>">
				<br> 주문시각 : <%=oderlistDto.getOderdate()%><br>주문상태 : <%=oderlistDto.getStatus()%><br>
				<input type="button" value="주문목록 보기" class="oderdetail">
				<table class="detail">
					<%
						for (oderDto dto : oderlistDto.getOderDtos()) {
					%>
					<tr>
						<td><%=dto.getMenu()%></td>
						<td><%=dto.getQuantity()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<p>
					총계 :
					<%=oderlistDto.getSum()%>원</li>
			<%
				}
			%>
		</ul>
	</div>
	<footer>
		<input type="button" value="주문 취소" class="btn btn-warning" id="delete"
			style="font-size: 30px;">&nbsp;&nbsp;<input type="button"
			value="조리 시작" class="btn btn-warning" style="font-size: 30px;"
			id="start">&nbsp;&nbsp;<input type="button" value="영수증 출력"
			class="btn btn-warning" style="font-size: 30px;" onclick="print()">
	</footer>
</body>
<script type="text/javascript">
	$(".detail").hide();
	var num = 0;
	$("#delete").click(function() {
		if (confirm("정말 취소하시겠습니까 ?") == true) {
			location.href = "deleteOder.do?odernum=" + num;
			alert("취소되었습니다");
		} else {
			return;
		}
	});
	$("#start").click(function() {
		if (confirm("조리가 완료 되었습니까?") == true) {
			location.href = "startOder.do?odernum=" + num;
			alert("조리가 완료되었습니다");
		} else {
			return;
		}
	});
	$('.oderNum').click(function() {
		var n = $('.oderNum').index(this);
		num = $("input[name=oderNum]:eq(" + n + ")").val();
	});

	function print() {
		var url = "receiptPrint.do?odernum=" + num;
		window
				.open(url, "receiptPrint",
						"toolbar=no, menubar=no,scrollbar=yes, resizable=no, width=450,height=800");
	}

	$('.oderNum').click(function() {
		var n = $('.oderNum').index(this);
		num = $("input[name=oderNum]:eq(" + n + ")").val();
	});
	$('.oderdetail').click(function() {
		var n = $('.oderdetail').index(this);
		if ($(".detail:eq(" + n + ")").css("display") == "none") {
			$(".detail:eq(" + n + ")").show();
			$(".oderdetail:eq(" + n + ")").val("주문목록 숨기기");
		} else {
			$(".detail:eq(" + n + ")").hide();
			$(".oderdetail:eq(" + n + ")").val("주문목록 보기");
		}
	});

	$("#status").change(function() {
		if ($(this).val() == "주문전") {
			$("#pop1").show();
			$("#pop2").hide();
			$("#pop3").hide();
		} else if ($(this).val() == "주문완료") {
			$("#pop1").hide();
			$("#pop2").show();
			$("#pop3").hide();
		} else if ($(this).val() == "주문취소") {
			$("#pop1").hide();
			$("#pop2").hide();
			$("#pop3").show();
		} else {
			$("#pop1").show();
			$("#pop2").show();
			$("#pop3").show();
		}
	});
</script>
</html>