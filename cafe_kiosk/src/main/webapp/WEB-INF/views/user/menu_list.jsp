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

span {
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
	<span> <input type="button" value="커피" class="show1"> <input
		type="button" value="티" class="show2"> <input type="button"
		value="음료" class="show3"><br> <input type="button"
		value="블렌디드" class="show4"> <input type="button" value="디저트"
		class="show5"> <br> 총 합계 금액 : <br>10000원 <br> <br>
		<input type="reset" value="메뉴 추가하기" class="btn btn-warning"
		style="font-size: 30px;"><br> <br> <input
		type="submit" value="주문 하기" class="btn btn-warning"
		style="font-size: 30px;">
	</span>

	<div class="coffee">
		<table style="text-align: center;">
			<tr>
				<td><img src="../img/menuImg/espresso_아메리카노_아이스.jpg"
					height="200px" width="200px"><br>아이스 아메리카노<br>5500원<br></td>
				<td><img src="../img/menuImg/espresso_아메리카노.jpg" height="200px"
					width="200px"><br>아메리카노<br>5000원<br></td>
				<td><img src="../img/menuImg/espresso_에스프레소.jpg" height="200px"
					width="200px"><br>에스프레소<br>5000원<br></td>
			</tr>

			<tr>
				<td><img src="../img/menuImg/espresso_카라멜 마키아토.jpg"
					height="200px" width="200px"><br>카라멜 마키아토<br>4000원<br></td>
				<td><img src="../img/menuImg/espresso_토피넛.jpg" height="200px"
					width="200px"><br>토피넛 커피<br>3500원<br></td>
				<td><img src="../img/menuImg/blended_카페모카.jpg" height="200px"
					width="200px"><br>카페모카<br>3500원<br></td>
			</tr>

			<tr>
				<td><img src="../img/menuImg/blended_카푸치노.jpg" height="200px"
					width="200px"><br>카푸치노<br>3500원<br></td>
			</tr>
		</table>
	</div>

	<div class="blended">
		<table style="text-align: center;">
			<tr>
				<td><img src="../img/menuImg/blended_그린티블렌.jpg" height="200px"
					width="200px"><br>그린티 블렌디드<br>5500원</td>
				<td><img src="../img/menuImg/blended_모카블렌.jpg" height="200px"
					width="200px"><br>모카 블렌디드<br>5000원</td>
				<td><img src="../img/menuImg/blended_바닐라블렌.jpg" height="200px"
					width="200px"><br>바닐라 블렌디드<br>5000원</td>
			</tr>
			<tr>
				<td><img src="../img/menuImg/blended_초코칩블렌.jpg" height="200px"
					width="200px"><br>초코칩 블렌디드<br>4000원</td>
				<td><img src="../img/menuImg/blended_화초모블렌.jpg" height="200px"
					width="200px"><br>화초모 블렌디드<br>6000원</td>
				<td><img src="../img/menuImg/blended_화초블렌.jpg" height="200px"
					width="200px"><br>화이트초코 블렌디드<br>5500원</td>
			</tr>
			<tr>
				<td><img src="../img/menuImg/blended_흑임자블렌.jpg" height="200px"
					width="200px"><br>흑임자 블렌디드<br>6500원</td>
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
				<td><img src="../img/menuImg/dessert_치즈베이글.jpg" height="200px"
					width="200px"><br>치즈베이글<br>3500원</td>
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

</body>
</html>