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

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #D9CDBC;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 1119px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

table td {
	font-size: x-large;
	border-collapse: separate;
	border-spacing: 50px;
}

img {
	margin: 0px auto;
	display: block;
}

.show1 {
	font-color: red;
}

.menu {
	font-size: 90%
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
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
			$('.coffee').hide; //페이지를 로드할 때 표시할 요소
			$('.blended').hide(); //페이지를 로드할 때 표시할 요소
			$('.etc').hide(); //페이지를 로드할 때 숨길 요소
			$('.tea').hide(); //페이지를 로드할 때 숨길 요소
			$('.dessert').show(); //페이지를 로드할 때 숨길 요소
			return false;
		});
	});
</script>
</head>
<body>
	<%@ include file="../navbar_user.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-9" align="center">
				<div id="container">
					<div id="section">
						<div class="tabArea navbar- menus">
							<div class="btnTab text-center">
								<span class="menu"> <span class="show1">커피</span> <span
									class="show2">블렌디드 </span> <span class="show3">티</span> <span
									class="show4">음료</span> <span class="show5">디저트</span>
								</span>
							</div>
						</div>
					</div>
				</div>

				<div class="coffee">
					<table style="text-align: center;">
						<tr>
							<td><img src="../img/menuImg/espresso_아메리카노_아이스.jpg"
								height="200px" width="200px"><br>아이스 아메리카노<br>5500원<br></td>
							<td><img src="../img/menuImg/espresso_아메리카노.jpg"
								height="200px" width="200px"><br>아메리카노<br>5000원<br></td>
							<td><img src="../img/menuImg/espresso_에스프레소.jpg"
								height="200px" width="200px"><br>에스프레소<br>5000원<br></td>
						</tr>

						<tr>
							<td><img src="../img/menuImg/espresso_카라멜 마키아토.jpg"
								height="200px" width="200px"><br>카라멜 마키아토<br>4000원<br></td>
							<td><img src="../img/menuImg/espresso_토피넛.jpg"
								height="200px" width="200px"><br>토피넛 커피<br>3500원<br></td>
							<td><img src="../img/menuImg/blended_카페모카.jpg"
								height="200px" width="200px"><br>카페모카<br>3500원<br></td>
						</tr>

						<tr>
							<td><img src="../img/menuImg/blended_카푸치노.jpg"
								height="200px" width="200px"><br>카푸치노<br>3500원<br></td>
						</tr>
					</table>
				</div>

				<div class="blended">
					<table style="text-align: center;">
						<tr>
							<td><img src="../img/menuImg/blended_그린티블렌.jpg"
								height="200px" width="200px"><br>그린티 블렌디드<br>5500원</td>
							<td><img src="../img/menuImg/blended_모카블렌.jpg"
								height="200px" width="200px"><br>모카 블렌디드<br>5000원</td>
							<td><img src="../img/menuImg/blended_바닐라블렌.jpg"
								height="200px" width="200px"><br>바닐라 블렌디드<br>5000원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/blended_초코칩블렌.jpg"
								height="200px" width="200px"><br>초코칩 블렌디드<br>4000원</td>
							<td><img src="../img/menuImg/blended_화초모블렌.jpg"
								height="200px" width="200px"><br>화초모 블렌디드<br>6000원</td>
							<td><img src="../img/menuImg/blended_화초블렌.jpg"
								height="200px" width="200px"><br>화이트초코 블렌디드<br>5500원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/blended_흑임자블렌.jpg"
								height="200px" width="200px"><br>흑임자 블렌디드<br>6500원</td>
						</tr>
					</table>
				</div>

				<div class="etc">
					<table style="text-align: center;">
						<tr>
							<td><img src="../img/menuImg/etc_라임에이드.jpg" height="200px"
								width="200px"><br>라임에이드<br>5500원</td>
							<td><img src="../img/menuImg/etc_복숭아에이드.jpg" height="200px"
								width="200px"><br>복숭아에이드<br>5000원</td>
							<td><img src="../img/menuImg/etc_우유.jpg" height="200px"
								width="200px"><br>우유<br>5000원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/etc_자몽에이드.jpg" height="200px"
								width="200px"><br>자몽에이드<br>4000원</td>
							<td><img src="../img/menuImg/etc_핫초코.jpg" height="200px"
								width="200px"><br>핫초코<br>3500원</td>
						</tr>
					</table>
				</div>

				<div class="tea">
					<table style="text-align: center;">
						<tr>
							<td><img src="../img/menuImg/tea_티_녹차.jpg" height="200px"
								width="200px"><br>녹차<br>5500원</td>
							<td><img src="../img/menuImg/tea_티_밀크티.jpg" height="200px"
								width="200px"><br>밀크티<br>5000원</td>
							<td><img src="../img/menuImg/tea_티_얼그레이.jpg" height="200px"
								width="200px"><br>얼그레이<br>5000원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/tea_티_히비스커스.jpg" height="200px"
								width="200px"><br>히비스커스<br>4000원</td>
						</tr>
					</table>
				</div>

				<div class="dessert">
					<table style="text-align: center;">
						<tr>
							<td><img src="../img/menuImg/dessert_몽데.jpg" height="200px"
								width="200px"><br>몽블랑 데니쉬<br>5000원</td>
							<td><img src="../img/menuImg/dessert_블베.jpg" height="200px"
								width="200px"><br>블루베리 베이글<br>3500원</td>
							<td><img src="../img/menuImg/dessert_치즈베이글.jpg"
								height="200px" width="200px"><br>치즈베이글<br>3500원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/dessert_초스.jpg" height="200px"
								width="200px"><br>초코 스콘<br>4000원</td>
							<td><img src="../img/menuImg/dessert_초크.jpg" height="200px"
								width="200px"><br>초코 크라상<br>4000원</td>
							<td><img src="../img/menuImg/dessert_아포.jpg" height="200px"
								width="200px"><br>아포카토<br>4500원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/dessert_클스.jpg" height="200px"
								width="200px"><br>플레인 스콘<br>3000원</td>
							<td><img src="../img/menuImg/dessert_핫.jpg" height="200px"
								width="200px"><br>소시지 바게트<br>5500원</td>
							<td><img src="../img/menuImg/dessert_blended_빨1.jpg"
								height="200px" width="200px"><br>빨미까레<br>3000원</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-sm-3 sidenav">

				<h3>Cart</h3>
				<div class="well">
					<p>주문메뉴 리스트</p>
				</div>

				<input type="submit" value="결제 하기" class="btn btn-warning"
					style="font-size: 30px;">
			</div>
		</div>
	</div>


</body>
</html>