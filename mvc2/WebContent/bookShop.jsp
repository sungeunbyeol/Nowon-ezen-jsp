<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- bookShop.jsp -->
<html>
<head>
	<title>MVC2번째예제</title>
</head>
<body>
	<h1>도서 주문 페이지</h1>
	<form name="f" action="bookShop.do" method="post">
		<input type="hidden" name="command" value="ADD"/>
		<b>도서선택 : </b>
		<select name="book">
			<option>어린왕자 / 생떽쥐페리 / 15000</option>
			<option>연금술사 / 파올로 코엘료 / 21000</option>
			<option>홍길동전 / 허균 / 25000</option>
			<option>자바의 정석 / 남궁성 / 32000</option>
			<option>1등주식을 사라 / 이일영 / 20000</option>
		</select>
		<b>수량 : </b>
		<input type="text" name="qty" size="2" value="1">
		<input type="submit" value="도서주문">
	</form>
	<hr color="red">
	<jsp:include page="cartShop.jsp"/>
</body>
</html>








