<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, shop.*"%>
<!-- result.jsp -->
<html>
<head>
	<title>결과</title>
</head>
<body>
	<h1>도서 주문 구매 페이지</h1>
	<hr color="blue">
	<b>주문한 도서품목</b>
	<table border="1">
		<tr>
			<th>도서제목</th>
			<th>작가</th>
			<th>단가</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
<%
		Hashtable<String, ShopDTO> ht = (Hashtable)request.getAttribute("cart");
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		int sum = 0;
		Enumeration<String> enu = ht.keys();
		while(enu.hasMoreElements()){
			ShopDTO dto = ht.get(enu.nextElement());
			int price = dto.getPrice() * dto.getQty();
			sum += price;%>
		<tr>
			<td align="center"><%=dto.getTitle()%></td>
			<td algin="center"><%=dto.getAuthor()%></td>
			<td algin="right"><%=dto.getPrice()%></td>
			<td align="right"><%=dto.getQty()%></td>
			<td algin="right"><%=df.format(price)%>원</td>
		</tr>	
<%	}%>
		<tr>
			<td colspan="4" align="center">총구입금액</td>
			<td><%=df.format(sum)%>원</td>
		</tr>
	</table>
</body>
</html>		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		