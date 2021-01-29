<%@page import="com.model.dto.oderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.getParameter("oder");
ArrayList<oderDto> oderDtos = new ArrayList<oderDto>();
oderDtos = (ArrayList<oderDto>) session.getAttribute("oderlist");
String sum = (String) session.getAttribute("sum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.jumbotron {
	margin-bottom: 0px;
	background-color: white;
	padding: 0;
}

.table {
	text-align: left;
	font-size: 20px;
}

img {
	object-fit: cover
}
</style>
<title>결제 정보</title>
</head>
<body>
	<%@ include file="../navbar_user.jsp"%>

	<div class="jumbotron" style="padding: 40px 0 0 0;">
		<div class="container text-center">
			<table class="table">
				<thead style="font-size: 60px; text-align: center">
					<tr>
						<td><sup>결제가 성공적으로 완료되었습니다.</sup></td>
					</tr>
				</thead>
				<tr>
					<td style="font-size: 30px;">결제/주문 내역</td>
				</tr>
			</table>
		</div>
	</div>

	<div style="padding: 0; margin: 0 auto; width: 50%;">
		<div class="jumbotron" style="float: left; width: 50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>결제
									금액</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>일반제품</td>
							<td><%=sum%>원</td>
						</tr>
						<tr>
							<td>총 합계 금액</td>
							<td><%=sum%>원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="jumbotron" style="float: left; width: 50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>결제
									수단</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>신용카드</td>
						</tr>

						<tr>
							<td><button type="button" class="btn btn-info"
									data-toggle="collapse" data-target="#demo"
									style="background-color: #D9CDBC; border: none;">참고사항</button>
								<div id="demo" class="collapse">
									- 주문 결제 이후 3분 이내 취소 가능하며, 제품 조리시는 취소 및 환불이 불가능합니다.<br> -
									주문 후 기타 문의사항은 소비자 상담전화(080-320-3000)로 연락바랍니다.<br> - 18시 ~
									21시는 주문량이 많은 시간대로 배달이 지연 될 수 있으니 양해 부탁드립니다.<br> - 주문 완료 전
									배송지와 연락처를 다시 한번 확인해 주시기 바랍니다.<br>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="jumbotron" style="float: left; width: 100%">
			<div class="container text-center">
				<table class="table">
					<tr>
						<td>
							<div>
								<table class="table">
									<%
										for (oderDto dto : oderDtos) {
										int price = Integer.parseInt(dto.getPrice());
										int Quantity = Integer.parseInt(dto.getQuantity());
									%>
									<tr>
										<td><img src="../showImage?key1=<%=dto.getMenu()%>"
											width="150" height="150" /></td>
										<td><%=dto.getMenu()%></td>
										<td><%=Quantity%></td>
										<td><%=price * Quantity%></td>
									</tr>
									<%
										}
									%>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>총 주문 금액</td>
						<td><%=sum%>원</td>
					</tr>
				</table>
			</div>
		</div>

	</div>

	<div class="jumbotron" style="padding: 50px 0 0 0;">
		<div class="container text-center">
			<table class="table">
				<thead style="font-size: 30px;">
					<tr>
						<td style="font-size: 30px;">수령 매장 정보</td>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<div style="padding: 0 0 0 0; margin: 0 auto; width: 50%;">
		<div class="jumbotron" style="float: left; width: 50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>매장
									정보</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>매장 이름</td>
							<td>${storeId.storeName}</td>
							<td></td>
						</tr>
						<tr>
							<td>매장 주소</td>
							<td>${storeId.storeAddress}</td>
							<td></td>
						</tr>
						<tr>
							<td>전화 번호</td>
							<td>${storeId.storePhone}</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="jumbotron" style="float: left; width: 50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>주문
									요청 사항</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${param.DOC_TEXT}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="jumbotron">
		<div class="container text-center">
			<div style="width: 100%; float: left; margin: 0 0 40px 0">
				<input type="button" value="홈으로" class="btn btn-warning"
					onclick="javascript:document.location.href='#'"> <input
					type="button" value="나의 주문 관리" class="btn btn-warning"
					onclick="javascript:document.location.href='oderlist.jsp'">
			</div>
		</div>
	</div>
</body>
</html>