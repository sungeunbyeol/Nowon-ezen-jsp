<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,shop.admin.*"%>
<!-- cartShop.jsp -->
<%
		List<ShopDTO> cart = (List)session.getAttribute("cart");
		if (cart != null && cart.size() != 0){
%>
<b>현재 주문한 도서</b>
<table border="1">
	<tr>
		<th>도서제목</th>
		<th>작가</th>
		<th>가격</th>
		<th>수량</th>
	</tr>
<%	for(int i=0; i<cart.size(); ++i){
			ShopDTO dto = cart.get(i);
%>
	<tr>
		<td><%=dto.getTitle()%></td>
		<td><%=dto.getAuthor()%></td>
		<td><%=dto.getPrice()%></td>
		<td><%=dto.getQty()%></td>
		<td>
			<form name="del" action="bookShop.do" method="post">
				<input type="hidden" name="command" value="DEL"/>
				<input type="hidden" name="index" value="<%=i %>"/>
				<input type="submit" value="삭제">
			</form>
		</td>
	</tr>	
<%	} %>
</table>
<form name="check" action="bookShop.do" method="post">
	<input type="hidden" name="command" value="CHK"/>
	<input type="submit" value="도서결제페이지로 이동">
</form>
<%} %>




