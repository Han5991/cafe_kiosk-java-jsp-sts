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
@font-face {
	font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf");
}

* {
	font-family: hzStyleFont;
}

.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #D9CDBC;
}

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
	<%@ include file="navbar_admin.jsp"%>
	<h1 style="text-align: center;">주문 관리 페이지</h1>
	<hr>
	<ul id="ul">

		<li class="oderNum">주문번호 : <input name="oderNum" type="hidden"
			value=""> <br> 주문시각 : <br>주문상태 : 조리전<br> <input
			type="button" value="주문목록 보기" class="oderdetail">
			<table class="detail">

				<tr>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>총계 :</td>
				</tr>
			</table>
		</li>
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

	function print() {
		var url = "../receiptPrint.do?odernum=" + num;
		window
				.open(url, "receiptPrint",
						"toolbar=no, menubar=no,scrollbar=yes, resizable=no, width=450,height=800");
	}
</script>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");

	var webSocket = new WebSocket('ws://localhost:8080/webChatServer');

	var inputMessage = document.getElementById('inputMessage');

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
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();
		if (chatMsg.substring(0, 6) == 'server') {
			var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
			$('#chat-container').append($chat);
		} else {
			var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg
					+ "</div><div class='chat-info chat-box'>" + dateInfo
					+ "</div></div>");
			$('#chat-container').append($chat);
		}

		$('#chat-container').scrollTop(
				$('#chat-container')[0].scrollHeight + 20);
	}

	function onOpen(e) {

	}

	function onError(e) {
		alert(e.data);
	}

	function send() {
		var chatMsg = inputMessage.value;
		if (chatMsg == '') {
			return;
		}
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();
		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>"
				+ chatMsg + "</div><div class='chat-info'>" + dateInfo
				+ "</div></div>");
		$('#chat-container').append($chat);
		webSocket.send(chatMsg);
		inputMessage.value = "";
		$('#chat-container').scrollTop(
				$('#chat-container')[0].scrollHeight + 20);
	}
	$(function() {
		$('#inputMessage').keydown(function(key) {
			if (key.keyCode == 13) {
				$('#inputMessage').focus();
				send();
			}
		});
		$('#btn-submit').click(function() {
			send();
		});

	})
</script>
</html>