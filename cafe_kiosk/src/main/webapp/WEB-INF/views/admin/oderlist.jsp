<%@page import="com.model.dto.*"%>
<%@page import="com.model.dao.OderDao"%>
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
</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="../navbar_admin.jsp"%>
	<%
		ArrayList<oderlistDto> alloder = new ArrayList<oderlistDto>();
	alloder = OderDao.getInstance().allOder();
	%>
	<h1 style="text-align: center;">주문 관리 페이지</h1>
	<hr>
	<ul id="ul">
		<%
			for (oderlistDto oderlistDto : alloder) {
		%>
		<li class="oderNum">주문번호 : <%=oderlistDto.getOdernum()%><input
			name="oderNum" type="hidden" readonly="readonly"
			value="<%=oderlistDto.getOdernum()%>"> <br> 주문시각 : <%=oderlistDto.getOderdate()%><br>주문상태
			: <%=oderlistDto.getStatus()%><br> <input type="button"
			value="주문목록 보기" class="oderdetail">
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
		<%
			oderlistDto dto = new oderlistDto();
		dto = OderDao.getInstance().getOneOder("18");
		%>
		<li class="oderNum">주문번호 : <%=dto.getOdernum()%><input
			name="oderNum" type="hidden" readonly="readonly"
			value="<%=dto.getOdernum()%>"> <br> 주문시각 : <%=dto.getOderdate()%><br>주문상태
			: <%=dto.getStatus()%><br> <input type="button" value="주문목록 보기"
			class="oderdetail">
			<table class="detail">
				<%
					for (oderDto dto2 : dto.getOderDtos()) {
				%>
				<tr>
					<td><%=dto2.getMenu()%></td>
					<td><%=dto2.getQuantity()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<p>
				총계2:
				<%=dto.getSum()%>원</li>
	</ul>

	<footer>
		<input type="button" value="주문 취소" class="btn btn-warning"
			style="font-size: 30px;">&nbsp;&nbsp;<input type="button"
			value="조리 시작" class="btn btn-warning" style="font-size: 30px;">&nbsp;&nbsp;<input
			type="button" value="영수증 출력" class="btn btn-warning"
			style="font-size: 30px;" onclick="print()">
	</footer>
</body>
<script type="text/javascript">
	var num = 0;
	var webSocket = new WebSocket('ws://localhost:8080/webChatServer');

	webSocket.onerror = function(e) {
		onError(e);
	};
	webSocket.onopen = function(e) {
		onOpen(e);
	};
	webSocket.onmessage = function(e) {
		onMessage(e);
	};

	function onMessage(e) {
		var chatMsg = event.data;
		if (chatMsg.substring(0, 5) == 'store') {
			var odernum = chatMsg.split(" ")[2];
			var $chat = 
				
				
			$('#ul').append($chat);
		}

		$('.detail').hide();
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

		// 		function print() {
		// 			var url = "../receiptPrint.do?odernum=" + num;
		// 			window
		// 					.open(url, "receiptPrint",
		// 							"toolbar=no, menubar=no,scrollbar=yes, resizable=no, width=450,height=800");
		// 		}

	}

	function onOpen(e) {
	}

	function onError(e) {
		alert(e.data);
	}

	function send() {
	}
</script>
</html>